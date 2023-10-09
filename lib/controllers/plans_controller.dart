import 'dart:convert';
import 'dart:math';

import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/get_plan_details_model.dart';
import 'package:bci/models/get_plans_model.dart';
import 'package:bci/models/slider_model.dart';
import 'package:bci/screens/members/otcpayment/member_sub_successful.dart';
import 'package:bci/screens/members/otcpayment/otc_payment.dart';
import 'package:bci/services/network/subscriptions_api_services/add_subscription_api_services.dart';
import 'package:bci/services/network/subscriptions_api_services/get_plan_details_api_services.dart';
import 'package:bci/services/network/subscriptions_api_services/get_plans_list_api_services.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' as dio;
import 'package:bci/services/network/slider_api_services/slider_api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class PlanController extends GetxController {
  GetSliderApiServices getSliderApiServices = GetSliderApiServices();
  GetPlansApiServices getPlansApiServices = GetPlansApiServices();
  GetPlansDetailsApiServices getPlansDetailsApiServices =
      GetPlansDetailsApiServices();

  AddSubscriptionApiServices addSubscriptionApiServices =
      AddSubscriptionApiServices();

  List<SliderPost> sliderList = [];
  List<PlansData> plansdataList = [];
  //List<PlansData> planDetailsList = [];
  List<SubscribePlansData> subscribePlansData = [];

  getSlider() async {
    dio.Response<dynamic> response = await getSliderApiServices.getSlider();

    if (response.statusCode == 200) {
      SliderModel sliderModel = SliderModel.fromJson(response.data);
      sliderList = sliderModel.posts;
    }
    update();
  }

  getplansList() async {
    dio.Response<dynamic> response = await getPlansApiServices.getPlans();
    if (response.statusCode == 200) {
      print(response.data);
      PlansModel plansModel = PlansModel.fromJson(response.data);
      plansdataList = plansModel.data;
    }
    update();
  }

  getPlanDetails({required dynamic id}) async {
    subscribePlansData.clear();
    dio.Response<dynamic> response =
        await getPlansDetailsApiServices.getPlansDetails(planId: id);

    if (response.statusCode == 200) {
      PlansDetailsModel plansDetailsModel =
          PlansDetailsModel.fromJson(response.data);

      subscribePlansData.add(plansDetailsModel.plan);
      update();
    }
    update();
  }

  addSubscription({required int planId}) async {
    dio.Response<dynamic> response =
        await addSubscriptionApiServices.addSubscription(
            planId: planId,
            customerId: Get.find<ProfileController>().profileData.first.id);

    if (response.statusCode == 200) {
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Plan Activated Successfully",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  paymentStatus(String transactionId) async {
    const saltKey = "875126e4-5a13-4dae-ad60-5b8c8b629035";
    const saltIndex = 1;
    const apiEndpoint = "/pg/v1/pay";

    var randomNumber = Random(10000);

    // final jsonData = {
    //   "merchantId": "PGTESTPAYUAT93",
    //   "merchantTransactionId": "MT7$randomNumber",
    //   "merchantUserId": "MUID123",
    //   "amount": '100',
    //   "redirectUrl": "https://app.e-sankalp.com/payment-processing",
    //   "redirectMode": "POST",
    //   "callbackUrl": "https://webhook.site/callback-url",
    //   "mobileNumber": "9999999999",
    //   "paymentInstrument": {"type": "PAY_PAGE"}
    // };

    // String jsonString = jsonEncode(jsonData);
    // String base64Data = jsonString.toBase64;
    print("<<-----[<->]-----your transaction ID-----[<->]------->>");
    print(transactionId);

    String dataToHash =
        "/v3/transaction/PGTESTPAYUAT93/$transactionId/status$saltKey";
    String sHA256 = generateSha256Hash(dataToHash);

    // print(base64Data);
    // print('#' * 10);
    print("$sHA256###$saltIndex");

    final response = await http.get(
      Uri.parse(
          'https://mercury-uat.phonepe.com/v3/transaction/PGTESTPAYUAT93/$transactionId/status'),
      headers: {
        "accept": "application/json",
        'X-VERIFY': '$sHA256###$saltIndex',
        'Content-Type': 'application/json',
      },
    );

    print(response.body.toString());

    var res = jsonDecode(response.body.toString());

    if (res["success"] == true) {
      Get.offAll(() => const SucessfulScreenOtc());
    } else {
      Get.rawSnackbar(message: "Payment failed");
    }

    // return res["data"]["instrumentResponse"]["redirectInfo"]["url"];
  }

  String generateSha256Hash(String input) {
    var bytes = utf8.encode(input);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}
