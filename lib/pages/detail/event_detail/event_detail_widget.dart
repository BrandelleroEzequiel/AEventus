import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/componentes/cupon_card/cupon_card_widget.dart';
import '/pages/componentes/event_card/event_card_widget.dart';
import '/pages/componentes/imagen_detail/imagen_detail_widget.dart';
import '/pages/componentes/list_cupones_user_detail/list_cupones_user_detail_widget.dart';
import '/pages/componentes/list_participantes_unidos/list_participantes_unidos_widget.dart';
import '/pages/componentes/user_horizontal_card/user_horizontal_card_widget.dart';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'event_detail_model.dart';
export 'event_detail_model.dart';

class EventDetailWidget extends StatefulWidget {
  const EventDetailWidget({
    super.key,
    required this.eventReference,
  });

  final DocumentReference? eventReference;

  @override
  State<EventDetailWidget> createState() => _EventDetailWidgetState();
}

class _EventDetailWidgetState extends State<EventDetailWidget>
    with TickerProviderStateMixin {
  late EventDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().ViewImg =
          'https://images.unsplash.com/photo-1502318217862-aa4e294ba657?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxzdGFycnklMjBuaWdodHxlbnwwfHx8fDE3MzA5OTcyMTF8MA&ixlib=rb-4.0.3&q=80&w=1080';
      FFAppState().banderaBooleana = false;
      FFAppState().banderaBoleana2 = false;
      FFAppState().banderaBooleana3 = false;
      FFAppState().listSeguidoresColapse = false;
      FFAppState().listSeguidosColapse = false;
      FFAppState().listUserUnidosColapse = false;
      safeSetState(() {});

      await widget.eventReference!.update({
        ...mapToFirestore(
          {
            'cantVisualizaciones': FieldValue.increment(1),
          },
        ),
      });
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 130.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<EventRecord>(
      stream: EventRecord.getDocument(widget.eventReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }

        final eventDetailEventRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Stack(
              children: [
                StreamBuilder<UserRecord>(
                  stream: UserRecord.getDocument(
                      eventDetailEventRecord.userCreator!),
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

                    final columnContenidoUserRecord = snapshot.data!;

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: SizedBox(
                              height: 400.0,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 407.0,
                                    decoration: const BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final imagenesEvento =
                                            eventDetailEventRecord
                                                .imagenesAdicionales
                                                .toList();

                                        return SizedBox(
                                          width: double.infinity,
                                          height: 500.0,
                                          child: Stack(
                                            children: [
                                              PageView.builder(
                                                controller: _model
                                                        .pageViewController ??=
                                                    PageController(
                                                        initialPage: max(
                                                            0,
                                                            min(
                                                                0,
                                                                imagenesEvento
                                                                        .length -
                                                                    1))),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    imagenesEvento.length,
                                                itemBuilder: (context,
                                                    imagenesEventoIndex) {
                                                  final imagenesEventoItem =
                                                      imagenesEvento[
                                                          imagenesEventoIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                    .ImgPerfil =
                                                                valueOrDefault<
                                                                    String>(
                                                              imagenesEventoItem,
                                                              'https://images.unsplash.com/photo-1502318217862-aa4e294ba657?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxzdGFycnklMjBuaWdodHxlbnwwfHx8fDE3MzA5OTcyMTF8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                                            );
                                                            FFAppState()
                                                                    .banderaBooleana3 =
                                                                true;
                                                            safeSetState(() {});
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                imagenesEventoItem,
                                                                'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg',
                                                              ),
                                                              width: double
                                                                  .infinity,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
                                                  child: smooth_page_indicator
                                                      .SmoothPageIndicator(
                                                    controller: _model
                                                            .pageViewController ??=
                                                        PageController(
                                                            initialPage: max(
                                                                0,
                                                                min(
                                                                    0,
                                                                    imagenesEvento
                                                                            .length -
                                                                        1))),
                                                    count:
                                                        imagenesEvento.length,
                                                    axisDirection:
                                                        Axis.horizontal,
                                                    onDotClicked: (i) async {
                                                      await _model
                                                          .pageViewController!
                                                          .animateToPage(
                                                        i,
                                                        duration: const Duration(
                                                            milliseconds: 500),
                                                        curve: Curves.ease,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    effect:
                                                        smooth_page_indicator
                                                            .SlideEffect(
                                                      spacing: 3.0,
                                                      radius: 8.0,
                                                      dotWidth: 8.0,
                                                      dotHeight: 6.0,
                                                      dotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      activeDotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      paintStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          15.0, 45.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.safePop();
                                        },
                                        child: Container(
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.08, -0.14),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.arrow_back,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 25.0,
                                                  ),
                                                ),
                                              ),
                                            ]
                                                .divide(const SizedBox(width: 5.0))
                                                .addToStart(
                                                    const SizedBox(width: 9.0))
                                                .addToEnd(const SizedBox(width: 9.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 8.0),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 52.0,
                                        ),
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: [
                                                if (!eventDetailEventRecord
                                                    .usersLikes
                                                    .contains(
                                                        currentUserReference))
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await eventDetailEventRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'usersLikes':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              currentUserReference
                                                            ]),
                                                            'likes': FieldValue
                                                                .increment(1),
                                                          },
                                                        ),
                                                      });
                                                      FFAppState().isLike =
                                                          true;
                                                      safeSetState(() {});
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  2000));
                                                      FFAppState().isLike =
                                                          false;
                                                      safeSetState(() {});
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/icon-saved.png',
                                                        width: 26.0,
                                                        height: 26.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                if (eventDetailEventRecord
                                                    .usersLikes
                                                    .contains(
                                                        currentUserReference))
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await eventDetailEventRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'usersLikes':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              currentUserReference
                                                            ]),
                                                            'likes': FieldValue
                                                                .increment(
                                                                    -(1)),
                                                          },
                                                        ),
                                                      });
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/icon-saved-filled.png',
                                                        width: 26.0,
                                                        height: 26.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              formatNumber(
                                                eventDetailEventRecord.likes,
                                                formatType: FormatType.compact,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                shadows: [
                                                  const Shadow(
                                                    color: Color(0xFF57636C),
                                                    offset: Offset(2.0, 2.0),
                                                    blurRadius: 1.0,
                                                  )
                                                ],
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
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 12.0),
                            child: Text(
                              eventDetailEventRecord.name,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          if ((eventDetailEventRecord.fechaInicio != null) ||
                              (eventDetailEventRecord.horaInicio != null) ||
                              (eventDetailEventRecord.horaFin != null) ||
                              (eventDetailEventRecord.fechaStr != ''))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                height: 42.0,
                                decoration: const BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if ((eventDetailEventRecord.fechaInicio !=
                                            null) ||
                                        (eventDetailEventRecord.fechaStr !=
                                                ''))
                                      Flexible(
                                        child: Container(
                                          constraints: const BoxConstraints(
                                            minWidth: 140.0,
                                            maxWidth: 190.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.calendar_month_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 25.0,
                                              ),
                                              SizedBox(
                                                height: 100.0,
                                                child: VerticalDivider(
                                                  width: 5.0,
                                                  thickness: 0.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Stack(
                                                    children: [
                                                      if (eventDetailEventRecord
                                                              .fechaInicio !=
                                                          null)
                                                        Text(
                                                          dateTimeFormat(
                                                            "d/M/y",
                                                            eventDetailEventRecord
                                                                .fechaInicio!,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      if (eventDetailEventRecord
                                                                  .fechaStr !=
                                                              '')
                                                        Text(
                                                          eventDetailEventRecord
                                                              .fechaStr,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ]
                                                .divide(const SizedBox(width: 7.0))
                                                .addToStart(
                                                    const SizedBox(width: 12.0))
                                                .addToEnd(
                                                    const SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                    if ((eventDetailEventRecord.horaInicio !=
                                            null) ||
                                        (eventDetailEventRecord.horaFin !=
                                            null))
                                      Flexible(
                                        child: Container(
                                          constraints: const BoxConstraints(
                                            minWidth: 140.0,
                                            maxWidth: 190.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.watch_later_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 25.0,
                                              ),
                                              SizedBox(
                                                height: 100.0,
                                                child: VerticalDivider(
                                                  width: 5.0,
                                                  thickness: 0.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (eventDetailEventRecord
                                                            .horaInicio !=
                                                        null)
                                                      Text(
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            "Hm",
                                                            eventDetailEventRecord
                                                                .horaInicio,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          '15:11',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    if ((eventDetailEventRecord
                                                                .horaInicio !=
                                                            null) &&
                                                        (eventDetailEventRecord
                                                                .horaFin !=
                                                            null))
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '0m628f7r' /*  -  */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    if (eventDetailEventRecord
                                                            .horaFin !=
                                                        null)
                                                      Text(
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            "Hm",
                                                            eventDetailEventRecord
                                                                .horaFin,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          '15:11',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ]
                                                .divide(const SizedBox(width: 7.0))
                                                .addToStart(
                                                    const SizedBox(width: 12.0))
                                                .addToEnd(
                                                    const SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                  ].divide(const SizedBox(width: 6.0)),
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 15.0),
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
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final categorys = eventDetailEventRecord
                                          .categorys
                                          .toList();

                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children:
                                              List.generate(categorys.length,
                                                  (categorysIndex) {
                                            final categorysItem =
                                                categorys[categorysIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'AllEvents',
                                                  queryParameters: {
                                                    'choiceChips':
                                                        serializeParam(
                                                      categorysItem,
                                                      ParamType.String,
                                                    ),
                                                    'buttonBack':
                                                        serializeParam(
                                                      true,
                                                      ParamType.bool,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 5.0, 12.0, 5.0),
                                                  child: Text(
                                                    categorysItem,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).divide(const SizedBox(width: 4.0)),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 5.0, 20.0, 25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (columnContenidoUserRecord
                                                .reference ==
                                            currentUserReference) {
                                          context.pushNamed('MyProfile');
                                        } else {
                                          context.pushNamed(
                                            'UserDetail',
                                            queryParameters: {
                                              'objUserParam': serializeParam(
                                                columnContenidoUserRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'objUserParam':
                                                  columnContenidoUserRecord,
                                            },
                                          );
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 45.0,
                                            height: 45.0,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Container(
                                                width: 45.0,
                                                height: 45.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    columnContenidoUserRecord
                                                        .photoUrl,
                                                    'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            columnContenidoUserRecord
                                                .displayName
                                                .maybeHandleOverflow(
                                              maxChars: 21,
                                              replacement: '…',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ]
                                            .divide(const SizedBox(width: 9.0))
                                            .addToEnd(const SizedBox(width: 9.0)),
                                      ),
                                    ),
                                    Container(
                                      width: 112.0,
                                      decoration: const BoxDecoration(),
                                      child: Visibility(
                                        visible: currentUserReference !=
                                            eventDetailEventRecord.userCreator,
                                        child: Stack(
                                          children: [
                                            if (!columnContenidoUserRecord
                                                .seguidores
                                                .contains(currentUserReference))
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  await columnContenidoUserRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'seguidores': FieldValue
                                                            .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'siguiendo': FieldValue
                                                            .arrayUnion([
                                                          columnContenidoUserRecord
                                                              .reference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '9opz2wir' /* Seguir */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 27.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color: Colors.white,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            if (columnContenidoUserRecord
                                                .seguidores
                                                .contains(currentUserReference))
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  await columnContenidoUserRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'seguidores': FieldValue
                                                            .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'siguiendo': FieldValue
                                                            .arrayRemove([
                                                          columnContenidoUserRecord
                                                              .reference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'b0ii6pgo' /* Dejar de seguir */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 27.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 8.0)),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 5.0,
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          if (eventDetailEventRecord.description != '')
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '0bj8elh5' /* Acerca de este evento */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 25.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              eventDetailEventRecord
                                                  .description,
                                              'description',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 5.0,
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ].divide(const SizedBox(height: 5.0)),
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 2.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ebq5m2ie' /* Ubicación del lugar */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 167.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.network(
                                          'https://www.google.com/maps/about/images/mymaps/mymaps-desktop-16x9.png',
                                          width: 300.0,
                                          height: 176.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 5.0, 20.0, 25.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'j2n16eyk' /* Alvear 800, Rosario, Santa Fe,... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ),
                                Divider(
                                  height: 5.0,
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ].divide(const SizedBox(height: 5.0)),
                            ),
                          ),
                          if (eventDetailEventRecord.isParticipar)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'cadwwne0' /* Participantes del evento */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().listUserUnidosColapse =
                                                true;
                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 2.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'f4eh9f4p' /* Ver todos */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            const Color(0x80000000),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 1.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.arrow_forward,
                                                  color: Color(0x7F000000),
                                                  size: 17.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        25.0, 0.0, 25.0, 0.0),
                                    child: Container(
                                      width: 400.0,
                                      decoration: const BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final useritem =
                                              eventDetailEventRecord.usersUnidos
                                                  .map((e) => e)
                                                  .toList()
                                                  .take(10)
                                                  .toList();
                                          if (useritem.isEmpty) {
                                            return Image.asset(
                                              'https://cdn.dribbble.com/users/134564/screenshots/2130212/media/96c633ef5816516913f98f90b73809a9.png?resize=800x600&vertical=center',
                                            );
                                          }

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: useritem.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 5.0),
                                            itemBuilder:
                                                (context, useritemIndex) {
                                              final useritemItem =
                                                  useritem[useritemIndex];
                                              return StreamBuilder<UserRecord>(
                                                stream: UserRecord.getDocument(
                                                    useritemItem),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        child: SpinKitPulse(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                    );
                                                  }

                                                  final userHorizontalCardUserRecord =
                                                      snapshot.data!;

                                                  return wrapWithModel(
                                                    model: _model
                                                        .userHorizontalCardModels
                                                        .getModel(
                                                      userHorizontalCardUserRecord
                                                          .reference.id,
                                                      useritemIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        UserHorizontalCardWidget(
                                                      key: Key(
                                                        'Keyuxg_${userHorizontalCardUserRecord.reference.id}',
                                                      ),
                                                      userParam:
                                                          userHorizontalCardUserRecord,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        25.0, 8.0, 25.0, 35.0),
                                    child: Stack(
                                      children: [
                                        if (!eventDetailEventRecord.usersUnidos
                                            .contains(currentUserReference))
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 30.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(50.0),
                                                  bottomRight:
                                                      Radius.circular(50.0),
                                                  topLeft:
                                                      Radius.circular(50.0),
                                                  topRight:
                                                      Radius.circular(50.0),
                                                ),
                                              ),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await eventDetailEventRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'usersUnidos':
                                                            FieldValue
                                                                .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '00w36eyk' /* Unirme al evento */,
                                                ),
                                                options: FFButtonOptions(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                          ),
                                        if (eventDetailEventRecord.usersUnidos
                                            .contains(currentUserReference))
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 30.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await eventDetailEventRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'usersUnidos':
                                                            FieldValue
                                                                .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'dtq8bgoi' /* Salir del evento */,
                                                ),
                                                options: FFButtonOptions(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color: Colors.white,
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: 1.0,
                                    thickness: 2.0,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ],
                              ),
                            ),
                          FutureBuilder<int>(
                            future: queryPromocionRecordCount(
                              queryBuilder: (promocionRecord) =>
                                  promocionRecord.where(
                                'user_creator',
                                isEqualTo: columnContenidoUserRecord.reference,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              int cuponesActivosDelLugarCount = snapshot.data!;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if ((cuponesActivosDelLugarCount > 0) &&
                                      columnContenidoUserRecord.profesional)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 30.0, 8.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context
                                                  .pushNamed('CreatePromocion');
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'i8mw5fr0' /* Cupones activos del usuario */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Lexend',
                                                    color: const Color(0xFF15161E),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().banderaBooleana =
                                                  true;
                                              safeSetState(() {});
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 2.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'q4oxr5b4' /* Ver todos */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color:
                                                              const Color(0x80000000),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.arrow_forward,
                                                    color: Color(0x7F000000),
                                                    size: 14.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if ((cuponesActivosDelLugarCount > 0) &&
                                      columnContenidoUserRecord.profesional)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: StreamBuilder<
                                            List<PromocionRecord>>(
                                          stream: queryPromocionRecord(
                                            queryBuilder: (promocionRecord) =>
                                                promocionRecord.where(
                                              'user_creator',
                                              isEqualTo:
                                                  columnContenidoUserRecord
                                                      .reference,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<PromocionRecord>
                                                listViewPromocionRecordList =
                                                snapshot.data!;

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  listViewPromocionRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(width: 9.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewPromocionRecord =
                                                    listViewPromocionRecordList[
                                                        listViewIndex];
                                                return wrapWithModel(
                                                  model: _model.cuponCardModels
                                                      .getModel(
                                                    listViewPromocionRecord
                                                        .reference.id,
                                                    listViewIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: CuponCardWidget(
                                                    key: Key(
                                                      'Keyv9l_${listViewPromocionRecord.reference.id}',
                                                    ),
                                                    cuponParam:
                                                        listViewPromocionRecord,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 30.0, 8.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('CreatePromocion');
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'kcmzngu4' /* Eventos similares */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Lexend',
                                                color: const Color(0xFF15161E),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'AllEvents',
                                            queryParameters: {
                                              'choiceChips': serializeParam(
                                                valueOrDefault<String>(
                                                  eventDetailEventRecord
                                                      .categorys.first,
                                                  'Musica',
                                                ),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 2.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'emifp2hk' /* Ver todos */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color:
                                                              const Color(0x80000000),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Color(0x7F000000),
                                                size: 14.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 200.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: StreamBuilder<List<EventRecord>>(
                                      stream: queryEventRecord(
                                        queryBuilder: (eventRecord) =>
                                            eventRecord
                                                .where(
                                                  'categorys',
                                                  arrayContains:
                                                      valueOrDefault<String>(
                                                    eventDetailEventRecord
                                                        .categorys.first,
                                                    'Musica',
                                                  ),
                                                )
                                                .where(
                                                  'name',
                                                  isNotEqualTo:
                                                      eventDetailEventRecord
                                                          .name,
                                                ),
                                        limit: 15,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 40.0,
                                              height: 40.0,
                                              child: SpinKitPulse(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 40.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<EventRecord>
                                            listViewEventRecordList =
                                            snapshot.data!;
                                        if (listViewEventRecordList.isEmpty) {
                                          return Image.asset(
                                            'assets/images/404_eventos_no_encontrados_categoria2.png',
                                          );
                                        }

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              listViewEventRecordList.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(width: 6.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewEventRecord =
                                                listViewEventRecordList[
                                                    listViewIndex];
                                            return wrapWithModel(
                                              model: _model.eventCardModels
                                                  .getModel(
                                                listViewEventRecord
                                                    .reference.id,
                                                listViewIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: EventCardWidget(
                                                key: Key(
                                                  'Keyuf4_${listViewEventRecord.reference.id}',
                                                ),
                                                eventParam: listViewEventRecord,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].addToEnd(const SizedBox(height: 40.0)),
                      ),
                    );
                  },
                ),
                if (FFAppState().listUserUnidosColapse)
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().listUserUnidosColapse = false;
                        safeSetState(() {});
                      },
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 2.0,
                          sigmaY: 2.0,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
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
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().listUserUnidosColapse = true;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      constraints: const BoxConstraints(
                                        minHeight: 200.0,
                                        maxHeight: 450.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 16.0, 8.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState()
                                                              .listUserUnidosColapse =
                                                          false;
                                                      safeSetState(() {});
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(4.0),
                                                        child: Icon(
                                                          Icons.close,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'vsg6mshc' /* Listado de participantes */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model
                                                  .listParticipantesUnidosModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  ListParticipantesUnidosWidget(
                                                objEventParam:
                                                    eventDetailEventRecord,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
                if (FFAppState().isLike)
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                      child: Container(
                        width: 285.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: const Color(0xE9E0E3E7),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'u28rmvka' /* ¡Se añadio a tus me gustas! */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!),
                    ),
                  ),
                if (FFAppState().banderaBooleana)
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().banderaBooleana = false;
                        safeSetState(() {});
                      },
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 2.0,
                          sigmaY: 2.0,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
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
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().banderaBooleana = true;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      constraints: const BoxConstraints(
                                        minHeight: 200.0,
                                        maxHeight: 450.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 5.0, 8.0, 15.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        FFAppState()
                                                                .banderaBooleana =
                                                            false;
                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  4.0),
                                                          child: Icon(
                                                            Icons.close,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '18xu8mh5' /* Listado de cupones del lugar */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .listCuponesUserDetailModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    ListCuponesUserDetailWidget(
                                                  userReference:
                                                      eventDetailEventRecord
                                                          .userCreator!,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
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
                if (FFAppState().banderaBooleana3)
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().banderaBooleana3 = false;
                        safeSetState(() {});
                      },
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 2.0,
                          sigmaY: 2.0,
                        ),
                        child: wrapWithModel(
                          model: _model.imagenDetailModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ImagenDetailWidget(
                            imagen: valueOrDefault<String>(
                              FFAppState().ImgPerfil,
                              'https://images.unsplash.com/photo-1502318217862-aa4e294ba657?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxzdGFycnklMjBuaWdodHxlbnwwfHx8fDE3MzA5OTcyMTF8MA&ixlib=rb-4.0.3&q=80&w=1080',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
