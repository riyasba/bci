import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/models/child_dob_model.dart';
import 'package:bci/models/credit_profile_model.dart';
import 'package:bci/models/credit_statement_model.dart';
import 'package:bci/models/get_coupons_model.dart';
import 'package:bci/models/initiate_payment_model.dart';
import 'package:bci/models/member_profile_model.dart';
import 'package:bci/models/member_profile_update_model.dart';
import 'package:bci/models/members_register_model.dart';
import 'package:bci/models/merchant_coupon_list_model.dart';
import 'package:bci/models/userredeemcoupon/redeemed_coupons_model.dart';
import 'package:bci/screens/members/flight_booking_screens/flight_loading_page.dart';
import 'package:bci/screens/members/home_screen/cancel_booking_confirmation_screen.dart';
import 'package:bci/screens/members/manual_payment_options/phone_pe_add_to_wallet.dart';
import 'package:bci/screens/members/manual_payment_options/phone_pe_bus_booking_model.dart';
import 'package:bci/screens/members/manual_payment_options/phone_pe_service_booking.dart';
import 'package:bci/screens/members/otcpayment/member_sub_successful.dart';
import 'package:bci/services/network/booking_cancel_refund_api_services/booking_cancel_refund_api_services.dart';
import 'package:bci/services/network/credit_api_services/get_credit_profile_api_services.dart';
import 'package:bci/services/network/credit_api_services/pay_credit_api_services.dart';
import 'package:bci/services/network/credit_api_services/user_credit_points_api_dart.dart';
import 'package:bci/services/network/credit_api_services/view_credit_statement.dart';
import 'package:bci/services/network/payment_api_services/intiate_payment_api_services.dart';
import 'package:bci/services/network/payment_api_services/payment_status_api_services.dart';
import 'package:bci/services/network/profile_api_services/our_coupons_api_service.dart';
import 'package:bci/services/network/profile_api_services/profile_api_services.dart';
import 'package:bci/services/network/profile_api_services/profile_pic_update_api_services.dart';
import 'package:bci/services/network/profile_api_services/profile_update_api_services.dart';
import 'package:bci/services/network/profile_api_services/redeem_coupons_api_services.dart';
import 'package:bci/services/network/profile_api_services/sub_coupons_redeem_api_services.dart';
import 'package:bci/services/network/profile_api_services/update_official_address_api.dart';
import 'package:bci/services/network/profile_api_services/user_redeem_coupon_api_service.dart';
import 'package:bci/services/network/subscriptions_api_services/ease_buzz_payment_api_services.dart';
import 'package:bci/services/network/vendor_list_api_services/merchant_coupon_list_api_service.dart';
import 'package:bci/services/network/wallet_api_services/withdraw_from_api_services.dart';
import 'package:bci/widgets/home_widgets/loading_widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
// import 'package:isgpayui_plugin/isgpayui_plugin.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../screens/members/otcpayment/payment_failed_screen.dart';
import '../services/network/profile_api_services/update_residencial_address_api_services.dart';

class ProfileController extends GetxController {
  GetProfileApiServices getProfileApiServices = GetProfileApiServices();
  ProfileUpdateApiServices profileUpdateApi = ProfileUpdateApiServices();
  UpdateResidencialAddressApiServices updateResidencialAddressApiServices =
      UpdateResidencialAddressApiServices();
  UpdateOfficialApiServices updateOfficialApiServices =
      UpdateOfficialApiServices();

  BookingCancelRefundAPIServices bookingCancelRefundAPIServices =
      BookingCancelRefundAPIServices();

  ProfilePIcUpdateApiServices profilePIcUpdateApiServices =
      ProfilePIcUpdateApiServices();

  List<MemberUser> profileData = [];

  RxBool isSubscribed = false.obs;

  RxBool isLoading = false.obs;

  RxString planid = "".obs;
  RxString refferalAmount = "0.00".obs;

  RxInt isWalletOrNot = 0.obs;

  List<ChildDetailsModel> childDetailsList = [];
  List<ChildDetailsModel> previchildDetailsList = [];

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
      refferalAmount(profileModel.refferalAmount);
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
        childDetailsList: childDetailsList,
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
      required String amount,
      required String vendorId}) async {
    dio.Response<dynamic> response =
        await redeemCouponApiServices.redeemCouponApiServices(
            couponcode: couponcode,
            serviceId: serviceId,
            vendorId: vendorId,
            planId: int.parse(planid.value),
            requestAmount: amount);
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
  List<CouponsData> tempcouponsData = [];
  List<CouponsData> categorycouponsData = [];
  List<CouponsRedeemedData> redeemcouponsData = [];

  getCoupons() async {
    dio.Response<dynamic> response =
        await ourCouponsApiServices.ourCouponsApiServices();
    if (response.statusCode == 200) {
      GetCouponsList getCouponsList = GetCouponsList.fromJson(response.data);
      couponsData = getCouponsList.data;
      tempcouponsData = getCouponsList.data;
      List<String> categoyNames = [];
      categorycouponsData = [];
      getCouponsList.data.forEach((element) {
        if (categoyNames.contains(element.name) == false) {
          categorycouponsData.add(element);
          categoyNames.add(element.name);
        }
      });

      couponsData.shuffle();
      update();
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

  getCouponsByCategory(String category) {
    couponsData =
        tempcouponsData.where((element) => element.name == category).toList();

    update();
  }

  //merchant coupon list
  MerchantCouponListAPIServices merchantCouponListAPIServices =
      MerchantCouponListAPIServices();
  List<MerchantCouponData> merchantCouponData = [];

  merchantCoupon() async {
    dio.Response<dynamic> response =
        await merchantCouponListAPIServices.merchantCouponList();
    if (response.statusCode == 200) {
      MerchantCouponList merchantCouponList =
          MerchantCouponList.fromJson(response.data);
      merchantCouponData = merchantCouponList.data;
    }
    update();
  }

  RedeemedCouponsCouponApiServices redeemedCouponsCouponApiServices =
      RedeemedCouponsCouponApiServices();

  //  List<CouponsRedeemedData> redee;

  redeemgetCoupons() async {
    dio.Response<dynamic> response =
        await redeemedCouponsCouponApiServices.redeemedCouponApiServices();
    if (response.statusCode == 200) {
      RedeemedCouponsModel getCouponsList =
          RedeemedCouponsModel.fromJson(response.data);
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

  SubRedeemCouponApiServices subRedeemCouponApiServices =
      SubRedeemCouponApiServices();

  redeemCoupon(
      {required String couponcode,
      required String serviceId,
      required String amount,
      required String vendorId}) async {
    String tempAmount = "0";
    dio.Response<dynamic> response =
        await redeemCouponApiServices.redeemCouponApiServices(
            couponcode: couponcode,
            serviceId: serviceId,
            vendorId: vendorId,
            planId: int.parse(planid.value),
            requestAmount: amount);
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

  redeemSubscriptionCoupon({required String couponcode}) async {
    String tempAmount = "0";
    dio.Response<dynamic> response =
        await subRedeemCouponApiServices.subRedeemCouponApiServices(
      couponcode: couponcode,
    );
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
            debitFrom: "",
            referenceId: "",
            amount: homeController.cartListData[i].price,
            bookDateTime: homeController.cartListData[i].bookDateTime);
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

  // // String responseData = "Nothing";
  // final _isgpayuiPlugin = IsgpayuiPlugin();

  // void payFromCart(double amount) async {
  //   int tempAmount = amount.toInt();
  //   String? result;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     result = await _isgpayuiPlugin
  //             .initiateISGPayUI(getArguments(tempAmount * 100)) ??
  //         'Unknown platform version';
  //   } on PlatformException catch (e) {
  //     result = e.message;
  //   }
  //   debugPrint('Result :::--> $result');

  //   var responseData = jsonDecode(result!);
  //   var data = jsonDecode(responseData);
  //   print("<<----response-data---->>${data.runtimeType}");
  //   print(data);
  //   if (data["ResponseCode"] == "00") {
  //     final homeController = Get.find<HomeController>();
  //     print(">>-------------->>---------->>");
  //     for (int i = 0; i < homeController.cartListData.length; i++) {
  //       homeController.addBooking(
  //           serviceid: homeController.cartListData[i].serviceId.toString(),
  //           cartid: homeController.cartListData[i].id.toString(),
  //           qty: homeController.cartListData[i].quantity.toString(),
  //           offerOrCoupon: "",
  //           couponcode: "",
  //           amount: homeController.cartListData[i].price,
  //           bookDateTime: homeController.cartListData[i].bookDateTime);
  //     }

  //     Get.offAll(
  //       () => LoadingWidgets(),
  //     );

  //     // Get.find<HomeController>().addSubscription(
  //     //     planId: id,
  //     //     customerId: Get.find<ProfileController>().profileData.first.id);

  //     //need to give id
  //     Get.snackbar(
  //       "Payment Successfully Paid",
  //       "",
  //       icon: const Icon(Icons.check_circle_outline_outlined,
  //           color: Colors.white),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.green,
  //       borderRadius: 20,
  //       margin: const EdgeInsets.all(15),
  //       colorText: Colors.white,
  //       duration: const Duration(seconds: 3),
  //       isDismissible: true,
  //       dismissDirection: DismissDirection.horizontal,
  //       forwardAnimationCurve: Curves.easeOutBack,
  //     );

  //     // print(response);
  //   } else {
  //     Get.closeAllSnackbars();
  //     Get.snackbar(
  //         "The last transaction has been cancelled!", "Please try again!",
  //         colorText: Colors.white,
  //         backgroundColor: Colors.red,
  //         snackPosition: SnackPosition.BOTTOM);
  //   }
  // }

  InitiatePaymentApiServices initiatePaymentApiServices =
      InitiatePaymentApiServices();

  PaymentResponseApiServices paymentResponseApiServices =
      PaymentResponseApiServices();

  initiatePayment({required double amount}) async {
    dio.Response<dynamic> response =
        await initiatePaymentApiServices.initiatePayment(
            userId: Get.find<ProfileController>().profileData.first.id,
            totalAmount: amount.toStringAsFixed(2),
            status: "Services");

    if (response.statusCode == 200) {
      IninitiatePaymentModel ininitiatePaymentModel =
          IninitiatePaymentModel.fromJson(response.data);

      Get.to(() => PaymentWebViewServices(
            amount: amount,
            url:
                ininitiatePaymentModel.data.instrumentResponse.redirectInfo.url,
            referenceId: ininitiatePaymentModel.data.merchantTransactionId,
          ));
    }
  }

  String generateRandomString() {
    var random = Random();

    // Generate a random 5-digit string
    String randomString = random.nextInt(90000).toString();

    return randomString;
  }

  checkPhonePeStatus({
    required String refernceID,
    required double amount,
  }) async {
    dio.Response<dynamic> response = await paymentResponseApiServices
        .paymentResponseApi(merchantId: refernceID);

    if (response.data["code"] == "PAYMENT_SUCCESS") {
      final homeController = Get.find<HomeController>();
      print(">>-------------->>---------->>");
      for (int i = 0; i < homeController.cartListData.length; i++) {
        if (homeController.cartListData[i].isSelected) {
          homeController.addBooking(
              serviceid: homeController.cartListData[i].serviceId.toString(),
              cartid: homeController.cartListData[i].id.toString(),
              qty: homeController.cartListData[i].quantity.toString(),
              offerOrCoupon: "",
              couponcode: "",
              debitFrom: "wallet",
              referenceId: generateRandomString(),
              amount: homeController.cartListData[i].price,
              bookDateTime: homeController.cartListData[i].bookDateTime);
        }
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
    } else {
      print("<<<<<<<<payment is Failed>>>>>>>>");

      Get.to(() => PaymentFailedScreen());
    }
  }

  WithdrawWalletApiServices withdrawWalletApiServices =
      WithdrawWalletApiServices();

  payFromWallet({required String amount}) async {
    final homeController = Get.find<HomeController>();

    dio.Response<dynamic> respone = await withdrawWalletApiServices
        .withdrawWalletApiServices(amount: amount);

    if (respone.statusCode == 200) {
      Get.to(() => const FlightLoadingPage());
      print(">>-------------->>---------->>");
      for (int i = 0; i < homeController.cartListData.length; i++) {
        if (homeController.cartListData[i].isSelected) {
          homeController.addBooking(
              serviceid: homeController.cartListData[i].serviceId.toString(),
              cartid: homeController.cartListData[i].id.toString(),
              qty: homeController.cartListData[i].quantity.toString(),
              offerOrCoupon: "",
              couponcode: "",
              debitFrom: "wallet",
              referenceId: respone.data["data"]["transaction_id"],
              amount: homeController.cartListData[i].price,
              bookDateTime: homeController.cartListData[i].bookDateTime);
        }
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
    } else {
      Get.rawSnackbar(
          message: respone.data["error"], backgroundColor: Colors.red);
    }

    // print(response);
  }

  Map<String, String> getArguments(var amount) {
    var randomStr = DateTime.now().microsecondsSinceEpoch.toString();
    print(amount);
    Map<String, String> map = {
      "version": "1",
      "txnRefNo": "ORD$randomStr", // Should change on every request
      "amount": "$amount",
      "passCode": "KHKZ7396",
      "bankId": "000004",
      "terminalId": "10043345",
      "merchantId": "120000000043345",
      "mcc": "4722",
      "paymentType": "Pay",
      "currency": "356",
      // 'email': "manu@gmail.com",
      // 'phone': '+918157868855',
      "hashKey": "3EB5718FB544D878AFEF33F28D2ABB79",
      "aesKey": "DA4247F2A35302A10CE1933FCBDFFA48",
      "payOpt": "",
      "orderInfo": "NARUTO00001",
      "returnURL": "https://www.portal.bcipvtltd.com/api/auth/add_transaction",
      "env": "PROD", //UAT PROD
      "url": "https://isgpay.com/ISGPay-Genius/request.action",
    };
    print("order id --->: ORD$randomStr");
    print("order id --->: Payout option is dc (dc)");
    return map;
  }

  // 'email': Get.find<ProfileController>().profileData.isEmpty
  //         ? "user@gmail.com"
  //         : Get.find<ProfileController>().profileData.first.email,
  //     'phone':
  //         '+91${Get.find<ProfileController>().profileData.isEmpty ? "1234567891" : Get.find<ProfileController>().profileData.first.mobile}',

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

  // void payfoSubscription({
  //   required double amount,
  //   required int id,
  //   required String gstPercentage,
  //   required String percentageAmount,
  //   required String totalAmount,
  // }) async {
  //   int tempAmount = amount.toInt();
  //   String? result;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     result = await _isgpayuiPlugin
  //             .initiateISGPayUI(getArguments(tempAmount * 100)) ??
  //         'Unknown platform version';
  //   } on PlatformException catch (e) {
  //     result = e.message;
  //   }
  //   debugPrint('Result ::: $result');

  //   var responseData = jsonDecode(result!);
  //   var data = jsonDecode(responseData);
  //   print("<<----response-data---->>${data.runtimeType}");
  //   print(data);
  //   if (data["ResponseCode"] == "00") {
  //     final homeController = Get.find<HomeController>();

  //     Get.find<HomeController>().addSubscription(
  //         planId: id,
  //         customerId: Get.find<ProfileController>().profileData.first.id,
  //         paymentMenthod: "5",
  //         gstPercentage: gstPercentage,
  //         percentageAmount: percentageAmount,
  //         totalAmount: totalAmount,
  //         amount: amount.toStringAsFixed(2),
  //         utrNumber: "");

  //     //need to give id
  //     Get.snackbar(
  //       "Payment Successfully Paid",
  //       "",
  //       icon: const Icon(Icons.check_circle_outline_outlined,
  //           color: Colors.white),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.green,
  //       borderRadius: 20,
  //       margin: const EdgeInsets.all(15),
  //       colorText: Colors.white,
  //       duration: const Duration(seconds: 3),
  //       isDismissible: true,
  //       dismissDirection: DismissDirection.horizontal,
  //       forwardAnimationCurve: Curves.easeOutBack,
  //     );
  //   } else {
  //     Get.closeAllSnackbars();
  //     Get.snackbar(
  //         "The last transaction has been cancelled!", "Please try again!",
  //         colorText: Colors.white,
  //         backgroundColor: Colors.red,
  //         snackPosition: SnackPosition.BOTTOM);
  //   }
  // }

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
      // Get.find<AuthController>().addTransaction(amount: amount);

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

  // void payforWallet({required double amount}) async {
  //   int tempAmount = amount.toInt();
  //   String? result;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     result = await _isgpayuiPlugin
  //             .initiateISGPayUI(getArguments(tempAmount * 100)) ??
  //         'Unknown platform version';
  //   } on PlatformException catch (e) {
  //     result = e.message;
  //   }
  //   debugPrint('Result ::: $result');

  //   var responseData = jsonDecode(result!);
  //   var data = jsonDecode(responseData);
  //   print("<<----response-data---->>${data.runtimeType}");
  //   print(data);
  //   if (data["ResponseCode"] == "00") {
  //     // Get.find<AuthController>()
  //     //     .addTransaction(amount: amount.toStringAsFixed(2));

  //     Get.to(const SucessfulScreenOtc());

  //     //need to give id
  //     Get.snackbar(
  //       "Payment Successfully Paid",
  //       "",
  //       icon: const Icon(Icons.check_circle_outline_outlined,
  //           color: Colors.white),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.green,
  //       borderRadius: 20,
  //       margin: const EdgeInsets.all(15),
  //       colorText: Colors.white,
  //       duration: const Duration(seconds: 3),
  //       isDismissible: true,
  //       dismissDirection: DismissDirection.horizontal,
  //       forwardAnimationCurve: Curves.easeOutBack,
  //     );
  //   } else {
  //     Get.closeAllSnackbars();
  //     Get.snackbar(
  //         "The last transaction has been cancelled!", "Please try again!",
  //         colorText: Colors.white,
  //         backgroundColor: Colors.red,
  //         snackPosition: SnackPosition.BOTTOM);
  //   }
  // }

  initiatePaymentAddtoWallet({required double amount}) async {
    var userId = 0;
    print(Get.find<ProfileController>().profileData);
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

      Get.to(() => PaymentWebViewAddToWallet(
            amount: amount,
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

  checkPhonePeStatusAddToWallet(
      {required String refernceID,
      required double amount,
      required String userId}) async {
    dio.Response<dynamic> response = await paymentResponseApiServices
        .paymentResponseApi(merchantId: refernceID);

    if (response.data["code"] == "PAYMENT_SUCCESS") {
      print("<<<<<<<<payment is Success>>>>>>>>");
      Get.find<AuthController>()
          .addTransaction(amount: amount.toStringAsFixed(2), userId: userId);

      Get.to(const SucessfulScreenOtc());
    } else {
      print("<<<<<<<<payment is Failed>>>>>>>>");

      Get.to(() => PaymentFailedScreen());
    }
  }

  downloadBroucher() async {
    var _byteData = await rootBundle.load('assets/pdf/bci_member_brochure.pdf');

    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    Directory root = await getTemporaryDirectory();
    final file = File(root.path + '/bci_brochure.pdf');
    final buffer = _byteData.buffer;

    await file.writeAsBytes(
        buffer.asUint8List(_byteData.offsetInBytes, _byteData.lengthInBytes));
    print("  ------------------------>>>  ");
    print(file.path);

    OpenFile.open(file.path);
  }

  downloadPaymentQrCode() async {
    var _byteData = await rootBundle.load('assets/images/qr_code.jpeg');

    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    Directory root = await getTemporaryDirectory();
    final file = File(root.path + '/qr_code.jpeg');
    final buffer = _byteData.buffer;

    await file.writeAsBytes(
        buffer.asUint8List(_byteData.offsetInBytes, _byteData.lengthInBytes));
    print("------------------------>>>");
    print(file.path);

    OpenFile.open(file.path);
  }

  cancelRefundApi({
    required String userId,
    required String amount,
    required String type,
    required String bookingId,
  }) async {
    dio.Response<dynamic> response =
        await bookingCancelRefundAPIServices.bookingCancelRefundApiServices(
      userId: userId,
      amount: amount,
      type: type,
      bookingId: bookingId,
    );

    if (response.statusCode == 200) {
      if (type == "booking") {
        Get.rawSnackbar(
            message: "Booking Cancelled", backgroundColor: Colors.green);
      }

      Get.off(() => const BookingCancelled());
    }
  }

//credit api functions
  GetCreditProfileApiServices getCreditProfileApiServices =
      GetCreditProfileApiServices();

  PayCreditApiServices payCreditApiServices = PayCreditApiServices();

  UseCreditPointsApiServices useCreditPointsApiServices =
      UseCreditPointsApiServices();

  ViewCreditStatementApiServices viewCreditStatementApiServices =
      ViewCreditStatementApiServices();

  RxString creditLimit = "0.00".obs;
  RxString availableLimit = "0.00".obs;
  RxString pendingLimit = "0.00".obs;
  RxString totalPaidAmountCurrentMonth = "0.00".obs;
  RxString totalUnpaidAmountCurrentMonth = "0.00".obs;

  getCreditProfile() async {
    dio.Response<dynamic> response =
        await getCreditProfileApiServices.getCreditProfile();

    if (response.statusCode == 200) {
      CreditProfileModel creditProfileModel =
          CreditProfileModel.fromJson(response.data);

      creditLimit(creditProfileModel.creditLimit);
      availableLimit(creditProfileModel.availableLimit);
      pendingLimit(creditProfileModel.pendingLimit);
      totalPaidAmountCurrentMonth(
          creditProfileModel.totalPaidAmountCurrentMonth);
      totalUnpaidAmountCurrentMonth(
          creditProfileModel.totalUnpaidAmountCurrentMonth);
    }
  }

  useCredit({
    required String creditAmount,
    required String creditFor,
    required String creditForId,
  }) async {
    final homeController = Get.find<HomeController>();
    dio.Response<dynamic> response =
        await useCreditPointsApiServices.useCreditPointsApi(
            creditAmount: creditAmount,
            creditFor: creditFor,
            creditForId: creditForId);

    if (response.statusCode == 200) {
      Get.to(() => const FlightLoadingPage());
      print(">>-------------->>---------->>");
      for (int i = 0; i < homeController.cartListData.length; i++) {
        if (homeController.cartListData[i].isSelected) {
          homeController.addBooking(
              serviceid: homeController.cartListData[i].serviceId.toString(),
              cartid: homeController.cartListData[i].id.toString(),
              qty: homeController.cartListData[i].quantity.toString(),
              offerOrCoupon: "",
              couponcode: "",
              debitFrom: "credit",
              referenceId: response.data["data"]["refrence_id"],
              amount: homeController.cartListData[i].price,
              bookDateTime: homeController.cartListData[i].bookDateTime);
        }

        Get.offAll(
          () => LoadingWidgets(),
        );
      }
    }
  }

  payCreditBill({required String creditAmount}) async {
    dio.Response<dynamic> response = await payCreditApiServices.payCreditApi(
      creditAmount: creditAmount,
    );

    if (response.statusCode == 200) {
      getCreditStatement();
      getCreditProfile();
      Get.rawSnackbar(
          message: response.data["message"], backgroundColor: Colors.green);
    } else {
      Get.rawSnackbar(
          message: response.data["message"], backgroundColor: Colors.red);
    }
  }

  List<CreditTransaction> creditTransactionsList = [];
  getCreditStatement() async {
    dio.Response<dynamic> response =
        await viewCreditStatementApiServices.viewCreditStatement();

    if (response.statusCode == 200) {
      CreditStatementModel creditStatementModel =
          CreditStatementModel.fromJson(response.data);

      creditTransactionsList = creditStatementModel.creditTransactions;
      update();
    }
  }

  String covertAmountToInt(String amount) {
    int intValue = int.parse(amount.replaceAll(',', '').split('.')[0]);

    return intValue.toString();
  }

  initiatePaymentPayBill({required double amount}) async {
    var userId = 0;
    print(Get.find<ProfileController>().profileData);
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
            status: "Pay bill");

    if (response.statusCode == 200) {
      IninitiatePaymentModel ininitiatePaymentModel =
          IninitiatePaymentModel.fromJson(response.data);

      Get.to(() => PaymentWebViewAddToWallet(
            amount: amount,
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

  checkPhonePeStatusPayBills(
      {required String refernceID,
      required double amount,
      required String userId}) async {
    dio.Response<dynamic> response = await paymentResponseApiServices
        .paymentResponseApi(merchantId: refernceID);

    if (response.data["code"] == "PAYMENT_SUCCESS") {
      print("<<<<<<<<payment is Success>>>>>>>>");
      payCreditBill(creditAmount: amount.toStringAsFixed(2));

      Get.to(const SucessfulScreenOtc());
    } else {
      print("<<<<<<<<payment is Failed>>>>>>>>");

      Get.to(() => PaymentFailedScreen());
    }
  }




  bookServiceWithoutPayment(){
    final homeController = Get.find<HomeController>();
      Get.to(() => const FlightLoadingPage());
      print(">>-------------->>---------->>");
      for (int i = 0; i < homeController.cartListData.length; i++) {
        if (homeController.cartListData[i].isSelected) {
          homeController.addBooking(
              serviceid: homeController.cartListData[i].serviceId.toString(),
              cartid: homeController.cartListData[i].id.toString(),
              qty: homeController.cartListData[i].quantity.toString(),
              offerOrCoupon: "",
              couponcode: "",
              debitFrom: "none",
              referenceId: "",
              amount: homeController.cartListData[i].price,
              bookDateTime: homeController.cartListData[i].bookDateTime);
        }
      }

      Get.offAll(
        () => LoadingWidgets(),
      );

      // Get.find<HomeController>().addSubscription(
      //     planId: id,
      //     customerId: Get.find<ProfileController>().profileData.first.id);

      //need to give id
      Get.snackbar(
        "Service Booked Successfully",
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
  }
}
