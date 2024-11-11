import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_event_widget.dart' show CreateEventWidget;
import 'package:flutter/material.dart';

class CreateEventModel extends FlutterFlowModel<CreateEventWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for Titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;
  String? Function(BuildContext, String?)? tituloTextControllerValidator;
  String? _tituloTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'n8ydgt1h' /* Campo obligatorio! */,
      );
    }

    if (val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'txgwrg7n' /* ¡Ingrese un titulo! */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        '3fxr00cq' /* El titulo no puede superar los... */,
      );
    }

    return null;
  }

  // State field(s) for Descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  // State field(s) for ChoiceChipsCategorias widget.
  FormFieldController<List<String>>? choiceChipsCategoriasValueController;
  List<String>? get choiceChipsCategoriasValues =>
      choiceChipsCategoriasValueController?.value;
  set choiceChipsCategoriasValues(List<String>? val) =>
      choiceChipsCategoriasValueController?.value = val;
  // State field(s) for isFechaColapse widget.
  bool? isFechaColapseValue;
  DateTime? datePicked1;
  // State field(s) for isHoraColapse widget.
  bool? isHoraColapseValue;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for switchParticipantes widget.
  bool? switchParticipantesValue;
  // State field(s) for ChoiceChipsPrivacidad widget.
  FormFieldController<List<String>>? choiceChipsPrivacidadValueController;
  String? get choiceChipsPrivacidadValue =>
      choiceChipsPrivacidadValueController?.value?.firstOrNull;
  set choiceChipsPrivacidadValue(String? val) =>
      choiceChipsPrivacidadValueController?.value = val != null ? [val] : [];
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Validate Form] action in Button widget.
  bool? isValida;

  @override
  void initState(BuildContext context) {
    tituloTextControllerValidator = _tituloTextControllerValidator;
  }

  @override
  void dispose() {
    tituloFocusNode?.dispose();
    tituloTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();
  }
}
