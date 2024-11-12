import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/user_horizontal_card/user_horizontal_card_widget.dart';
import 'list_participantes_unidos_widget.dart'
    show ListParticipantesUnidosWidget;
import 'package:flutter/material.dart';

class ListParticipantesUnidosModel
    extends FlutterFlowModel<ListParticipantesUnidosWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for userHorizontalCard dynamic component.
  late FlutterFlowDynamicModels<UserHorizontalCardModel>
      userHorizontalCardModels;

  @override
  void initState(BuildContext context) {
    userHorizontalCardModels =
        FlutterFlowDynamicModels(() => UserHorizontalCardModel());
  }

  @override
  void dispose() {
    userHorizontalCardModels.dispose();
  }
}
