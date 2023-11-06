import 'dart:io';
import 'package:bci/models/members_register_model.dart';
import 'package:bci/models/merchant_update_profile.dart';
import 'package:bci/models/merchants_register_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileUpdateApiServices extends BaseApiService {
  Future profileUpdate({
    required MerchantUpdateModel merchantUpdateModel,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      FormData formData = FormData.fromMap({
        "category_id": merchantUpdateModel.categoryId,
        "name": merchantUpdateModel.name,
        "mobile": merchantUpdateModel.mobile,
        "alternate_mobile": merchantUpdateModel.alternateMobile,
        "gst_no": merchantUpdateModel.gstNo,
        "address": merchantUpdateModel.address,
        "bank_name": merchantUpdateModel.bankName,
        "bank_account_name": merchantUpdateModel.bankAccountName,
        "account_type": merchantUpdateModel.accountType,
        "bank_account_number": merchantUpdateModel.bankAccountNumber,
        "location_address": merchantUpdateModel.locationAddress,
        "ifsc_code": merchantUpdateModel.ifscCode,
        "video_link": merchantUpdateModel.videoLink,
        if (merchantUpdateModel.shopImage != "null")
          "shop_image": await MultipartFile.fromFile(
              merchantUpdateModel.shopImage,
              filename: "shopImage"),
        if (merchantUpdateModel.aadharProof != null)
          "adhar_proof": await MultipartFile.fromFile(
              merchantUpdateModel.aadharProof.path,
              filename: "aadhar"),
        if (merchantUpdateModel.panProof != null)
          "pan_proof": await MultipartFile.fromFile(
              merchantUpdateModel.panProof.path,
              filename: "pancard"),
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
