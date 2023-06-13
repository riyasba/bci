import 'package:bci/constands/app_fonts.dart';
import 'package:bci/models/create_services_model.dart';
import 'package:bci/services/network/services_api_service/merchant_add_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;

class ServicesController extends GetxController {
  AddServicesApiServices addServicesApiServices = AddServicesApiServices();
  RxBool isLoading = false.obs;

  addServices({required CreateServiceModel createServiceModel}) async {
    isLoading(true);
    dio.Response<dynamic> response = await addServicesApiServices.addServices(
        createServiceModel: createServiceModel);
    isLoading(false);
    if (response.statusCode == 201) {
      Get.back();
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Service Created Successfully",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    } else if (response.statusCode == 500) {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong, Please check all the fields",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    } else {}
  }
}
