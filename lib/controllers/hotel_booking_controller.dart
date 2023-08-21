import 'package:bci/models/hotel_booking_models/hotel_info_model.dart';
import 'package:bci/services/network/hotel_api_services/hotel_info_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../constands/app_fonts.dart';
import '../models/bus_booking_models/search_bus_model.dart';
import '../services/network/hotel_api_services/search_bus_api_service.dart';

class HotelBookingController extends GetxController {
  RxInt child = 0.obs;
  RxInt adult = 0.obs;
  RxInt infant = 0.obs;
  RxBool isLoading = false.obs;

  //search bus
  SearchHotelListApiService searchBusListApiService =
      SearchHotelListApiService();
  List<Bus> busData = [];
  RxString busSearchKey = "".obs;

  searchHotel(
      {required int child,
        required int adult,
      required String checkindate,
      required String checkoutdate,}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await searchBusListApiService.searchhotelListApiService(
            adult: adult, checkindate: checkindate, checkoutdate: checkoutdate, child: child);
    isLoading(false);
    if (response.statusCode == 200) {
      if (response.data["Error_Code"] == "0001") {
        Get.rawSnackbar(
            backgroundColor: Colors.red,
            messageText: Text(
              "No hotel availbale for the given city Names.",
              style: primaryFont.copyWith(color: Colors.white),
            ));
      } else {
        SearchBusList searchBusList = SearchBusList.fromJson(response.data);
        busData = searchBusList.buses;
        busSearchKey(searchBusList.searchKey);
        // Get.to(BusDetailsScreen(
        //   fromCityName: fromCity.value,
        //   toCityName: toCity.value,
        //   tdate: date.value,
        //   searchKey: searchBusList.searchKey,
        // )
        // );
      }
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  //hotel info
  HotelInfoApiServices hotelInfoApiServices = HotelInfoApiServices();
  List<HotelInfoData> hotelInfoData = [];

  hotelInfo({
    required String userIp,
    required String resultIndex,
    required String hotelCode,
    required String searchToken,
   }) async { 
     
     dio.Response<dynamic> response = await hotelInfoApiServices.hotelInfoApiServices(
      userIp: userIp, resultIndex: resultIndex, hotelCode: hotelCode, searchToken: searchToken);
      if(response.statusCode == 200){
        HotelInfoModel hotelInfoModel = HotelInfoModel.fromJson(response.data);
        hotelInfoData.add(hotelInfoModel.result);
      } else {
        Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
      }
      update();
  }

  //get hotel room

}
