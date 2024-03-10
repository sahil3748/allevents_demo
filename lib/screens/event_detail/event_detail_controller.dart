// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventDetailsController extends GetxController {
  String? argumentValue;
  late WebViewController webViewController;

  @override
  void onInit() {
    argumentValue = Get.arguments;
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('$argumentValue')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('$argumentValue'));
    super.onInit();
  }
  // double progress = 0;
  // late InAppWebViewController inAppWebViewController;

  // void processUpdation() {
  //   progress = progress / 100;
  // }

  // final webViewController = WebViewController()
  //   ..setJavaScriptMode(JavaScriptMode.disabled)
  //   ..loadRequest(Uri.parse('https://www.google.com/'));
}
