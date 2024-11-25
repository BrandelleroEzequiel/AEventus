import '/backend/backend.dart';
import '/components/event_horizontal_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'event_admin_widget.dart' show EventAdminWidget;
import 'package:flutter/material.dart';

class EventAdminModel extends FlutterFlowModel<EventAdminWidget> {
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
  // Models for EventHorizontal dynamic component.
  late FlutterFlowDynamicModels<EventHorizontalModel> eventHorizontalModels1;
  // Models for EventHorizontal dynamic component.
  late FlutterFlowDynamicModels<EventHorizontalModel> eventHorizontalModels2;
  // Models for EventHorizontal dynamic component.
  late FlutterFlowDynamicModels<EventHorizontalModel> eventHorizontalModels3;
  // Models for EventHorizontal dynamic component.
  late FlutterFlowDynamicModels<EventHorizontalModel> eventHorizontalModels4;

  @override
  void initState(BuildContext context) {
    eventHorizontalModels1 =
        FlutterFlowDynamicModels(() => EventHorizontalModel());
    eventHorizontalModels2 =
        FlutterFlowDynamicModels(() => EventHorizontalModel());
    eventHorizontalModels3 =
        FlutterFlowDynamicModels(() => EventHorizontalModel());
    eventHorizontalModels4 =
        FlutterFlowDynamicModels(() => EventHorizontalModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    eventHorizontalModels1.dispose();
    eventHorizontalModels2.dispose();
    eventHorizontalModels3.dispose();
    eventHorizontalModels4.dispose();
  }
}
