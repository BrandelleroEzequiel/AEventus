import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/cupon_card/cupon_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'list_cupones_user_detail_model.dart';
export 'list_cupones_user_detail_model.dart';

class ListCuponesUserDetailWidget extends StatefulWidget {
  const ListCuponesUserDetailWidget({
    super.key,
    required this.userReference,
  });

  final DocumentReference? userReference;

  @override
  State<ListCuponesUserDetailWidget> createState() =>
      _ListCuponesUserDetailWidgetState();
}

class _ListCuponesUserDetailWidgetState
    extends State<ListCuponesUserDetailWidget> {
  late ListCuponesUserDetailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListCuponesUserDetailModel());

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
                model: _model.cuponCardModels.getModel(
                  columnPromocionRecord.reference.id,
                  columnIndex,
                ),
                updateCallback: () => safeSetState(() {}),
                child: CuponCardWidget(
                  key: Key(
                    'Keyozf_${columnPromocionRecord.reference.id}',
                  ),
                  cuponParam: columnPromocionRecord,
                ),
              );
            }).divide(const SizedBox(height: 8.0)),
          ),
        );
      },
    );
  }
}
