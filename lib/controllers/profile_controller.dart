import 'dart:convert';
import 'dart:io';
import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/models/get_coupons_model.dart';
import 'package:bci/models/member_profile_model.dart';
import 'package:bci/models/member_profile_update_model.dart';
import 'package:bci/models/members_register_model.dart';
import 'package:bci/screens/members/otcpayment/member_sub_successful.dart';
import 'package:bci/services/network/profile_api_services/our_coupons_api_service.dart';
import 'package:bci/services/network/profile_api_services/profile_api_services.dart';
import 'package:bci/services/network/profile_api_services/profile_pic_update_api_services.dart';
import 'package:bci/services/network/profile_api_services/profile_update_api_services.dart';
import 'package:bci/services/network/profile_api_services/redeem_coupons_api_services.dart';
import 'package:bci/services/network/profile_api_services/update_official_address_api.dart';
import 'package:bci/services/network/profile_api_services/user_redeem_coupon_api_service.dart';
import 'package:bci/services/network/subscriptions_api_services/ease_buzz_payment_api_services.dart';
import 'package:bci/widgets/home_widgets/loading_widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:isgpayui_plugin/isgpayui_plugin.dart';
import '../services/network/profile_api_services/update_residencial_address_api_services.dart';

class ProfileController extends GetxController {
  GetProfileApiServices getProfileApiServices = GetProfileApiServices();
  ProfileUpdateApiServices profileUpdateApi = ProfileUpdateApiServices();
  UpdateResidencialAddressApiServices updateResidencialAddressApiServices =
      UpdateResidencialAddressApiServices();
  UpdateOfficialApiServices updateOfficialApiServices =
      UpdateOfficialApiServices();

  ProfilePIcUpdateApiServices profilePIcUpdateApiServices =
      ProfilePIcUpdateApiServices();

  List<MemberUser> profileData = [];

  RxBool isSubscribed = false.obs;

  RxBool isLoading = false.obs;

  RxString planid = "".obs;

  getProfile() async {
    profileData.clear();
    isLoading(true);
    dio.Response<dynamic> response = await getProfileApiServices.getProfile();
    isLoading(false);
    if (response.statusCode == 200) {
      MemberProfileModel profileModel =
          MemberProfileModel.fromJson(response.data);
      isSubscribed(profileModel.subscription);
      planid(profileModel.planId.toString());
      profileData.add(profileModel.user);
      update();
      var token = await FirebaseMessaging.instance.getToken();
      Get.find<AuthController>().fcmtoken(
        token: token.toString(),
      );
      print("............firebase token.......=====================>>>");
      print(token);
    } else if (response.statusCode == 401) {
      Get.find<AuthController>().logout();
    }
    update();
  }

  updateProfile(
      {required MemberProfileUpdateModel memberProfileUpdateModel}) async {
    isLoading(true);
    dio.Response<dynamic> response = await profileUpdateApi.profileUpdate(
        memberProfileUpdateModel: memberProfileUpdateModel);
    isLoading(false);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "profile updated",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  updateRecidencyAddress({required AddressModel residentialAddress}) async {
    isLoading(true);
    dio.Response<dynamic> response = await updateResidencialAddressApiServices
        .updateResidencialAddressApi(residentialAddress: residentialAddress);
    isLoading(false);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.rawSnackbar(
        backgroundColor: Colors.green,
        messageText: Text(
          "Address updated",
          style: primaryFont.copyWith(color: Colors.white),
        ),
      );
    }
  }

  updateOfficalAddress({required AddressModel officialAddress}) async {
    isLoading(true);
    dio.Response<dynamic> response = await updateOfficialApiServices
        .updateOfficialAddress(officialAddress: officialAddress);
    isLoading(false);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Address updated",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  updateProfilePic(File image) async {
    dio.Response<dynamic> response =
        await profilePIcUpdateApiServices.profilepicUpdate(image: image);

    getProfile();
  }

  // service coupons list
  RedeemCouponApiServices userredeemCouponApiServices =
      RedeemCouponApiServices();
  List<CouponsData> servicecouponsData = [];

  getuserCoupones(
      {required String couponcode,
      required String serviceId,
      required String vendorId}) async {
    dio.Response<dynamic> response =
        await redeemCouponApiServices.redeemCouponApiServices(
            couponcode: couponcode, serviceId: serviceId, vendorId: vendorId);
    if (response.statusCode == 200) {
      GetCouponsList getCouponsList = GetCouponsList.fromJson(response.data);
      couponsData = getCouponsList.data;
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          response.data["message"],
          style: primaryFont.copyWith(color: Colors.white),
        ),
      );
    }
    update();
  }

  //coupons list
  OurCouponsApiServices ourCouponsApiServices = OurCouponsApiServices();
  // RedeemCouponApiServices redeemCouponApiServices = RedeemCouponApiServices();
  List<CouponsData> couponsData = [];
  List<CouponsData> redeemcouponsData = [];

  getCoupons() async {
    dio.Response<dynamic> response =
        await ourCouponsApiServices.ourCouponsApiServices();
    if (response.statusCode == 200) {
      GetCouponsList getCouponsList = GetCouponsList.fromJson(response.data);
      couponsData = getCouponsList.data;
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  RedeemedCouponsCouponApiServices redeemedCouponsCouponApiServices =
      RedeemedCouponsCouponApiServices();

  redeemgetCoupons() async {
    dio.Response<dynamic> response =
        await redeemedCouponsCouponApiServices.redeemedCouponApiServices();
    if (response.statusCode == 200) {
      GetCouponsList getCouponsList = GetCouponsList.fromJson(response.data);
      redeemcouponsData = getCouponsList.data;
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  //redeem coupon
  RedeemCouponApiServices redeemCouponApiServices = RedeemCouponApiServices();

  redeemCoupon(
      {required String couponcode,
      required String serviceId,
      required String vendorId}) async {
    String tempAmount = "0";
    dio.Response<dynamic> response =
        await redeemCouponApiServices.redeemCouponApiServices(
            couponcode: couponcode, serviceId: serviceId, vendorId: vendorId);
    if (response.statusCode == 200) {
      tempAmount = response.data["amount"].toString();
      Get.rawSnackbar(
          message: response.data["message"], backgroundColor: Colors.green);
    } else if (response.statusCode == 400) {
      Get.rawSnackbar(
          message: response.data["error"], backgroundColor: Colors.red);
    } else {
      Get.rawSnackbar(
          message: response.data["error"], backgroundColor: Colors.red);
    }

    return tempAmount;
  }

  //easebuzz

  static MethodChannel _channel = MethodChannel('easebuzz');
  EaseBuzzTokenApiService easeBuzzApi = EaseBuzzTokenApiService();

  payUseingEaseBuzz({
    required int id,
    required String amount,
    required String customerName,
    required String email,
    required String phone,
    required dynamic status,
  }) async {
    isLoading(true);
    Get.find<ProfileController>().getProfile();

    var response = await easeBuzzApi.getPaymentToken(
        amount: amount,
        customerName: customerName,
        email: email,
        id: "07889${DateTime.now().microsecond}${DateTime.now().second}",
        phone: phone);

    String access_key = response["data"];
    String pay_mode = "test";

    print("access_key >>$access_key");
    Object parameters = {"access_key": access_key, "pay_mode": pay_mode};
    // isPayLoading(false);
    isLoading(false);
    final payment_response =
        await _channel.invokeMethod("payWithEasebuzz", parameters);
    print(payment_response);
    isLoading(false);
    if (payment_response["result"] == "payment_successfull") {
      final homeController = Get.find<HomeController>();
      print("-------------->>---------->>");
      for (int i = 0; i < homeController.cartListData.length; i++) {
        homeController.addBooking(
            serviceid: homeController.cartListData[i].serviceId.toString(),
            cartid: homeController.cartListData[i].id.toString(),
            qty: homeController.cartListData[i].quantity.toString(),
            offerOrCoupon: "",
            couponcode: "",
            amount: homeController.cartListData[i].price);
      }

      Get.offAll(
        () => LoadingWidgets(),
      );

      // Get.find<HomeController>().addSubscription(
      //     planId: id,
      //     customerId: Get.find<ProfileController>().profileData.first.id);

      //need to give id
      Get.snackbar(
        "Payment Successfully Paid",
        "",
        icon: const Icon(Icons.check_circle_outline_outlined,
            color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );

      print(response);
    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
          "The last transaction has been cancelled!", "Please try again!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

//payment gateway isgPay

  // String responseData = "Nothing";
  final _isgpayuiPlugin = IsgpayuiPlugin();

  void payFromCart(double amount) async {
    String? result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _isgpayuiPlugin.initiateISGPayUI(getArguments(amount * 100)) ??
          'Unknown platform version';
    } on PlatformException catch (e) {
      result = e.message;
    }
    debugPrint('Result ::: $result');

    var responseData = jsonDecode(result!);
    var data = jsonDecode(responseData);
    print("<<----response-data---->>${data.runtimeType}");
    print(data);
    if(data["ResponseCode"] == "00"){
      final homeController = Get.find<HomeController>();
      print(">>-------------->>---------->>");
      for (int i = 0; i < homeController.cartListData.length; i++) {
        homeController.addBooking(
            serviceid: homeController.cartListData[i].serviceId.toString(),
            cartid: homeController.cartListData[i].id.toString(),
            qty: homeController.cartListData[i].quantity.toString(),
            offerOrCoupon: "",
            couponcode: "",
            amount: homeController.cartListData[i].price);
      }

      Get.offAll(
        () => LoadingWidgets(),
      );

      // Get.find<HomeController>().addSubscription(
      //     planId: id,
      //     customerId: Get.find<ProfileController>().profileData.first.id);

      //need to give id
      Get.snackbar(
        "Payment Successfully Paid",
        "",
        icon: const Icon(Icons.check_circle_outline_outlined,
            color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );

      // print(response);
    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
          "The last transaction has been cancelled!", "Please try again!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Map<String, String> getArguments(var amount) {
    var randomStr = DateTime.now().microsecondsSinceEpoch.toString();
    Map<String, String> map = {
      'version': "1",
      'txnRefNo': "ORD$randomStr", // Should change on every request
      'amount': "$amount",
      'passCode': 'SVPL4257',
      'bankId': '000004',
      'terminalId': '10100781',
      'merchantId': '101000000000781',
      'mcc': "4112",
      'paymentType': 'Pay',
      'currency': "356",
      'email': 'manu@gmail.com',
      'phone': '+917907886767',
      'hashKey': 'E59CD2BF6F4D86B5FB3897A680E0DD3E',
      'aesKey': '5EC4A697141C8CE45509EF485EE7D4B1',
      'payOpt': 'cc',
      'orderInfo': 'NARUTO00001',
      'env': 'UAT', //UAT PROD
      'url': 'https://sandbox.isgpay.com/ISGPay-Genius/request.action',
    };
    return map;
  }

//add subcription
  payUseingEaseBuzzSubs({
    required int id,
    required String amount,
    required String customerName,
    required String email,
    required String phone,
    required dynamic status,
  }) async {
    Get.find<ProfileController>().getProfile();
    var response = await easeBuzzApi.getPaymentToken(
        amount: amount,
        customerName: customerName,
        email: email,
        id: "07889${DateTime.now().microsecond}${DateTime.now().second}",
        phone: phone);

    String access_key = response["data"];
    String pay_mode = "test";

    print("access_key >>$access_key");
    Object parameters = {"access_key": access_key, "pay_mode": pay_mode};
    // isPayLoading(false);
    isLoading(false);
    final payment_response =
        await _channel.invokeMethod("payWithEasebuzz", parameters);
    print(payment_response);
    isLoading(false);
    if (payment_response["result"] == "payment_successfull") {
      final homeController = Get.find<HomeController>();

      Get.find<HomeController>().addSubscription(
          planId: id,
          customerId: Get.find<ProfileController>().profileData.first.id);

      //need to give id
      Get.snackbar(
        "Payment Successfully Paid",
        "",
        icon: const Icon(Icons.check_circle_outline_outlined,
            color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );

      print(response);
    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
          "The last transaction has been cancelled!", "Please try again!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void payfoSubscription({required double amount,
    required int id,
  }) async {
    String? result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result =
          await _isgpayuiPlugin.initiateISGPayUI(getArguments(amount * 100)) ??
              'Unknown platform version';
    } on PlatformException catch (e) {
      result = e.message;
    }
    debugPrint('Result ::: $result');

    var responseData = jsonDecode(result!);
    var data = jsonDecode(responseData);
    print("<<----response-data---->>${data.runtimeType}");
    print(data);
    if (data["ResponseCode"] == "00") {
        final homeController = Get.find<HomeController>();

      Get.find<HomeController>().addSubscription(
          planId: id,
          customerId: Get.find<ProfileController>().profileData.first.id);

      //need to give id
      Get.snackbar(
        "Payment Successfully Paid",
        "",
        icon: const Icon(Icons.check_circle_outline_outlined,
            color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
          "The last transaction has been cancelled!", "Please try again!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }


  //add wallet amount
  payUseingEaseBuzzWallet({
    required int id,
    required String amount,
    required String customerName,
    required String email,
    required String phone,
    required dynamic status,
  }) async {
    Get.find<ProfileController>().getProfile();
    var response = await easeBuzzApi.getPaymentToken(
        amount: amount,
        customerName: customerName,
        email: email,
        id: "07889${DateTime.now().microsecond}${DateTime.now().second}",
        phone: phone);

    String access_key = response["data"];
    String pay_mode = "test";

    print("access_key >>$access_key");
    Object parameters = {"access_key": access_key, "pay_mode": pay_mode};
    // isPayLoading(false);
    isLoading(false);
    final payment_response =
        await _channel.invokeMethod("payWithEasebuzz", parameters);
    print(payment_response);
    isLoading(false);
    if (payment_response["result"] == "payment_successfull") {
      Get.find<AuthController>().addTransaction(amount: amount);

      Get.to(const SucessfulScreenOtc());

      //need to give id
      Get.snackbar(
        "Payment Successfully Paid",
        "",
        icon: const Icon(Icons.check_circle_outline_outlined,
            color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );

      print(response);
    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
          "The last transaction has been cancelled!", "Please try again!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }


   // String responseData = "Nothing";

  void payforWallet(
      {required double amount}) async {
    String? result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result =
          await _isgpayuiPlugin.initiateISGPayUI(getArguments(amount * 100)) ??
              'Unknown platform version';
    } on PlatformException catch (e) {
      result = e.message;
    }
    debugPrint('Result ::: $result');

    var responseData = jsonDecode(result!);
    var data = jsonDecode(responseData);
    print("<<----response-data---->>${data.runtimeType}");
    print(data);
    if (data["ResponseCode"] == "00") {
      Get.find<AuthController>().addTransaction(amount: amount.toStringAsFixed(2));

      Get.to(const SucessfulScreenOtc());

      //need to give id
      Get.snackbar(
        "Payment Successfully Paid",
        "",
        icon: const Icon(Icons.check_circle_outline_outlined,
            color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );

    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
          "The last transaction has been cancelled!", "Please try again!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

 

}
