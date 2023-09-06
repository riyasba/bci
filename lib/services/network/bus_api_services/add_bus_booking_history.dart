import 'dart:io';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddBusBookingHistoryAPIServices extends BaseApiService {
  Future addBusBookingAPIServices({
    required String fromCityCode,
    required String toCityCode,
    required String fromCityName,
    required String toCityName,
    required String bookingRefNo,
    required String busName,
    required String date,
    required String price,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(addBusBookingHistoryURL,
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
            "FromCityCode": fromCityCode,
            "ToCityCode": toCityCode,
            "FromCityName": fromCityName,
            "ToCityName": toCityName,
            "Booking_RefNo": bookingRefNo,
            "BusName": busName,
            "Date": date,
            "price": price
          });
      print(
          "::::::::<--add Bus History requiry-->::::::::status code:::::::::");
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
