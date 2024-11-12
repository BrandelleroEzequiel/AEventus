import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/user_horizontal_card/user_horizontal_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'list_seguidores_model.dart';
export 'list_seguidores_model.dart';

class ListSeguidoresWidget extends StatefulWidget {
  const ListSeguidoresWidget({
    super.key,
    required this.userReference,
  });

  final DocumentReference? userReference;

  @override
  State<ListSeguidoresWidget> createState() => _ListSeguidoresWidgetState();
}

class _ListSeguidoresWidgetState extends State<ListSeguidoresWidget> {
  late ListSeguidoresModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListSeguidoresModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserRecord>(
      stream: UserRecord.getDocument(widget.userReference!),
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

        final columnUserRecord = snapshot.data!;

        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Builder(
                builder: (context) {
                  final seguidor =
                      columnUserRecord.seguidores.map((e) => e).toList();

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: seguidor.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                    itemBuilder: (context, seguidorIndex) {
                      final seguidorItem = seguidor[seguidorIndex];
                      return StreamBuilder<UserRecord>(
                        stream: UserRecord.getDocument(seguidorItem),
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
                              seguidorIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: UserHorizontalCardWidget(
                              key: Key(
                                'Keywy8_${userHorizontalCardUserRecord.reference.id}',
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
      },
    );
  }
}
