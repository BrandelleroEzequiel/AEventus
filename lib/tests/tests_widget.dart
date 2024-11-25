import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tests_model.dart';
export 'tests_model.dart';

class TestsWidget extends StatefulWidget {
  const TestsWidget({super.key});

  @override
  State<TestsWidget> createState() => _TestsWidgetState();
}

class _TestsWidgetState extends State<TestsWidget> {
  late TestsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      ),
    );
  }
}
