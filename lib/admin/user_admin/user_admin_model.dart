import '/backend/backend.dart';
import '/components/user_horizontal_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_admin_widget.dart' show UserAdminWidget;
import 'package:flutter/material.dart';

class UserAdminModel extends FlutterFlowModel<UserAdminWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UserRecord> simpleSearchResults = [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for UserHorizontal dynamic component.
  late FlutterFlowDynamicModels<UserHorizontalModel> userHorizontalModels1;
  // Models for UserHorizontal dynamic component.
  late FlutterFlowDynamicModels<UserHorizontalModel> userHorizontalModels2;
  // Models for UserHorizontal dynamic component.
  late FlutterFlowDynamicModels<UserHorizontalModel> userHorizontalModels3;
  // Models for UserHorizontal dynamic component.
  late FlutterFlowDynamicModels<UserHorizontalModel> userHorizontalModels4;

  @override
  void initState(BuildContext context) {
    userHorizontalModels1 =
        FlutterFlowDynamicModels(() => UserHorizontalModel());
    userHorizontalModels2 =
        FlutterFlowDynamicModels(() => UserHorizontalModel());
    userHorizontalModels3 =
        FlutterFlowDynamicModels(() => UserHorizontalModel());
    userHorizontalModels4 =
        FlutterFlowDynamicModels(() => UserHorizontalModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    userHorizontalModels1.dispose();
    userHorizontalModels2.dispose();
    userHorizontalModels3.dispose();
    userHorizontalModels4.dispose();
  }
}
