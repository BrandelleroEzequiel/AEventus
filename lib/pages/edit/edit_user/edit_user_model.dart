import '/flutter_flow/flutter_flow_util.dart';
import 'edit_user_widget.dart' show EditUserWidget;
import 'package:flutter/material.dart';

class EditUserModel extends FlutterFlowModel<EditUserWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for InputNombreDeUsuario widget.
  FocusNode? inputNombreDeUsuarioFocusNode;
  TextEditingController? inputNombreDeUsuarioTextController;
  String? Function(BuildContext, String?)?
      inputNombreDeUsuarioTextControllerValidator;
  // State field(s) for InputEmail widget.
  FocusNode? inputEmailFocusNode;
  TextEditingController? inputEmailTextController;
  String? Function(BuildContext, String?)? inputEmailTextControllerValidator;
  // State field(s) for InputDescripcion widget.
  FocusNode? inputDescripcionFocusNode;
  TextEditingController? inputDescripcionTextController;
  String? Function(BuildContext, String?)?
      inputDescripcionTextControllerValidator;
  // State field(s) for InputWhatsApp widget.
  FocusNode? inputWhatsAppFocusNode;
  TextEditingController? inputWhatsAppTextController;
  String? Function(BuildContext, String?)? inputWhatsAppTextControllerValidator;
  // State field(s) for InputInstagram widget.
  FocusNode? inputInstagramFocusNode;
  TextEditingController? inputInstagramTextController;
  String? Function(BuildContext, String?)?
      inputInstagramTextControllerValidator;
  // State field(s) for InputX widget.
  FocusNode? inputXFocusNode;
  TextEditingController? inputXTextController;
  String? Function(BuildContext, String?)? inputXTextControllerValidator;
  // State field(s) for InputTikTok widget.
  FocusNode? inputTikTokFocusNode;
  TextEditingController? inputTikTokTextController;
  String? Function(BuildContext, String?)? inputTikTokTextControllerValidator;
  // State field(s) for SwitchProfesional widget.
  bool? switchProfesionalValue;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputNombreDeUsuarioFocusNode?.dispose();
    inputNombreDeUsuarioTextController?.dispose();

    inputEmailFocusNode?.dispose();
    inputEmailTextController?.dispose();

    inputDescripcionFocusNode?.dispose();
    inputDescripcionTextController?.dispose();

    inputWhatsAppFocusNode?.dispose();
    inputWhatsAppTextController?.dispose();

    inputInstagramFocusNode?.dispose();
    inputInstagramTextController?.dispose();

    inputXFocusNode?.dispose();
    inputXTextController?.dispose();

    inputTikTokFocusNode?.dispose();
    inputTikTokTextController?.dispose();
  }
}
