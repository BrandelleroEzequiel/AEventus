import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/cupon_card/cupon_card_widget.dart';
import '/pages/componentes/event_card/event_card_widget.dart';
import '/pages/componentes/user_profesional_card/user_profesional_card_widget.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for EventCard dynamic component.
  late FlutterFlowDynamicModels<EventCardModel> eventCardModels1;
  // Models for EventCard dynamic component.
  late FlutterFlowDynamicModels<EventCardModel> eventCardModels2;
  // Models for CuponCard dynamic component.
  late FlutterFlowDynamicModels<CuponCardModel> cuponCardModels;
  // Models for userProfesionalCard dynamic component.
  late FlutterFlowDynamicModels<UserProfesionalCardModel>
      userProfesionalCardModels;

  @override
  void initState(BuildContext context) {
    eventCardModels1 = FlutterFlowDynamicModels(() => EventCardModel());
    eventCardModels2 = FlutterFlowDynamicModels(() => EventCardModel());
    cuponCardModels = FlutterFlowDynamicModels(() => CuponCardModel());
    userProfesionalCardModels =
        FlutterFlowDynamicModels(() => UserProfesionalCardModel());
  }

  @override
  void dispose() {
    eventCardModels1.dispose();
    eventCardModels2.dispose();
    cuponCardModels.dispose();
    userProfesionalCardModels.dispose();
  }
}
