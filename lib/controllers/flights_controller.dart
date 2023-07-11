import 'dart:convert';

import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/models/flight_booking_models/air_port_search_model.dart';
import 'package:bci/models/flight_booking_models/air_reprint_model.dart';
import 'package:bci/models/flight_booking_models/air_search_model.dart';
import 'package:bci/models/flight_booking_models/booking_model.dart';
import 'package:bci/models/flight_booking_models/flight_search_data_model.dart';
import 'package:bci/models/flight_booking_models/passenger_model.dart';
import 'package:bci/screens/members/flight_booking_screens/flight_booking_success_page.dart';
import 'package:bci/screens/members/flight_booking_screens/par_nyc_screen.dart';
import 'package:bci/services/network/flight_booking_api_services/air_add_payment_api_services.dart';
import 'package:bci/services/network/flight_booking_api_services/air_printing_api_services.dart';
import 'package:bci/services/network/flight_booking_api_services/air_search_api_services.dart';
import 'package:bci/services/network/flight_booking_api_services/air_ticket_booking_api_services.dart';
import 'package:bci/services/network/flight_booking_api_services/airport_search_api_services.dart';
import 'package:bci/services/network/subscriptions_api_services/ease_buzz_payment_api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class FlightsController extends GetxController {
  RxInt wayIndex = 0.obs;
  RxInt cabinClassIndex = 0.obs;

  RxInt adultsCount = 1.obs;
  RxInt childsCount = 0.obs;

  RxInt domesticORInternational = 0.obs;

  DateTime depatureDate = DateTime.now();
  RxBool isDepatureDateSelected = false.obs;

  DateTime returnDate = DateTime.now();
  RxBool isreturnDateDateSelected = false.obs;

  RxBool isLoading = false.obs;

  AirSearchApiServices airSearchApiServices = AirSearchApiServices();
  AirportSearchApiServices airportSearchApiServices =
      AirportSearchApiServices();

  AirTicketBookingApiServices airTicketBookingApiServices =
      AirTicketBookingApiServices();

  AirAddPaymentApiServices airAddPaymentApiServices =
      AirAddPaymentApiServices();

  AirRePrintingServices airRePrintingServices = AirRePrintingServices();

  List<Airport> airports = [];

  RxBool airPortFound = false.obs;
  RxString origin = "Choose".obs;
  RxString originCountry = "Choose".obs;
  RxString originFullName = "Choose".obs;
  RxString destination = "Choose".obs;
  RxString destinationCountry = "Choose".obs;
  RxString destinationFullName = "Choose".obs;

  RxInt isMaleOrFemale = 2.obs;

  List<PassengerDetail> passengersDetailsList = [];

  seachAirport({required String keyWord}) async {
    dio.Response<dynamic> response = await airportSearchApiServices
        .airportSearchApiServices(keyWord: keyWord);

    if (jsonDecode(response.data)["status"] == 1) {
      print("---------on 1-----------");
      airPortFound(false);
      AirportSearchModel airportSearchModel =
          AirportSearchModel.fromJson(jsonDecode(response.data));

      airports = airportSearchModel.airports;
    } else {
      print("<<--------its here---------->>");
      airPortFound(true);
      airports.clear();
    }

    update();
  }

  //air search flight list
  List<Flight> flightList = [];

  airSearch({required FlightSearchDataModel flightSearchModel}) async {
    isLoading(true);
    flightList.clear();
    String seachKey = "";
    dio.Response<dynamic> response = await airSearchApiServices
        .airSearchApiServices(flightSearchModel: flightSearchModel);
    isLoading(false);
    if (response.data["Response_Header"]["Error_Code"] == "0000") {
      AirSearchModel airSearchModel = AirSearchModel.fromJson(response.data);
      flightList = airSearchModel.tripDetails.first.flights;
      seachKey = airSearchModel.searchKey;
    }

    Get.to(ParNycSCreen(
      flightSearchDataModel: flightSearchModel,
      searchKey: seachKey,
    ));

    update();
  }

  increaseAdultCount() {
    adultsCount(adultsCount.value + 1);
    update();
  }

  decreaseAdultCount() {
    if (adultsCount.value == 1) {
    } else {
      adultsCount(adultsCount.value - 1);
      update();
    }
  }

  increaseChildCount() {
    childsCount(childsCount.value + 1);
    update();
  }

  decreaseChildCount() {
    if (childsCount.value == 0) {
    } else {
      childsCount(childsCount.value - 1);
      update();
    }
  }

  bookAirTicket({required BookingModel bookingModel}) async {
    dio.Response<dynamic> response = await airTicketBookingApiServices
        .airTicketBookingApiServices(bookingModel: bookingModel);

    if (response.statusCode == 200) {
      airAddPayment(refernceNo: response.data["Booking_RefNo"]);
    }
  }

  airAddPayment({required String refernceNo}) async {
    dio.Response<dynamic> response = await airAddPaymentApiServices
        .addPaymentApiServices(clientReferneNo: "", refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      airReprint(refernceNo: refernceNo);
      Get.rawSnackbar(
          message: "Payment Added Success", backgroundColor: Colors.red);
    } else {}
  }

  airReprint({required String refernceNo}) async {
    dio.Response<dynamic> response = await airRePrintingServices
        .airRePrintingApi(clientReferneNo: "", refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      AirReprintModel airReprintModel = AirReprintModel.fromJson(response.data);

      Get.off(() => FlightBookingSuccessPage(
            airReprintModel: airReprintModel,
            refNo: refernceNo,
          ));
    } else {}
  }

  static MethodChannel _channel = MethodChannel('easebuzz');
  EaseBuzzTokenApiService easeBuzzApi = EaseBuzzTokenApiService();

  payUseingEaseBuzzSubs(
      {required int id,
      required String amount,
      required String customerName,
      required String email,
      required String phone,
      required BookingModel bookingModel}) async {
    var response = await easeBuzzApi.getPaymentToken(
        amount: amount,
        customerName: customerName,
        email: email,
        id: "07889${DateTime.now().microsecond}${DateTime.now().second}",
        phone: phone);

    String access_key = response["data"];
    String pay_mode = "test";

    print("access_key >>$access_key");
    Object parameters = {"access_key": access_key, "pay_mode": pay_mode};
    // isPayLoading(false);
    isLoading(false);
    final payment_response =
        await _channel.invokeMethod("payWithEasebuzz", parameters);
    print(payment_response);
    isLoading(false);
    if (payment_response["result"] == "payment_successfull") {
      //need to give id

      bookAirTicket(bookingModel: bookingModel);
    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
          "The last transaction has been cancelled!", "Please try again!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
