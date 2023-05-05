import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dropdown_model.dart';
export 'dropdown_model.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({
    Key? key,
    this.tweet,
  }) : super(key: key);

  final TweetsRecord? tweet;

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  late DropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowDropDown<String>(
      controller: _model.dropDownValueController ??=
          FormFieldController<String>(null),
      options: ['Delete'],
      onChanged: (val) async {
        setState(() => _model.dropDownValue = val);
        await widget.tweet!.reference.delete();
      },
      width: 180.0,
      height: 50.0,
      searchHintTextStyle: FlutterFlowTheme.of(context).bodyLarge.override(
            fontFamily: 'Inter',
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Inter',
          ),
      searchHintText: 'Search for an item...',
      icon: Icon(
        Icons.more_vert,
        size: 15.0,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      borderColor: Colors.transparent,
      borderWidth: 0.0,
      borderRadius: 0.0,
      margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
      hidesUnderline: true,
      isSearchable: false,
    );
  }
}
