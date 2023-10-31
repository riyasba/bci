import 'dart:io';
import 'package:bci/models/flight_booking_models/flight_search_data_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AirSearchApiServices extends BaseApiService {
  Future airSearchApiServices(
      {required FlightSearchDataModel flightSearchModel,
      required String airlineCode}) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var data = {
        "imei_number": "64654546546546",
        "origin": flightSearchModel.fromIata,
        "destination": flightSearchModel.toIata,
        "travel_date": formatDate(
            flightSearchModel.depatureDate, [mm, "/", dd, "/", yyyy]),
        "travel_type": flightSearchModel.isDomOrINTL,
        "booking_type": flightSearchModel.isOneWayOrRoundTrip,
        "adult_count": "${flightSearchModel.adultsCount}",
        "child_count": "${flightSearchModel.childCount}",
        "infant_count": "0",
        "class_of_travel": "${flightSearchModel.cabinClass}",
        "inventory_type": 0,
        "airline_code": airlineCode
      };

      var data2 = {
        "Auth_Header": {
          "UserId": "benzclub",
          "Password": "B39F285E37EDCE355386E79CFD8A979ACE740A1E",
          "IP_Address": "101.188.67.134",
          "Request_Id": "5500g887959052",
          "IMEI_Number": "2232323232323"
        },
        "Travel_Type": 0,
        "Booking_Type": 0,
        "TripInfo": [
          {
            "Origin": flightSearchModel.fromIata,
            "Destination": flightSearchModel.toIata,
            "TravelDate": formatDate(
                flightSearchModel.depatureDate, [mm, "/", dd, "/", yyyy]),
            "Trip_Id": 0
          }
        ],
        "Adult_Count": "1",
        "Child_Count": "0",
        "Infant_Count": "0",
        "Class_Of_Travel": "0",
        "InventoryType": 0,
        "Filtered_Airline": [
          {"Airline_Code": ""}
        ]
      };

      print(data);

      var response = await dio.post(airSearchUrl,
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: data2);
      print("::::::::<--Air search-->::::::::status code::::::::::");
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
