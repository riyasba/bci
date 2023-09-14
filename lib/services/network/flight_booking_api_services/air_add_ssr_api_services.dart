import 'dart:io';
import 'package:bci/models/flight_booking_models/air_search_model.dart';
import 'package:bci/models/flight_booking_models/flight_search_data_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

class AirAddSsrApiServices extends BaseApiService {
  Future airGetSsrDetails({
    required String searchKey,
    required String flightKey,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var data ={
            "imei_number": "64654546546546",
            "search_key": searchKey,
            "flight_key": flightKey,
          };
       
          developer.log(
          "----------------------------------------------------->>air ssr printing");
          developer.log(data.toString(), name: "hotel room details request");

      var response = await dio.post(airGetSsrURL,
          options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "imei_number": "64654546546546",
            "search_key": searchKey,
            "flight_key": flightKey,
          });
      print(
          "::::::::<-- Air get ssr printing -->::::::::status code::::::::::");
      print(response.statusCode);
      // print(response.data);
        developer.log(response.data.toString(), name: "block data response");
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
