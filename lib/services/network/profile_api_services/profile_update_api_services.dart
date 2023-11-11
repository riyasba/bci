import 'dart:io';
import 'package:bci/models/child_dob_model.dart';
import 'package:bci/models/member_profile_update_model.dart';
import 'package:bci/models/members_register_model.dart';
import 'package:bci/models/merchants_register_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileUpdateApiServices extends BaseApiService {
  Future profileUpdate({
    required MemberProfileUpdateModel memberProfileUpdateModel,
    required List<ChildDetailsModel> childDetailsList,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      FormData formData = FormData.fromMap({
        "name": memberProfileUpdateModel.name,
        "mobile": memberProfileUpdateModel.mobile,
        "email": memberProfileUpdateModel.email,
        "occupation": memberProfileUpdateModel.occupation,
        "father_name": memberProfileUpdateModel.fatherName,
        "mother_name": memberProfileUpdateModel.motherName,
        "is_married": memberProfileUpdateModel.isMarried,
        "dob": memberProfileUpdateModel.dateOfBirth,
        "wife_dob": memberProfileUpdateModel.spousedateOfBirth,
        "qualification": memberProfileUpdateModel.qualification,
        "alternate_mobile": memberProfileUpdateModel.alternateMob,
        "pan_no": memberProfileUpdateModel.panNo,
        "aadhar_no": memberProfileUpdateModel.adharNo,
        "gst_no": memberProfileUpdateModel.gstNo,
        "gender": memberProfileUpdateModel.gender,
        "branch": memberProfileUpdateModel.branch,
        "spouse": memberProfileUpdateModel.spouse,
        for (var i = 0; i < memberProfileUpdateModel.children!.length; i++)
          "child_name[$i]": memberProfileUpdateModel.children![i],
        "wedding_date": memberProfileUpdateModel.weddingDate,
        if (memberProfileUpdateModel.adharproofimg != "null")
          "adhar_proof": await MultipartFile.fromFile(
              memberProfileUpdateModel.adharproofimg,
              filename: "adhar_proof"),
        if (memberProfileUpdateModel.panproofimg != "null")
          "pan_proof": await MultipartFile.fromFile(
              memberProfileUpdateModel.panproofimg,
              filename: "pan_proof"),
        for (int i = 0; i < childDetailsList.where((element) => element.isNew).toList().length; i++)
          "child_name[$i]": childDetailsList[i].nameController.text,
        for (int i = 0; i < childDetailsList.where((element) => element.isNew)
                    .toList()
                    .length; i++)
          "dob[$i]": childDetailsList[i].dateOfBirthController.text,
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
      print(
          "::::::::<profile update URL>::::::::status code:::::::::${memberProfileUpdateModel.gender}:");
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
