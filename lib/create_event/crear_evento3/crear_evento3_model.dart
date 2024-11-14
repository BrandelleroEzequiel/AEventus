import '/flutter_flow/flutter_flow_util.dart';
import 'crear_evento3_widget.dart' show CrearEvento3Widget;
import 'package:flutter/material.dart';

class CrearEvento3Model extends FlutterFlowModel<CrearEvento3Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for switchParticipantes widget.
  bool? switchParticipantesValue;
  // State field(s) for switchextra widget.
  bool? switchextraValue;
  // State field(s) for switchextra2 widget.
  bool? switchextra2Value1;
  // State field(s) for switchextra2 widget.
  bool? switchextra2Value2;
  // State field(s) for switchextra2 widget.
  bool? switchextra2Value3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
