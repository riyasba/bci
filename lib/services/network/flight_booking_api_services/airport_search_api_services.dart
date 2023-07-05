import 'dart:io';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AirportSearchApiServices extends BaseApiService {
  Future airportSearchApiServices({required String keyWord}) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      FormData formData = FormData.fromMap({
        "name": keyWord,
        "iata": "",
        "icao": "",
        "city": "",
        "country": "ALL",
        "code": "",
        "x": "",
        "y": "",
        "elevation": "",
        "timezone": "",
        "dst": "U",
        "db": "airports",
        "iatafilter": true,
        "apid": "",
        "action": "SEARCH",
        "offset": 0
      });

      var response = await dio.post(airportSearch,
          options: Options(
              headers: {
                'Accept': 'application/json',
                "Content-Type": "application/x-www-form-urlencoded",
                "Connection": "keep-alive"
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formData);
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
