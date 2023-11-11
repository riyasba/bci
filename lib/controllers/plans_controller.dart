import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/get_plan_details_model.dart';
import 'package:bci/models/get_plans_model.dart';
import 'package:bci/models/initiate_payment_model.dart';
import 'package:bci/models/partial_booking_data_model.dart';
import 'package:bci/models/partial_payment_history_model.dart';
import 'package:bci/models/slider_model.dart';
import 'package:bci/screens/members/manual_payment_options/phone_pe_partial_payment_view.dart';
import 'package:bci/screens/members/manual_payment_options/phone_pe_web_view_screen.dart';
import 'package:bci/screens/members/otcpayment/member_sub_successful.dart';
import 'package:bci/screens/members/otcpayment/payment_failed_screen.dart';
import 'package:bci/screens/members/settings_views/setings_quick_payment_screen.dart';
import 'package:bci/services/network/partial_payment_api_services/collect_partial_payment.dart';
import 'package:bci/services/network/partial_payment_api_services/partial_payment_api_services.dart';
import 'package:bci/services/network/partial_payment_api_services/partial_payment_history_api_services.dart';
import 'package:bci/services/network/payment_api_services/intiate_payment_api_services.dart';
import 'package:bci/services/network/payment_api_services/payment_status_api_services.dart';
import 'package:bci/services/network/subscriptions_api_services/add_subscription_api_services.dart';
import 'package:bci/services/network/subscriptions_api_services/check_for_previous_plan.dart';
import 'package:bci/services/network/subscriptions_api_services/get_plan_details_api_services.dart';
import 'package:bci/services/network/subscriptions_api_services/get_plans_list_api_services.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' as dio;
import 'package:bci/services/network/slider_api_services/slider_api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

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

  RxInt paymentIndex = 99.obs;

  CheckPlanApiServices checkPlanApiServices = CheckPlanApiServices();

  InitiatePaymentApiServices initiatePaymentApiServices =
      InitiatePaymentApiServices();

  PaymentResponseApiServices paymentResponseApiServices =
      PaymentResponseApiServices();

  getSlider() async {
    dio.Response<dynamic> response = await getSliderApiServices.getSlider();

    if (response.statusCode == 200) {
      SliderModel sliderModel = SliderModel.fromJson(response.data);
      sliderList = sliderModel.posts;
    }
    update();
  }

  checkUserPlan() async {
    bool isValid = false;
    dio.Response<dynamic> response = await checkPlanApiServices.checkPlanApi(
        userId: Get.find<ProfileController>().profileData.first.id);

    print("-------------User data------------");

    if (response.statusCode == 200) {
      print("_ ----------_ no current_ ----------- _");
      isValid = true;
    } else {
      print("_ ----------_ there are current plan going on_ ----------- _");

      isValid = false;

      Get.rawSnackbar(
          message: response.data["error"], backgroundColor: Colors.red);
    }
    return isValid;
  }

  RxBool isLoading = false.obs;

  getplansList() async {
    isLoading(true);
    dio.Response<dynamic> response = await getPlansApiServices.getPlans();
    isLoading(false);
    if (response.statusCode == 200) {
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

  calcGstAmount(String gstPercentage, String saleAmount) {
    print("<<--------on payment screen------->>");
    int tempGst = int.parse(gstPercentage);
    int tempSaleAmount = int.parse(saleAmount);
    var tempGstPercent = tempGst / 100;

    var gstAmount = tempSaleAmount * tempGstPercent;

    return gstAmount;
  }

  calcTotalAmountIncGst(String gstPercentage, String saleAmount) {
    int tempGst = int.parse(gstPercentage);
    int tempSaleAmount = int.parse(saleAmount);
    var tempGstPercent = tempGst / 100;

    var gstAmount = tempSaleAmount * tempGstPercent;
    var totalAmountincGst = tempSaleAmount + gstAmount;
    return totalAmountincGst;
  }

  // addSubscription({required int planId}) async {
  //   dio.Response<dynamic> response =
  //       await addSubscriptionApiServices.addSubscription(
  //           planId: planId,
  //           customerId: Get.find<ProfileController>().profileData.first.id);

  //   if (response.statusCode == 200) {
  //     Get.rawSnackbar(
  //         backgroundColor: Colors.green,
  //         messageText: Text(
  //           "Plan Activated Successfully",
  //           style: primaryFont.copyWith(color: Colors.white),
  //         ));
  //   } else {
  //     Get.rawSnackbar(
  //         backgroundColor: Colors.red,
  //         messageText: Text(
  //           response.data["message"],
  //           style: primaryFont.copyWith(color: Colors.white),
  //         ));
  //   }
  // }

  init(String environment, String appId, String merchantId,
      bool enableLogging) async {
    PhonePePaymentSdk.init(environment, appId, merchantId, enableLogging)
        .then((val) => {
              // result = 'PhonePe SDK Initialized - $val';
              print("-------------------->> value on init"),
              print(val.toString()),
              // Get.rawSnackbar(
              //     message: val.toString(), backgroundColor: Colors.red)
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
      required String referanceId,
      required String checksum,
      required Map<String, String> headers,
      required String apiEndPoint,
      required double amount,
      required int id,
      required String gstPercentage,
      required int planId,
      required String percentageAmount,
      required String totalAmount,
      String? packageName}) async {
    try {
      var response = PhonePePaymentSdk.startPGTransaction(
          body, callback, checksum, headers, apiEndPoint, packageName);

      print(
          "<:---::---::---::---::---:Result from phonePe:---::---::---::---:>");
      print(response);
      response
          .then((val) => {
                print(
                    "<:---::---::---::---::---:Result from phonePe:---::---::---::---:>"),
                print(val),
                // Get.rawSnackbar(
                //     message: val.toString(), backgroundColor: Colors.red),
                if (val!["status"] == "SUCCESS")
                  {
                    print("<<<<<<<<payment is Success>>>>>>>>"),
                    checkPhonePeStatus(
                        refernceID: referanceId,
                        amount: amount,
                        id: planId,
                        gstPercentage: gstPercentage,
                        percentageAmount: percentageAmount,
                        totalAmount: totalAmount,
                        planId: planId),
                    // Get.find<HomeController>().addSubscription(
                    //     planId: planId,
                    //     customerId:
                    //         Get.find<ProfileController>().profileData.first.id,
                    //     paymentMenthod: "5",
                    //     utrNumber: "",
                    //     gstPercentage: gstPercentage,
                    //     percentageAmount: percentageAmount,
                    //     amount: amount.toStringAsFixed(2),
                    //     totalAmount: totalAmount)
                  }
                else
                  {
                    print("<<<<<<<<payment is Failed>>>>>>>>"),
                  },
              })
          .catchError((error) {
        // handleError(error);
        print(
            "<:---::---:1:---:1:---:1:---:_Error_on_phonePe_:---:1:---:1:---:1:---:>");
        return <dynamic>{};
      });
    } catch (error) {
      print(
          "<:---::---:2:---:2:---:2:---:Error on phonePe:---:2:---:2:---:2:---:>");
      print(error);
      //handleError(error);
    }
  }

  phonePePayment({
    required double amount,
    required int id,
    required String gstPercentage,
    required String percentageAmount,
    required String totalAmount,
    required String packageName,
    required int planId,
  }) async {
    var random = Random();

    int randomInt = random.nextInt(100000);

    var signature = await PhonePePaymentSdk.getPackageSignatureForAndroid();

    print("-New-%%%%%%%%%%%%%%%%%%%%%%%%Signature%%%%%%%%%%%%%%%%%%%%%start");
    print(signature);
    print((double.parse(totalAmount) * 100).round().toString());
    print("end%%%%%%%%%%%%%%%%%%%%%%%%Signature%%%%%%%%%%%%%%%%%%%%%");

    print(
        ":::::::::::Amount -->> ${(double.parse(totalAmount) * 100).round()}");

    var resPond = {
      "merchantId": "M1FTWHQF8C06",
      "merchantTransactionId": "transacti_$randomInt",
      "merchantUserId": "90050770",
      // "amount": (double.parse(totalAmount) * 100).round().toString(),
      "amount": (double.parse(totalAmount) * 100).round(),
      "mobileNumber": "7907556867",
      "callbackUrl": "https://www.portal.bcipvtltd.com",
      "paymentInstrument": {"type": "UPI_INTENT", "targetApp": packageName},
      "deviceContext": {"deviceOS": "ANDROID"}
    };

    // Step 1: Convert JSON object to JSON string
    String jsonString = jsonEncode(resPond);

    // Step 2: Encode JSON string to Base64
    String base64String = jsonString.toBase64;

    print(base64String);

    String apiEndPoint = "/pg/v1/pay";

    String salt = "dac833ac-bd21-4db3-aff9-ea16c7f88288";

    int saltIndex = 1;

    var encodedCheckSum = utf8.encode("$base64String/pg/v1/pay$salt");

    var tempCheckSum = sha256.convert(encodedCheckSum);

    String checksum = tempCheckSum.toString() + "###" + "$saltIndex";

    // String checksum = sha256(base64Body + apiEndPoint + salt) + ### + saltIndex;

    print(
        "<-<->------<->----------<->--------- Sha256 algorithm ---------<->---------<->-------<->->");

    print(checksum);

    print(">>---->>merchat id>>---->>--->>--->>-->>");
    print(resPond["merchantTransactionId"]);

    Map<String, String> pgHeaders = {"Content-Type": "application/json"};

    startPGTransaction(
        referanceId: "transacti_$randomInt",
        apiEndPoint: apiEndPoint,
        body: base64String,
        callback: "",
        checksum: checksum,
        headers: pgHeaders,
        amount: amount,
        gstPercentage: gstPercentage,
        id: id,
        percentageAmount: percentageAmount,
        totalAmount: totalAmount,
        planId: planId,
        packageName: packageName);
  }

  initiatePayment(
      {required double amount,
      required int id,
      required String gstPercentage,
      required String percentageAmount,
      required String totalAmount,
      required int planId}) async {
    dio.Response<dynamic> response =
        await initiatePaymentApiServices.initiatePayment(
            userId: Get.find<ProfileController>().profileData.first.id,
            totalAmount: totalAmount,
            status: "subscription");

    if (response.statusCode == 200) {
      IninitiatePaymentModel ininitiatePaymentModel =
          IninitiatePaymentModel.fromJson(response.data);

      Get.to(() => PaymentWebView(
            amount: amount,
            gstPercentage: gstPercentage,
            id: id,
            percentageAmount: percentageAmount,
            planId: planId,
            totalAmount: totalAmount,
            url:
                ininitiatePaymentModel.data.instrumentResponse.redirectInfo.url,
            referenceId: ininitiatePaymentModel.data.merchantTransactionId,
          ));
    }
  }

  checkPhonePeStatus(
      {required String refernceID,
      required double amount,
      required int id,
      required String gstPercentage,
      required String percentageAmount,
      required String totalAmount,
      required int planId}) async {
    dio.Response<dynamic> response = await paymentResponseApiServices
        .paymentResponseApi(merchantId: refernceID);

    if (response.data["code"] == "PAYMENT_SUCCESS") {
      print("<<<<<<<<payment is Success>>>>>>>>");
      Get.find<HomeController>().addSubscription(
          planId: planId,
          customerId: Get.find<ProfileController>().profileData.first.id,
          paymentMenthod: "5",
          utrNumber: "",
          gstPercentage: gstPercentage,
          percentageAmount: percentageAmount,
          amount: amount.toStringAsFixed(2),
          totalAmount: totalAmount);
    } else {
      print("<<<<<<<<payment is Failed>>>>>>>>");

      Get.to(() => PaymentFailedScreen());
    }
  }

//partial Payment functions

  PartialPaymentHistoryApiServices partialPaymentHistoryApiServices =
      PartialPaymentHistoryApiServices();

  PartialPaymentApiServices partialPaymentApiServices =
      PartialPaymentApiServices();

  CollectPartialPaymentyApiServices collectPartialPaymentyApiServices =
      CollectPartialPaymentyApiServices();

  List<PartialAmount> partialAmountdataList = [];
  List<PartialPaymentHistoryData> partialAmountHistoryList = [];
  // RxBool isLoading = false.obs;
  getPartialPaymentDatas() async {
    isLoading(true);
    dio.Response<dynamic> response =
        await partialPaymentApiServices.partialPayment();
    isLoading(false);
    if (response.statusCode == 200) {
      if (response.data["message"] == "No records found for the user") {
        Get.off(() => QucikPaymentScreen());
      } else {
        PartialAmountModel partialAmountModel =
            PartialAmountModel.fromJson(response.data);
        partialAmountdataList.clear();
        partialAmountdataList.add(partialAmountModel.partialAmount);
        getPartialPaymentDataHistory(
            partialID: partialAmountModel.partialAmount.id.toString());
        update();
      }
    }
  }

  getPartialPaymentDataHistory({required String partialID}) async {
    dio.Response<dynamic> response = await partialPaymentHistoryApiServices
        .partialPaymentHistory(partialID: partialID);

    if (response.statusCode == 200) {
      PartialPaymentHistoryModel partialPaymentHistoryModel =
          PartialPaymentHistoryModel.fromJson(response.data);
      partialAmountHistoryList = partialPaymentHistoryModel.data;
      update();
    }
  }

  collectPartialAmount({
    required int customerId,
    required String saleAmount,
    required String planId,
    required String collectedDate,
    required String collectedAmount,
    required String status,
  }) async {
    dio.Response<dynamic> response =
        await collectPartialPaymentyApiServices.collectPartialPayment(
            collectedAmount: collectedAmount,
            collectedDate: collectedDate,
            customerId: customerId,
            planId: planId,
            saleAmount: saleAmount,
            status: "Pending");

    if (response.statusCode == 200) {
      // Get.rawSnackbar(
      //     message: response.data["message"], backgroundColor: Colors.green);
    }
  }

  initiatePaymentPartialPayment({
    required double amount,
    required int customerId,
    required String saleAmount,
    required String planId,
    required String collectedDate,
    required String collectedAmount,
    required String status,
  }) async {
    var userId = 0;
    // print(Get.find<ProfileController>().profileData);
    if (Get.find<ProfileController>().profileData.isNotEmpty) {
      userId = Get.find<ProfileController>().profileData.first.id;
    } else {
      await Get.find<ProfileController>().getProfile();
      userId = Get.find<ProfileController>().profileData.first.id;
    }
    dio.Response<dynamic> response =
        await initiatePaymentApiServices.initiatePayment(
            userId: userId,
            totalAmount: amount.toStringAsFixed(2),
            status: "Wallet");

    if (response.statusCode == 200) {
      IninitiatePaymentModel ininitiatePaymentModel =
          IninitiatePaymentModel.fromJson(response.data);

      Get.to(() => PaymentWebViewPartialPayment(
            amount: amount,
            collectedAmount: collectedAmount,
            collectedDate: collectedDate,
            customerId: customerId,
            planId: planId,
            saleAmount: saleAmount,
            status: status,
            referenceId: ininitiatePaymentModel.data.merchantTransactionId,
            url:
                ininitiatePaymentModel.data.instrumentResponse.redirectInfo.url,
            userId: Get.find<ProfileController>()
                .profileData
                .first
                .userId
                .toString(),
          ));
    }
  }

  checkPhonePeStatusPartialPayment({
    required String refernceID,
    required double amount,
    required String userId,
    required int customerId,
    required String saleAmount,
    required String planId,
    required String collectedDate,
    required String collectedAmount,
    required String status,
  }) async {
    dio.Response<dynamic> response = await paymentResponseApiServices
        .paymentResponseApi(merchantId: refernceID);

    if (response.data["code"] == "PAYMENT_SUCCESS") {
      print("<<<<<<<<payment is Success>>>>>>>>");
      collectPartialAmount(
          customerId: customerId,
          saleAmount: saleAmount,
          planId: planId,
          collectedDate: collectedDate,
          collectedAmount: collectedAmount,
          status: status);

      Get.to(const SucessfulScreenOtc());
    } else {
      print("<<<<<<<<payment is Failed>>>>>>>>");

      Get.to(() => PaymentFailedScreen());
    }
  }

  calculateUnPaid(double planAmount, double paidAmount) {
    double remainingAmount = planAmount - paidAmount;

    return remainingAmount.toStringAsFixed(0);
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
