import 'dart:io';
import 'package:bci/controllers/services_controller.dart';
import 'package:bci/models/create_services_model.dart';
import 'package:bci/models/members_register_model.dart';
import 'package:bci/models/merchant_update_profile.dart';
import 'package:bci/models/merchants_register_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart' as gtx;

class UploadImagesServicesApiServices extends BaseApiService {
  Future uploadImagesServices(
      {required List<XFile> images,
      required int id,
      required String cid}) async {
    dynamic responseJson;
    try {
      var dio = Dio();

      print("image length ------->> ${images.length}");

      FormData formData = FormData.fromMap({
        for (int i = 0; i < images.length; i++)
          "image[$i]": await MultipartFile.fromFile(images[i].path,
              filename: images[i].path.split("/").last),
        // if (images.isNotEmpty)
        //   "image": await MultipartFile.fromFile(images.first.path,
        //       filename: images.first.path.split("/").last),
        "id": id,
        "category_id": cid
      });

      print(formData.fields);

      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(addServicesURL,
          options: Options(
              headers: {'Authorization': 'Bearer $authtoken'},
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formData);
      print("::::::::<update services URL>::::::::status code::::::::::");
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
