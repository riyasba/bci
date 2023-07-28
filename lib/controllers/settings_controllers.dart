import 'package:bci/constands/app_fonts.dart';
import 'package:bci/models/get_wallet_details.model.dart';
import 'package:bci/services/network/settings_api_services/create_support_api_service.dart';
import 'package:bci/services/network/settings_api_services/get_wallet_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class SettingsController extends GetxController{

   RxInt index = 0.obs;

   RxInt actIndex = 10.obs;

   //create support
   CreateSupportApiServices createSupportApiService = CreateSupportApiServices();

   createSupport({
    required String title,
    required String message,
   }) async {
      dio.Response<dynamic> response = await createSupportApiService.createSupportApiServices(
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