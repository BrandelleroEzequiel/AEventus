import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'imagen_detail_model.dart';
export 'imagen_detail_model.dart';

class ImagenDetailWidget extends StatefulWidget {
  const ImagenDetailWidget({
    super.key,
    String? imagen,
  }) : imagen = imagen ??
            'https://images.unsplash.com/photo-1502318217862-aa4e294ba657?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxzdGFycnklMjBuaWdodHxlbnwwfHx8fDE3MzA5OTcyMTF8MA&ixlib=rb-4.0.3&q=80&w=1080';

  final String imagen;

  @override
  State<ImagenDetailWidget> createState() => _ImagenDetailWidgetState();
}

class _ImagenDetailWidgetState extends State<ImagenDetailWidget> {
  late ImagenDetailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImagenDetailModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 380.0,
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Wrap(
            spacing: 0.0,
            runSpacing: 0.0,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.none,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          widget.imagen,
                          'https://images.unsplash.com/photo-1502318217862-aa4e294ba657?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxzdGFycnklMjBuaWdodHxlbnwwfHx8fDE3MzA5OTcyMTF8MA&ixlib=rb-4.0.3&q=80&w=1080',
                        ),
                        width: double.infinity,
                        height: 485.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
