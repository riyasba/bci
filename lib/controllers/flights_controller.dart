import 'dart:convert';
import 'dart:io';
import 'package:bci/models/flight_booking_models/air_port_search_model.dart';
import 'package:bci/models/flight_booking_models/air_reprint_model.dart';
import 'package:bci/models/flight_booking_models/air_search_model.dart';
import 'package:bci/models/flight_booking_models/booking_model.dart';
import 'package:bci/models/flight_booking_models/flight_search_data_model.dart';
import 'package:bci/models/flight_booking_models/get_flight_booking_history.dart';
import 'package:bci/models/flight_booking_models/passenger_model.dart';
import 'package:bci/screens/members/flight_booking_screens/flight_booking_success_page.dart';
import 'package:bci/screens/members/flight_booking_screens/flight_loading_page.dart';
import 'package:bci/screens/members/flight_booking_screens/par_nyc_screen.dart';
import 'package:bci/services/network/flight_booking_api_services/add_flight_booking_history.dart';
import 'package:bci/services/network/flight_booking_api_services/air_add_payment_api_services.dart';
import 'package:bci/services/network/flight_booking_api_services/air_printing_api_services.dart';
import 'package:bci/services/network/flight_booking_api_services/air_search_api_services.dart';
import 'package:bci/services/network/flight_booking_api_services/air_ticket_booking_api_services.dart';
import 'package:bci/services/network/flight_booking_api_services/airport_search_api_services.dart';
import 'package:bci/services/network/flight_booking_api_services/get_flight_booking_list.dart';
import 'package:bci/services/network/subscriptions_api_services/ease_buzz_payment_api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

class FlightsController extends GetxController {
  RxInt wayIndex = 0.obs;
  RxInt cabinClassIndex = 0.obs;

  RxInt adultsCount = 1.obs;
  RxInt childsCount = 0.obs;

  RxInt domesticORInternational = 0.obs;

  RxInt flightFilterIndex = 0.obs;

  DateTime depatureDate = DateTime.now();
  RxBool isDepatureDateSelected = false.obs;

  DateTime returnDate = DateTime.now();
  RxBool isreturnDateDateSelected = false.obs;

  RxBool isLoading = false.obs;
  RxBool isLoading2 = false.obs;

  RxBool isAirIndia = false.obs;
  RxBool isAirAsia = false.obs;
  RxBool isGoFirst = false.obs;
  RxBool isSpiceJet = false.obs;
  RxBool indiGo = false.obs;

  List<Flight> flightCodelist = [];

  AirSearchApiServices airSearchApiServices = AirSearchApiServices();
  AirportSearchApiServices airportSearchApiServices =
      AirportSearchApiServices();

  AirTicketBookingApiServices airTicketBookingApiServices =
      AirTicketBookingApiServices();

  AirAddPaymentApiServices airAddPaymentApiServices =
      AirAddPaymentApiServices();

  AirRePrintingServices airRePrintingServices = AirRePrintingServices();

  GetFlightBookingHistoryAPIServices getFlightBookingHistoryAPIServices =
      GetFlightBookingHistoryAPIServices();

  AddFlightBookingHistoryAPIServices addFlightBookingHistoryAPIServices =
      AddFlightBookingHistoryAPIServices();

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

  airSearch(
      {required FlightSearchDataModel flightSearchModel,
      String airlineCode = ""}) async {
    isLoading(true);
    isLoading2(true);
    flightList.clear();
    String seachKey = "";
    dio.Response<dynamic> response =
        await airSearchApiServices.airSearchApiServices(
            flightSearchModel: flightSearchModel, airlineCode: airlineCode);
    isLoading(false);
    isLoading2(false);
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
    dio.Response<dynamic> response =
        await airAddPaymentApiServices.addPaymentApiServices(
            clientReferneNo: "Testing Team", refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      airReprint(refernceNo: refernceNo);
      Get.rawSnackbar(
          message: "Payment Added Success", backgroundColor: Colors.green);
    } else {}
  }

  airReprint({required String refernceNo}) async {
    dio.Response<dynamic> response = await airRePrintingServices
        .airRePrintingApi(clientReferneNo: "", refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      AirReprintModel airReprintModel = AirReprintModel.fromJson(response.data);
      addFlightBookingHistoy(
          invoiceNumber: airReprintModel.invoiceNumber,
          remark: airReprintModel.remark,
          fromCityCode:
              airReprintModel.airPnrDetails.first.flights.first.origin,
          toCityCode:
              airReprintModel.airPnrDetails.first.flights.first.destination,
          fromCityName:
              airReprintModel.airPnrDetails.first.flights.first.origin,
          toCityName:
              airReprintModel.airPnrDetails.first.flights.first.destination,
          bookingRefNo: airReprintModel.bookingRefNo,
          airlineCode:
              airReprintModel.airPnrDetails.first.flights.first.airlineCode,
          date: airReprintModel.bookingDateTime);
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
      Get.to(() => FlightLoadingPage());

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

  //flight ticket pdf
  Future<void> downloadFlightTicketInvoice(
      AirReprintModel airReprintModel) async {
    final pdf = pw.Document();

    print("------------------------------>>starting to generate PDF");
    print(
        "------------------------------>>${airReprintModel.airPnrDetails.first.flights.first.origin}");
    print(
        "------------------------------>>${airReprintModel.airPnrDetails.first.flights.first.destination}");

    pdf.addPage(pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Column(children: [
          pw.Center(
              child: pw.Text(
            "Flight Ticket",
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
          )),
          pw.SizedBox(
            height: 10,
          ),
          pw.Divider(
            thickness: 1.2,
          ),
          pw.Text(
            "Booking Date",
            style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(
            height: 5,
          ),
          pw.Text(
            "${airReprintModel.bookingDateTime}",
            style: pw.TextStyle(
              fontSize: 11,
              color: PdfColors.grey,
            ),
          ),
          pw.SizedBox(
            height: 10,
          ),
          pw.Text(
            "Guest Name",
            style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(
            height: 5,
          ),
          pw.Text(
            "${airReprintModel.customerDetail.customerName}",
            style: pw.TextStyle(
              fontSize: 11,
              color: PdfColors.grey,
            ),
          ),
          pw.Divider(
            thickness: 1.2,
          ),
          pw.SizedBox(
            height: 10,
          ),
          pw.Text(
            "Flight Details",
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          // pw.SizedBox(
          //   height: 5,
          // ),
          // pw.Text(
          //   "Route",
          //   style: pw.TextStyle(
          //     fontSize: 12,
          //     color: PdfColors.grey,
          //   ),
          // ),
          // pw.SizedBox(
          //   height: 5,
          // ),
          // pw.Text(
          //   "${airReprintModel.airPnrDetails.first.flights.first.origin} - ${airReprintModel.airPnrDetails.first.flights.first.destination}",
          //   style: const pw.TextStyle(
          //     fontSize: 12,
          //     color: PdfColors.grey,
          //   ),
          // ),
          // pw.SizedBox(
          //   height: 5,
          // ),
          pw.Divider(
            thickness: 1.2,
          ),
          //from
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "From",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    airReprintModel.airPnrDetails.first.flights.first.origin,
                    style: pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Airline",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    "${airReprintModel.airPnrDetails.first.flights.first.airlineCode}",
                    style: pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Departure Date",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    airReprintModel
                        .airPnrDetails.first.flights.first.travelDate,
                    style: pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Arrival Date",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    "",
                    style: pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          //to
          pw.Padding(
            padding: pw.EdgeInsets.only(left: 30, right: 30, top: 10),
            child: pw.Divider(
              thickness: 1.2,
            ),
          ),
          pw.SizedBox(
            height: 10,
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "To",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    airReprintModel
                        .airPnrDetails.first.flights.first.destination,
                    style: const pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Flight Number",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    "${airReprintModel.airPnrDetails.first.flights.first.flightNumbers ?? ""}",
                    style: const pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Departure Terminal",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    airReprintModel.airPnrDetails.first.flights.first.segments
                        .first.originTerminal,
                    style: const pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Arrival Terminal",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    airReprintModel.airPnrDetails.first.flights.first.segments
                        .first.destinationTerminal,
                    style: const pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 30, right: 30, top: 10),
            child: pw.Divider(
              thickness: 1.2,
            ),
          ),
          //class
          pw.SizedBox(
            height: 10,
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Seat Class",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Container(
                    height: 20,
                    width: 80,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.blueAccent100,
                      borderRadius: pw.BorderRadius.circular(3),
                    ),
                    child: pw.Center(
                      child: pw.Text(
                        "",
                        style: const pw.TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Checkin Baggage Allowance",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Container(
                    height: 20,
                    width: 70,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.blueAccent100,
                      borderRadius: pw.BorderRadius.circular(3),
                    ),
                    child: pw.Center(
                      child: pw.Text(
                        airReprintModel.airPnrDetails.first.flights.first.fares
                            .first.fareDetails.first.freeBaggage.checkInBaggage,
                        style: const pw.TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Hand Baggage Allowance",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Container(
                    height: 20,
                    width: 70,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.blueAccent100,
                      borderRadius: pw.BorderRadius.circular(3),
                    ),
                    child: pw.Center(
                      child: pw.Text(
                        airReprintModel.airPnrDetails.first.flights.first.fares
                            .first.fareDetails.first.freeBaggage.handBaggage,
                        style: const pw.TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Seat Number",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    "",
                    style: const pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 10, bottom: 10),
            child: pw.Divider(
              thickness: 1.2,
            ),
          ),
          //fare breakdown
          pw.Text(
            "Fare  Breakdown",
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 0, top: 10),
            child: pw.Row(
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Base Fare",
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Text(
                      "Passenger Service Charge",
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Text(
                      "Airport tax",
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    // pw.Text(
                    //   "Fuel/Insurance Surcharge",
                    //   style: pw.TextStyle(
                    //       fontSize: 11, fontWeight: pw.FontWeight.bold),
                    // ),
                    // pw.SizedBox(
                    //   height: 10,
                    // ),
                    // pw.Text(
                    //   "Ticketing Service Charge",
                    //   style: pw.TextStyle(
                    //       fontSize: 11, fontWeight: pw.FontWeight.bold),
                    // ),
                  ],
                ),
                //
                pw.SizedBox(
                  height: 30,
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      ":     Rs. ${airReprintModel.airPnrDetails.first.flights.first.fares.first.fareDetails.first.basicAmount}",
                      style: pw.TextStyle(
                        fontSize: 11,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.grey,
                      ),
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Text(
                      ":     Rs. ${airReprintModel.airPnrDetails.first.flights.first.fares.first.fareDetails.first.serviceFeeAmount}",
                      style: pw.TextStyle(
                        fontSize: 11,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.grey,
                      ),
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Text(
                      ":     Rs. ${airReprintModel.airPnrDetails.first.flights.first.fares.first.fareDetails.first.airportTaxAmount}",
                      style: pw.TextStyle(
                        fontSize: 11,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.grey,
                      ),
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    // pw.Text(
                    //   ":     ₹ 30.00",
                    //   style: pw.TextStyle(
                    //     fontSize: 11,
                    //     fontWeight: pw.FontWeight.bold,
                    //     color: PdfColors.grey,
                    //   ),
                    // ),
                    // pw.SizedBox(
                    //   height: 10,
                    // ),
                    // pw.Text(
                    //   ":     ₹ 5.00",
                    //   style: pw.TextStyle(
                    //     fontSize: 11,
                    //     fontWeight: pw.FontWeight.bold,
                    //     color: PdfColors.grey,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(
                left: 0, right: 50, top: 5, bottom: 10),
            child: pw.Divider(
              thickness: 1.2,
            ),
          ),
          pw.Row(
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Total Amount",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(left: 93),
                child: pw.Column(
                  children: [
                    pw.Text(
                      ":     Rs. ${airReprintModel.airPnrDetails.first.flights.first.fares.first.fareDetails.first.totalAmount}",
                      style: pw.TextStyle(
                        fontSize: 11,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          pw.Padding(
            padding:
                pw.EdgeInsets.only(left: 0, right: 50, top: 10, bottom: 10),
            child: pw.Divider(
              thickness: 1.2,
            ),
          ),
          //last
          pw.Text(
            "Important Information",
            style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(
            height: 10,
          ),
          pw.Text(
            "The Indian rupee is the official currency in the Republic of India. The rupee is subdivided into 100 paise. The issuance of the currency is controlled by the Reserve Bank of India.",
            style: pw.TextStyle(
              fontSize: 11,
              color: PdfColors.grey,
            ),
          ),
        ]),
      ),
    ));

    var bytes = await pdf.save();
    downloadFile(bytes, airReprintModel.airPnrDetails.first.airlinePnr);
  }

  downloadFile(var bytes, String txId) async {
    await Permission.storage.request();
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.

      // Directory generalDownloadDir = Directory(
      //     '/storage/emulated/0/Download'); //! THIS WORKS for android only !!!!!!

      try {
        // var path = "/storage/emulated/0/Download";
        var dir = await getExternalStorageDirectory();

        //qr image file saved to general downloads folder
        File file = await File('${dir!.path}/$txId-air_ticket.pdf').create();

        await file.writeAsBytes(bytes);
        Get.closeAllSnackbars();
        OpenFile.open(file.path);
        Get.snackbar("Invoice Downloaded to ", "${file.path}",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP);
      } on Exception catch (e) {
        // TODO
        var dir = await getApplicationDocumentsDirectory();

        File file = await File('${dir.path}/$txId-air_ticket.pdf').create();

        await file.writeAsBytes(bytes);
        OpenFile.open(file.path);
        print(e);
      }
    } else {
      var dir = await getApplicationDocumentsDirectory();

      File file = await File('${dir.path}/$txId-air_ticket.pdf').create();

      await file.writeAsBytes(bytes);
      OpenFile.open(file.path);
    }
  }

  addFlightBookingHistoy({
    required String invoiceNumber,
    required String remark,
    required String fromCityCode,
    required String toCityCode,
    required String fromCityName,
    required String toCityName,
    required String bookingRefNo,
    required String airlineCode,
    required String date,
  }) async {
    dio.Response<dynamic> response =
        await addFlightBookingHistoryAPIServices.addFlightBookingAPIServices(
            airlineCode: airlineCode,
            bookingRefNo: bookingRefNo,
            date: date,
            fromCityCode: fromCityCode,
            fromCityName: fromCityName,
            invoiceNumber: invoiceNumber,
            remark: remark,
            toCityCode: toCityCode,
            toCityName: toCityName);

    if (response.statusCode == 201) {}
  }

  //flights booking list

  List<FlightBookedData> flightBookingHistoyrList = [];

  getFlightBookingHistory() async {
    dio.Response<dynamic> response =
        await getFlightBookingHistoryAPIServices.getFlightBookingAPIServices();

    if (response.statusCode == 200) {
      GetFlightsModel flightsModel = GetFlightsModel.fromJson(response.data);
      flightBookingHistoyrList = flightsModel.data;
      update();
    }
  }
}
