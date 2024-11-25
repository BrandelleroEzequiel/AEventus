import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'user_horizontal_model.dart';
export 'user_horizontal_model.dart';

class UserHorizontalWidget extends StatefulWidget {
  const UserHorizontalWidget({
    super.key,
    required this.objParam,
  });

  final UserRecord? objParam;

  @override
  State<UserHorizontalWidget> createState() => _UserHorizontalWidgetState();
}

class _UserHorizontalWidgetState extends State<UserHorizontalWidget> {
  late UserHorizontalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserHorizontalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (_model.isEditLocal) {
          _model.isEditLocal = false;
          safeSetState(() {});
        } else {
          context.pushNamed(
            'UserDetail',
            queryParameters: {
              'objUserParam': serializeParam(
                widget.objParam,
                ParamType.Document,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'objUserParam': widget.objParam,
            },
          );
        }
      },
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 70.0,
          maxHeight: 91.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  widget.objParam!.photoUrl,
                                ).image,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Wrap(
                            spacing: 0.0,
                            runSpacing: 0.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.objParam?.displayName,
                                    'name Default',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.isEditLocal = true;
                              safeSetState(() {});
                            },
                            child: Container(
                              width: 30.0,
                              height: 50.0,
                              decoration: const BoxDecoration(),
                              child: Icon(
                                Icons.more_vert,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (_model.isEditLocal)
              Align(
                alignment: const AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'EditUser',
                                queryParameters: {
                                  'userReference': serializeParam(
                                    widget.objParam?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );

                              _model.isEditLocal = false;
                              safeSetState(() {});
                            },
                            child: Container(
                              width: 30.0,
                              height: 20.0,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    2.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.edit_sharp,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 12.0,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await widget.objParam!.reference.delete();
                            },
                            child: Container(
                              width: 30.0,
                              height: 20.0,
                              decoration: const BoxDecoration(),
                              child: Icon(
                                Icons.delete_outline_rounded,
                                color: FlutterFlowTheme.of(context).error,
                                size: 16.0,
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 8.0)),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
