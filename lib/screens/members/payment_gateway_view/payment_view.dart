import 'dart:async';
import 'dart:io';
import 'package:bci/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:havyou/src/controllers/Instant_top_up_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  String userId;
  dynamic planId;
  String totalAmount;
  String payOpt;
  int payType;

  PaymentWebView({
    required this.userId,
    required this.totalAmount,
    required this.payOpt,
    required this.payType,
  });

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  // final paymentController = Get.find<InstantTopUpController>();

  final profileController = Get.find<ProfileController>();

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

  // startTimer() {
  //   print(":::::::::_________________payment strated---------------");
  //   tempTimer = Timer.periodic(const Duration(seconds: 5), (timer) async {
  //     print("timer working ...");
  //     int status = await Get.find<TempleController>().paymentStatus(
  //       widget.orderId,
  //       memeberList: widget.memeberList,
  //       offerAmount: widget.offerAmount,
  //       poojaDate: widget.poojaDate,
  //       poojaName: widget.poojaName,
  //       preiestAmount: widget.preiestAmount,
  //       session: widget.session,
  //       templeId: widget.templeId,
  //       time: widget.time,
  //       totalAmount: widget.totalAmount,
  //     );

  //     print(
  //         "<<<>>><<<>>><<>>><>><><><><><><><------cccccc------><><><><><><><><><><><><><><><>");
  //     print(status);

  //     if (status == 200) {
  //       timer.cancel();
  //     } else if (status == 400) {
  //       print("calceld:::::::::::");
  //       timer.cancel();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBack,
        child: SafeArea(
            child: WebView(
          initialUrl: "https://www.portal.bcipvtltd.com/paymentgateway?amount=${widget.totalAmount}&payOpt=&user_id=${widget.userId}",
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
                "https://www.portal.bcipvtltd.com/api/response_transaction") {

                      if(widget.payType == 0){
                        profileController.payForSubscribe( id: widget.planId);
                      }else if(widget.payType == 1){
                                  profileController.payCart();
                      } else if (widget.payType == 2) {
                            profileController.payFromWallet(amount: widget.totalAmount);
                      }
                  
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
