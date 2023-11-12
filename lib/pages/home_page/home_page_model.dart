import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwipeableStack widget.
  late SwipeableCardSectionController swipeableStackController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    swipeableStackController = SwipeableCardSectionController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
