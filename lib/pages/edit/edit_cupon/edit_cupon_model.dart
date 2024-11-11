import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_cupon_widget.dart' show EditCuponWidget;
import 'package:flutter/material.dart';

class EditCuponModel extends FlutterFlowModel<EditCuponWidget> {
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
        'wufyfs6c' /* Campo obligatorio! */,
      );
    }

    if (val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xuk6aee2' /* ¡Ingrese un titulo! */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'k1vf2nhh' /* El titulo no puede superar los... */,
      );
    }

    return null;
  }

  // State field(s) for Descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  // State field(s) for switchCuponActivo widget.
  bool? switchCuponActivoValue;
  // State field(s) for isFechaColapse widget.
  bool? isFechaColapseValue1;
  DateTime? datePicked1;
  // State field(s) for isFechaColapse widget.
  bool? isFechaColapseValue2;
  DateTime? datePicked2;
  // State field(s) for isHoraColapse widget.
  bool? isHoraColapseValue;
  DateTime? datePicked3;
  DateTime? datePicked4;
  // State field(s) for ChoiceChipsCategorias widget.
  FormFieldController<List<String>>? choiceChipsCategoriasValueController;
  List<String>? get choiceChipsCategoriasValues =>
      choiceChipsCategoriasValueController?.value;
  set choiceChipsCategoriasValues(List<String>? val) =>
      choiceChipsCategoriasValueController?.value = val;
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
