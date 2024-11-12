import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/imagen_detail/imagen_detail_widget.dart';
import '/pages/componentes/list_cupones_user_detail/list_cupones_user_detail_widget.dart';
import '/pages/componentes/list_participantes_unidos/list_participantes_unidos_widget.dart';
import '/pages/componentes/my_cupon_creado/my_cupon_creado_widget.dart';
import '/pages/componentes/myevent_creado/myevent_creado_widget.dart';
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
  // Models for MyCuponCreado dynamic component.
  late FlutterFlowDynamicModels<MyCuponCreadoModel> myCuponCreadoModels;
  // Models for MyeventCreado dynamic component.
  late FlutterFlowDynamicModels<MyeventCreadoModel> myeventCreadoModels;
  // Model for listParticipantesUnidos component.
  late ListParticipantesUnidosModel listParticipantesUnidosModel;
  // Model for ListCuponesUserDetail component.
  late ListCuponesUserDetailModel listCuponesUserDetailModel;
  // Model for ImagenDetail component.
  late ImagenDetailModel imagenDetailModel;

  @override
  void initState(BuildContext context) {
    userHorizontalCardModels =
        FlutterFlowDynamicModels(() => UserHorizontalCardModel());
    myCuponCreadoModels = FlutterFlowDynamicModels(() => MyCuponCreadoModel());
    myeventCreadoModels = FlutterFlowDynamicModels(() => MyeventCreadoModel());
    listParticipantesUnidosModel =
        createModel(context, () => ListParticipantesUnidosModel());
    listCuponesUserDetailModel =
        createModel(context, () => ListCuponesUserDetailModel());
    imagenDetailModel = createModel(context, () => ImagenDetailModel());
  }

  @override
  void dispose() {
    userHorizontalCardModels.dispose();
    myCuponCreadoModels.dispose();
    myeventCreadoModels.dispose();
    listParticipantesUnidosModel.dispose();
    listCuponesUserDetailModel.dispose();
    imagenDetailModel.dispose();
  }
}
