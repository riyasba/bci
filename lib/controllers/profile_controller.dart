import 'dart:io';

import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/models/get_coupons_model.dart';
import 'package:bci/models/member_profile_model.dart';
import 'package:bci/models/member_profile_update_model.dart';
import 'package:bci/models/members_register_model.dart';
import 'package:bci/models/profile_model.dart';
import 'package:bci/services/network/profile_api_services/our_coupons_api_service.dart';
import 'package:bci/services/network/profile_api_services/profile_api_services.dart';
import 'package:bci/services/network/profile_api_services/profile_pic_update_api_services.dart';
import 'package:bci/services/network/profile_api_services/profile_update_api_services.dart';
import 'package:bci/services/network/profile_api_services/redeem_coupons_api_services.dart';
import 'package:bci/services/network/profile_api_services/update_official_address_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

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

  RxBool isLoading = false.obs;

  getProfile() async {
    profileData.clear();
    dio.Response<dynamic> response = await getProfileApiServices.getProfile();
    if (response.statusCode == 200) {
      MemberProfileModel profileModel =
          MemberProfileModel.fromJson(response.data);
      profileData.add(profileModel.user);
      update();
    } else if (response.statusCode == 401) {
      Get.find<AuthController>().logout();
    }
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
          ));
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

  //coupons list
  OurCouponsApiServices ourCouponsApiServices = OurCouponsApiServices();
  List<CouponsData> couponsData = [];

  getCoupons() async {
    dio.Response<dynamic> response = await ourCouponsApiServices.ourCouponsApiServices();
    if(response.statusCode == 200){
      GetCouponsList getCouponsList = GetCouponsList.fromJson(response.data);
      couponsData = getCouponsList.data;
    }else {
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

  redeemCoupon({required String couponcode}) async {

    dio.Response<dynamic> response = await redeemCouponApiServices.redeemCouponApiServices(couponcode: couponcode);
    if(response.statusCode == 200){
      Get.rawSnackbar(
      message: response.data["message"],
      backgroundColor: Colors.green);
    } else if(response.statusCode == 400){
      Get.rawSnackbar(
      message: response.data["error"],
      backgroundColor: Colors.red);
    } else{
      Get.rawSnackbar(
      message: response.data["error"],
      backgroundColor: Colors.red);
    }


  }

}
