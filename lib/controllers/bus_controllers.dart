import 'dart:convert';

import 'package:bci/constands/app_fonts.dart';
import 'package:bci/models/bus_booking_models/bus_cityList_model.dart';
import 'package:bci/models/bus_booking_models/bus_seat_map_model.dart';
import 'package:bci/models/bus_booking_models/search_bus_model.dart';
import 'package:bci/services/network/bus_api_services/bus_cityList_api_service.dart';
import 'package:bci/services/network/bus_api_services/bus_seatMap_api_service.dart';
import 'package:bci/services/network/bus_api_services/search_bus_api_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusController extends GetxController{

  RxString fromCity = "Enter Boarding".obs;
  RxString toCity = "Enter Designation".obs;
  RxInt fromcityId = 0.obs;
  RxInt tocityId = 0.obs;
  RxString date = "Select Date".obs;
  RxString day = "".obs;
  RxInt bookSeat = 0.obs;
  var travelDatess = DateTime.now();

  //bus city list
  GetBusCityListApiService getBusCityListApiService = GetBusCityListApiService();
  List<GetBusCityList> getBusCityList = []; 

  busCityList({required String searchCity}) async {
     
     dio.Response<dynamic> response = await getBusCityListApiService.getBusCityListApiService(
      searchCity: searchCity
     );
     if(response.statusCode == 200){
      getBusCityList =  List<GetBusCityList>.from(response.data.map((x) => GetBusCityList.fromJson(x)));

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

  //search bus
  SearchBusListApiService searchBusListApiService = SearchBusListApiService();
  List<Bus> busData = [];

  searchBus({
    required String fromCityId,
    required String toCityId,
    required String travelDate
  }) async {

    dio.Response<dynamic> response = await searchBusListApiService.searchBusListApiService(
      fromCityId: fromCityId, toCityId: toCityId, travelDate: travelDate);
      if(response.statusCode == 200){

        SearchBusList searchBusList = SearchBusList.fromJson(response.data);
        busData = searchBusList.buses;

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

  //bus seat map
  BusSeatMapApiService busSeatMapApiService = BusSeatMapApiService();
  List<SeatMap> seatMap = [];

  busSeat({
    required String boardingId,
    required String droppingId,
    required String busKey
  }) async {
     dio.Response<dynamic> response = await busSeatMapApiService.busSeatMapApiService(
      boardingId: boardingId, droppingId: droppingId, busKey: busKey);
      if(response.statusCode == 200){

        BusSeatMapList busSeatMapList = BusSeatMapList.fromJson(response.data);
        seatMap = busSeatMapList.seatMap;

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