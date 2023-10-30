import 'dart:async';
import 'dart:io';

import 'package:bci/controllers/plans_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:havyou/src/controllers/Instant_top_up_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyWebView extends StatefulWidget {

  PrivacyPolicyWebView();

  @override
  State<PrivacyPolicyWebView> createState() => _PrivacyPolicyWebViewState();
}

class _PrivacyPolicyWebViewState extends State<PrivacyPolicyWebView> {
  // final paymentController = Get.find<InstantTopUpController>();

  Timer? tempTimer;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    // startTimer();
  }

  late WebViewController _controll;

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBack,
        child: SafeArea(
            child: WebView(
          initialUrl: "https://www.privacypolicygenerator.info/live.php?token=x8qU1aFvVs7Jm7KWN8klcUGpw9HLBTxT",
          javascriptMode: JavascriptMode.unrestricted,
          allowsInlineMediaPlayback: true,
          gestureNavigationEnabled: true,
          onProgress: (int loading) {
            print("printing >>>>>>>>>>>>>>");
            print(loading);
          },
          onWebViewCreated: (webViewController) {
            _controll = webViewController;
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
        )),
      ),
    );
  }

  Future<bool> _onBack() async {
    bool goBack;

    var value = await _controll.canGoBack(); // check webview can go back

    if (value) {
      _controll.goBack(); // perform webview back operation

      return false;
    } else {
      Get.back();
      return true;
    }
  }
}
