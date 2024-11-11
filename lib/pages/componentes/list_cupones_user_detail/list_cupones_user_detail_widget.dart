import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
              width: 50.0,
              height: 50.0,
              child: SpinKitRipple(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
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
              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().banderaBooleana = false;
                  safeSetState(() {});
                  if (columnPromocionRecord.userCreator ==
                      currentUserReference) {
                    context.pushNamed(
                      'MyPromocionDetail',
                      queryParameters: {
                        'promocionReference': serializeParam(
                          columnPromocionRecord.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  } else {
                    context.pushNamed(
                      'PromocionDetail',
                      queryParameters: {
                        'promocionReference': serializeParam(
                          columnPromocionRecord.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  }
                },
                child: Container(
                  width: 350.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: StreamBuilder<UserRecord>(
                    stream: UserRecord.getDocument(widget.userReference!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitRipple(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }

                      final stackUserRecord = snapshot.data!;

                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                            child: Image.network(
                              valueOrDefault<String>(
                                columnPromocionRecord.imagen,
                                'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg',
                              ),
                              width: double.infinity,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 101.0,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0x325A5A5A),
                                    Color(0xAE000000)
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(0.0, -1.0),
                                  end: AlignmentDirectional(0, 1.0),
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 10.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(40.0),
                                    bottomRight: Radius.circular(40.0),
                                    topLeft: Radius.circular(40.0),
                                    topRight: Radius.circular(40.0),
                                  ),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().banderaBooleana = false;
                                    safeSetState(() {});
                                    if (stackUserRecord.reference ==
                                        currentUserReference) {
                                      context.pushNamed('MyProfile');
                                    } else {
                                      context.pushNamed(
                                        'UserDetail',
                                        queryParameters: {
                                          'objUserParam': serializeParam(
                                            stackUserRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'objUserParam': stackUserRecord,
                                        },
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: 120.0,
                                    height: 120.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        stackUserRecord.photoUrl,
                                        'https://www.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600nw-1037719192.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  60.0, 0.0, 0.0, 17.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().banderaBooleana = false;
                                  safeSetState(() {});
                                  if (stackUserRecord.reference ==
                                      currentUserReference) {
                                    context.pushNamed('MyProfile');
                                  } else {
                                    context.pushNamed(
                                      'UserDetail',
                                      queryParameters: {
                                        'objUserParam': serializeParam(
                                          stackUserRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'objUserParam': stackUserRecord,
                                      },
                                    );
                                  }
                                },
                                child: Text(
                                  valueOrDefault<String>(
                                    stackUserRecord.displayName,
                                    '777',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 47.0),
                              child: Text(
                                columnPromocionRecord.name,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            }).divide(const SizedBox(height: 8.0)),
          ),
        );
      },
    );
  }
}
