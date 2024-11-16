import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'crear_evento2_widget.dart' show CrearEvento2Widget;
import 'package:flutter/material.dart';

class CrearEvento2Model extends FlutterFlowModel<CrearEvento2Widget> {
  ///  State fields for stateful widgets in this page.

  DateTime? datePicked1;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for SwitchHoraInicio widget.
  bool? switchHoraInicioValue;
  DateTime? datePicked2;
  // State field(s) for SwitchHoraFin widget.
  bool? switchHoraFinValue;
  DateTime? datePicked3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
