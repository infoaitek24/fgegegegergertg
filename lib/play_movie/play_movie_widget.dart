import '/backend/supabase/supabase.dart';
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
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<NameServerRow>>(
            future: NameServerTable().querySingleRow(
              queryFn: (q) => q,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<NameServerRow> containerNameServerRowList = snapshot.data!;
              final containerNameServerRow =
                  containerNameServerRowList.isNotEmpty
                      ? containerNameServerRowList.first
                      : null;
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(),
                child: FlutterFlowWebView(
                  content:
                      '${containerNameServerRow?.url}${widget.movieId?.toString()}',
                  bypass: false,
                  width: MediaQuery.sizeOf(context).width,
                  height: 916.0,
                  verticalScroll: false,
                  horizontalScroll: false,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
