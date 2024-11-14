import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/user_horizontal_card/user_horizontal_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'list_seguidos_model.dart';
export 'list_seguidos_model.dart';

class ListSeguidosWidget extends StatefulWidget {
  const ListSeguidosWidget({
    super.key,
    required this.userParam,
  });

  final DocumentReference? userParam;

  @override
  State<ListSeguidosWidget> createState() => _ListSeguidosWidgetState();
}

class _ListSeguidosWidgetState extends State<ListSeguidosWidget> {
  late ListSeguidosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListSeguidosModel());

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
      stream: UserRecord.getDocument(widget.userParam!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40.0,
              height: 40.0,
              child: SpinKitPulse(
                color: FlutterFlowTheme.of(context).primary,
                size: 40.0,
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
                  final seguidos =
                      columnUserRecord.siguiendo.map((e) => e).toList();
                  if (seguidos.isEmpty) {
                    return Center(
                      child: Image.asset(
                        'https://www.popwebdesign.net/popart_blog/wp-content/uploads/2019/04/Nicolo-Miranda-404-not-found-screenshot.png',
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: seguidos.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                    itemBuilder: (context, seguidosIndex) {
                      final seguidosItem = seguidos[seguidosIndex];
                      return StreamBuilder<UserRecord>(
                        stream: UserRecord.getDocument(seguidosItem),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40.0,
                                height: 40.0,
                                child: SpinKitPulse(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 40.0,
                                ),
                              ),
                            );
                          }

                          final userHorizontalCardUserRecord = snapshot.data!;

                          return wrapWithModel(
                            model: _model.userHorizontalCardModels.getModel(
                              userHorizontalCardUserRecord.reference.id,
                              seguidosIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: UserHorizontalCardWidget(
                              key: Key(
                                'Keytzw_${userHorizontalCardUserRecord.reference.id}',
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
