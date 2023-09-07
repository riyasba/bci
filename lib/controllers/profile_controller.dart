import 'dart:io';
import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/models/bank_account_no_model.dart';
import 'package:bci/models/business_user_profile.dart';
import 'package:bci/models/merchant_update_profile.dart';
import 'package:bci/models/profile_model.dart';
import 'package:bci/screens/bussiness/views/busines_widget/bottumnavigation.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/my_account_screen.dart';
import 'package:bci/services/network/profile_api_services/profile_api_services.dart';
import 'package:bci/services/network/profile_api_services/profile_pic_update_api.dart';
import 'package:bci/services/network/profile_api_services/profile_update_api.dart';
import 'package:bci/services/network/profile_api_services/update_bank_account_api_services.dart';
import 'package:bci/services/network/wallet_api_services/withdraw_from_wallet_api_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class ProfileController extends GetxController {
  GetProfileApiServices getProfileApiServices = GetProfileApiServices();
  ProfileUpdateApiServices profileUpdateApiServices =
      ProfileUpdateApiServices();
  ProfilePIcUpdateApiServices profilePIcUpdateApiServices =
      ProfilePIcUpdateApiServices();

  WithdrawWalletApiServices withdrawWalletApiServices =
      WithdrawWalletApiServices();

  UpdateBankApiServices updateBankApiServices = UpdateBankApiServices();

  List<BusinessUser> profileData = [];
  RxBool isLoading = false.obs;

  getProfile() async {
    profileData.clear();
    dio.Response<dynamic> response = await getProfileApiServices.getProfile();

    if (response.statusCode == 200) {
      BusinessProfileModel profileModel =
          BusinessProfileModel.fromJson(response.data);
      profileData.add(profileModel.user);
      //fcmtoken
      var token = await FirebaseMessaging.instance.getToken();
      Get.find<AuthController>().fcmtoken(
        token: token.toString(),
      );
      print("<<<............firebase_token.............>>>");
      print(token);
      update();
    } else if (response.statusCode == 401) {
      Get.snackbar("Please login again", "",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
      Get.find<AuthController>().logout();
    }
  }

  updateProfile({required MerchantUpdateModel merchantUpdateModel}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await profileUpdateApiServices.profileUpdate(
      merchantUpdateModel: merchantUpdateModel,
    );
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

  withdrawAmountFromWallet({required String amount}) async {
    isLoading(true);
    dio.Response<dynamic> response = await withdrawWalletApiServices
        .withdrawWalletApiServices(amount: amount);
    isLoading(false);
    print(response.data);

    if (response.statusCode == 200) {
      Get.rawSnackbar(
        message: "Withrawal submitted successfully",
        backgroundColor: Colors.green,
      );
      Get.offAll(() => HomeBottomnavigationBar(
            index: 2,
          ));
    } else {
      Get.rawSnackbar(
        message: "Something went wrong, please try again!",
        backgroundColor: Colors.red,
      );
    }
  }

  updateBankAccount({required UpdateBankModel merchantUpdateModel}) async {
    isLoading(true);
    dio.Response<dynamic> response = await updateBankApiServices.updateBank(
      merchantUpdateModel: merchantUpdateModel,
    );
    isLoading(false);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.off(() => HomeBottomnavigationBar());
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Bank Account updated",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }
}
