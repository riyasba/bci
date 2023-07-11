import 'dart:io';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateEnquiryApiService extends BaseApiService {
  Future createEnquiryApiService({
    required String packageid,
    required String cityofdeparture,
    required String dateofdeparture,
    required String adultcount,
    required String childcount,
    required String infantcount,
    required String name,
    required String email,
    required String mobile,
    required String status,
    }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.get(
        getPackageDetailsApiUrl,
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
              "package_id": 1,
              "vendor_id": 107,
              "city_of_departure": "New York",
              "date_of_departure": "2023-07-12",
              "adult_count": 2,
              "child_count": 1,
              "infant_count": 0,
              "name": "John Doe",
              "email": "johndoe@example.com",
              "mobile": "1234567890",
              "status": "pending"
            }
      );
      print("::::::::<create enquiry Api>::::::::status code::::::::::");
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
