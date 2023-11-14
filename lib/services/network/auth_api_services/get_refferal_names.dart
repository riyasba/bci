import 'dart:io';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';

class RefferalNameAPIServices extends BaseApiService {
  Future refferalNameApiServices({
    required String reffrealId,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      var response = await dio.post(refferedNameURL,
          options: Options(
              headers: {'Content-Type': 'application/json'},
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {"reffreal_id": reffrealId});
      print("::::::::<GetRefferal name URL>::::::::status code::::::::::");
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
