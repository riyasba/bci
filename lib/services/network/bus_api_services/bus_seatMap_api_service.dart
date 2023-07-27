import 'dart:io';
import 'package:bci/models/bus_booking_models/search_bus_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusSeatMapApiService extends BaseApiService {
  Future busSeatMapApiService(
      {required String boardingId,
      required String droppingId,
      required Bus busData,
      required String searcKey}) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      // var sendingData = {
      //   "imei_Number": "726736735476234",
      //   "boarding_id": boardingId,
      //   "dropping_id": droppingId,
      //   "bus_key": busData.busKey,
      //   "search_key": searcKey
      // };

      // print(sendingData);
      // print(searcKey);

      var response = await dio.post(busSeatMapApiUrl,
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
            "imei_Number": "726736735476234",
            "boarding_id": boardingId,
            "dropping_id": droppingId,
            "bus_key": busData.busKey,
            "search_key": searcKey
          });
      print("::::::::<bus-seat map list Api>::::::::status code::::::::::");
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
