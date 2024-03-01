import '/flutter_flow/flutter_flow_util.dart';
import 'sign_in_widget.dart' show SignInWidget;
import 'package:flutter/material.dart';

class SignInModel extends FlutterFlowModel<SignInWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for sign_in_email widget.
  FocusNode? signInEmailFocusNode;
  TextEditingController? signInEmailController;
  String? Function(BuildContext, String?)? signInEmailControllerValidator;
  // State field(s) for sign_in_pass widget.
  FocusNode? signInPassFocusNode;
  TextEditingController? signInPassController;
  late bool signInPassVisibility;
  String? Function(BuildContext, String?)? signInPassControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    signInPassVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    signInEmailFocusNode?.dispose();
    signInEmailController?.dispose();

    signInPassFocusNode?.dispose();
    signInPassController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
