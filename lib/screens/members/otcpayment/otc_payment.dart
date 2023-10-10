import 'dart:convert';
import 'dart:math';

import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/get_plans_model.dart';
import 'package:bci/screens/members/otcpayment/member_sub_successful.dart';
import 'package:bci/screens/members/payment_gateway_screen/payment_gateway_web_view.dart';
import 'package:crypto/crypto.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

import '../../bussiness/views/home_screen/contact_admin.dart';
import 'add_to_wallet.dart';

import 'package:http/http.dart' as http;

class OtcPayment extends StatefulWidget {
  PlansData plansData;
  OtcPayment({super.key, required this.plansData});

  @override
  State<OtcPayment> createState() => _OtcPaymentState();
}

class _OtcPaymentState extends State<OtcPayment> {
  final homeController = Get.find<HomeController>();
  var redeemCouponController = TextEditingController();

  final profileController = Get.find<ProfileController>();

  static MethodChannel _channel = MethodChannel('easebuzz');

  Map<String, String> pgHeaders = {"Content-Type": "application/json"};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init("UAT_SIM", "com.memberapp.bci", "PGTESTPAYUAT93", true);
  }

  var result;

  init(String environment, String appId, String merchantId,
      bool enableLogging) async {
    PhonePePaymentSdk.init(environment, appId, merchantId, enableLogging)
        .then((val) => {
              setState(() {
                result = 'PhonePe SDK Initialized - $val';
                print("-------------------->> value on init");
                print(val.toString());
              })
            })
        .catchError((error) {
      print(error);
      // handleError(error);
      return <dynamic>{};
    });
  }

  startPGTransaction(
      {required String body,
      required String callback,
      required String checksum,
      required Map<String, String> headers,
      required String apiEndPoint,
      String? packageName}) async {
    try {
      var response = PhonePePaymentSdk.startPGTransaction(
          body, callback, checksum, headers, apiEndPoint, packageName);

      // print(
      //     "<:---::---::---::---::---:Result from phonePe:---::---::---::---:>");
      // print(response);
      response
          .then((val) => {
                setState(() {
                  result = val;
                }),
                print(
                    "<:---::---::---::---::---:Result from phonePe:---::---::---::---:>"),
                print(result)
              })
          .catchError((error) {
        // handleError(error);
        print(
            "<:---::---:1:---:1:---:1:---:Error on phonePe:---:1:---:1:---:1:---:>");
        return <dynamic>{};
      });
    } catch (error) {
      print(
          "<:---::---:2:---:2:---:2:---:Error on phonePe:---:2:---:2:---:2:---:>");
      print(error);
      //handleError(error);
    }
  }

  trigerPaymentGateway() async {
    const saltKey = "875126e4-5a13-4dae-ad60-5b8c8b629035";
    const saltIndex = 1;
    const apiEndpoint = "/pg/v1/pay";

    final jsonData = {
      "merchantId": "PGTESTPAYUAT93",
      "merchantTransactionId": "MT7850590068188104",
      "merchantUserId": "MUID123",
      "amount": '100',
      "redirectUrl": "https://webhook.site/redirect-url",
      "redirectMode": "POST",
      "callbackUrl": "https://webhook.site/callback-url",
      "mobileNumber": "9999999999",
      "paymentInstrument": {"type": "PAY_PAGE"}
    };

    var resPond = {
      "merchantId": "PGTESTPAYUAT93",
      "merchantTransactionId": "transaction_123",
      "merchantUserId": "902232560",
      "amount": "10",
      "mobileNumber": "8157868869",
      "callbackUrl": "https://www.portal.bcipvtltd.com/api",
      "paymentInstrument": {
        "type": "UPI_INTENT",
        "targetApp": "com.google.android.apps.walletnfcrel"
      },
      "deviceContext": {"deviceOS": "ANDROID"}
    };

    String jsonString = jsonEncode(resPond);
    String base64Data = jsonString.toBase64;
    String dataToHash = base64Data + apiEndpoint + saltKey;
    String sHA256 = generateSha256Hash(dataToHash);

    print(base64Data);
    print('#' * 10);
    print("$sHA256###$saltIndex");

    startPGTransaction(
        apiEndPoint:
            "https://api-preprod.phonepe.com/apis/pg-sandbox/pg/v1/pay",
        body: base64Data,
        callback: "https://webhook.site/callback-url",
        checksum: "sHA256###$saltIndex",
        headers: {
          "accept": "application/json",
          'X-VERIFY': '$sHA256###$saltIndex',
          'Content-Type': 'application/json',
        });
  }

  test() async {
    const saltKey = "875126e4-5a13-4dae-ad60-5b8c8b629035";
    const saltIndex = 1;
    const apiEndpoint = "/pg/v1/pay";

    var randomNumber = Random().nextInt(100000);

    final jsonData = {
      "merchantId": "PGTESTPAYUAT93",
      "merchantTransactionId": "MT7$randomNumber",
      "merchantUserId": "MUID123",
      "amount": '100',
      "redirectUrl": "https://webhook.site/success",
      "redirectMode": "POST",
      "callbackUrl": "https://webhook.site/failed",
      "mobileNumber": "9999999999",
      "paymentInstrument": {"type": "PAY_PAGE"}
    };

    String jsonString = jsonEncode(jsonData);
    String base64Data = jsonString.toBase64;
    String dataToHash = base64Data + apiEndpoint + saltKey;
    String sHA256 = generateSha256Hash(dataToHash);

    print(base64Data);
    print('#' * 10);
    print("$sHA256###$saltIndex");

    final response = await http.post(
      Uri.parse('https://api-preprod.phonepe.com/apis/pg-sandbox/pg/v1/pay'),
      headers: {
        "accept": "application/json",
        'X-VERIFY': '$sHA256###$saltIndex',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'request': base64Data}),
    );

    print(response.body.toString());

    var res = jsonDecode(response.body.toString());

    return res["data"];
  }

  String generateSha256Hash(String input) {
    var bytes = utf8.encode(input);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150.h,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                                'assets/images/chevron-left (2).png'))),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        'Payment',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(const ContactAdmin());
                        },
                        child: Image.asset(
                            'assets/images/3669173_help_ic_icon.png'))
                  ],
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 11, 15, 11),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Image.network(
              widget.plansData.cardImg,
              height: 200,
            ),
            ksizedbox30,
            Row(
              children: [
                Text(
                  widget.plansData.title,
                  style:
                      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            ksizedbox10,
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "₹${widget.plansData.saleAmount}",
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            ksizedbox20,
            Text(
              widget.plansData.planDescription,
              style: TextStyle(fontSize: 16.sp),
            ),
            ksizedbox30,
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     // controller: _controller,
            //     decoration: InputDecoration(
            //         hintText: 'Enter Coupon',
            //         hintStyle: TextStyle(fontSize: 17.sp, color: kgrey),
            //         fillColor: kwhite,
            //         focusColor: kwhite,
            //         isDense: true,
            //         filled: true,
            //         border: OutlineInputBorder(
            //           borderSide: BorderSide(color: kblue),
            //           borderRadius: BorderRadius.circular(4.0),
            //         ),
            //         // suffixIcon:
            //         //     Image.asset('assets/images/Icon awesome-copy.png'),
            //             ),
            //   ),
            // ),
            // ksizedbox10,
            ksizedbox10,
            Text(
              'Promo Code',
              style: TextStyle(
                  fontSize: 16.5, color: kblue, fontWeight: FontWeight.w500),
            ),
            ksizedbox10,
            TextField(
              controller: redeemCouponController,
              decoration: InputDecoration(
                disabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                hintText: 'Enter Your Coupon code',
                fillColor: kwhite,
                focusColor: kwhite,
                isDense: true,
                filled: true,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 20,
                    width: 130,
                    decoration: BoxDecoration(
                      color: kblue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () async {
                        String tempSaleAmount = widget.plansData.saleAmount;
                        // var sgst =  widget.plansData.sg
                        String amount =
                            await profileController.redeemSubscriptionCoupon(
                                couponcode: redeemCouponController.text);

                        double tAmount = double.parse(amount);
                        double tempSaleAmounz = double.parse(tempSaleAmount);

                        if (tAmount < tempSaleAmounz) {
                          double totalAmountTobeAdded =
                              tempSaleAmounz - tAmount;

                          setState(() {
                            widget.plansData.saleAmount =
                                totalAmountTobeAdded.toStringAsFixed(0);
                          });
                        } else {
                          Get.rawSnackbar(
                              message:
                                  "Coupon is not applicable for this subscription",
                              backgroundColor: Colors.red);
                        }
                      },
                      child: Center(
                        child: Text(
                          'Redeem Now',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ksizedbox40,
            InkWell(
              onTap: () async {
                // var urls = await test();
                // Get.to(PaymentWebView(
                //   userId: "",
                //   payOpt: "",
                //   payType: 0,
                //   totalAmount: "",
                //   transactionType: urls["merchantTransactionId"],
                //   url: urls["instrumentResponse"]["redirectInfo"]["url"],
                // ));
                // trigerPaymentGateway();

                var random = Random();

                int randomInt = random.nextInt(100000);

                var resPond = {
                  "merchantId": "PGTESTPAYUAT93",
                  "merchantTransactionId": "transacti_$randomInt",
                  "merchantUserId": "90050770",
                  "amount": "1000",
                  "mobileNumber": "7907556867",
                  "callbackUrl": "https://webhook.site/callback-url",
                  "paymentInstrument": {
                    "type": "UPI_INTENT",
                    "targetApp": "com.phonepe.simulator"
                  },
                  "deviceContext": {"deviceOS": "ANDROID"}
                };

                // Step 1: Convert JSON object to JSON string
                String jsonString = jsonEncode(resPond);

                // Step 2: Encode JSON string to Base64
                String base64String = jsonString.toBase64;

                print(base64String);

                String apiEndPoint = "/pg/v1/pay";

                String salt = "875126e4-5a13-4dae-ad60-5b8c8b629035";

                int saltIndex = 1;

                var encodedCheckSum =
                    utf8.encode("$base64String/pg/v1/pay$salt");

                var tempCheckSum = sha256.convert(encodedCheckSum);

                String checksum =
                    tempCheckSum.toString() + "###" + "$saltIndex";

                // String checksum = sha256(base64Body + apiEndPoint + salt) + ### + saltIndex;

                print(
                    "<-<->------<->----------<->---------Sha256 algorithm---------<->---------<->-------<->->");

                print(checksum);

                print("------merchat id---->>--->>--->>-->>");
                print(resPond["merchantTransactionId"]);

                startPGTransaction(
                    apiEndPoint: apiEndPoint,
                    body: base64String,
                    callback: "https://www.portal.bcipvtltd.com",
                    checksum: checksum,
                    headers: pgHeaders,
                    packageName: "com.phonepe.simulator");
                    
                print(
                    ">>>>>>>>>>>>>>>>>..............payment start..........>>>>>>>>>>${widget.plansData.id}");
                // profileController.payfoSubscription(
                //   id: widget.plansData.id,
                //   amount: double.parse(widget.plansData.saleAmount),
                //);

                // profileController.payUseingEaseBuzzSubs(
                //     id: widget.plansData.id,
                //     amount: widget.plansData.saleAmount,
                //     customerName: profileController.profileData.first.name
                //         .trim()
                //         .split(" ")
                //         .first,
                //     email: profileController.profileData.first.email,
                //     phone: profileController.profileData.first.mobile,
                //     status: "");
                print(
                    ">>>>>>>>>>>>>>>>>..............payment end..........>>>>>>>>>>");
                // {
                //  String access_key = "Access key generated by the Initiate Payment API";
                //  String pay_mode = """This will either be "test" or "production""";
                //  Object parameters =
                //   {
                //     "access_key":access_key,
                //     "pay_mode":pay_mode
                //    };
                //  final payment_response = await _channel.invokeMethod("payWithEasebuzz", parameters);
                //  }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFFF5C29),
                        Color(0xFFFFCD38),
                      ],
                    ),
                  ),
                  child: Text(
                    'Proceed To Payment',
                    style: TextStyle(
                        fontSize: 28.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            ksizedbox40
          ],
        ),
      ),
    );
  }
}

/// EncodingExtensions
extension EncodingExtensions on String {
  /// To Base64
  /// This is used to convert the string to base64
  String get toBase64 {
    return base64.encode(toUtf8);
  }

  /// To Utf8
  /// This is used to convert the string to utf8
  List<int> get toUtf8 {
    return utf8.encode(this);
  }

  /// To Sha256
  /// This is used to convert the string to sha256
  String get toSha256 {
    return sha256.convert(toUtf8).toString();
  }
}
