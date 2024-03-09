import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'play_trailer_model.dart';
export 'play_trailer_model.dart';

class PlayTrailerWidget extends StatefulWidget {
  const PlayTrailerWidget({
    super.key,
    required this.key,
  });

  @override
  final String? key;

  @override
  State<PlayTrailerWidget> createState() => _PlayTrailerWidgetState();
}

class _PlayTrailerWidgetState extends State<PlayTrailerWidget> {
  late PlayTrailerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayTrailerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterFlowYoutubePlayer(
                  url: 'https://www.youtube.com/watch?v=${widget.key}',
                  width: double.infinity,
                  height: double.infinity,
                  autoPlay: false,
                  looping: true,
                  mute: true,
                  showControls: true,
                  showFullScreen: true,
                  strictRelatedVideos: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
