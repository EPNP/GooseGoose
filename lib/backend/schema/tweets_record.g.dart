// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweets_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TweetsRecord> _$tweetsRecordSerializer =
    new _$TweetsRecordSerializer();

class _$TweetsRecordSerializer implements StructuredSerializer<TweetsRecord> {
  @override
  final Iterable<Type> types = const [TweetsRecord, _$TweetsRecord];
  @override
  final String wireName = 'TweetsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TweetsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.postLikedBy;
    if (value != null) {
      result
        ..add('Post_liked_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.postGiftedFrom;
    if (value != null) {
      result
        ..add('Post_Gifted_From')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tweetBy;
    if (value != null) {
      result
        ..add('Tweet_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postGiftedBy;
    if (value != null) {
      result
        ..add('Post_Gifted_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.tweetByEmail;
    if (value != null) {
      result
        ..add('Tweet_by_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tweetOwnerpic;
    if (value != null) {
      result
        ..add('Tweet_ownerpic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tweetTime;
    if (value != null) {
      result
        ..add('Tweet_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TweetsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TweetsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Post_liked_by':
          result.postLikedBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'Post_Gifted_From':
          result.postGiftedFrom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Tweet_by':
          result.tweetBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Post_Gifted_by':
          result.postGiftedBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'Tweet_by_email':
          result.tweetByEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Tweet_ownerpic':
          result.tweetOwnerpic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Tweet_time':
          result.tweetTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TweetsRecord extends TweetsRecord {
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? uid;
  @override
  final BuiltList<DocumentReference<Object?>>? postLikedBy;
  @override
  final String? postGiftedFrom;
  @override
  final String? tweetBy;
  @override
  final BuiltList<DocumentReference<Object?>>? postGiftedBy;
  @override
  final String? tweetByEmail;
  @override
  final String? tweetOwnerpic;
  @override
  final DateTime? tweetTime;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TweetsRecord([void Function(TweetsRecordBuilder)? updates]) =>
      (new TweetsRecordBuilder()..update(updates))._build();

  _$TweetsRecord._(
      {this.name,
      this.uid,
      this.postLikedBy,
      this.postGiftedFrom,
      this.tweetBy,
      this.postGiftedBy,
      this.tweetByEmail,
      this.tweetOwnerpic,
      this.tweetTime,
      this.ffRef})
      : super._();

  @override
  TweetsRecord rebuild(void Function(TweetsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TweetsRecordBuilder toBuilder() => new TweetsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TweetsRecord &&
        name == other.name &&
        uid == other.uid &&
        postLikedBy == other.postLikedBy &&
        postGiftedFrom == other.postGiftedFrom &&
        tweetBy == other.tweetBy &&
        postGiftedBy == other.postGiftedBy &&
        tweetByEmail == other.tweetByEmail &&
        tweetOwnerpic == other.tweetOwnerpic &&
        tweetTime == other.tweetTime &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, postLikedBy.hashCode);
    _$hash = $jc(_$hash, postGiftedFrom.hashCode);
    _$hash = $jc(_$hash, tweetBy.hashCode);
    _$hash = $jc(_$hash, postGiftedBy.hashCode);
    _$hash = $jc(_$hash, tweetByEmail.hashCode);
    _$hash = $jc(_$hash, tweetOwnerpic.hashCode);
    _$hash = $jc(_$hash, tweetTime.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TweetsRecord')
          ..add('name', name)
          ..add('uid', uid)
          ..add('postLikedBy', postLikedBy)
          ..add('postGiftedFrom', postGiftedFrom)
          ..add('tweetBy', tweetBy)
          ..add('postGiftedBy', postGiftedBy)
          ..add('tweetByEmail', tweetByEmail)
          ..add('tweetOwnerpic', tweetOwnerpic)
          ..add('tweetTime', tweetTime)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TweetsRecordBuilder
    implements Builder<TweetsRecord, TweetsRecordBuilder> {
  _$TweetsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _uid;
  DocumentReference<Object?>? get uid => _$this._uid;
  set uid(DocumentReference<Object?>? uid) => _$this._uid = uid;

  ListBuilder<DocumentReference<Object?>>? _postLikedBy;
  ListBuilder<DocumentReference<Object?>> get postLikedBy =>
      _$this._postLikedBy ??= new ListBuilder<DocumentReference<Object?>>();
  set postLikedBy(ListBuilder<DocumentReference<Object?>>? postLikedBy) =>
      _$this._postLikedBy = postLikedBy;

  String? _postGiftedFrom;
  String? get postGiftedFrom => _$this._postGiftedFrom;
  set postGiftedFrom(String? postGiftedFrom) =>
      _$this._postGiftedFrom = postGiftedFrom;

  String? _tweetBy;
  String? get tweetBy => _$this._tweetBy;
  set tweetBy(String? tweetBy) => _$this._tweetBy = tweetBy;

  ListBuilder<DocumentReference<Object?>>? _postGiftedBy;
  ListBuilder<DocumentReference<Object?>> get postGiftedBy =>
      _$this._postGiftedBy ??= new ListBuilder<DocumentReference<Object?>>();
  set postGiftedBy(ListBuilder<DocumentReference<Object?>>? postGiftedBy) =>
      _$this._postGiftedBy = postGiftedBy;

  String? _tweetByEmail;
  String? get tweetByEmail => _$this._tweetByEmail;
  set tweetByEmail(String? tweetByEmail) => _$this._tweetByEmail = tweetByEmail;

  String? _tweetOwnerpic;
  String? get tweetOwnerpic => _$this._tweetOwnerpic;
  set tweetOwnerpic(String? tweetOwnerpic) =>
      _$this._tweetOwnerpic = tweetOwnerpic;

  DateTime? _tweetTime;
  DateTime? get tweetTime => _$this._tweetTime;
  set tweetTime(DateTime? tweetTime) => _$this._tweetTime = tweetTime;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TweetsRecordBuilder() {
    TweetsRecord._initializeBuilder(this);
  }

  TweetsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _uid = $v.uid;
      _postLikedBy = $v.postLikedBy?.toBuilder();
      _postGiftedFrom = $v.postGiftedFrom;
      _tweetBy = $v.tweetBy;
      _postGiftedBy = $v.postGiftedBy?.toBuilder();
      _tweetByEmail = $v.tweetByEmail;
      _tweetOwnerpic = $v.tweetOwnerpic;
      _tweetTime = $v.tweetTime;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TweetsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TweetsRecord;
  }

  @override
  void update(void Function(TweetsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TweetsRecord build() => _build();

  _$TweetsRecord _build() {
    _$TweetsRecord _$result;
    try {
      _$result = _$v ??
          new _$TweetsRecord._(
              name: name,
              uid: uid,
              postLikedBy: _postLikedBy?.build(),
              postGiftedFrom: postGiftedFrom,
              tweetBy: tweetBy,
              postGiftedBy: _postGiftedBy?.build(),
              tweetByEmail: tweetByEmail,
              tweetOwnerpic: tweetOwnerpic,
              tweetTime: tweetTime,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'postLikedBy';
        _postLikedBy?.build();

        _$failedField = 'postGiftedBy';
        _postGiftedBy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TweetsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
