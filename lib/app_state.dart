import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _recentSearches =
        prefs.getStringList('ff_recentSearches') ?? _recentSearches;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool _value) {
    _searchActive = _value;
  }

  bool _searchActive2 = false;
  bool get searchActive2 => _searchActive2;
  set searchActive2(bool _value) {
    _searchActive2 = _value;
  }

  List<String> _recentSearches = [];
  List<String> get recentSearches => _recentSearches;
  set recentSearches(List<String> _value) {
    _recentSearches = _value;
    prefs.setStringList('ff_recentSearches', _value);
  }

  void addToRecentSearches(String _value) {
    _recentSearches.add(_value);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void removeFromRecentSearches(String _value) {
    _recentSearches.remove(_value);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void removeAtIndexFromRecentSearches(int _index) {
    _recentSearches.removeAt(_index);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
