import 'dart:convert';
import 'dart:io';
import 'package:bci/constands/app_fonts.dart';
import 'package:bci/models/bus_booking_models/bus_booking_history_model.dart';
import 'package:bci/models/bus_booking_models/bus_cityList_model.dart';
import 'package:bci/models/bus_booking_models/bus_requery_model.dart';
import 'package:bci/models/bus_booking_models/bus_seat_map_model.dart';
import 'package:bci/models/bus_booking_models/pax_list_model.dart';
import 'package:bci/models/bus_booking_models/search_bus_model.dart';

import 'package:bci/screens/members/bus/bus_booking_success.dart';
import 'package:bci/screens/members/bus/bus_details.dart';

import 'package:bci/screens/members/flight_booking_screens/flight_loading_page.dart';
import 'package:bci/services/network/bus_api_services/add_bus_booking_history.dart';
import 'package:bci/services/network/bus_api_services/bus_booking_add_payment_api_services.dart';
import 'package:bci/services/network/bus_api_services/bus_cityList_api_service.dart';
import 'package:bci/services/network/bus_api_services/bus_requiry_api_services.dart';
import 'package:bci/services/network/bus_api_services/bus_seatMap_api_service.dart';
import 'package:bci/services/network/bus_api_services/bus_temp_booking.dart';
import 'package:bci/services/network/bus_api_services/bus_ticketing_api_services.dart';
import 'package:bci/services/network/bus_api_services/get_bus_booking_history_api_services.dart';
import 'package:bci/services/network/bus_api_services/search_bus_api_service.dart';
import 'package:bci/services/network/subscriptions_api_services/ease_buzz_payment_api_services.dart';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:isgpayui_plugin/isgpayui_plugin.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class BusController extends GetxController {
  RxString fromCity = "Enter Boarding".obs;
  RxString toCity = "Enter Designation".obs;
  RxInt fromcityId = 0.obs;
  RxInt tocityId = 0.obs;
  RxString date = "Select Date".obs;
  RxString day = "".obs;
  RxInt bookSeat = 0.obs;
  var travelDatess = DateTime.now();
  BusTempTicketBookingApiService busTempTicketBookingApiService =
      BusTempTicketBookingApiService();

  BusRequieyApiServices busRequieyApiServices = BusRequieyApiServices();

  BusAddPaymentApiServices busAddPaymentApiServices =
      BusAddPaymentApiServices();

  BusTicketingApiServices busTicketingApiServices = BusTicketingApiServices();

  AddBusBookingHistoryAPIServices addBusBookingHistoryAPIServices =
      AddBusBookingHistoryAPIServices();

  GetBusBookingHistoyApiServices getBusBookingHistoyApiServices =
      GetBusBookingHistoyApiServices();

  RxBool isLoading = false.obs;

  //bus city list
  GetBusCityListApiService getBusCityListApiService =
      GetBusCityListApiService();
  List<GetBusCityList> getBusCityList = [];

  busCityList({required String searchCity}) async {
    dio.Response<dynamic> response = await getBusCityListApiService
        .getBusCityListApiService(searchCity: searchCity);
    if (response.statusCode == 200) {
      getBusCityList = List<GetBusCityList>.from(
          response.data.map((x) => GetBusCityList.fromJson(x)));
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
  RxString busSearchKey = "".obs;

  searchBus(
      {required String fromCityId,
      required String toCityId,
      required String travelDate}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await searchBusListApiService.searchBusListApiService(
            fromCityId: fromCityId, toCityId: toCityId, travelDate: travelDate);
    isLoading(false);
    if (response.statusCode == 200) {
      if (response.data["Response_Header"]["Error_Code"] == "0001") {
        Get.rawSnackbar(
            backgroundColor: Colors.red,
            messageText: Text(
              "No bus availbale for the given city Names.",
              style: primaryFont.copyWith(color: Colors.white),
            ));
      } else {
        SearchBusList searchBusList = SearchBusList.fromJson(response.data);
        busData = searchBusList.buses;
        busSearchKey(searchBusList.searchKey);
        Get.to(BusDetailsScreen(
          fromCityName: fromCity.value,
          toCityName: toCity.value,
          tdate: date.value,
          searchKey: searchBusList.searchKey,
        ));
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

  //bus seat map
  BusSeatMapApiService busSeatMapApiService = BusSeatMapApiService();
  List<SeatMap> seatMap = [];
  List<List<SeatMap>> seatMapList = [];

  RxDouble totalAmount = 0.0.obs;

  RxString seatMapKey = "".obs;

  busSeat(
      {required String boardingId,
      required String droppingId,
      required String searchKey,
      required Bus busData}) async {
    seatMapList.clear();
    dio.Response<dynamic> response =
        await busSeatMapApiService.busSeatMapApiService(
            boardingId: boardingId,
            droppingId: droppingId,
            busData: busData,
            searcKey: searchKey);
    if (response.statusCode == 200) {
      BusSeatMapList busSeatMapList = BusSeatMapList.fromJson(response.data);
      seatMap = busSeatMapList.seatMap;
      generateBusSeats(seatMap);
      seatMapKey(busSeatMapList.seatMapKey);
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

  generateBusSeats(List<SeatMap> seatMap) {
    List<int> rowList = [];

    for (int k = 0; k < seatMap.length; k++) {
      rowList.add(int.parse(seatMap[k].row));
    }

    List<int> uniqueList = rowList.toSet().toList();

    // Sort the unique list
    uniqueList.sort();

    for (int i = 0; i < uniqueList.length; i++) {
      int rowNumber = uniqueList[i];

      List<SeatMap> tempList = [];

      for (int j = 0; j < seatMap.length; j++) {
        int tempRowNum = int.parse(seatMap[j].row.toString());

        print(rowNumber == tempRowNum);

        if (rowNumber == tempRowNum) {
          tempList.add(seatMap[j]);
        }
      }
      print(tempList.length);
      seatMapList.add(tempList);
    }
    update();
  }

  tempBookBusTicket(
      {required String boardingId,
      required String droppingId,
      required Bus busData,
      required String searcKey,
      required String seatMapKey,
      required String mobileNumber,
      required String customerEmail,
      required List<PaxDetailslist> paxDetailslist,
      required String amount,
      required String customerName}) async {
    dio.Response<dynamic> response =
        await busTempTicketBookingApiService.busTempTicketBooking(
            boardingId: boardingId,
            droppingId: droppingId,
            busData: busData,
            searcKey: searcKey,
            seatMapKey: seatMapKey,
            mobileNumber: mobileNumber,
            customerEmail: customerEmail,
            paxDetailslist: paxDetailslist);

    if (response.statusCode == 200) {
      if (response.data["Response_Header"]["Error_Desc"] == "SUCCESS") {
        var bookingRefernceNo = response.data["Booking_RefNo"];

        payForBusBooking(
            amount: double.parse(amount), bookingRef: bookingRefernceNo);

        // payUseingEaseBuzzSubs(
        //     amount: amount,
        //     bookingRef: bookingRefernceNo,
        //     customerName: customerName.trim().split(" ").first,
        //     email: customerEmail,
        //     phone: mobileNumber);

        //booking api
      } else {
        Get.rawSnackbar(
            message: response.data["Error_Desc"], backgroundColor: Colors.red);
      }
    }
  }

  static MethodChannel _channel = MethodChannel('easebuzz');
  EaseBuzzTokenApiService easeBuzzApi = EaseBuzzTokenApiService();

  payUseingEaseBuzzSubs(
      {required String amount,
      required String customerName,
      required String email,
      required String phone,
      required String bookingRef}) async {
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
      busAddPayment(refernceNo: bookingRef);
    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
          "The last transaction has been cancelled!", "Please try again!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // String responseData = "Nothing";
  final _isgpayuiPlugin = IsgpayuiPlugin();

  void payForBusBooking(
      {required double amount, required String bookingRef}) async {
    String? result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result =
          await _isgpayuiPlugin.initiateISGPayUI(getArguments(amount * 100)) ??
              'Unknown platform version';
    } on PlatformException catch (e) {
      result = e.message;
    }
    debugPrint('Result ::: $result');

    var responseData = jsonDecode(result!);
    var data = jsonDecode(responseData);
    print("<<----response-data---->>${data.runtimeType}");
    print(data);
    if (data["ResponseCode"] == "00") {
      //
      //need to give id
      Get.to(() => FlightLoadingPage());
      busAddPayment(refernceNo: bookingRef);
    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
          "The last transaction has been cancelled!", "Please try again!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Map<String, String> getArguments(var amount) {
    var randomStr = DateTime.now().microsecondsSinceEpoch.toString();
    Map<String, String> map = {
      'version': "1",
      'txnRefNo': "ORD$randomStr", // Should change on every request
      'amount': "$amount",
      'passCode': 'SVPL4257',
      'bankId': '000004',
      'terminalId': '10100781',
      'merchantId': '101000000000781',
      'mcc': "4112",
      'paymentType': 'Pay',
      'currency': "356",
      'email': 'manu@gmail.com',
      'phone': '+917907886767',
      'hashKey': 'E59CD2BF6F4D86B5FB3897A680E0DD3E',
      'aesKey': '5EC4A697141C8CE45509EF485EE7D4B1',
      'payOpt': 'cc',
      'orderInfo': 'NARUTO00001',
      'env': 'UAT', //UAT PROD
      'url': 'https://sandbox.isgpay.com/ISGPay-Genius/request.action',
    };
    return map;
  }

  busAddPayment({required String refernceNo}) async {
    dio.Response<dynamic> response =
        await busAddPaymentApiServices.addPaymentForBusApiServices(
            clientReferneNo: "Testing Team", refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      busTicketing(refernceNo: refernceNo);
      // Get.rawSnackbar(
      //     message: "Payment Added Success", backgroundColor: Colors.green);
    } else {}
  }

  busTicketing({required String refernceNo}) async {
    dio.Response<dynamic> response =
        await busTicketingApiServices.busTicketingApi(refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      busRequery(refernceNo: refernceNo);
      // AirReprintModel airReprintModel = AirReprintModel.fromJson(response.data);

      // Get.off(() => FlightBookingSuccessPage(
      //       airReprintModel: airReprintModel,
      //       refNo: refernceNo,
      //     ));
    } else {}
  }

  busRequery({required String refernceNo}) async {
    dio.Response<dynamic> response =
        await busRequieyApiServices.busRequiryApi(refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      BusRequeryModel busRequeryModel = BusRequeryModel.fromJson(response.data);

      addBusBookingHistoy(
          bookingRefNo: refernceNo,
          busName: busRequeryModel.busDetail.busType,
          date: busRequeryModel.bookingDate,
          fromCityCode: busRequeryModel.busDetail.fromCity,
          fromCityName: busRequeryModel.busDetail.fromCity,
          toCityCode: busRequeryModel.busDetail.toCity,
          toCityName: busRequeryModel.busDetail.toCity);

      Get.off(() => BusBookingSuccessPage(
            busRequeryModel: busRequeryModel,
          ));
    } else {}
  }

  busTicketDownload({required String refernceNo}) async {
    dio.Response<dynamic> response =
        await busRequieyApiServices.busRequiryApi(refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      BusRequeryModel busRequeryModel = BusRequeryModel.fromJson(response.data);

      createPDF(busRequeryModel);
    }
  }

  ///bus ticketing
  ///
  ///
  Future<void> createPDF(BusRequeryModel busRequeryModel) async {
    final pdf = pw.Document();
    print("------------------------>>>1");
    pdf.addPage(pw.Page(
      build: (context) => pw.ListView(
        children: [
          pw.Column(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.only(left: 20, right: 20, top: 20),
                child: pw.Container(
                  height: 380,
                  width: 500,
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black)),
                  child: pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        left: 1, right: 1, top: 1, bottom: 1),
                    child: pw.Container(
                      height: 380,
                      width: 400,
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      child: pw.Column(
                        children: [
                          pw.Padding(
                            padding:
                                const pw.EdgeInsets.only(top: 15, left: 20),
                            child: pw.Row(
                              children: [
                                pw.Text(
                                  'Itinerary',
                                  style: pw.TextStyle(color: PdfColors.grey100),
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                left: 20, top: 20, right: 20),
                            child: pw.Container(
                              height: 45,
                              width: 400,
                              decoration: const pw.BoxDecoration(
                                  color: PdfColors.yellow200,
                                  border: pw.Border(
                                      top: pw.BorderSide(
                                          color: PdfColors.orange),
                                      bottom: pw.BorderSide(
                                          color: PdfColors.orange))),
                              child: pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    left: 10, right: 10),
                                child: pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Text(
                                      '${busRequeryModel.busDetail.fromCity} to ${busRequeryModel.busDetail.toCity}',
                                      style: pw.TextStyle(
                                          //fontWeight: pw.FontWeight.bold
                                          ),
                                    ),
                                    pw.Text(
                                        busRequeryModel.busDetail.travelDate),
                                    // pw.Text(
                                    //   busRequeryModel.busDetail.busType,
                                    //   style: pw.TextStyle(
                                    //       //fontWeight: pw.FontWeight.bold
                                    //       ),
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 20, left: 0, right: 0),
                            child: pw.Container(
                              height: 1,
                              color: PdfColors.black,
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 2, left: 0, right: 0),
                            child: pw.Container(
                              height: 1,
                              color: PdfColors.black,
                            ),
                          ),
                          pw.Padding(
                            padding:
                                const pw.EdgeInsets.only(left: 20, right: 20),
                            child: pw.Container(
                              height: 100,
                              decoration:
                                  pw.BoxDecoration(color: PdfColors.grey100),
                              child: pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    left: 12, right: 12, top: 5, bottom: 5),
                                child: pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.spaceAround,
                                        children: [
                                          pw.Text(
                                            'Passenger name',
                                            style: pw.TextStyle(
                                                color: PdfColors.blueAccent,
                                                fontWeight: pw.FontWeight.bold),
                                          ),
                                          pw.Padding(
                                            padding: pw.EdgeInsets.only(top: 2),
                                            child: pw.Text(
                                              busRequeryModel
                                                  .paxDetails.first.paxName,
                                              style: pw.TextStyle(
                                                fontSize: 11,
                                                //fontWeight: pw.FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          pw.Text(
                                            'ticket #',
                                            style: pw.TextStyle(
                                                color: PdfColors.blueAccent,
                                                fontWeight: pw.FontWeight.bold),
                                          ),
                                          pw.Padding(
                                            padding: pw.EdgeInsets.only(top: 2),
                                            child: pw.Text(
                                              busRequeryModel.bookingRefNo,
                                              style: const pw.TextStyle(
                                                fontSize: 11,
                                                //fontWeight: pw.FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ]),
                                    pw.Column(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text(
                                          'Seat number(s)',
                                          style: pw.TextStyle(
                                              color: PdfColors.blueAccent,
                                              fontWeight: pw.FontWeight.bold),
                                        ),
                                        pw.Padding(
                                          padding: pw.EdgeInsets.only(top: 2),
                                          child: pw.Text(
                                            busRequeryModel
                                                .paxDetails.first.seatNumber,
                                            style: pw.TextStyle(
                                              fontSize: 11,
                                              //fontWeight: pw.FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        pw.Padding(
                                          padding: pw.EdgeInsets.only(top: 14),
                                          child: pw.Text(
                                            'PNR #',
                                            style: pw.TextStyle(
                                                color: PdfColors.blueAccent,
                                                fontWeight: pw.FontWeight.bold),
                                          ),
                                        ),
                                        pw.Padding(
                                          padding: pw.EdgeInsets.only(top: 2),
                                          child: pw.Text(
                                            'JBR190223-\n(Luxura A/C Sleeper)',
                                            style: pw.TextStyle(
                                              fontSize: 11,
                                              //fontWeight: pw.FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding:
                                pw.EdgeInsets.only(top: 0, left: 0, right: 0),
                            child: pw.Container(
                              height: 1,
                              color: PdfColors.black,
                            ),
                          ),
                          pw.Padding(
                            padding:
                                pw.EdgeInsets.only(top: 2, left: 0, right: 0),
                            child: pw.Container(
                              height: 1,
                              color: PdfColors.black,
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(
                                left: 30, right: 30, top: 10),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Row(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Text(
                                            'Bus type',
                                            style: pw.TextStyle(
                                                color: PdfColors.blueAccent,
                                                fontWeight: pw.FontWeight.bold),
                                          ),
                                          pw.Padding(
                                            padding:
                                                pw.EdgeInsets.only(top: 5.5),
                                            child: pw.Text(
                                              busRequeryModel.busDetail.busType,
                                              style: pw.TextStyle(
                                                fontSize: 13,
                                                //fontWeight: pw.FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ]),
                                    pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Text(
                                            'Departure Time',
                                            style: pw.TextStyle(
                                                color: PdfColors.blueAccent,
                                                fontWeight: pw.FontWeight.bold),
                                          ),
                                          pw.Padding(
                                            padding:
                                                pw.EdgeInsets.only(top: 5.5),
                                            child: pw.Text(
                                              busRequeryModel
                                                  .busDetail.departureTime,
                                              style: pw.TextStyle(
                                                fontSize: 13,
                                                //fontWeight: pw.FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ],
                                ),
                                pw.Padding(
                                    padding: pw.EdgeInsets.only(top: 15),
                                    child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Container(
                                          width: 150,
                                          child: pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            children: [
                                              pw.Text(
                                                'Boarding point address',
                                                style: pw.TextStyle(
                                                    color: PdfColors.blueAccent,
                                                    fontWeight:
                                                        pw.FontWeight.bold),
                                              ),
                                              pw.Padding(
                                                padding: pw.EdgeInsets.only(
                                                    top: 5.5),
                                                child: pw.Row(
                                                  children: [
                                                    pw.Text(
                                                      'Location:',
                                                      style: pw.TextStyle(
                                                          fontWeight: pw
                                                              .FontWeight.bold),
                                                    ),
                                                    pw.Text(
                                                      '  ${busRequeryModel.busDetail.boardingDetails.boardingAddress}',
                                                      style: pw.TextStyle(
                                                        height: 2,
                                                        fontSize: 13,
                                                        // fontWeight: pw.FontWeight.bold
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // pw.Padding(
                                              //   padding: pw.EdgeInsets.only(
                                              //       top: 5.5),
                                              //   child: pw.Row(
                                              //     children: [
                                              //       pw.Text(
                                              //         'Landmark:',
                                              //         style: pw.TextStyle(
                                              //             fontWeight: pw
                                              //                 .FontWeight.bold),
                                              //       ),
                                              //       pw.Text(
                                              //         ' Sholinganallur',
                                              //         style: pw.TextStyle(
                                              //           height: 2,
                                              //           fontSize: 13,
                                              //           //fontWeight: pw.FontWeight.bold
                                              //         ),
                                              //       ),
                                              //     ],
                                              //   ),
                                              // ),
                                              // pw.Padding(
                                              //   padding: pw.EdgeInsets.only(
                                              //       top: 5.5),
                                              //   child: pw.Text(
                                              //     'Address:',
                                              //     style: pw.TextStyle(
                                              //         fontWeight:
                                              //             pw.FontWeight.bold),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        pw.Padding(
                                            padding: pw.EdgeInsets.only(
                                              top: 8,
                                            ),
                                            child: pw.Container(
                                              width: 82,
                                              child: pw.Column(
                                                crossAxisAlignment:
                                                    pw.CrossAxisAlignment.start,
                                                children: [
                                                  pw.Text(
                                                    'Total fare',
                                                    style: pw.TextStyle(
                                                        color: PdfColors
                                                            .blueAccent,
                                                        fontWeight:
                                                            pw.FontWeight.bold),
                                                  ),
                                                  pw.Padding(
                                                    padding: pw.EdgeInsets.only(
                                                        top: 8),
                                                    child: pw.Text(
                                                      'Rs. ${getTotalAmount(busRequeryModel.paxDetails)}',
                                                      style: pw.TextStyle(
                                                        fontSize: 13,
                                                        //fontWeight: pw.FontWeight.bold
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(left: 20, top: 15),
                child: pw.Row(
                  children: [
                    pw.Text(
                      'Terms and conditions',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(left: 20, top: 10, right: 0),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [
                          pw.Text('1.'),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(left: 10),
                            child: pw.Text(
                              'redBus* is ONLY a bus ticket agent. It does not operate bus services of its \nown. In order to provide a comprehensive choice of bus operators, departure \ntimes and prices to customers, it has tied up with many bus operators. redBus" \nadvice to customers is to choose bus operators they are aware of and whose \nservice they are comfortable with.',
                              style: pw.TextStyle(height: 3),
                            ),
                          ),
                        ]),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(top: 5, left: 20),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            'redBus" responsibilities include: ',
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(top: 6, left: 30),
                            child: pw.Text(
                              '(1) Issuing a valid ticket (a ticket that will be accepted by the bus \noperator) for its" network of bus operators\n(2) Providing refund and support in the event of cancellation\n(3) Providing customer support and information in case of any delays /\ninconvenience',
                              style: pw.TextStyle(height: 3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.Padding(
                        padding: pw.EdgeInsets.only(top: 5),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('2.'),
                            pw.Padding(
                              padding: pw.EdgeInsets.only(
                                left: 10,
                              ),
                              child: pw.Text(
                                  'The departure time mentioned on the ticket are only tentative timings.\nHowever the bus will not leave the source before the time that is \nmentioned on the ticket.',
                                  style: pw.TextStyle(height: 3)),
                            )
                          ],
                        ))
                  ],
                ),
                // pw.Column(
                //   crossAxisAlignment: pw.CrossAxisAlignment.start,
                //   children: [
                //     pw.Row(
                //       crossAxisAlignment:pw. CrossAxisAlignment.start,
                //       children: [
                //         pw.Text('3.'),
                //         pw.Padding(
                //           padding: pw. EdgeInsets.only(left: 10),
                //           child:pw. Text(' Passengers are required to furnish the following at the time of boarding the bus:\n(1) A copy of the ticket (A print out of the ticket or the print out of the ticket e-mail).\n(2) A valid identity proof \nFailing to do so, they may not be allowed to board the bus',
                //           style:pw. TextStyle(
                //             height: 1.8
                //           ),),
                //         )
                //       ],
                //     ),
                //       pw.Padding(
                //         padding:pw.EdgeInsets.only(top: 5),
                //         child: pw.Row(
                //         crossAxisAlignment: pw.CrossAxisAlignment.start,
                //         children: [
                //           pw.Text('4.'),
                //           pw.Padding(
                //             padding:pw. EdgeInsets.only(left: 10),
                //             child: pw.Text('Change of bus: In case the bus operator changes the type of bus due to some reason, \nredBus will refund the differential amount to the customer upon being intimated by \nthe customers in 24 hours of the journey',
                //             style: pw.TextStyle(
                //               height: 1.8
                //             ),),
                //           )
                //         ],
                //                               ),
                //       ),
                //       pw.Padding(
                //         padding:pw.EdgeInsets.only(top: 5),
                //         child:pw. Row(
                //         crossAxisAlignment: pw.CrossAxisAlignment.start,
                //         children: [
                //           pw.Text('5.'),
                //           pw.Padding(
                //             padding: pw. EdgeInsets.only(left: 10),
                //             child: pw.Text('Amenities for this bus as shown on redBus have been configured and provided by \nthe bus provider (bus operator). These amenities will be provided unless there are \nsome exceptions on certain days. Please note that redBus provides this information \nin good faith to help passengers to make an informed decision. The liability of the amenity \nnot being made available lies with the operator and not with redBus',
                //             style: pw.TextStyle(
                //               height: 1.8
                //             ),),
                //           )
                //         ],
                //                               ),
                //       ),
                //        pw.Padding(
                //         padding: pw.EdgeInsets.only(top: 5),
                //         child: pw.Row(
                //         crossAxisAlignment:pw. CrossAxisAlignment.start,
                //         children: [
                //           pw.Text('6.'),
                //           pw.Padding(
                //             padding:pw. EdgeInsets.only(left: 10),
                //             child:pw. Text('nfigured and provided by \nthe bus provider (bus operator). These amenities will be provided unless there are \nsome exceptions on certain days. Please note that redBus provides this information \nin good faith to help passengers to make an informed decision. The liability of the amenity \nnot being made available lies with the operator and not with redBus',
                //             style: pw.TextStyle(
                //               height: 1.8
                //             ),),
                //           )
                //         ],
                //                               ),
                //       ),
                //   ],
                // )
              ),
              pw.SizedBox(
                height: 10,
              )
            ],
          ),
        ],
      ),
    ));

    Directory root = await getTemporaryDirectory();
    final file = File(root.path + '/example.pdf');
    await file.writeAsBytes(await pdf.save());
    print("------------------------>>>");
    print(file.path);

    OpenFile.open(file.path);
  }

  getTotalAmount(List<PaxDetail> paxDetails) {
    double totalAmount = 0;

    for (var i = 0; i < paxDetails.length; i++) {
      totalAmount = totalAmount + paxDetails[i].fare.totalAmount;
    }

    return totalAmount.toStringAsFixed(2);
  }

  addBusBookingHistoy({
    required String fromCityCode,
    required String toCityCode,
    required String fromCityName,
    required String toCityName,
    required String bookingRefNo,
    required String busName,
    required String date,
  }) async {
    dio.Response<dynamic> response =
        await addBusBookingHistoryAPIServices.addBusBookingAPIServices(
            fromCityCode: fromCityCode,
            toCityCode: toCityCode,
            fromCityName: fromCityName,
            toCityName: toCityName,
            bookingRefNo: bookingRefNo,
            busName: busName,
            date: date);

    if (response.statusCode == 201) {}
  }

  //bus booking list

  List<BookingHistoryData> bookingHistoryList = [];

  getBusBookingHistory() async {
    dio.Response<dynamic> response =
        await getBusBookingHistoyApiServices.getBusBookingApiServices();

    if (response.statusCode == 200) {
      BusHistoryModel busHistoryModel = BusHistoryModel.fromJson(response.data);
      bookingHistoryList = busHistoryModel.data;
      update();
    }
    update();
  }
}
