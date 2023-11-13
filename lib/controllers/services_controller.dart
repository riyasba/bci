import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/create_services_model.dart';
import 'package:bci/models/get_booking_list_model.dart';
import 'package:bci/models/service_list_model.dart';
import 'package:bci/models/time_slot_models.dart';
import 'package:bci/models/vendor_offer_list_model.dart';
import 'package:bci/services/network/categorys_api_services/get_booking_api_services.dart';
import 'package:bci/services/network/categorys_api_services/get_booking_date_filter.dart';
import 'package:bci/services/network/services_api_service/add_coupons_api_services.dart';
import 'package:bci/services/network/services_api_service/add_today_offers_api_services.dart';
import 'package:bci/services/network/services_api_service/get_service_by_category.dart';
import 'package:bci/services/network/services_api_service/get_services_api_services.dart';
import 'package:bci/services/network/services_api_service/get_vendor_offer_list_api.services.dart';
import 'package:bci/services/network/services_api_service/merchant_add_services.dart';
import 'package:bci/services/network/services_api_service/merchants_update_service_api.dart';
import 'package:bci/services/network/services_api_service/upload_images_api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;

class ServicesController extends GetxController {
  AddServicesApiServices addServicesApiServices = AddServicesApiServices();
  GetServicesApiServices getServicesApiServices = GetServicesApiServices();
  UploadImagesServicesApiServices uploadImagesServicesApiServices =
      UploadImagesServicesApiServices();
  GetServicesByCategoryApiServices getServicesByCategoryApiServices =
      GetServicesByCategoryApiServices();
  UpdateServicesApiServices updateServicesApiServices =
      UpdateServicesApiServices();
  RxBool isLoading = false.obs;

  //service data list
  List<ServiceData> serviceDataList = [];

  RxInt isExpand = 999.obs;

  //time slots
  // List<String> sundayFrom = [];
  // List<String> mondayFrom = [];
  // List<String> tuesDayFrom = [];
  // List<String> wednesdayFrom = [];
  // List<String> thuesdayFrom = [];
  // List<String> fridayFrom = [];
  // List<String> saturdayFrom = [];

  // List<String> sundayTo = [];
  // List<String> mondayTo = [];
  // List<String> tuesDayTo = [];
  // List<String> wednesdayTo = [];
  // List<String> thuesdayTo = [];
  // List<String> fridayTo = [];
  // List<String> saturdayTo = [];

  List<TimeSlotModels> sunTimeSlot = [];
  List<TimeSlotModels> monTimeSlot = [];
  List<TimeSlotModels> tueTimeSlot = [];
  List<TimeSlotModels> wedTimeSlot = [];
  List<TimeSlotModels> thuTimeSlot = [];
  List<TimeSlotModels> friTimeSlot = [];
  List<TimeSlotModels> satTimeSlot = [];

  setDefaultSlots() {
    isExpand(999);
    sunTimeSlot.clear();
    monTimeSlot.clear();
    tueTimeSlot.clear();
    wedTimeSlot.clear();
    thuTimeSlot.clear();
    friTimeSlot.clear();
    satTimeSlot.clear();
    update();
  }

  addServices({required CreateServiceModel createServiceModel}) async {
    isLoading(true);
    dio.Response<dynamic> response = await addServicesApiServices.addServices(
        createServiceModel: createServiceModel);
    isLoading(false);
    if (response.statusCode == 200) {
      // dio.Response<dynamic> response2 =
      //     await uploadImagesServicesApiServices.uploadImagesServices(
      //         images: createServiceModel.image,
      //         id: response.data["data"]["id"],
      //         cid: response.data["data"]["category_id"].toString());
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
    dio.Response<dynamic> response =
        await getServicesByCategoryApiServices.getServicesByCategory(
            categoryId: categoryId,
            vendorId:
                Get.find<ProfileController>().profileData.first.id.toString());

    if (response.statusCode == 200) {
      ServiceListModel serviceListModel =
          ServiceListModel.fromJson(response.data);

      serviceDataList = serviceListModel.data
          .where((element) =>
              element.vendorId ==
              Get.find<ProfileController>().profileData.first.id.toString())
          .toList();
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
  GetBookingListApiServices getBookingListApiServices =
      GetBookingListApiServices();
  List<BookingListData> bookingListData = [];

  getBooking() async {
    dio.Response<dynamic> response =
        await getBookingListApiServices.getBookingListApiServices();
    if (response.statusCode == 200) {
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
  GetDateFilterBookingListApiServices getDateFilterBookingListApiServices =
      GetDateFilterBookingListApiServices();

  List<BookingListData> dateFilterBookingListData = [];

  dateFilterBooking({required String fromdate, required String todate}) async {
    dio.Response<dynamic> response = await getDateFilterBookingListApiServices
        .getDateFilterBookingListApiServices(
            fromdate: fromdate, todate: todate);
    if (response.statusCode == 200) {
      GetBookingList getDateFBookingList =
          GetBookingList.fromJson(response.data);
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

  //add today offers
  AddTodayOffersApiServices addTodayOffersApiServices =
      AddTodayOffersApiServices();
  AddCouponsApiServices addCouponsApiServices = AddCouponsApiServices();
  addTodayOffers({
    required String image,
    required String title,
    required String category,
    required String startsat,
    required String endsat,
    required String discountValue,
    required String claimUser,
  }) async {
    dio.Response<dynamic> response =
        await addTodayOffersApiServices.addTodayOffersApiServices(
      image: image,
      title: title,
      category: category,
      startsat: startsat,
      endsat: endsat,
      discountValue: discountValue,
      claimUser: claimUser,
    );
    if (response.statusCode == 200) {
      Get.back();
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Offer created successfully",
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

  addCoupons({
    required String image,
    required String title,
    required String category,
    required String startsat,
    required String endsat,
    required String discountValue,
    required String buyAmt,
    required String claimUser,
  }) async {
    dio.Response<dynamic> response =
        await addCouponsApiServices.addCouponsApiServices(
      image: image,
      title: title,
      category: category,
      startsat: startsat,
      endsat: endsat,
      buyAmt: buyAmt,
      discountValue: discountValue,
      merchantId: Get.find<ProfileController>().profileData.first.id.toString(),
      description: claimUser,
    );
    if (response.statusCode == 201) {
      Get.back();
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Coupon created successfully",
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

  //vendor offer list
  GetVendorOfferListApiServices getVendorOfferListApiServices =
      GetVendorOfferListApiServices();
  List<VendorOfferList> offerListData = [];

  offerList() async {
    dio.Response<dynamic> response =
        await getVendorOfferListApiServices.getVendorOfferListApiServices();
    if (response.statusCode == 200) {
      offerListData = List<VendorOfferList>.from(
          response.data.map((x) => VendorOfferList.fromJson(x)));
    }
    update();
  }
}
