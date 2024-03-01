import '/backend/api_requests/api_calls.dart';
import '/components/movie_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: double.infinity,
                height: 400.0,
                child: Stack(
                  children: [
                    PagedPageView<ApiPagingParams, dynamic>(
                      pagingController: _model.setPageViewController(
                        (nextPageMarker) => TrendingCall.call(
                          apiKey: 'b36ffbe87e5597c826742a6782d8f62a',
                        ),
                      ),
                      pageController: _model.pageViewController ??=
                          PageController(
                              initialPage:
                                  min(0, _model.pageViewLoadedLength - 1)),
                      onPageChanged: (_) => setState(() {
                        _model.pageViewLoadedLength =
                            _model.pageViewPagingController!.itemList!.length;
                      }),
                      scrollDirection: Axis.horizontal,
                      builderDelegate: PagedChildBuilderDelegate<dynamic>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),

                        itemBuilder: (context, _, resultsIndex) {
                          final resultsItem = _model.pageViewPagingController!
                              .itemList![resultsIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'MovieDetails',
                                queryParameters: {
                                  'movieId': serializeParam(
                                    getJsonField(
                                      resultsItem,
                                      r'''$.id''',
                                    ),
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Stack(
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'MovieDetails',
                                      queryParameters: {
                                        'movieId': serializeParam(
                                          getJsonField(
                                            resultsItem,
                                            r'''$.id''',
                                          ),
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 400.0,
                                    child: custom_widgets.ImdbImage(
                                      width: double.infinity,
                                      height: double.infinity,
                                      imagePath: getJsonField(
                                        resultsItem,
                                        r'''$.backdrop_path''',
                                      ).toString(),
                                      radious: valueOrDefault<double>(
                                        resultsItem,
                                        0.0,
                                      ),
                                      isPoster: false,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 101.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.transparent,
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground
                                        ],
                                        stops: const [0.0, 1.0],
                                        begin: const AlignmentDirectional(0.0, -1.0),
                                        end: const AlignmentDirectional(0, 1.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.85),
                                  child: Container(
                                    width: double.infinity,
                                    height: 68.0,
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      resultsItem,
                                                      r'''$.title''',
                                                    ).toString(),
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 20.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Action • Drama • Adventure',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.7),
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.play,
                                                  color: Colors.white,
                                                  size: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-0.83, 0.95),
                      child: smooth_page_indicator.SmoothPageIndicator(
                        controller: _model.pageViewController!,
                        count: _model.pageViewLoadedLength,
                        axisDirection: Axis.horizontal,
                        onDotClicked: (i) async {
                          await _model.pageViewController!.animateToPage(
                            i,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        effect: smooth_page_indicator.ExpandingDotsEffect(
                          expansionFactor: 2.0,
                          spacing: 8.0,
                          radius: 16.0,
                          dotWidth: 12.0,
                          dotHeight: 6.0,
                          dotColor: const Color(0x33EF233C),
                          activeDotColor: FlutterFlowTheme.of(context).primary,
                          paintStyle: PaintingStyle.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Now Playing',
                      style: FlutterFlowTheme.of(context).titleSmall,
                    ),
                    Text(
                      'See all >',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 224.0,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: PagedListView<ApiPagingParams, dynamic>(
                  pagingController: _model.setListViewController1(
                    (nextPageMarker) => NowPlayingMoviesCall.call(
                      page: nextPageMarker.nextPageNumber,
                      apiKey: 'b36ffbe87e5597c826742a6782d8f62a',
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  primary: false,
                  reverse: false,
                  scrollDirection: Axis.horizontal,
                  builderDelegate: PagedChildBuilderDelegate<dynamic>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ),
                    // Customize what your widget looks like when it's loading another page.
                    newPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ),

                    itemBuilder: (context, _, moviesIndex) {
                      final moviesItem = _model
                          .listViewPagingController1!.itemList![moviesIndex];
                      return Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'MovieDetails',
                              queryParameters: {
                                'movieId': serializeParam(
                                  getJsonField(
                                    moviesItem,
                                    r'''$.id''',
                                  ),
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: MovieCardWidget(
                            key: Key(
                                'Keybr4_${moviesIndex}_of_${_model.listViewPagingController1!.itemList!.length}'),
                            imagePath: getJsonField(
                              moviesItem,
                              r'''$.poster_path''',
                            ).toString(),
                            title: getJsonField(
                              moviesItem,
                              r'''$.title''',
                            ).toString(),
                            duration: '1h 37m',
                            rating: getJsonField(
                              moviesItem,
                              r'''$.vote_average''',
                            ).toString(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'On TV',
                      style: FlutterFlowTheme.of(context).titleSmall,
                    ),
                    Text(
                      'See all >',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 224.0,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: PagedListView<ApiPagingParams, dynamic>(
                  pagingController: _model.setListViewController2(
                    (nextPageMarker) => TvShowsOnAirCall.call(
                      page: nextPageMarker.nextPageNumber,
                      apiKey: 'b36ffbe87e5597c826742a6782d8f62a',
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  primary: false,
                  reverse: false,
                  scrollDirection: Axis.horizontal,
                  builderDelegate: PagedChildBuilderDelegate<dynamic>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ),
                    // Customize what your widget looks like when it's loading another page.
                    newPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ),

                    itemBuilder: (context, _, tvshowsIndex) {
                      final tvshowsItem = _model
                          .listViewPagingController2!.itemList![tvshowsIndex];
                      return Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: TvShowsInfoCall.call(
                            tvId: getJsonField(
                              tvshowsItem,
                              r'''$.id''',
                            ),
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
                            final movieCardTvShowsInfoResponse = snapshot.data!;
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'TvShowsDetails',
                                  queryParameters: {
                                    'tvId': serializeParam(
                                      getJsonField(
                                        tvshowsItem,
                                        r'''$.id''',
                                      ),
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: MovieCardWidget(
                                key: Key(
                                    'Keyqnh_${tvshowsIndex}_of_${_model.listViewPagingController2!.itemList!.length}'),
                                imagePath: getJsonField(
                                  tvshowsItem,
                                  r'''$.poster_path''',
                                ).toString(),
                                title: getJsonField(
                                  tvshowsItem,
                                  r'''$.name''',
                                ).toString(),
                                duration: 'S${getJsonField(
                                  movieCardTvShowsInfoResponse.jsonBody,
                                  r'''$.last_episode_to_air.season_number''',
                                ).toString()}E${getJsonField(
                                  movieCardTvShowsInfoResponse.jsonBody,
                                  r'''$.last_episode_to_air.episode_number''',
                                ).toString()}',
                                rating: getJsonField(
                                  tvshowsItem,
                                  r'''$.vote_average''',
                                ).toString(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Movies',
                      style: FlutterFlowTheme.of(context).titleSmall,
                    ),
                    Text(
                      'See all >',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 224.0,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: PagedListView<ApiPagingParams, dynamic>(
                  pagingController: _model.setListViewController3(
                    (nextPageMarker) => PopularMoviesCall.call(
                      page: nextPageMarker.nextPageNumber,
                      apiKey: 'b36ffbe87e5597c826742a6782d8f62a',
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  primary: false,
                  reverse: false,
                  scrollDirection: Axis.horizontal,
                  builderDelegate: PagedChildBuilderDelegate<dynamic>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ),
                    // Customize what your widget looks like when it's loading another page.
                    newPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ),

                    itemBuilder: (context, _, popularMoviesIndex) {
                      final popularMoviesItem = _model
                          .listViewPagingController3!
                          .itemList![popularMoviesIndex];
                      return Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'MovieDetails',
                              queryParameters: {
                                'movieId': serializeParam(
                                  valueOrDefault<int>(
                                    getJsonField(
                                      popularMoviesItem,
                                      r'''$.id''',
                                    ),
                                    278,
                                  ),
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: MovieCardWidget(
                            key: Key(
                                'Keytvn_${popularMoviesIndex}_of_${_model.listViewPagingController3!.itemList!.length}'),
                            imagePath: getJsonField(
                              popularMoviesItem,
                              r'''$.poster_path''',
                            ).toString(),
                            title: getJsonField(
                              popularMoviesItem,
                              r'''$.title''',
                            ).toString(),
                            duration: '1h 37m',
                            rating: getJsonField(
                              popularMoviesItem,
                              r'''$.vote_average''',
                            ).toString(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 24.0,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
