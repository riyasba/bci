import 'dart:async';
import 'dart:io';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/controllers/hotel_booking_controller.dart';
import 'package:bci/controllers/plans_controller.dart';
import 'package:bci/models/flight_booking_models/booking_model.dart';
import 'package:bci/models/hotel_booking_models/hotel_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:havyou/src/controllers/Instant_top_up_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:bci/models/hotel_booking_models/get_hotel_room_model.dart'
    as ht;

class PaymentWebViewHotel extends StatefulWidget {
  double amount;
  String userIp;
  String resultIndex;
  String hotelCode;
  String hotelName;
  String searchToken;
  HotelInfoData hotelInfoData;
  ht.HotelRoomsDetail hotelRoomsDetail;
  String url;
  String referenceId;

  PaymentWebViewHotel(
      {required this.amount,
      required this.userIp,
      required this.resultIndex,
      required this.hotelCode,
      required this.hotelName,
      required this.searchToken,
      required this.hotelInfoData,
      required this.hotelRoomsDetail,
      required this.referenceId,
      required this.url});

  @override
  State<PaymentWebViewHotel> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebViewHotel> {
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

              Get.find<HotelBookingController>().checkPhonePeStatus(
                  refernceID: widget.referenceId,
                  amount: widget.amount,
                  hotelCode: widget.hotelCode,
                  hotelInfoData: widget.hotelInfoData,
                  hotelName: widget.hotelName,
                  hotelRoomsDetail: widget.hotelRoomsDetail,
                  resultIndex: widget.resultIndex,
                  searchToken: widget.searchToken,
                  userIp: widget.userIp);
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
