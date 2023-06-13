import 'dart:io';

import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/models/business_user_profile.dart';
import 'package:bci/models/merchant_update_profile.dart';
import 'package:bci/models/profile_model.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/my_account_screen.dart';
import 'package:bci/services/network/profile_api_services/profile_api_services.dart';
import 'package:bci/services/network/profile_api_services/profile_pic_update_api.dart';
import 'package:bci/services/network/profile_api_services/profile_update_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class ProfileController extends GetxController {
  GetProfileApiServices getProfileApiServices = GetProfileApiServices();
  ProfileUpdateApiServices profileUpdateApiServices =
      ProfileUpdateApiServices();
  ProfilePIcUpdateApiServices profilePIcUpdateApiServices =
      ProfilePIcUpdateApiServices();
  List<BusinessUser> profileData = [];
  RxBool isLoading = false.obs;

  getProfile() async {
    profileData.clear();
    dio.Response<dynamic> response = await getProfileApiServices.getProfile();

    if (response.statusCode == 200) {
      BusinessProfileModel profileModel =
          BusinessProfileModel.fromJson(response.data);
      profileData.add(profileModel.user);
      update();
    } else if (response.statusCode == 401) {
      Get.snackbar("Session has expired", "",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
      Get.find<AuthController>().logout();
    }
  }

  updateProfile({required MerchantUpdateModel merchantUpdateModel}) async {
    isLoading(true);
    dio.Response<dynamic> response = await profileUpdateApiServices
        .profileUpdate(merchantUpdateModel: merchantUpdateModel);
    isLoading(false);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.off(() => const MyAccountScreen());
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "profile updated",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  updateProfilePic(File image) async {
    dio.Response<dynamic> response =
        await profilePIcUpdateApiServices.profilepicUpdate(image: image);

    getProfile();
  }
}
