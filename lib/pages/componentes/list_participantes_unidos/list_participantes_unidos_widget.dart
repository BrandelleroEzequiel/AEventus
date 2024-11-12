import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/user_horizontal_card/user_horizontal_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'list_participantes_unidos_model.dart';
export 'list_participantes_unidos_model.dart';

class ListParticipantesUnidosWidget extends StatefulWidget {
  const ListParticipantesUnidosWidget({
    super.key,
    required this.objEventParam,
  });

  final EventRecord? objEventParam;

  @override
  State<ListParticipantesUnidosWidget> createState() =>
      _ListParticipantesUnidosWidgetState();
}

class _ListParticipantesUnidosWidgetState
    extends State<ListParticipantesUnidosWidget> {
  late ListParticipantesUnidosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListParticipantesUnidosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Builder(
            builder: (context) {
              final usersUnidos = widget.objEventParam?.usersUnidos
                      .map((e) => e)
                      .toList()
                      .toList() ??
                  [];
              if (usersUnidos.isEmpty) {
                return Image.asset(
                  'https://cdn.dribbble.com/users/134564/screenshots/2130212/media/96c633ef5816516913f98f90b73809a9.png?resize=800x600&vertical=center',
                );
              }

              return ListView.separated(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: usersUnidos.length,
                separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                itemBuilder: (context, usersUnidosIndex) {
                  final usersUnidosItem = usersUnidos[usersUnidosIndex];
                  return StreamBuilder<UserRecord>(
                    stream: UserRecord.getDocument(usersUnidosItem),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitRipple(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }

                      final userHorizontalCardUserRecord = snapshot.data!;

                      return wrapWithModel(
                        model: _model.userHorizontalCardModels.getModel(
                          userHorizontalCardUserRecord.reference.id,
                          usersUnidosIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: UserHorizontalCardWidget(
                          key: Key(
                            'Keyti3_${userHorizontalCardUserRecord.reference.id}',
                          ),
                          userParam: userHorizontalCardUserRecord,
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
