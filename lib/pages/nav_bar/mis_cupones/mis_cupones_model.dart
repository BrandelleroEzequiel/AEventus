import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/cupon_card/cupon_card_widget.dart';
import 'mis_cupones_widget.dart' show MisCuponesWidget;
import 'package:flutter/material.dart';

class MisCuponesModel extends FlutterFlowModel<MisCuponesWidget> {
  ///  State fields for stateful widgets in this page.

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
