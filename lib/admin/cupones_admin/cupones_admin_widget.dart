import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/componentes/my_cupon_creado/my_cupon_creado_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'cupones_admin_model.dart';
export 'cupones_admin_model.dart';

class CuponesAdminWidget extends StatefulWidget {
  const CuponesAdminWidget({super.key});

  @override
  State<CuponesAdminWidget> createState() => _CuponesAdminWidgetState();
}

class _CuponesAdminWidgetState extends State<CuponesAdminWidget> {
  late CuponesAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CuponesAdminModel());

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

    return StreamBuilder<List<PromocionRecord>>(
      stream: queryPromocionRecord(),
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
        List<PromocionRecord> cuponesAdminPromocionRecordList = snapshot.data!;

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
                            '174x1ucg' /* Listado de cupones */,
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
                                              cuponesAdminPromocionRecordList
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
                                          'ek3of3j1' /*     Buscar... */,
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
                                                'geiggfms' /* Todos */,
                                              ),
                                              Icons.public),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'm7rd4oko' /* Fiestas */,
                                              ),
                                              FontAwesomeIcons.cocktail),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5raz4m1c' /* Deportes */,
                                              ),
                                              Icons.sports_football),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '4khvcof0' /* Gastronomía */,
                                              ),
                                              Icons.fastfood_rounded),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'utycb5f9' /* Educación */,
                                              ),
                                              FontAwesomeIcons.school),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '79fwx7gw' /* Caridad */,
                                              ),
                                              FontAwesomeIcons
                                                  .handHoldingHeart),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'dcw0ljj0' /* Teatro */,
                                              ),
                                              FontAwesomeIcons.splotch),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'o0tl6uo3' /* Música */,
                                              ),
                                              FontAwesomeIcons.music),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '4vetgm6w' /* Turismo */,
                                              ),
                                              FontAwesomeIcons.tree),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'bfshchf8' /* Empresarial */,
                                              ),
                                              Icons.work),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'jxxyttje' /* Infantil */,
                                              ),
                                              FontAwesomeIcons.child),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '2hofxhdb' /* Otros */,
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
                                              'g1hrf99p' /* Todos */,
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
                                              cuponesAdminPromocionRecordList
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
                                                    .myCuponCreadoModels1
                                                    .getModel(
                                                  allEventsItemItem
                                                      .reference.id,
                                                  allEventsItemIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: MyCuponCreadoWidget(
                                                  key: Key(
                                                    'Keyj3q_${allEventsItemItem.reference.id}',
                                                  ),
                                                  objCuponParam:
                                                      allEventsItemItem,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ].addToEnd(const SizedBox(height: 50.0)),
                                  ),
                                if ((FFAppState().buscando == false) &&
                                    (_model.choiceChipsValue != 'Todos'))
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final allEventsItem =
                                              cuponesAdminPromocionRecordList
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
                                                    .myCuponCreadoModels2
                                                    .getModel(
                                                  allEventsItemItem
                                                      .reference.id,
                                                  allEventsItemIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: MyCuponCreadoWidget(
                                                  key: Key(
                                                    'Key7v2_${allEventsItemItem.reference.id}',
                                                  ),
                                                  objCuponParam:
                                                      allEventsItemItem,
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
                                                    .myCuponCreadoModels3
                                                    .getModel(
                                                  allEventsItemItem
                                                      .reference.id,
                                                  allEventsItemIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: MyCuponCreadoWidget(
                                                  key: Key(
                                                    'Keykaa_${allEventsItemItem.reference.id}',
                                                  ),
                                                  objCuponParam:
                                                      allEventsItemItem,
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
