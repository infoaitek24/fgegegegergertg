import '/components/subscription_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'subscribtion_widget.dart' show SubscribtionWidget;
import 'package:flutter/material.dart';

class SubscribtionModel extends FlutterFlowModel<SubscribtionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SubscriptionCard component.
  late SubscriptionCardModel subscriptionCardModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    subscriptionCardModel = createModel(context, () => SubscriptionCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    subscriptionCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
