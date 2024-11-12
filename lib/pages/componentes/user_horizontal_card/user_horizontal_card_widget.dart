import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'user_horizontal_card_model.dart';
export 'user_horizontal_card_model.dart';

class UserHorizontalCardWidget extends StatefulWidget {
  const UserHorizontalCardWidget({
    super.key,
    required this.userParam,
  });

  final UserRecord? userParam;

  @override
  State<UserHorizontalCardWidget> createState() =>
      _UserHorizontalCardWidgetState();
}

class _UserHorizontalCardWidgetState extends State<UserHorizontalCardWidget> {
  late UserHorizontalCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserHorizontalCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      constraints: const BoxConstraints(
        minWidth: 300.0,
        maxWidth: 400.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          FFAppState().listSeguidoresColapse = false;
          FFAppState().listUserUnidosColapse = false;
          FFAppState().listSeguidosColapse = false;
          safeSetState(() {});
          if (widget.userParam?.reference == currentUserReference) {
            context.pushNamed('MyProfile');
          } else {
            context.pushNamed(
              'UserDetail',
              queryParameters: {
                'objUserParam': serializeParam(
                  widget.userParam,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'objUserParam': widget.userParam,
              },
            );
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Container(
                        width: 35.0,
                        height: 35.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          widget.userParam!.photoUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          widget.userParam?.displayName,
                          'DisplayName',
                        ).maybeHandleOverflow(
                          maxChars: 17,
                          replacement: '…',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 8.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Visibility(
                        visible: widget.userParam?.reference !=
                            currentUserReference,
                        child: Stack(
                          children: [
                            if (widget.userParam?.seguidores
                                    .contains(currentUserReference) ==
                                false)
                              FFButtonWidget(
                                onPressed: () async {
                                  await widget.userParam!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'seguidores': FieldValue.arrayUnion(
                                            [currentUserReference]),
                                      },
                                    ),
                                  });

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'siguiendo': FieldValue.arrayUnion(
                                            [widget.userParam?.reference]),
                                      },
                                    ),
                                  });
                                },
                                text: FFLocalizations.of(context).getText(
                                  'wgnhgm7s' /* Seguir */,
                                ),
                                options: FFButtonOptions(
                                  width: 80.0,
                                  height: 25.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            if (widget.userParam?.seguidores
                                    .contains(currentUserReference) ==
                                true)
                              FFButtonWidget(
                                onPressed: () async {
                                  await widget.userParam!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'seguidores': FieldValue.arrayRemove(
                                            [currentUserReference]),
                                      },
                                    ),
                                  });

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'siguiendo': FieldValue.arrayRemove(
                                            [widget.userParam?.reference]),
                                      },
                                    ),
                                  });
                                },
                                text: FFLocalizations.of(context).getText(
                                  '4czzmzi1' /* Dejar de seguir */,
                                ),
                                options: FFButtonOptions(
                                  width: 110.0,
                                  height: 25.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 8.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
