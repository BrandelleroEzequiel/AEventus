import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/my_cupon_creado/my_cupon_creado_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'list_cupones_profile_model.dart';
export 'list_cupones_profile_model.dart';

class ListCuponesProfileWidget extends StatefulWidget {
  const ListCuponesProfileWidget({
    super.key,
    required this.userReference,
  });

  final DocumentReference? userReference;

  @override
  State<ListCuponesProfileWidget> createState() =>
      _ListCuponesProfileWidgetState();
}

class _ListCuponesProfileWidgetState extends State<ListCuponesProfileWidget> {
  late ListCuponesProfileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListCuponesProfileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PromocionRecord>>(
      stream: queryPromocionRecord(
        queryBuilder: (promocionRecord) => promocionRecord.where(
          'user_creator',
          isEqualTo: widget.userReference,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40.0,
              height: 40.0,
              child: SpinKitPulse(
                color: FlutterFlowTheme.of(context).primary,
                size: 40.0,
              ),
            ),
          );
        }
        List<PromocionRecord> columnPromocionRecordList = snapshot.data!;

        return SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children:
                List.generate(columnPromocionRecordList.length, (columnIndex) {
              final columnPromocionRecord =
                  columnPromocionRecordList[columnIndex];
              return wrapWithModel(
                model: _model.myCuponCreadoModels.getModel(
                  columnPromocionRecord.reference.id,
                  columnIndex,
                ),
                updateCallback: () => safeSetState(() {}),
                child: MyCuponCreadoWidget(
                  key: Key(
                    'Keybbr_${columnPromocionRecord.reference.id}',
                  ),
                  objCuponParam: columnPromocionRecord,
                ),
              );
            }).divide(const SizedBox(height: 8.0)),
          ),
        );
      },
    );
  }
}
