import 'package:bci/models/hotel_booking_models/hotel_info_model.dart';
import 'package:bci/models/hotel_booking_models/search_hotel_list_model.dart';
import 'package:bci/services/network/hotel_api_services/hotel_info_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import '../constands/app_fonts.dart';
import '../models/hotel_booking_models/block_room_api_model.dart';
import '../models/hotel_booking_models/get_hotel_room_model.dart';
import '../models/hotel_booking_models/search_city_list_model.dart';
import '../screens/members/hottel/Hotel_members.dart';
import '../services/network/hotel_api_services/block_room_api_service.dart';
import '../services/network/hotel_api_services/get_hotel_room_api_service.dart';
import '../services/network/hotel_api_services/hotel_booking_api_service.dart';
import '../services/network/hotel_api_services/hotel_citylist_api_service.dart';
import '../services/network/hotel_api_services/search_hotel_api_service.dart';
import 'package:bci/models/hotel_booking_models/get_hotel_room_model.dart'
    as ht;

class HotelBookingController extends GetxController {
  RxInt child = 0.obs;
  RxInt adult = 0.obs;
  RxInt roomno = 0.obs;
  RxBool isLoading = false.obs;
  List<SearchCityListModel> getHotelCityList = [];

  //search hotel
  SearchHotelListApiService searchBusListApiService =
      SearchHotelListApiService();

  RxString hotelSearchKey = "".obs;
  List<SearchHotelData> searchHotelData = [];

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
    if (response.data["Error"]["ErrorCode"] == 0) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("searchtoken", response.data["Search_Token"]);
      SearchHotelModel searchHotelModel =
          SearchHotelModel.fromJson(response.data);
      searchHotelData = searchHotelModel.result;
      Get.to(HotelListScreen());

      // if (response.data["Error_Code"] == "0001") {
      //   Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       "No hotel availbale for the given city Names.",
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ),
      //   );
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
    hotelInfoData.clear();
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

  GetHotelRoomApiServices hotelroomsApiServices = GetHotelRoomApiServices();
  List<HotelRoomData> hotelRoomsData = [];

  getHotelRoomApiServices({
    required String userIp,
    required String resultIndex,
    required String hotelCode,
    required String searchToken,
  }) async {
    hotelRoomsData.clear();
    dio.Response<dynamic> response =
        await hotelroomsApiServices.getHotelRoomApiServices(
            userIp: userIp,
            resultIndex: resultIndex,
            hotelCode: hotelCode,
            searchToken: searchToken);
    if (response.statusCode == 200) {
      GetHotelRoomModel hotelRoomsModel =
          GetHotelRoomModel.fromJson(response.data);
      hotelRoomsData.add(hotelRoomsModel.result);
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

  //block room

  BlockRoomApiService blockroomapiservice = BlockRoomApiService();
  List<Result> blockroomdata = [];

  blockroomapi(
      {required String userIp,
      required String resultIndex,
      required String hotelCode,
      required String hotelName,
      required String searchToken,
      required ht.HotelRoomsDetail hotelRoomsDetail}) async {
    hotelRoomsData.clear();
    dio.Response<dynamic> response =
        await blockroomapiservice.blockRoomApiService(
            hotelCode: hotelCode,
            hotelName: hotelName,
            hotelRoomsDetail: hotelRoomsDetail,
            resultIndex: resultIndex,
            searchToken: searchToken,
            userIp: userIp);
    if (response.statusCode == 200) {
      // BlockRoomApiModel blockroommodel =
      //     BlockRoomApiModel.fromJson(response.data);
      // blockroomdata.add(blockroommodel.result);
      hotelbookingapi(
        hotelCode: hotelCode,
        hotelName: hotelName,
        hotelRoomsDetail: hotelRoomsDetail,
        resultIndex: resultIndex,
        searchToken: searchToken,
        userIp: userIp,
      );
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

  //hotel booking

  HotelBookingApiServices hotelbookingapiservice = HotelBookingApiServices();

  hotelbookingapi(
      {required String userIp,
      required String resultIndex,
      required String hotelCode,
      required String hotelName,
      required String searchToken,
      required ht.HotelRoomsDetail hotelRoomsDetail}) async {
    hotelRoomsData.clear();
    dio.Response<dynamic> response =
        await hotelbookingapiservice.hotelBookingApiServices(
            hotelCode: hotelCode,
            hotelName: hotelName,
            hotelRoomsDetail: hotelRoomsDetail,
            resultIndex: resultIndex,
            searchToken: searchToken,
            userIp: userIp);
    if (response.statusCode == 200) {
      print('hotel book sucessfully');
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
}
