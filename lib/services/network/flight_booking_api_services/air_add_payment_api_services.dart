import 'dart:io';
import 'package:bci/models/flight_booking_models/air_search_model.dart';
import 'package:bci/models/flight_booking_models/flight_search_data_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AirAddPaymentApiServices extends BaseApiService {
  Future addPaymentApiServices({
    required String refrenceNo,
    required String clientReferneNo,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(airAddPayment,
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
            "Auth_Header": {
              "UserId": "benzclub",
              "Password": "B39F285E37EDCE355386E79CFD8A979ACE740A1E",
              "IP_Address": "101.188.67.134",
              "Request_Id": "56456456456464",
              "IMEI_Number": "2232323232323"
            },
            "ClientRefNo": clientReferneNo,
            "RefNo": refrenceNo,
            "TransactionType": 0,
            "ProductId": "1"
          });
      print(
          "::::::::<--Air add payment-->::::::::status code::::::$refrenceNo::::");
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
