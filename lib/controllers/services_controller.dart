import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/create_services_model.dart';
import 'package:bci/models/get_booking_list_model.dart';
import 'package:bci/models/service_list_model.dart';
import 'package:bci/services/network/categorys_api_services/get_booking_api_services.dart';
import 'package:bci/services/network/categorys_api_services/get_booking_date_filter.dart';
import 'package:bci/services/network/services_api_service/get_service_by_category.dart';
import 'package:bci/services/network/services_api_service/get_services_api_services.dart';
import 'package:bci/services/network/services_api_service/merchant_add_services.dart';
import 'package:bci/services/network/services_api_service/merchants_update_service_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;

class ServicesController extends GetxController {
  AddServicesApiServices addServicesApiServices = AddServicesApiServices();
  GetServicesApiServices getServicesApiServices = GetServicesApiServices();
  GetServicesByCategoryApiServices getServicesByCategoryApiServices =
      GetServicesByCategoryApiServices();
  UpdateServicesApiServices updateServicesApiServices =
      UpdateServicesApiServices();
  RxBool isLoading = false.obs;

  //service data list
  List<ServiceData> serviceDataList = [];

  addServices({required CreateServiceModel createServiceModel}) async {
    isLoading(true);
    dio.Response<dynamic> response = await addServicesApiServices.addServices(
        createServiceModel: createServiceModel);
    isLoading(false);
    if (response.statusCode == 200) {
      getServicesByVendor();
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

  getServicesByVendor() async {
    dio.Response<dynamic> response =
        await getServicesApiServices.getServicesByVendor(
            vendorId:
                Get.find<ProfileController>().profileData.first.id.toString());

    if (response.statusCode == 200) {
      ServiceListModel serviceListModel =
          ServiceListModel.fromJson(response.data);

      serviceDataList = serviceListModel.data;
    }
    update();
  }

  getServicesByCategory({required String categoryId}) async {
    dio.Response<dynamic> response = await getServicesByCategoryApiServices
        .getServicesByCategory(categoryId: categoryId);

    if (response.statusCode == 200) {
      ServiceListModel serviceListModel =
          ServiceListModel.fromJson(response.data);

      serviceDataList = serviceListModel.data;
    }
    update();
  }

  // getServicesByDate() async {
  //   dio.Response<dynamic> response =
  //       await getServicesApiServices.getServicesByVendor();

  //   if (response.statusCode == 200) {
  //     ServiceListModel serviceListModel =
  //         ServiceListModel.fromJson(response.data);

  //     serviceDataList = serviceListModel.data;
  //   }
  //   update();
  // }

  updateServices(
      {required CreateServiceModel createServiceModel, required int id}) async {
    isLoading(true);
    dio.Response<dynamic> response = await updateServicesApiServices
        .updateServices(createServiceModel: createServiceModel, id: id);
    isLoading(false);
    if (response.statusCode == 200) {
      getServicesByVendor();
      Get.back();
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Service Updated Successfully",
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

  //get booking list api
  GetBookingListApiServices getBookingListApiServices = GetBookingListApiServices();
  List<BookingListData> bookingListData = [];

  getBooking() async {
    dio.Response<dynamic> response = await getBookingListApiServices.getBookingListApiServices();
    if(response.statusCode == 200){

      GetBookingList getBookingList = GetBookingList.fromJson(response.data);
      bookingListData = getBookingList.data;

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

  //get date filter booking list
  GetDateFilterBookingListApiServices 
  getDateFilterBookingListApiServices = GetDateFilterBookingListApiServices();

  List<BookingListData> dateFilterBookingListData = [];

  dateFilterBooking({
    required String fromdate,
    required String todate
  }) async {

    dio.Response<dynamic> response = await 
    getDateFilterBookingListApiServices.getDateFilterBookingListApiServices(
      fromdate: fromdate, todate: todate);
      if(response.statusCode == 200){

        GetBookingList getDateFBookingList = GetBookingList.fromJson(response.data);
        bookingListData = getDateFBookingList.data;

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
