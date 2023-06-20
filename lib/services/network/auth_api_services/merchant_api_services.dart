import 'dart:io';
import 'package:bci/models/members_register_model.dart';
import 'package:bci/models/merchants_register_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';

class MerchantRegisterApiServices extends BaseApiService {
  Future merchantRegister({
    required MerchantRegisterModel merchantRegisterModel,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      FormData formData = FormData.fromMap({
        "category_id": merchantRegisterModel.categoryId,
        //"subcategory_id": merchantRegisterModel.subcategoryId,
        "name": merchantRegisterModel.name,
        "email": merchantRegisterModel.email,
        "mobile": merchantRegisterModel.mobile,
        "alternate_mobile": merchantRegisterModel.alternateMobile,
        "gst_no": merchantRegisterModel.gstNo,
        "address": merchantRegisterModel.address,
        "aadhar_proof": await MultipartFile.fromFile(
            merchantRegisterModel.aadharProof,
            filename: merchantRegisterModel.gstNo),
        "pan_proof": await MultipartFile.fromFile(
            merchantRegisterModel.panProof,
            filename: merchantRegisterModel.name),
        "role_id": "5",
        "password": "1234567",
        "password_confirmation": "1234567"
      });

      var response = await dio.post(registerURl,
          options: Options(
              headers: {
                'Accept': 'application/json',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formData);
      print("::::::::<merchant Register URL>::::::::status code::::::::::");
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
