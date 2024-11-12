import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/my_cupon_creado/my_cupon_creado_widget.dart';
import 'list_cupones_profile_widget.dart' show ListCuponesProfileWidget;
import 'package:flutter/material.dart';

class ListCuponesProfileModel
    extends FlutterFlowModel<ListCuponesProfileWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for MyCuponCreado dynamic component.
  late FlutterFlowDynamicModels<MyCuponCreadoModel> myCuponCreadoModels;

  @override
  void initState(BuildContext context) {
    myCuponCreadoModels = FlutterFlowDynamicModels(() => MyCuponCreadoModel());
  }

  @override
  void dispose() {
    myCuponCreadoModels.dispose();
  }
}
