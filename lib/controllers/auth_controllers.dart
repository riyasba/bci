import 'package:bci/authentications/generate_otp/member_login_screen.dart';
import 'package:bci/authentications/otp_verification/otp_verification.dart';
import 'package:bci/authentications/verified_screen/verified_screen.dart';
import 'package:bci/constands/app_fonts.dart';
import 'package:bci/models/category_model.dart';
import 'package:bci/models/members_register_model.dart';
import 'package:bci/models/merchants_register_model.dart';
import 'package:bci/models/notification_list_model.dart';
import 'package:bci/models/refferal_name_model.dart';
import 'package:bci/models/sub_category_model.dart';
import 'package:bci/models/transaction_history_model.dart';
import 'package:bci/screens/members/sign_up_view/member_sign_up_screen.dart';
import 'package:bci/services/network/auth_api_services/add_transaction_api_service.dart';
import 'package:bci/services/network/auth_api_services/fcm_token_store_api_service.dart';
import 'package:bci/services/network/auth_api_services/get_otp_api_services.dart';
import 'package:bci/services/network/auth_api_services/get_refferal_names.dart';
import 'package:bci/services/network/auth_api_services/login_api_services.dart';
import 'package:bci/services/network/auth_api_services/merchant_api_services.dart';
import 'package:bci/services/network/auth_api_services/notification_list_api_service.dart';
import 'package:bci/services/network/auth_api_services/referral_register_api_services.dart';
import 'package:bci/services/network/auth_api_services/transaction_history_api_service.dart';
import 'package:bci/services/network/categorys_api_services/get_category_services.dart';
import 'package:bci/services/network/categorys_api_services/sub_category_api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../models/offerslist_model.dart';
import '../services/network/auth_api_services/member_register_api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/network/categorys_api_services/filter_category_api_service.dart';

class AuthController extends GetxController {
//apis method call
  RxInt filterindex = 90909.obs;
  RxInt logoutindex = 0.obs;
  RxBool logoutbool = false.obs;
  MerchantRegisterApiServices merchantRegisterApiServices =
      MerchantRegisterApiServices();

  MemberRegisterApiServices memberRegisterApiServices =
      MemberRegisterApiServices();

  GetOTPApiServices getOTPApiServices = GetOTPApiServices();

  LoginApiServices loginApiServices = LoginApiServices();

  GetCategoryApiServices getCategoryApiServices = GetCategoryApiServices();

  GetSubCategoryApiServices getSubCategoryApiServices =
      GetSubCategoryApiServices();

  List<CategoryList> categoryList = [];
  List<SubCategoryModelList> subCategoryList = [];

  RxBool isGstAvailable = true.obs;
  RxBool isLoading = false.obs;
  RxBool isOTPLoading = false.obs;

//api callings

  registerMember(
      {required MemberRegisterModel memberRegisterModel,
      required String referralCode}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await memberRegisterApiServices.memberRegister(
      memberRegisterModel: memberRegisterModel,
      //officialAddress: officialAddress,
      //residentialAddress: residentialAddress
    );
    isLoading(false);
    if (response.statusCode == 201) {
      print("User id ------>>${response.data["user"]["id"]}");
      memReferralRegister(
          referralCode: referralCode,
          userId: response.data["user"]["id"].toString());
      Get.to(OtpVerificationView(
        phoneNumber: memberRegisterModel.mobile,
        otp: response.data["user"]["otp"].toString(),
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

  //referral register
  ReferralRegisterApiServices referralRegisterApiServices =
      ReferralRegisterApiServices();

  memReferralRegister(
      {required String referralCode, required String userId}) async {
    dio.Response<dynamic> response = await referralRegisterApiServices
        .referralRegister(referralCode: referralCode, userId: userId);
    if (response.data["success"] == true) {
    } else {
      // Get.rawSnackbar(
      //   backgroundColor: Colors.red,
      //   messageText: Text(
      //     response.data["message"],
      //     style: primaryFont.copyWith(color: Colors.white),
      //   ));
    }
  }

  getOtpFunction({required String mobileNumber}) async {
    isLoading(true);

    dio.Response<dynamic> response =
        await getOTPApiServices.getOtpApi(mobileNumber: mobileNumber);
    isLoading(false);

    if (response.statusCode == 200) {
      Get.to(OtpVerificationView(
        phoneNumber: mobileNumber,
        otp: response.data["otp"].toString(),
      ));
    } else if (response.statusCode == 404) {
      Get.to(() => MemberSignUpScreen(
            phoneNumber: mobileNumber,
          ));
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       response.data["message"],
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  Future<String> rendOtpFunction({required String mobileNumber}) async {
    String otpCode = "null";
    isOTPLoading(true);

    dio.Response<dynamic> response =
        await getOTPApiServices.getOtpApi(mobileNumber: mobileNumber);
    isOTPLoading(false);

    if (response.statusCode == 200) {
      otpCode = response.data["otp"].toString();
    }
    return otpCode;
  }

  loginUsers({required String mobile, required String otp}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await loginApiServices.loginApi(mobile: mobile, otp: otp);
    isLoading(false);

    // print("start testing...................>>>>>>>>>>>>>>");
    // print(response.data);
    // print(response.statusCode);
    // print(response.statusMessage);
    // print(response.data["user"]["role_id"]);
    // print(response.data["user"]["id"]);
    // print("end testing...................>>>>>>>>>>>>>>");

    if (response.statusCode == 200) {
      if (response.data["user"]["role_id"].toString() == "3") {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("auth_token", response.data["token"]);
        await prefs.setString("id", response.data["user"]["id"].toString());
        Get.offAll(const MemberVerifiedScreen());
      } else {
        Get.rawSnackbar(
            backgroundColor: Colors.red,
            messageText: Text(
              response.data["message"],
              style: primaryFont.copyWith(color: Colors.white),
            ));
      }
    } else if (response.statusCode == 422) {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    } else if (response.statusCode == 401) {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    } else {
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       "something went wrong",
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    }
  }

  getCategoryList() async {
    dio.Response<dynamic> response = await getCategoryApiServices.getCategory();

    if (response.statusCode == 201) {
      CategoryModel categoryModel = CategoryModel.fromJson(response.data);
      categoryList = categoryModel.data;
    }
    update();
  }

  //offers filter
  FilterCategoryApiService filtercategoryapiservice =
      FilterCategoryApiService();

  List<OffersListModel> offerslistdata = [];

  getoffersfilterCategory({required String categoryid}) async {
    dio.Response<dynamic> response =
        await filtercategoryapiservice.filtercategory(categoryId: categoryid);
    if (response.statusCode == 200) {
      List<OffersListModel> offerslistModel = List<OffersListModel>.from(
          response.data.map((x) => OffersListModel.fromJson(x)));
      // offersListModelFromJson();
      offerslistdata = offerslistModel;
      update();
      Get.back();
    } else {
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       " Offers not available today",
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    }
    update();
  }

  getSubCategoryList() async {
    dio.Response<dynamic> response =
        await getSubCategoryApiServices.getSubCategory();

    if (response.statusCode == 201) {
      SubCategoryModel subCategoryModel =
          SubCategoryModel.fromJson(response.data);
      subCategoryList = subCategoryModel.data;
    }
    update();
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("auth_token", "null");

    Get.offAll(const MemberLoginScreen());
  }

  //fcm token store api
  FcmTokenStoreApiService fcmTokenStoreApiService = FcmTokenStoreApiService();

  fcmtoken({required String token}) async {
    dio.Response<dynamic> response =
        await fcmTokenStoreApiService.fcmTokenStoreApiService(
      token: token,
    );
    if (response.statusCode == 200) {
    } else {
      // Get.snackbar("Something went wrong", response.statusCode.toString(),
      //     colorText: Colors.white,
      //     backgroundColor: Colors.red,
      //     snackPosition: SnackPosition.BOTTOM);
    }
  }

  //add transaction
  AddTransactionApiServices addTransactionApiServices =
      AddTransactionApiServices();

  addTransaction({
    required String amount,
    required String userId,
  }) async {
    dio.Response<dynamic> response = await addTransactionApiServices
        .addTransactionApi(amount: amount, userId: userId);
    if (response.statusCode == 200) {
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  //transaction history
  TransactionHistoryApiServices transactionHistoryApiServices =
      TransactionHistoryApiServices();
  List<TransactionHistory> transactionHistorydata = [];

  transactionHistoryDetails() async {
    dio.Response<dynamic> response =
        await transactionHistoryApiServices.transactionHistoryApi();
    if (response.statusCode == 200) {
      TransactionHistoryModel transactionHistoryModel =
          TransactionHistoryModel.fromJson(response.data);
      transactionHistorydata =
          transactionHistoryModel.transactionHistory.reversed.toList();
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

  //notification list
  NotificationListApiService notificationListApiService =
      NotificationListApiService();
  List<NotificationData> notificationData = [];

  notification() async {
    dio.Response<dynamic> response =
        await notificationListApiService.notificationListApiService();
    if (response.statusCode == 200) {
      NotificationListModel notificationListModel =
          NotificationListModel.fromJson(response.data);
      notificationData = notificationListModel.data;
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

  RefferalNameAPIServices refferalNameAPIServices = RefferalNameAPIServices();

  RxString refferalName = "".obs;

  getRefferalName(String refferalId) async {
    refferalName("");
    dio.Response<dynamic> response = await refferalNameAPIServices
        .refferalNameApiServices(reffrealId: refferalId.trim());

    if (response.statusCode == 200) {
      RefferalDataModel refferalDataModel =
          RefferalDataModel.fromJson(response.data);

      refferalName(refferalDataModel.departments.name);
    }
  }
}
