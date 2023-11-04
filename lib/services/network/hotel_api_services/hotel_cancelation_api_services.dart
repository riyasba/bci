import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../base_urls/base_urls.dart';

class HotelCancelApiServices extends BaseApiService {
  Future cancelHotel({
    required String searchToken,
    required String bookingId,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(hotelBookingCancelationURL,
          options: Options(
              headers: {'Authorization': 'Bearer $authtoken'},
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "Search_Token": searchToken,
            "UserIp": "122.160.83.78",
            "BookingId": bookingId,
            "BookingMode": "5",
            "RequestType": "4",
            "Remarks": "Canceling the hotel",
          });

      print("::::::::<get HOTEL city-list Api>::::::::status code::::::::::");
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
    }
  }
}
