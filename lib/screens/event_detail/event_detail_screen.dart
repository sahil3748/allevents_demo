import 'package:allevents_demo/screens/event_detail/event_detail_controller.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventDetailsController>(
        init: EventDetailsController(),
        builder: (controller) {
          return Scaffold(
            // key: controller.scaffoldKey,
            // appBar: AppBar(),
            body: SafeArea(
                child: WebViewWidget(controller: controller.webViewController)),
            // InAppWebView(
            //   initialUrlRequest: URLRequest(
            //       url:
            //           WebUri.uri(Uri.parse("https://protocoderspoint.com/"))),
            //   onWebViewCreated: (InAppWebViewController inAppcontroller) {
            //     controller.inAppWebViewController = inAppcontroller;
            //   },
            //   onProgressChanged:
            //       (InAppWebViewController inAppcontroller, int progress) {
            //     // setState(() {
            //     controller.processUpdation();
            //     // });
            //   },
            // )
          );
        });
  }
}
