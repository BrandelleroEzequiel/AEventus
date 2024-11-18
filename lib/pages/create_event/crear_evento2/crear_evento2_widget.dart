import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'crear_evento2_model.dart';
export 'crear_evento2_model.dart';

class CrearEvento2Widget extends StatefulWidget {
  const CrearEvento2Widget({super.key});

  @override
  State<CrearEvento2Widget> createState() => _CrearEvento2WidgetState();
}

class _CrearEvento2WidgetState extends State<CrearEvento2Widget> {
  late CrearEvento2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrearEvento2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().estado = 'SinFecha';
      safeSetState(() {});
    });

    _model.switchHoraInicioValue = FFAppState().isFechaColapse;
    _model.switchHoraFinValue = FFAppState().isFechaColapse;
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 362.0,
                    height: 43.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Color(0xBC57636C),
                              size: 21.0,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'g7403eqz' /* Configurando evento nuevo */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1.0,
                    color: Color(0x3F57636C),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'iak6f5au' /* ¿El evento tiene una ubicación... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      'https://css-tianguis.com/wp-content/uploads/2020/03/google-maps-links.png',
                                      width: double.infinity,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                  maxWidth: 600.0,
                                ),
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '6ffs2qmm' /* ¿El evento tiene una fecha? */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().estado = 'SinFecha';
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              constraints: const BoxConstraints(
                                                minWidth: 60.0,
                                                maxWidth: 120.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    (FFAppState().estado !=
                                                                'FechaExacta') &&
                                                            (FFAppState()
                                                                    .estado !=
                                                                'FechaPeriodica')
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                  ),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 19.0, 5.0, 19.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    FaIcon(
                                                      FontAwesomeIcons.times,
                                                      color:
                                                          valueOrDefault<Color>(
                                                        (FFAppState().estado !=
                                                                    'FechaExacta') &&
                                                                (FFAppState()
                                                                        .estado !=
                                                                    'FechaPeriodica')
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                      ),
                                                      size: 34.0,
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'lh15a4pw' /* Sin fecha */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: (FFAppState().estado !=
                                                                            'FechaExacta') &&
                                                                        (FFAppState().estado !=
                                                                            'FechaPeriodica')
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 5.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().estado =
                                                  'FechaExacta';
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              constraints: const BoxConstraints(
                                                minWidth: 60.0,
                                                maxWidth: 120.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState()
                                                                .estado ==
                                                            'FechaExacta'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                  ),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 12.0, 5.0, 12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.calendar_today,
                                                      color:
                                                          valueOrDefault<Color>(
                                                        FFAppState().estado ==
                                                                'FechaExacta'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                      ),
                                                      size: 34.0,
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'vo3k029d' /* Fecha
exacta */
                                                        ,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              FFAppState().estado ==
                                                                      'FechaExacta'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                            ),
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 5.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().estado =
                                                  'FechaPeriodica';
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              constraints: const BoxConstraints(
                                                minWidth: 60.0,
                                                maxWidth: 120.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().estado ==
                                                            'FechaPeriodica'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                  ),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 12.0, 5.0, 12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.calendar_month,
                                                      color:
                                                          valueOrDefault<Color>(
                                                        FFAppState().estado ==
                                                                'FechaPeriodica'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                      ),
                                                      size: 34.0,
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '2uzvc0z4' /* Fecha
periódica */
                                                        ,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              FFAppState().estado ==
                                                                      'FechaPeriodica'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                            ),
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 5.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 6.0)),
                                    ),
                                    if (FFAppState().estado == 'FechaExacta')
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 6.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'v0ovssa2' /* Ingrese la fecha exacta del ev... */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Container(
                                              width: 205.0,
                                              height: 41.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                      final datePicked1Date =
                                                          await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            getCurrentTimestamp,
                                                        firstDate:
                                                            getCurrentTimestamp,
                                                        lastDate:
                                                            DateTime(2050),
                                                        builder:
                                                            (context, child) {
                                                          return wrapInMaterialDatePickerTheme(
                                                            context,
                                                            child!,
                                                            headerBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            headerForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            headerTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend',
                                                                      fontSize:
                                                                          32.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                            pickerBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            pickerForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            selectedDateTimeBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            selectedDateTimeForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            actionButtonForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            iconSize: 24.0,
                                                          );
                                                        },
                                                      );

                                                      if (datePicked1Date !=
                                                          null) {
                                                        safeSetState(() {
                                                          _model.datePicked1 =
                                                              DateTime(
                                                            datePicked1Date
                                                                .year,
                                                            datePicked1Date
                                                                .month,
                                                            datePicked1Date
                                                                .day,
                                                          );
                                                        });
                                                      }
                                                    },
                                                    child: Icon(
                                                      Icons.date_range,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 25.0,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 100.0,
                                                    child: VerticalDivider(
                                                      thickness: 2.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      dateTimeFormat(
                                                        "d/M/y",
                                                        _model.datePicked1,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Lexend',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(width: 8.0))
                                                    .addToStart(
                                                        const SizedBox(width: 15.0))
                                                    .addToEnd(
                                                        const SizedBox(width: 15.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (FFAppState().estado == 'FechaPeriodica')
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 6.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'r5hwqz4q' /* Eliga una opción */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Container(
                                              width: 205.0,
                                              height: 41.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .dropDownValueController ??=
                                                    FormFieldController<String>(
                                                  _model.dropDownValue ??=
                                                      FFAppState().fechaStr,
                                                ),
                                                options: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'isz5lfho' /* Los Lunes */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'on3dhy2a' /* Los Martes */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'a0hqoshx' /* Los Miércoles */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'zs9hx35o' /* Los Jueves */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '7fg3isw5' /* Los Viernes */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '32urr21t' /* Los Sábados */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '303nmsz9' /* Los Domingos */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'qzikvkki' /* Fines de semana */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'px96mecg' /* Todos los dias */,
                                                  )
                                                ],
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                        .dropDownValue = val),
                                                width: 200.0,
                                                height: 40.0,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'kaf95cwm' /* Seleccione aqui */,
                                                ),
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 8.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 12.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                  maxWidth: 600.0,
                                ),
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'exc3imc6' /* ¿El evento tiene horario de in... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Switch.adaptive(
                                            value:
                                                _model.switchHoraInicioValue!,
                                            onChanged: (newValue) async {
                                              safeSetState(() =>
                                                  _model.switchHoraInicioValue =
                                                      newValue);
                                              if (newValue) {
                                                FFAppState().banderaBooleana =
                                                    true;
                                                safeSetState(() {});
                                              } else {
                                                FFAppState().banderaBooleana =
                                                    false;
                                                FFAppState().horaInicio = null;
                                                safeSetState(() {});
                                              }
                                            },
                                            activeColor: const Color(0xFF8667F2),
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            inactiveTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            inactiveThumbColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (FFAppState().banderaBooleana)
                                      Container(
                                        decoration: const BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'i0cy4d0c' /* Inicio */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(1.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: 132.0,
                                                height: 41.0,
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
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
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
                                                        final datePicked2Time =
                                                            await showTimePicker(
                                                          context: context,
                                                          initialTime: TimeOfDay
                                                              .fromDateTime(
                                                                  getCurrentTimestamp),
                                                          builder:
                                                              (context, child) {
                                                            return wrapInMaterialTimePickerTheme(
                                                              context,
                                                              child!,
                                                              headerBackgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              headerForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              headerTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend',
                                                                        fontSize:
                                                                            32.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                              pickerBackgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              pickerForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              selectedDateTimeBackgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              selectedDateTimeForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              actionButtonForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              iconSize: 24.0,
                                                            );
                                                          },
                                                        );
                                                        if (datePicked2Time !=
                                                            null) {
                                                          safeSetState(() {
                                                            _model.datePicked2 =
                                                                DateTime(
                                                              getCurrentTimestamp
                                                                  .year,
                                                              getCurrentTimestamp
                                                                  .month,
                                                              getCurrentTimestamp
                                                                  .day,
                                                              datePicked2Time
                                                                  .hour,
                                                              datePicked2Time
                                                                  .minute,
                                                            );
                                                          });
                                                        }
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .watch_later_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 25.0,
                                                      ),
                                                    ),
                                                    VerticalDivider(
                                                      width: 1.0,
                                                      thickness: 2.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        dateTimeFormat(
                                                          "Hm",
                                                          _model.datePicked2,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                  ]
                                                      .divide(
                                                          const SizedBox(width: 13.0))
                                                      .addToStart(
                                                          const SizedBox(width: 13.0))
                                                      .addToEnd(const SizedBox(
                                                          width: 13.0)),
                                                ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 15.0)),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(
                                maxWidth: 600.0,
                              ),
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          's5u8x5x8' /* ¿El evento tiene horario de fi... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Switch.adaptive(
                                          value: _model.switchHoraFinValue!,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.switchHoraFinValue =
                                                    newValue);
                                            if (newValue) {
                                              FFAppState().banderaBoleana2 =
                                                  true;
                                              safeSetState(() {});
                                            } else {
                                              FFAppState().banderaBoleana2 =
                                                  false;
                                              FFAppState().horaFin = null;
                                              safeSetState(() {});
                                            }
                                          },
                                          activeColor: const Color(0xFF8667F2),
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (FFAppState().banderaBoleana2)
                                    Container(
                                      decoration: const BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '0993via6' /* Fin */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    1.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 132.0,
                                              height: 41.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
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
                                                      final datePicked3Time =
                                                          await showTimePicker(
                                                        context: context,
                                                        initialTime: TimeOfDay
                                                            .fromDateTime(
                                                                getCurrentTimestamp),
                                                        builder:
                                                            (context, child) {
                                                          return wrapInMaterialTimePickerTheme(
                                                            context,
                                                            child!,
                                                            headerBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            headerForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            headerTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend',
                                                                      fontSize:
                                                                          32.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                            pickerBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            pickerForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            selectedDateTimeBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            selectedDateTimeForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            actionButtonForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            iconSize: 24.0,
                                                          );
                                                        },
                                                      );
                                                      if (datePicked3Time !=
                                                          null) {
                                                        safeSetState(() {
                                                          _model.datePicked3 =
                                                              DateTime(
                                                            getCurrentTimestamp
                                                                .year,
                                                            getCurrentTimestamp
                                                                .month,
                                                            getCurrentTimestamp
                                                                .day,
                                                            datePicked3Time
                                                                .hour,
                                                            datePicked3Time
                                                                .minute,
                                                          );
                                                        });
                                                      }
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .access_time_filled_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 25.0,
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    width: 1.0,
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      dateTimeFormat(
                                                        "Hm",
                                                        _model.datePicked3,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Lexend',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(width: 13.0))
                                                    .addToStart(
                                                        const SizedBox(width: 13.0))
                                                    .addToEnd(
                                                        const SizedBox(width: 13.0)),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 15.0)),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
                    .addToStart(const SizedBox(height: 40.0))
                    .addToEnd(const SizedBox(height: 90.0)),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: 90.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0x00FFFFFF), Color(0x92000000)],
                    stops: [0.0, 0.9],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 6.0, 20.0, 25.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (FFAppState().estado != 'SinFecha') {
                          if ((FFAppState().estado == 'FechaExacta') &&
                              (_model.datePicked1 != null)) {
                            FFAppState().updateEventoCreadoStruct(
                              (e) => e..fechaInicio = _model.datePicked1,
                            );
                            safeSetState(() {});
                          } else {
                            if ((FFAppState().estado == 'FechaPeriodica') &&
                                (_model.dropDownValue != null &&
                                    _model.dropDownValue != '')) {
                              FFAppState().updateEventoCreadoStruct(
                                (e) => e..fechaStr = _model.dropDownValue,
                              );
                              safeSetState(() {});
                            }
                          }
                        }
                        if ((FFAppState().banderaBooleana == true) &&
                            (_model.datePicked2 != null)) {
                          FFAppState().updateEventoCreadoStruct(
                            (e) => e
                              ..horaInicio = _model.datePicked2
                              ..isHoraInicio = true,
                          );
                          safeSetState(() {});
                        }
                        if ((FFAppState().banderaBoleana2 == true) &&
                            (_model.datePicked3 != null)) {
                          FFAppState().updateEventoCreadoStruct(
                            (e) => e
                              ..horaFin = _model.datePicked3
                              ..isHoraFin = true,
                          );
                          safeSetState(() {});
                        }

                        context.pushNamed('CrearEvento3');
                      },
                      text: FFLocalizations.of(context).getText(
                        'skzkwxj6' /* Continuar */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 38.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      showLoadingIndicator: false,
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
