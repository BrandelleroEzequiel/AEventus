import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'home_admin_model.dart';
export 'home_admin_model.dart';

class HomeAdminWidget extends StatefulWidget {
  const HomeAdminWidget({super.key});

  @override
  State<HomeAdminWidget> createState() => _HomeAdminWidgetState();
}

class _HomeAdminWidgetState extends State<HomeAdminWidget> {
  late HomeAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeAdminModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Icon(
                      Icons.admin_panel_settings,
                      color: Color(0xFFC29002),
                      size: 35.0,
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'ri2fl0eh' /* Panel de administrador */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Lexend',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 27.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Visibility(
            visible: valueOrDefault<bool>(currentUserDocument?.isAdmin, false),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: AuthUserStreamWidget(
                builder: (context) => Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (valueOrDefault<bool>(
                              currentUserDocument?.isAdmin, false)) {
                            context.pushNamed('UserAdmin');
                          } else {
                            context.pushNamed('Home');
                          }
                        },
                        child: Material(
                          color: Colors.transparent,
                          child: ListTile(
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'dqnrzgd2' /* Todos los usuarios */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Lexend',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            subtitle: Text(
                              FFLocalizations.of(context).getText(
                                'oneao3nz' /* Listado completo de usuarios r... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (valueOrDefault<bool>(
                            currentUserDocument?.isAdmin, false)) {
                          context.pushNamed('EventAdmin');
                        } else {
                          context.pushNamed('Home');
                        }
                      },
                      child: Material(
                        color: Colors.transparent,
                        child: ListTile(
                          title: Text(
                            FFLocalizations.of(context).getText(
                              'ou4n6fav' /* Todos los eventos */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Lexend',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          subtitle: Text(
                            FFLocalizations.of(context).getText(
                              'o23ot46e' /* Listado completo de eventos cr... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          dense: false,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (valueOrDefault<bool>(
                            currentUserDocument?.isAdmin, false)) {
                          context.pushNamed('CuponesAdmin');
                        } else {
                          context.pushNamed('Home');
                        }
                      },
                      child: Material(
                        color: Colors.transparent,
                        child: ListTile(
                          title: Text(
                            FFLocalizations.of(context).getText(
                              'ppea8m00' /* Todos los cupones */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Lexend',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          subtitle: Text(
                            FFLocalizations.of(context).getText(
                              'irvnp66s' /* Listado completo de cupones cr... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          dense: false,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.safePop();
                        },
                        text: FFLocalizations.of(context).getText(
                          'b4t9hmde' /* Volver atrás */,
                        ),
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: 150.0,
                          height: 30.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
