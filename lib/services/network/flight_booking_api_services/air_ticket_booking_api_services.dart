import 'dart:io';
import 'package:bci/models/flight_booking_models/air_search_model.dart';
import 'package:bci/models/flight_booking_models/booking_model.dart';
import 'package:bci/models/flight_booking_models/flight_search_data_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AirTicketBookingApiServices extends BaseApiService {
  Future airTicketBookingApiServices({
    required BookingModel bookingModel,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(airTicketBookingUrl,
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "Auth_Header": {
              "UserId": "benzclub",
              "Password": "B39F285E37EDCE355386E79CFD8A979ACE740A1E",
              "IP_Address": "101.188.67.134",
              "Request_Id": "5645645645646674",
              "IMEI_Number": "2232323232323"
            },
            "Customer_Mobile": bookingModel.customerMobile,
            "Passenger_Mobile": bookingModel.passengerMobile,
            "WhatsAPP_Mobile": null,
            "Passenger_Email": bookingModel.passengerEmail,
            "PAX_Details": List<dynamic>.from(
                bookingModel.paxDetails.map((x) => x.toJson())),
            "GST": false,
            "GST_Number": "",
            "GST_HolderName": "GST Holder Name",
            "GST_Address": "GST Address",
            "BookingFlightDetails": [
              {
                "Search_Key": bookingModel.searchKey,
                "Flight_Key": bookingModel.flightKey,
                "BookingSSRDetails": []
              }
            ],
            "CostCenterId": 0,
            "ProjectId": 0,
            "BookingRemark": bookingModel.bookingRemark,
            "CorporateStatus": 0,
            "CorporatePaymentMode": 0,
            "MissedSavingReason": null,
            "CorpTripType": null,
            "CorpTripSubType": null,
            "TripRequestId": null,
            "BookingAlertIds": null
          });
      print("::::::::<--Air Ticket booking-->::::::::status code::::::::::");
      print(response.statusCode);
      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }

  dynamic returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        print("here.>>>>>>>>>>>>");
        return responseJson;
      case 400:
      // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      // throw UnauthorisedException(response.body.toString());
      case 404:
      // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      // throw FetchDataException(
      //     'Error occured while communication with server' +
      //         ' with status code : ${response.statusCode}');
    }
  }
}
