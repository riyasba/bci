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
            "something went wrong ${response.statusCode}",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }
}
