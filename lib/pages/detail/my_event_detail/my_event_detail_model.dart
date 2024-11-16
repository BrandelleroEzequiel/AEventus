import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/cupon_card/cupon_card_widget.dart';
import '/pages/componentes/event_card/event_card_widget.dart';
import '/pages/componentes/imagen_detail/imagen_detail_widget.dart';
import '/pages/componentes/list_cupones_user_detail/list_cupones_user_detail_widget.dart';
import '/pages/componentes/list_participantes_unidos/list_participantes_unidos_widget.dart';
import '/pages/componentes/user_horizontal_card/user_horizontal_card_widget.dart';
import 'my_event_detail_widget.dart' show MyEventDetailWidget;
import 'package:flutter/material.dart';

class MyEventDetailModel extends FlutterFlowModel<MyEventDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for userHorizontalCard dynamic component.
  late FlutterFlowDynamicModels<UserHorizontalCardModel>
      userHorizontalCardModels;
  // Models for CuponCard dynamic component.
  late FlutterFlowDynamicModels<CuponCardModel> cuponCardModels;
  // Models for EventCard dynamic component.
  late FlutterFlowDynamicModels<EventCardModel> eventCardModels;
  // Model for ImagenDetail component.
  late ImagenDetailModel imagenDetailModel;
  // Model for listParticipantesUnidos component.
  late ListParticipantesUnidosModel listParticipantesUnidosModel;
  // Model for ListCuponesUserDetail component.
  late ListCuponesUserDetailModel listCuponesUserDetailModel;

  @override
  void initState(BuildContext context) {
    userHorizontalCardModels =
        FlutterFlowDynamicModels(() => UserHorizontalCardModel());
    cuponCardModels = FlutterFlowDynamicModels(() => CuponCardModel());
    eventCardModels = FlutterFlowDynamicModels(() => EventCardModel());
    imagenDetailModel = createModel(context, () => ImagenDetailModel());
    listParticipantesUnidosModel =
        createModel(context, () => ListParticipantesUnidosModel());
    listCuponesUserDetailModel =
        createModel(context, () => ListCuponesUserDetailModel());
  }

  @override
  void dispose() {
    userHorizontalCardModels.dispose();
    cuponCardModels.dispose();
    eventCardModels.dispose();
    imagenDetailModel.dispose();
    listParticipantesUnidosModel.dispose();
    listCuponesUserDetailModel.dispose();
  }
}
