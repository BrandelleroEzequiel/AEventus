import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/componentes/event_card_big/event_card_big_widget.dart';
import 'all_events_widget.dart' show AllEventsWidget;
import 'package:flutter/material.dart';

class AllEventsModel extends FlutterFlowModel<AllEventsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<EventRecord> simpleSearchResults = [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for eventCardBig dynamic component.
  late FlutterFlowDynamicModels<EventCardBigModel> eventCardBigModels1;
  // Models for eventCardBig dynamic component.
  late FlutterFlowDynamicModels<EventCardBigModel> eventCardBigModels2;
  // Models for eventCardBig dynamic component.
  late FlutterFlowDynamicModels<EventCardBigModel> eventCardBigModels3;
  // Models for eventCardBig dynamic component.
  late FlutterFlowDynamicModels<EventCardBigModel> eventCardBigModels4;

  @override
  void initState(BuildContext context) {
    eventCardBigModels1 = FlutterFlowDynamicModels(() => EventCardBigModel());
    eventCardBigModels2 = FlutterFlowDynamicModels(() => EventCardBigModel());
    eventCardBigModels3 = FlutterFlowDynamicModels(() => EventCardBigModel());
    eventCardBigModels4 = FlutterFlowDynamicModels(() => EventCardBigModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    eventCardBigModels1.dispose();
    eventCardBigModels2.dispose();
    eventCardBigModels3.dispose();
    eventCardBigModels4.dispose();
  }
}
