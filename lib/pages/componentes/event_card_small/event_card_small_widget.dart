import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'event_card_small_model.dart';
export 'event_card_small_model.dart';

class EventCardSmallWidget extends StatefulWidget {
  const EventCardSmallWidget({
    super.key,
    required this.eventReference,
  });

  final EventRecord? eventReference;

  @override
  State<EventCardSmallWidget> createState() => _EventCardSmallWidgetState();
}

class _EventCardSmallWidgetState extends State<EventCardSmallWidget> {
  late EventCardSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventCardSmallModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget.eventReference?.userCreator == currentUserReference) {
          context.pushNamed(
            'MyEventDetail',
            queryParameters: {
              'eventReference': serializeParam(
                widget.eventReference?.reference,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );
        } else {
          context.pushNamed(
            'EventDetail',
            queryParameters: {
              'eventReference': serializeParam(
                widget.eventReference?.reference,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );
        }
      },
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.eventReference?.imagenesAdicionales.first,
                      'https://www.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600nw-1037719192.jpg',
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0x0057636C), Color(0x6714181B)],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 20.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.eventReference?.name,
                      'name',
                    ).maybeHandleOverflow(
                      maxChars: 35,
                      replacement: '…',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lexend',
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        const Shadow(
                          color: Color(0x7857636C),
                          offset: Offset(2.0, 2.0),
                          blurRadius: 2.0,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
