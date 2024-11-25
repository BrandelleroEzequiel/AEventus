import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/event_horizontal_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'event_admin_model.dart';
export 'event_admin_model.dart';

class EventAdminWidget extends StatefulWidget {
  const EventAdminWidget({super.key});

  @override
  State<EventAdminWidget> createState() => _EventAdminWidgetState();
}

class _EventAdminWidgetState extends State<EventAdminWidget> {
  late EventAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventAdminModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return StreamBuilder<List<EventRecord>>(
      stream: queryEventRecord(),
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
        List<EventRecord> eventAdminEventRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(2.0, 30.0, 2.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 25.0,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'qayzv3xx' /* Listado de eventos */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Lexend',
                                    color: const Color(0xFFA539EF),
                                    fontSize: 27.0,
                                    letterSpacing: 0.0,
                                  ),
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
                visible:
                    valueOrDefault<bool>(currentUserDocument?.isAdmin, false),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Container(
                                    height: 40.0,
                                    decoration: const BoxDecoration(),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        const Duration(milliseconds: 100),
                                        () async {
                                          safeSetState(() {
                                            _model.simpleSearchResults =
                                                TextSearch(
                                              eventAdminEventRecordList
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record,
                                                            [record.name]),
                                                  )
                                                  .toList(),
                                            )
                                                    .search(_model
                                                        .textController.text)
                                                    .map((r) => r.object)
                                                    .toList();
                                          });
                                          FFAppState().buscando = true;
                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'cu7fk8l5' /*     Buscar... */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                if (FFAppState().buscando == true)
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          safeSetState(() {
                                            _model.textController?.clear();
                                          });
                                          FFAppState().buscando = false;
                                          safeSetState(() {});
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          color: Color(0x8014181B),
                                          size: 28.0,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          if (!FFAppState().buscando)
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 8.0),
                                      child: FlutterFlowChoiceChips(
                                        options: [
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '0e5m9ekb' /* Todos */,
                                              ),
                                              Icons.public),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5nwzhlep' /* Comunidad */,
                                              ),
                                              Icons.people_alt_sharp),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'hjh3h641' /* Fiestas */,
                                              ),
                                              FontAwesomeIcons.cocktail),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ayap3q2k' /* Deportes */,
                                              ),
                                              Icons.sports_football),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'bx0mwffq' /* Gastronomía */,
                                              ),
                                              Icons.fastfood_rounded),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ms6xnlaw' /* Educación */,
                                              ),
                                              FontAwesomeIcons.school),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'kxa0umu7' /* Caridad */,
                                              ),
                                              FontAwesomeIcons
                                                  .handHoldingHeart),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '4l1sk7by' /* Teatro */,
                                              ),
                                              FontAwesomeIcons.splotch),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'j46x44pn' /* Música */,
                                              ),
                                              FontAwesomeIcons.music),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7dgv79q6' /* Turismo */,
                                              ),
                                              FontAwesomeIcons.tree),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ct9oncoz' /* Empresarial */,
                                              ),
                                              Icons.work),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'mdxr3ekq' /* Infantil */,
                                              ),
                                              FontAwesomeIcons.child),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'n8jzttgz' /* Otros */,
                                              ),
                                              Icons.notes)
                                        ],
                                        onChanged: (val) => safeSetState(() =>
                                            _model.choiceChipsValue =
                                                val?.firstOrNull),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context).info,
                                          iconSize: 13.0,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          borderWidth: 1.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          iconSize: 18.0,
                                          elevation: 0.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 1.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        chipSpacing: 5.0,
                                        rowSpacing: 2.0,
                                        multiselect: false,
                                        initialized:
                                            _model.choiceChipsValue != null,
                                        alignment: WrapAlignment.start,
                                        controller: _model
                                                .choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                          [
                                            FFLocalizations.of(context).getText(
                                              'veh9y5cn' /* Todos */,
                                            )
                                          ],
                                        ),
                                        wrapped: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Stack(
                              children: [
                                if ((FFAppState().buscando == false) &&
                                    (_model.choiceChipsValue == 'Todos'))
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final allEventsItem =
                                              eventAdminEventRecordList
                                                  .toList();

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: allEventsItem.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 8.0),
                                            itemBuilder:
                                                (context, allEventsItemIndex) {
                                              final allEventsItemItem =
                                                  allEventsItem[
                                                      allEventsItemIndex];
                                              return wrapWithModel(
                                                model: _model
                                                    .eventHorizontalModels1
                                                    .getModel(
                                                  allEventsItemItem
                                                      .reference.id,
                                                  allEventsItemIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: EventHorizontalWidget(
                                                  key: Key(
                                                    'Key4gw_${allEventsItemItem.reference.id}',
                                                  ),
                                                  objParam: allEventsItemItem,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ].addToEnd(const SizedBox(height: 50.0)),
                                  ),
                                if ((FFAppState().buscando == false) &&
                                    (_model.choiceChipsValue == 'Comunidad'))
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final allEventsItem =
                                              eventAdminEventRecordList
                                                  .map((e) => e)
                                                  .toList()
                                                  .where((e) =>
                                                      !e.iscreatorProfesional)
                                                  .toList();

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: allEventsItem.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 8.0),
                                            itemBuilder:
                                                (context, allEventsItemIndex) {
                                              final allEventsItemItem =
                                                  allEventsItem[
                                                      allEventsItemIndex];
                                              return wrapWithModel(
                                                model: _model
                                                    .eventHorizontalModels2
                                                    .getModel(
                                                  allEventsItemItem
                                                      .reference.id,
                                                  allEventsItemIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: EventHorizontalWidget(
                                                  key: Key(
                                                    'Keyo0z_${allEventsItemItem.reference.id}',
                                                  ),
                                                  objParam: allEventsItemItem,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ].addToEnd(const SizedBox(height: 50.0)),
                                  ),
                                if ((FFAppState().buscando == false) &&
                                    (_model.choiceChipsValue != 'Comunidad') &&
                                    (_model.choiceChipsValue != 'Todos'))
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final allEventsItem =
                                              eventAdminEventRecordList
                                                  .map((e) => e)
                                                  .toList()
                                                  .where((e) =>
                                                      e.categorys.contains(_model
                                                          .choiceChipsValue) ==
                                                      true)
                                                  .toList();

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: allEventsItem.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 8.0),
                                            itemBuilder:
                                                (context, allEventsItemIndex) {
                                              final allEventsItemItem =
                                                  allEventsItem[
                                                      allEventsItemIndex];
                                              return wrapWithModel(
                                                model: _model
                                                    .eventHorizontalModels3
                                                    .getModel(
                                                  allEventsItemItem
                                                      .reference.id,
                                                  allEventsItemIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: EventHorizontalWidget(
                                                  key: Key(
                                                    'Keyo3h_${allEventsItemItem.reference.id}',
                                                  ),
                                                  objParam: allEventsItemItem,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ].addToEnd(const SizedBox(height: 50.0)),
                                  ),
                                if (FFAppState().buscando == true)
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final allEventsItem = _model
                                              .simpleSearchResults
                                              .map((e) => e)
                                              .toList();

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: allEventsItem.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 8.0),
                                            itemBuilder:
                                                (context, allEventsItemIndex) {
                                              final allEventsItemItem =
                                                  allEventsItem[
                                                      allEventsItemIndex];
                                              return wrapWithModel(
                                                model: _model
                                                    .eventHorizontalModels4
                                                    .getModel(
                                                  allEventsItemItem
                                                      .reference.id,
                                                  allEventsItemIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: EventHorizontalWidget(
                                                  key: Key(
                                                    'Keyvcc_${allEventsItemItem.reference.id}',
                                                  ),
                                                  objParam: allEventsItemItem,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ].addToEnd(const SizedBox(height: 50.0)),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
