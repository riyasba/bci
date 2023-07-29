import 'package:bci/constands/app_fonts.dart';
import 'package:bci/models/get_wallet_details_model.dart';
import 'package:bci/models/our_partners_model.dart';
import 'package:bci/services/network/settings_api_services/create_support_api_service.dart';
import 'package:bci/services/network/settings_api_services/generate_referralCode_api_service.dart';
import 'package:bci/services/network/settings_api_services/get_wallet_details_api_service.dart';
import 'package:bci/services/network/settings_api_services/our_partners_api_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController{

   RxInt index = 0.obs;

   RxInt actIndex = 10.obs;

   RxString referralCode = "".obs; 

   //create support api
   CreateSupportApiService createSupportApiService = CreateSupportApiService();

   createSupport({
    required String title,
    required String message,
   }) async {
      dio.Response<dynamic> response = await createSupportApiService.createSupportApiService(
        title: title, message: message);
        if(response.statusCode == 201){
          Get.back();
          Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
        } else {
          Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
        }
   }

   //generate referral code api
   GenerateReferralCodeApiService generateReferralCodeApiService = GenerateReferralCodeApiService();

   generateRefCode() async {

      dio.Response<dynamic> response = await generateReferralCodeApiService.generateReferralCodeApiService();
      if(response.statusCode == 200){
         referralCode(response.data["code"]);
      } else {
        Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
      }
     update();
   }

   //our partners api
   OurPartnersApiService ourPartnersApiService = OurPartnersApiService();
   List<OurPartnersData> ourPartnersData = [];

   ourPartner() async {
     
     dio.Response<dynamic> response = await ourPartnersApiService.ourPartnersApiService();
     if(response.statusCode == 200){
       OurPartnersList ourPartnersList = OurPartnersList.fromJson(response.data);
       ourPartnersData = ourPartnersList.data;
     } else {
       Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
     }
     update();
   }

   //get wallet details
   GetWalletDetailsApiServices getWalletDetailsApiServices = GetWalletDetailsApiServices();
   List<GetWalletDetails> getWalletData = [];

   getWalletList() async {
      getWalletData.clear();
      dio.Response<dynamic> response = await getWalletDetailsApiServices.getWalletDetailsApiServices();
      if(response.statusCode == 200){
        GetWalletDetails getWalletDetails = GetWalletDetails.fromJson(response.data);
        getWalletData.add(getWalletDetails);
      } else {
        Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
      }
      update();
   }

}