import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'editar_evento_model.dart';
export 'editar_evento_model.dart';

class EditarEventoWidget extends StatefulWidget {
  const EditarEventoWidget({
    super.key,
    required this.eventCreado,
  });

  final EventRecord? eventCreado;

  @override
  State<EditarEventoWidget> createState() => _EditarEventoWidgetState();
}

class _EditarEventoWidgetState extends State<EditarEventoWidget> {
  late EditarEventoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarEventoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.eventCreado?.fechaInicio != null) {
        FFAppState().estado = 'FechaExacta';
        FFAppState().fechaInicio = widget.eventCreado?.fechaInicio;
        FFAppState().fechaStr = '';
        safeSetState(() {});
      } else {
        FFAppState().fechaInicio = null;
        safeSetState(() {});
        if (widget.eventCreado?.fechaStr != null &&
            widget.eventCreado?.fechaStr != '') {
          FFAppState().estado = 'FechaPeriodica';
          FFAppState().fechaStr = widget.eventCreado!.fechaStr;
          safeSetState(() {});
        } else {
          FFAppState().estado = 'SinFecha';
          FFAppState().fechaStr = '';
          safeSetState(() {});
        }
      }

      if (widget.eventCreado?.horaInicio != null) {
        FFAppState().banderaBooleana = true;
        FFAppState().horaInicio = widget.eventCreado?.horaInicio;
        safeSetState(() {});
      } else {
        FFAppState().banderaBooleana = false;
        FFAppState().horaInicio = null;
        safeSetState(() {});
      }

      if (widget.eventCreado?.horaFin != null) {
        FFAppState().banderaBoleana2 = true;
        FFAppState().horaFin = widget.eventCreado?.horaFin;
        safeSetState(() {});
      } else {
        FFAppState().banderaBoleana2 = false;
        FFAppState().horaFin = null;
        safeSetState(() {});
      }

      FFAppState().banderaBooleana3 = false;
      FFAppState().imgpath =
          widget.eventCreado!.imagenesAdicionales.toList().cast<String>();
      safeSetState(() {});
    });

    _model.tituloTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.eventCreado?.name,
      'name',
    ));
    _model.tituloFocusNode ??= FocusNode();

    _model.descripcionTextController ??=
        TextEditingController(text: widget.eventCreado?.description);
    _model.descripcionFocusNode ??= FocusNode();

    _model.switchHoraInicioValue = widget.eventCreado!.isHoraInicio;
    _model.switchHoraFinValue = widget.eventCreado!.isHoraFin;
    _model.switchParticipantesValue = widget.eventCreado!.isParticipar;
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
                              FFAppState().imgpath = [];
                              FFAppState().imgpathFalse = [];
                              FFAppState().isFechaColapse = false;
                              FFAppState().isHoraColapse = false;
                              FFAppState().fechaInicio = null;
                              FFAppState().horaInicio = null;
                              FFAppState().horaFin = null;
                              FFAppState().option = false;
                              FFAppState().integert = 0;
                              FFAppState().banderaBooleana = false;
                              FFAppState().banderaBoleana2 = false;
                              safeSetState(() {});
                              FFAppState().addToImgpath(
                                  'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg');
                              FFAppState().addToImgpathFalse(
                                  'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg');
                              FFAppState().ImgPerfil =
                                  'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg';
                              FFAppState().imgPortada =
                                  'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg';
                              safeSetState(() {});
                              context.safePop();
                            },
                            child: Icon(
                              Icons.close,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'u3lknu4t' /* Editar evento */,
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
                                0.0, 0.0, 0.0, 15.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'x0korhvb' /* ¿Quiere agregar imagenes al ev... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Container(
                                            height: 180.0,
                                            constraints: const BoxConstraints(
                                              maxWidth: 260.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final imagenes = FFAppState()
                                                    .imgpath
                                                    .toList();

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: imagenes.length,
                                                  separatorBuilder: (_, __) =>
                                                      const SizedBox(width: 8.0),
                                                  itemBuilder:
                                                      (context, imagenesIndex) {
                                                    final imagenesItem =
                                                        imagenes[imagenesIndex];
                                                    return Container(
                                                      width: 200.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              imagenesItem,
                                                              'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg',
                                                            ),
                                                          ).image,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .removeAtIndexFromImgpath(
                                                                      imagenesIndex);
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .delete_outline_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            width: 110.0,
                                            height: 180.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                final selectedMedia =
                                                    await selectMediaWithSourceBottomSheet(
                                                  context: context,
                                                  allowPhoto: true,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  safeSetState(() => _model
                                                      .isDataUploading = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isDataUploading =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    safeSetState(() {
                                                      _model.uploadedLocalFile =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl =
                                                          downloadUrls.first;
                                                    });
                                                  } else {
                                                    safeSetState(() {});
                                                    return;
                                                  }
                                                }

                                                FFAppState().addToImgpath(
                                                    _model.uploadedFileUrl);
                                                safeSetState(() {});
                                              },
                                              child: Icon(
                                                Icons.add_circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 45.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 7.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.tituloTextController,
                              focusNode: _model.tituloFocusNode,
                              autofocus: false,
                              textCapitalization: TextCapitalization.none,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  '4ziyfcvm' /* Título del evento */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      letterSpacing: 0.0,
                                    ),
                                errorStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context).error,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 16.0, 20.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model.tituloTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 15.0),
                            child: TextFormField(
                              controller: _model.descripcionTextController,
                              focusNode: _model.descripcionFocusNode,
                              autofocus: false,
                              textCapitalization: TextCapitalization.none,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'va59tvvh' /* Descripción */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                                alignLabelWithHint: true,
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      letterSpacing: 0.0,
                                    ),
                                errorStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context).error,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    letterSpacing: 0.0,
                                  ),
                              maxLines: 9,
                              minLines: 5,
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model
                                  .descripcionTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
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
                                        'q0v3z3gl' /* Ubicacion exacta del evento */,
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
                                  0.0, 15.0, 0.0, 15.0),
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
                                          'eqjwmagt' /* Fecha del evento */,
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
                                                        'kv8vwikk' /* Sin fecha */,
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
                                                        'da4mzl8s' /* Fecha
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
                                                        'qfz3u1i1' /* Fecha
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
                                                  'g8ifx3gx' /* Fecha exacta del evento */,
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
                                                      FFAppState().fechaInicio =
                                                          _model.datePicked1;
                                                      safeSetState(() {});
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
                                                        FFAppState()
                                                            .fechaInicio,
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
                                                  'ycuivowp' /* Eliga la opción que correspond... */,
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
                                                      valueOrDefault<String>(
                                                    FFAppState().fechaStr,
                                                    'Todos los dias',
                                                  ),
                                                ),
                                                options: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mwwemsx9' /* Los Lunes */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'gprnz2hg' /* Los Martes */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '9ipn1rsl' /* Los Miércoles */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'px3ph4s3' /* Los Jueves */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'l6rpf2s2' /* Los Viernes */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'uo61jzjp' /* Los Sábados */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'j2uq6xel' /* Los Domingos */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'i5v7376h' /* Fines de semana */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'avhikknj' /* Todos los dias */,
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
                                                  'ohefk4j1' /* Seleccione aqui */,
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
                                            '680sb2ua' /* Horario de inicio del evento */,
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
                                                  'jaunohs7' /* Inicio */,
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
                                                        FFAppState()
                                                                .horaInicio =
                                                            _model.datePicked2;
                                                        safeSetState(() {});
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
                                                          FFAppState()
                                                              .horaInicio,
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
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
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
                                            'gnozqc3p' /* Horario de fin del evento */,
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
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'kn5z1l9i' /* Fin */,
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
                                                        FFAppState().horaFin =
                                                            _model.datePicked3;
                                                        safeSetState(() {});
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        dateTimeFormat(
                                                          "Hm",
                                                          FFAppState().horaFin,
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
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 10.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'mpms5204' /* Seleccione una o más categoría... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  1.0, 0.0, 0.0, 15.0),
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData(FFLocalizations.of(context).getText(
                                    'ebml977f' /* Fiestas */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    'cp05cxad' /* Deportes */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    'gc94meqp' /* Gastronomía */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    'mdi1g58e' /* Educación */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    'cvezslz2' /* Caridad */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    '3cwlgrxw' /* Teatro */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    '7d0z49ab' /* Música */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    'fh9er8t7' /* Turismo */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    'ntumzs2d' /* Empresarial */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    'mjxq10vv' /* Infantil */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    'dm5lhf3r' /* Otros */,
                                  ))
                                ],
                                onChanged: (val) => safeSetState(() =>
                                    _model.choiceChipsCategoriasValues = val),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor: const Color(0x33B400FF),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  iconSize: 18.0,
                                  elevation: 0.0,
                                  borderColor: const Color(0x52B400FF),
                                  borderWidth: 2.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  iconSize: 18.0,
                                  elevation: 0.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                chipSpacing: 8.0,
                                rowSpacing: 8.0,
                                multiselect: true,
                                initialized:
                                    _model.choiceChipsCategoriasValues != null,
                                alignment: WrapAlignment.start,
                                controller: _model
                                        .choiceChipsCategoriasValueController ??=
                                    FormFieldController<List<String>>(
                                  widget.eventCreado?.categorys,
                                ),
                                wrapped: true,
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
                                  0.0, 15.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'lzwtg8xb' /* Seleccione las funcionalidades... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 10.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'lkm9q68p' /* Permitir unirse al evento y vi... */,
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Switch.adaptive(
                                        value: _model.switchParticipantesValue!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchParticipantesValue =
                                                  newValue);
                                        },
                                        activeColor: const Color(0xCEB400FF),
                                        activeTrackColor: const Color(0xA6B400FF),
                                        inactiveTrackColor: const Color(0x24B400FF),
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
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
                        FFAppState().banderaBooleana3 = true;
                        safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'bajqyt8c' /* Continuar */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 45.0,
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
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 300.0,
                        height: 160.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: Color(0x3B1D2429),
                              offset: Offset(
                                0.0,
                                -3.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 6.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'mb7yypcm' /* ¿Confirma editar este evento? */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                FFAppState().banderaBooleana3 = false;
                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'm84d3de6' /* Cancelar */,
                              ),
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 35.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: const Color(0xFF57636C),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                if (FFAppState().estado == 'SinFecha') {
                                  await widget.eventCreado!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'fechaInicio': FieldValue.delete(),
                                        'fechaStr': FieldValue.delete(),
                                      },
                                    ),
                                  });
                                } else {
                                  if (FFAppState().estado == 'FechaExacta') {
                                    await widget.eventCreado!.reference
                                        .update({
                                      ...createEventRecordData(
                                        fechaInicio: FFAppState().fechaInicio,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'fechaStr': FieldValue.delete(),
                                        },
                                      ),
                                    });
                                  } else {
                                    if (FFAppState().estado ==
                                        'FechaPeriodica') {
                                      await widget.eventCreado!.reference
                                          .update({
                                        ...createEventRecordData(
                                          fechaStr: _model.dropDownValue,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'fechaInicio': FieldValue.delete(),
                                          },
                                        ),
                                      });
                                    }
                                  }
                                }

                                if ((FFAppState().horaInicio != null) &&
                                    FFAppState().banderaBooleana) {
                                  await widget.eventCreado!.reference
                                      .update(createEventRecordData(
                                    horaInicio: FFAppState().horaInicio,
                                    isHoraInicio: true,
                                  ));
                                } else {
                                  await widget.eventCreado!.reference.update({
                                    ...createEventRecordData(
                                      isHoraInicio: false,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'horaInicio': FieldValue.delete(),
                                      },
                                    ),
                                  });
                                }

                                if ((FFAppState().horaFin != null) &&
                                    FFAppState().banderaBoleana2) {
                                  await widget.eventCreado!.reference
                                      .update(createEventRecordData(
                                    horaFin: FFAppState().horaFin,
                                    isHoraFin: true,
                                  ));
                                } else {
                                  await widget.eventCreado!.reference.update({
                                    ...createEventRecordData(
                                      isHoraFin: false,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'horaFin': FieldValue.delete(),
                                      },
                                    ),
                                  });
                                }

                                await widget.eventCreado!.reference.update({
                                  ...createEventRecordData(
                                    name: _model.tituloTextController.text,
                                    description:
                                        _model.descripcionTextController.text,
                                    isParticipar:
                                        _model.switchParticipantesValue,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'ImagenesAdicionales':
                                          FFAppState().imgpath,
                                      'categorys':
                                          _model.choiceChipsCategoriasValues,
                                    },
                                  ),
                                });
                                FFAppState().imgpath = [];
                                FFAppState().imgpathFalse = [];
                                FFAppState().isFechaColapse = false;
                                FFAppState().isHoraColapse = false;
                                FFAppState().fechaInicio = null;
                                FFAppState().horaInicio = null;
                                FFAppState().horaFin = null;
                                FFAppState().option = false;
                                FFAppState().integert = 0;
                                FFAppState().banderaBooleana = false;
                                FFAppState().banderaBoleana2 = false;
                                FFAppState().banderaBooleana3 = false;
                                safeSetState(() {});
                                FFAppState().addToImgpath(
                                    'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg');
                                FFAppState().addToImgpathFalse(
                                    'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg');
                                FFAppState().ImgPerfil =
                                    'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg';
                                FFAppState().imgPortada =
                                    'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg';
                                safeSetState(() {});
                                context.safePop();
                              },
                              text: FFLocalizations.of(context).getText(
                                'f8c35d4t' /* Confirmar */,
                              ),
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 35.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 2.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ].divide(const SizedBox(height: 12.0)),
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
  }
}
