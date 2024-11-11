import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/list_cupones_user_detail/list_cupones_user_detail_widget.dart';
import '/pages/componentes/list_seguidores/list_seguidores_widget.dart';
import '/pages/componentes/list_seguidos/list_seguidos_widget.dart';
import 'user_detail_widget.dart' show UserDetailWidget;
import 'package:flutter/material.dart';

class UserDetailModel extends FlutterFlowModel<UserDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for listSeguidores component.
  late ListSeguidoresModel listSeguidoresModel;
  // Model for listSeguidos component.
  late ListSeguidosModel listSeguidosModel;
  // Model for ListCuponesUserDetail component.
  late ListCuponesUserDetailModel listCuponesUserDetailModel;

  @override
  void initState(BuildContext context) {
    listSeguidoresModel = createModel(context, () => ListSeguidoresModel());
    listSeguidosModel = createModel(context, () => ListSeguidosModel());
    listCuponesUserDetailModel =
        createModel(context, () => ListCuponesUserDetailModel());
  }

  @override
  void dispose() {
    listSeguidoresModel.dispose();
    listSeguidosModel.dispose();
    listCuponesUserDetailModel.dispose();
  }
}
