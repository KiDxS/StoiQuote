import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        endDrawer: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: const Drawer(
            elevation: 11.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            FFAppConstants.projectName,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(-1.00, -1.00),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FutureBuilder<ApiCallResponse>(
                    future: GetStoicQuotesCall.call(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      final swipeableStackGetStoicQuotesResponse =
                          snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final retrieveStoicQuotesResponse =
                              GetStoicQuotesCall.allQuotes(
                                    swipeableStackGetStoicQuotesResponse
                                        .jsonBody,
                                  )?.toList() ??
                                  [];
                          return FlutterFlowSwipeableStack(
                            topCardHeightFraction: 0.5,
                            middleCardHeightFraction: 0.3,
                            bottomCardHeightFraction: 0.4,
                            topCardWidthFraction: 0.9,
                            middleCardWidthFraction: 0.85,
                            bottomCardWidthFraction: 0.8,
                            onSwipeFn: (index) {},
                            onLeftSwipe: (index) {},
                            onRightSwipe: (index) {},
                            onUpSwipe: (index) {},
                            onDownSwipe: (index) {},
                            itemBuilder:
                                (context, retrieveStoicQuotesResponseIndex) {
                              final retrieveStoicQuotesResponseItem =
                                  retrieveStoicQuotesResponse[
                                      retrieveStoicQuotesResponseIndex];
                              return Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    '"${getJsonField(
                                      retrieveStoicQuotesResponseItem,
                                      r'''$.text''',
                                    ).toString()}" - ${getJsonField(
                                      retrieveStoicQuotesResponseItem,
                                      r'''$.author''',
                                    ).toString()}',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 24.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ),
                              );
                            },
                            itemCount: retrieveStoicQuotesResponse.length,
                            controller: _model.swipeableStackController,
                            enableSwipeUp: false,
                            enableSwipeDown: false,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
