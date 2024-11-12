import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/user_horizontal_card/user_horizontal_card_widget.dart';
import '/pages/componentes/user_profesional_card/user_profesional_card_widget.dart';
import 'all_users_widget.dart' show AllUsersWidget;
import 'package:flutter/material.dart';

class AllUsersModel extends FlutterFlowModel<AllUsersWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UserRecord> simpleSearchResults = [];
  // Models for userProfesionalCard dynamic component.
  late FlutterFlowDynamicModels<UserProfesionalCardModel>
      userProfesionalCardModels;
  // Models for userHorizontalCard dynamic component.
  late FlutterFlowDynamicModels<UserHorizontalCardModel>
      userHorizontalCardModels1;
  // Models for userHorizontalCard dynamic component.
  late FlutterFlowDynamicModels<UserHorizontalCardModel>
      userHorizontalCardModels2;

  @override
  void initState(BuildContext context) {
    userProfesionalCardModels =
        FlutterFlowDynamicModels(() => UserProfesionalCardModel());
    userHorizontalCardModels1 =
        FlutterFlowDynamicModels(() => UserHorizontalCardModel());
    userHorizontalCardModels2 =
        FlutterFlowDynamicModels(() => UserHorizontalCardModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    userProfesionalCardModels.dispose();
    userHorizontalCardModels1.dispose();
    userHorizontalCardModels2.dispose();
  }
}
