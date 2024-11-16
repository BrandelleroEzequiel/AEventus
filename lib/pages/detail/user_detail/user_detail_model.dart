import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/cupon_card/cupon_card_widget.dart';
import '/pages/componentes/event_card/event_card_widget.dart';
import '/pages/componentes/event_card_small/event_card_small_widget.dart';
import '/pages/componentes/imagen_detail/imagen_detail_widget.dart';
import '/pages/componentes/list_cupones_user_detail/list_cupones_user_detail_widget.dart';
import '/pages/componentes/list_seguidores/list_seguidores_widget.dart';
import '/pages/componentes/list_seguidos/list_seguidos_widget.dart';
import 'user_detail_widget.dart' show UserDetailWidget;
import 'package:flutter/material.dart';

class UserDetailModel extends FlutterFlowModel<UserDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for eventCardSmall dynamic component.
  late FlutterFlowDynamicModels<EventCardSmallModel> eventCardSmallModels1;
  // Models for eventCardSmall dynamic component.
  late FlutterFlowDynamicModels<EventCardSmallModel> eventCardSmallModels2;
  // Models for CuponCard dynamic component.
  late FlutterFlowDynamicModels<CuponCardModel> cuponCardModels;
  // Models for EventCard dynamic component.
  late FlutterFlowDynamicModels<EventCardModel> eventCardModels;
  // Model for listSeguidores component.
  late ListSeguidoresModel listSeguidoresModel;
  // Model for listSeguidos component.
  late ListSeguidosModel listSeguidosModel;
  // Model for ListCuponesUserDetail component.
  late ListCuponesUserDetailModel listCuponesUserDetailModel;
  // Models for eventCardSmall dynamic component.
  late FlutterFlowDynamicModels<EventCardSmallModel> eventCardSmallModels3;
  // Model for ImagenDetail component.
  late ImagenDetailModel imagenDetailModel;

  @override
  void initState(BuildContext context) {
    eventCardSmallModels1 =
        FlutterFlowDynamicModels(() => EventCardSmallModel());
    eventCardSmallModels2 =
        FlutterFlowDynamicModels(() => EventCardSmallModel());
    cuponCardModels = FlutterFlowDynamicModels(() => CuponCardModel());
    eventCardModels = FlutterFlowDynamicModels(() => EventCardModel());
    listSeguidoresModel = createModel(context, () => ListSeguidoresModel());
    listSeguidosModel = createModel(context, () => ListSeguidosModel());
    listCuponesUserDetailModel =
        createModel(context, () => ListCuponesUserDetailModel());
    eventCardSmallModels3 =
        FlutterFlowDynamicModels(() => EventCardSmallModel());
    imagenDetailModel = createModel(context, () => ImagenDetailModel());
  }

  @override
  void dispose() {
    eventCardSmallModels1.dispose();
    eventCardSmallModels2.dispose();
    cuponCardModels.dispose();
    eventCardModels.dispose();
    listSeguidoresModel.dispose();
    listSeguidosModel.dispose();
    listCuponesUserDetailModel.dispose();
    eventCardSmallModels3.dispose();
    imagenDetailModel.dispose();
  }
}
