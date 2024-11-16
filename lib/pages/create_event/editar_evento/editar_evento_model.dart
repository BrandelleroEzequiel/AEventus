import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_evento_widget.dart' show EditarEventoWidget;
import 'package:flutter/material.dart';

class EditarEventoModel extends FlutterFlowModel<EditarEventoWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;
  String? Function(BuildContext, String?)? tituloTextControllerValidator;
  // State field(s) for Descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for switchHoraInicio widget.
  bool? switchHoraInicioValue;
  DateTime? datePicked2;
  // State field(s) for SwitchHoraFin widget.
  bool? switchHoraFinValue;
  DateTime? datePicked3;
  // State field(s) for ChoiceChipsCategorias widget.
  FormFieldController<List<String>>? choiceChipsCategoriasValueController;
  List<String>? get choiceChipsCategoriasValues =>
      choiceChipsCategoriasValueController?.value;
  set choiceChipsCategoriasValues(List<String>? val) =>
      choiceChipsCategoriasValueController?.value = val;
  // State field(s) for switchParticipantes widget.
  bool? switchParticipantesValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tituloFocusNode?.dispose();
    tituloTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();
  }
}
