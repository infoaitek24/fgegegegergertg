import '/components/activity_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'activity_widget.dart' show ActivityWidget;
import 'package:flutter/material.dart';

class ActivityModel extends FlutterFlowModel<ActivityWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ActivityCard component.
  late ActivityCardModel activityCardModel1;
  // Model for ActivityCard component.
  late ActivityCardModel activityCardModel2;
  // Model for ActivityCard component.
  late ActivityCardModel activityCardModel3;
  // Model for ActivityCard component.
  late ActivityCardModel activityCardModel4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    activityCardModel1 = createModel(context, () => ActivityCardModel());
    activityCardModel2 = createModel(context, () => ActivityCardModel());
    activityCardModel3 = createModel(context, () => ActivityCardModel());
    activityCardModel4 = createModel(context, () => ActivityCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    activityCardModel1.dispose();
    activityCardModel2.dispose();
    activityCardModel3.dispose();
    activityCardModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
