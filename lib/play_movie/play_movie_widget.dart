import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'play_movie_model.dart';
export 'play_movie_model.dart';

class PlayMovieWidget extends StatefulWidget {
  const PlayMovieWidget({
    super.key,
    this.movieId,
  });

  final int? movieId;

  @override
  State<PlayMovieWidget> createState() => _PlayMovieWidgetState();
}

class _PlayMovieWidgetState extends State<PlayMovieWidget> {
  late PlayMovieModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayMovieModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: FlutterFlowWebView(
            content:
                'https://www.2embed.cc/embed/${widget.movieId?.toString()}',
            bypass: false,
            width: MediaQuery.sizeOf(context).width,
            height: 916.0,
            verticalScroll: false,
            horizontalScroll: false,
          ),
        ),
      ),
    );
  }
}
