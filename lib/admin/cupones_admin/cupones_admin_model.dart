import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/componentes/my_cupon_creado/my_cupon_creado_widget.dart';
import 'cupones_admin_widget.dart' show CuponesAdminWidget;
import 'package:flutter/material.dart';

class CuponesAdminModel extends FlutterFlowModel<CuponesAdminWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<PromocionRecord> simpleSearchResults = [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for MyCuponCreado dynamic component.
  late FlutterFlowDynamicModels<MyCuponCreadoModel> myCuponCreadoModels1;
  // Models for MyCuponCreado dynamic component.
  late FlutterFlowDynamicModels<MyCuponCreadoModel> myCuponCreadoModels2;
  // Models for MyCuponCreado dynamic component.
  late FlutterFlowDynamicModels<MyCuponCreadoModel> myCuponCreadoModels3;

  @override
  void initState(BuildContext context) {
    myCuponCreadoModels1 = FlutterFlowDynamicModels(() => MyCuponCreadoModel());
    myCuponCreadoModels2 = FlutterFlowDynamicModels(() => MyCuponCreadoModel());
    myCuponCreadoModels3 = FlutterFlowDynamicModels(() => MyCuponCreadoModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    myCuponCreadoModels1.dispose();
    myCuponCreadoModels2.dispose();
    myCuponCreadoModels3.dispose();
  }
}
