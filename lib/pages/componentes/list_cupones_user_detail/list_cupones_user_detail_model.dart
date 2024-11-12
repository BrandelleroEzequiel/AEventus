import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/cupon_card/cupon_card_widget.dart';
import 'list_cupones_user_detail_widget.dart' show ListCuponesUserDetailWidget;
import 'package:flutter/material.dart';

class ListCuponesUserDetailModel
    extends FlutterFlowModel<ListCuponesUserDetailWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for CuponCard dynamic component.
  late FlutterFlowDynamicModels<CuponCardModel> cuponCardModels;

  @override
  void initState(BuildContext context) {
    cuponCardModels = FlutterFlowDynamicModels(() => CuponCardModel());
  }

  @override
  void dispose() {
    cuponCardModels.dispose();
  }
}
