import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;
  int pageViewLoadedLength = 25;
  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  PagingController<ApiPagingParams, dynamic>? pageViewPagingController;
  Function(ApiPagingParams nextPageMarker)? pageViewApiCall;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    pageViewPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<ApiPagingParams, dynamic> setPageViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    pageViewApiCall = apiCall;
    return pageViewPagingController ??= _createPageViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createPageViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(pageViewTrendingPage);
  }

  void pageViewTrendingPage(ApiPagingParams nextPageMarker) =>
      pageViewApiCall!(nextPageMarker).then((pageViewTrendingResponse) {
        final pageItems = (getJsonField(
                  pageViewTrendingResponse.jsonBody,
                  r'''$.results''',
                ) ??
                [])
            .take(25 - nextPageMarker.numItems)
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        pageViewPagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty) && newNumItems < 25
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: pageViewTrendingResponse,
                )
              : null,
        );
      });
}
