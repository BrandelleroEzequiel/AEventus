import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/imagen_detail/imagen_detail_widget.dart';
import '/pages/componentes/list_cupones_user_detail/list_cupones_user_detail_widget.dart';
import '/pages/componentes/list_participantes_unidos/list_participantes_unidos_widget.dart';
import 'event_detail_widget.dart' show EventDetailWidget;
import 'package:flutter/material.dart';

class EventDetailModel extends FlutterFlowModel<EventDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for listParticipantesUnidos component.
  late ListParticipantesUnidosModel listParticipantesUnidosModel;
  // Model for ListCuponesUserDetail component.
  late ListCuponesUserDetailModel listCuponesUserDetailModel;
  // Model for ImagenDetail component.
  late ImagenDetailModel imagenDetailModel;

  @override
  void initState(BuildContext context) {
    listParticipantesUnidosModel =
        createModel(context, () => ListParticipantesUnidosModel());
    listCuponesUserDetailModel =
        createModel(context, () => ListCuponesUserDetailModel());
    imagenDetailModel = createModel(context, () => ImagenDetailModel());
  }

  @override
  void dispose() {
    listParticipantesUnidosModel.dispose();
    listCuponesUserDetailModel.dispose();
    imagenDetailModel.dispose();
  }
}
