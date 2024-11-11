import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_promocion_widget.dart' show CreatePromocionWidget;
import 'package:flutter/material.dart';

class CreatePromocionModel extends FlutterFlowModel<CreatePromocionWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameTextController;
  String? Function(BuildContext, String?)? productNameTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for switchProfesional widget.
  bool? switchProfesionalValue;
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    productNameFocusNode?.dispose();
    productNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
