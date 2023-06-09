import 'package:bci/authentications/langing_screen/landing_screen.dart';
import 'package:bci/authentications/otp_verification/otp_verification.dart';
import 'package:bci/authentications/verified_screen/verified_screen.dart';
import 'package:bci/constands/app_fonts.dart';
import 'package:bci/models/category_model.dart';
import 'package:bci/models/members_register_model.dart';
import 'package:bci/models/merchants_register_model.dart';
import 'package:bci/models/sub_category_model.dart';
import 'package:bci/screens/bussiness/views/generations/otp_verification_screen.dart';
import 'package:bci/screens/bussiness/views/generations/verified_screen.dart';
import 'package:bci/services/network/auth_api_services/get_otp_api_services.dart';
import 'package:bci/services/network/auth_api_services/login_api_services.dart';
import 'package:bci/services/network/auth_api_services/merchant_api_services.dart';
import 'package:bci/services/network/categorys_api_services/get_category_services.dart';
import 'package:bci/services/network/categorys_api_services/sub_category_api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../services/network/auth_api_services/customer_api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
//apis method call
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

//api callings
  registerMerchants(
      {required MerchantRegisterModel merchantRegisterModel}) async {
    isLoading(true);
    dio.Response<dynamic> response = await merchantRegisterApiServices
        .merchantRegister(merchantRegisterModel: merchantRegisterModel);
    isLoading(false);
    if (response.statusCode == 201) {
      Get.to(BusinessOtpvarification(
        phoneNumber: merchantRegisterModel.mobile,
        otp: response.data["user"]["otp"].toString(),
      ));
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["errors"].first,
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  registerMember({
    required MemberRegisterModel memberRegisterModel,
    required AddressModel residentialAddress,
    required AddressModel officialAddress,
  }) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await memberRegisterApiServices.memberRegister(
            memberRegisterModel: memberRegisterModel,
            officialAddress: officialAddress,
            residentialAddress: residentialAddress);
    isLoading(false);
    if (response.statusCode == 201) {
      Get.to(OtpVerificationView(
        phoneNumber: memberRegisterModel.mobile,
        otp: response.data["user"]["otp"].toString(),
      ));
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["errors"].first,
            style: primaryFont.copyWith(color: Colors.white),
          ));
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
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "User not found",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  getOtpFunctionBusiness({required String mobileNumber}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await getOTPApiServices.getOtpApi(mobileNumber: mobileNumber);
    isLoading(false);

    if (response.statusCode == 200) {
      Get.to(BusinessOtpvarification(
        phoneNumber: mobileNumber,
        otp: response.data["otp"].toString(),
      ));
    } else if (response.statusCode == 404) {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "User not found",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  loginUsers({required String mobile, required String otp}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await loginApiServices.loginApi(mobile: mobile, otp: otp);
    isLoading(false);
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", response.data["token"]);

      if (response.data["user"]["role_id"] == "3") {
        Get.offAll(const verified_Screen());
      } else {
        Get.rawSnackbar(
            backgroundColor: Colors.red,
            messageText: Text(
              "Login As Business",
              style: primaryFont.copyWith(color: Colors.white),
            ));
      }
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Invalid OTP",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  loginUsersbusiness({required String mobile, required String otp}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await loginApiServices.loginApi(mobile: mobile, otp: otp);
    isLoading(false);
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", response.data["token"]);
      if (response.data["user"]["role_id"] == "5") {
        Get.offAll(const BusinessverifiedScreen());
      } else {
        Get.rawSnackbar(
            backgroundColor: Colors.red,
            messageText: Text(
              "Login As Member",
              style: primaryFont.copyWith(color: Colors.white),
            ));
      }
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Invalid OTP",
            style: primaryFont.copyWith(color: Colors.white),
          ));
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
    Get.to(landing_screen());
  }
}
