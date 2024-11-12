import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/componentes/cupon_card/cupon_card_widget.dart';
import 'all_cupones_widget.dart' show AllCuponesWidget;
import 'package:flutter/material.dart';

class AllCuponesModel extends FlutterFlowModel<AllCuponesWidget> {
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
  // Models for CuponCard dynamic component.
  late FlutterFlowDynamicModels<CuponCardModel> cuponCardModels1;
  // Models for CuponCard dynamic component.
  late FlutterFlowDynamicModels<CuponCardModel> cuponCardModels2;
  // Models for CuponCard dynamic component.
  late FlutterFlowDynamicModels<CuponCardModel> cuponCardModels3;

  @override
  void initState(BuildContext context) {
    cuponCardModels1 = FlutterFlowDynamicModels(() => CuponCardModel());
    cuponCardModels2 = FlutterFlowDynamicModels(() => CuponCardModel());
    cuponCardModels3 = FlutterFlowDynamicModels(() => CuponCardModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    cuponCardModels1.dispose();
    cuponCardModels2.dispose();
    cuponCardModels3.dispose();
  }
}
