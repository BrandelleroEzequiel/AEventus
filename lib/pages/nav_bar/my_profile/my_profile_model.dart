import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/list_cupones_profile/list_cupones_profile_widget.dart';
import '/pages/componentes/list_seguidores/list_seguidores_widget.dart';
import '/pages/componentes/list_seguidos/list_seguidos_widget.dart';
import 'my_profile_widget.dart' show MyProfileWidget;
import 'package:flutter/material.dart';

class MyProfileModel extends FlutterFlowModel<MyProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for listSeguidores component.
  late ListSeguidoresModel listSeguidoresModel;
  // Model for listSeguidos component.
  late ListSeguidosModel listSeguidosModel;
  // Model for ListCuponesProfile component.
  late ListCuponesProfileModel listCuponesProfileModel;

  @override
  void initState(BuildContext context) {
    listSeguidoresModel = createModel(context, () => ListSeguidoresModel());
    listSeguidosModel = createModel(context, () => ListSeguidosModel());
    listCuponesProfileModel =
        createModel(context, () => ListCuponesProfileModel());
  }

  @override
  void dispose() {
    listSeguidoresModel.dispose();
    listSeguidosModel.dispose();
    listCuponesProfileModel.dispose();
  }
}
