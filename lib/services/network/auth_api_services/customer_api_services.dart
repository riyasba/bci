import 'dart:convert';
import 'dart:io';
import 'package:bci/models/members_register_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';

class MemberRegisterApiServices extends BaseApiService {
  Future memberRegister({
    required MemberRegisterModel memberRegisterModel,
    required AddressModel residentialAddress,
    required AddressModel officialAddress,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      var response = await dio.post(registerURl,
          options: Options(
              headers: {
                'Accept': 'application/json',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "name": memberRegisterModel.name,
            "mobile": memberRegisterModel.mobile,
            "email": memberRegisterModel.email,
            "occupation": memberRegisterModel.occupation,
            "father_name": memberRegisterModel.fatherName,
            "mother_name": memberRegisterModel.motherName,
            "is_married": "0",
            "residential_address": jsonEncode({
              "door_no": residentialAddress.doorNo,
              "address": residentialAddress.address,
              "building_name": residentialAddress.buildingName,
              "state": residentialAddress.state,
              "city": residentialAddress.city,
              "personal_id": residentialAddress.personalId,
              "aadhar_id": residentialAddress.aadhrId
            }),
            "official_address": jsonEncode({
              "door_no": officialAddress.doorNo,
              "address": officialAddress.address,
              "building_name": officialAddress.buildingName,
              "state": officialAddress.state,
              "city": officialAddress.city,
            }),
            "pan_no": memberRegisterModel.panNo,
            "aadhar_no": residentialAddress.aadhrId,
            "role_id": "3",
            "password": "1234567",
            "password_confirmation": "1234567"
          });
      print("::::::::<Register URL>::::::::status code::::::::::");
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
