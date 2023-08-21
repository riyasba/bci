import 'package:bci/models/hotel_booking_models/hotel_info_model.dart';
import 'package:bci/services/network/hotel_api_services/hotel_info_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../constands/app_fonts.dart';
import '../models/bus_booking_models/search_bus_model.dart';
import '../models/hotel_booking_models/search_city_list_model.dart';
import '../screens/members/hottel/Hotel_members.dart';
import '../services/network/hotel_api_services/hotel_citylist_api_service.dart';
import '../services/network/hotel_api_services/search_hotel_api_service.dart';

class HotelBookingController extends GetxController {
  RxInt child = 0.obs;
  RxInt adult = 0.obs;
  RxInt roomno = 0.obs;
  RxBool isLoading = false.obs;
  List<SearchCityListModel> getHotelCityList = [];

  //search bus
  SearchHotelListApiService searchBusListApiService =
      SearchHotelListApiService();
  // List<Bus> busData = [];
  RxString hotelSearchKey = "".obs;

  searchHotel({
    required String destination,
    required int child,
    required int adult,
    required String checkindate,
    required String checkoutdate,
   // required int childage,
    required String roomsno,
  }) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await searchBusListApiService.searchhotelListApiService(
            adult: adult,
            checkindate: checkindate,
            checkoutdate: checkoutdate,
            child: child,
            destination: destination,
         //   childage: childage,
            roomsno: roomsno);
    isLoading(false);
    if (response.statusCode == 200) {
      if (response.data["Error_Code"] == "0001") {
        Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "No hotel availbale for the given city Names.",
            style: primaryFont.copyWith(color: Colors.white),
          ),
        );
      } else {
        SearchCityListModel searchBusList =
            SearchCityListModel.fromJson(response.data);
Get.to(Hotel());
        // busData = searchBusList.buses;
        //    busSearchKey(searchBusList.searchKey);
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
        ),
      );
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
    dio.Response<dynamic> response =
        await hotelInfoApiServices.hotelInfoApiServices(
            userIp: userIp,
            resultIndex: resultIndex,
            hotelCode: hotelCode,
            searchToken: searchToken);
    if (response.statusCode == 200) {
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
  //hotel city list
  GetHotelCityListApiService getBusCityListApiService =
      GetHotelCityListApiService();

  hotelCityList({required String searchCity}) async {
    dio.Response<dynamic> response = await getBusCityListApiService
        .getHotelCityListApiService(searchCity: searchCity);

    if (response.statusCode == 200) {
      getHotelCityList = List<SearchCityListModel>.from(
          response.data.map((x) => SearchCityListModel.fromJson(x)));
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          "something went wrong ${response.statusCode}",
          style: primaryFont.copyWith(color: Colors.white),
        ),
      );
    }
    update();
  }
}
