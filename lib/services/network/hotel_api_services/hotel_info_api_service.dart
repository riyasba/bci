import 'dart:io';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HotelInfoApiServices extends BaseApiService {
  Future hotelInfoApiServices({
    required String userIp,
    required String resultIndex,
    required String hotelCode,
    required String searchToken,
    }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(
        hotelInfoApiUrl,
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
              "UserIp":userIp,
              "ResultIndex":resultIndex,
              "HotelCode":hotelCode,
              "Search_Token": searchToken,
            }
      );
      print("::::::::<hotel info Services Api>::::::${userIp}::status code:::${resultIndex}::${hotelCode}:${searchToken}::::");
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
