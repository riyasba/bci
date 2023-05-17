import 'dart:convert';
import 'dart:io';
import 'package:bci/models/member_profile_update_model.dart';
import 'package:bci/models/members_register_model.dart';
import 'package:bci/models/merchants_register_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateResidencialAddressApiServices extends BaseApiService {
  Future updateResidencialAddressApi({
    required AddressModel residentialAddress,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      FormData formData = FormData.fromMap({
        "residential_address": jsonEncode({
          "door_no": residentialAddress.doorNo,
          "address": residentialAddress.address,
          "building_name": residentialAddress.buildingName,
          "state": residentialAddress.state,
          "city": residentialAddress.city,
          "personal_id": residentialAddress.personalId,
          "aadhar_id": residentialAddress.aadhrId
        }),
      });

      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(profileUpdateURL,
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formData);
      print("::::::::<profile update URL>::::::::status code::::::::::");
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
