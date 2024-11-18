import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'crear_evento1_widget.dart' show CrearEvento1Widget;
import 'package:flutter/material.dart';

class CrearEvento1Model extends FlutterFlowModel<CrearEvento1Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;
  String? Function(BuildContext, String?)? tituloTextControllerValidator;
  String? _tituloTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6ybz2pas' /* Este campo es obligatorio! */,
      );
    }

    if (val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'awq5yqy4' /* Este campo es obligatorio! */,
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
