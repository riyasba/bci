import 'dart:async';
import 'dart:io';
import 'package:bci/controllers/bus_controllers.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/controllers/plans_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/flight_booking_models/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:havyou/src/controllers/Instant_top_up_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewPartialPayment extends StatefulWidget {
  double amount;
  String url;
  String referenceId;
  String userId;
  int customerId;
  String saleAmount;
  String planId;
  String collectedDate;
  String collectedAmount;
  String status;

  PaymentWebViewPartialPayment({
    required this.amount,
    required this.url,
    required this.referenceId,
    required this.userId,
    required this.collectedAmount,
    required this.collectedDate,
    required this.customerId,
    required this.planId,
    required this.saleAmount,
    required this.status,
  });

  @override
  State<PaymentWebViewPartialPayment> createState() =>
      _PaymentWebViewAddToWalletState();
}

class _PaymentWebViewAddToWalletState
    extends State<PaymentWebViewPartialPayment> {
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
          initialUrl: widget.url,
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
          onPageFinished: (String url) async {
            print(
                'Page finished loading---------------------------------------------------: $url');
            print(
                'Page finished loading---------------------------------------------------: $url');

            if (url.trim() ==
                "https://www.portal.bcipvtltd.com/api/response_phonepay") {
              // Check Status here

              Get.find<PlanController>().checkPhonePeStatusPartialPayment(
                  collectedAmount: widget.collectedAmount,
                  collectedDate: widget.collectedAmount,
                  customerId: widget.customerId,
                  planId: widget.planId,
                  saleAmount: widget.saleAmount,
                  status: widget.status,
                  refernceID: widget.referenceId,
                  amount: widget.amount,
                  userId: widget.userId);
            }

            // paymentController.getPaymantResponse(widget.orderId);
          },
          navigationDelegate: (value) async {
            if (value.url.startsWith("gpay") ||
                value.url.startsWith("phonepe") ||
                value.url.startsWith("paytmmp") ||
                value.url.startsWith("upi")) {
              final link = value.url;
              final uri = Uri.parse(link);
              if (await canLaunchUrl(uri)) {
                await launchUrl(
                  uri,
                  mode: LaunchMode.externalApplication,
                );
              }
              SystemChannels.textInput.invokeMethod('TextInput.hide');
              return NavigationDecision.prevent;
            }
            SystemChannels.textInput.invokeMethod('TextInput.hide');
            return NavigationDecision.navigate;
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
