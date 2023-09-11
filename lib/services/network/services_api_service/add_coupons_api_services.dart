import 'dart:io';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCouponsApiServices extends BaseApiService {
  Future addCouponsApiServices({
    required String image,
    required String title,
    required String category,
    required String startsat,
    required String endsat,
    required String discountValue,
    required String description,
    required String merchantId,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();

      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(image,
            filename: image.split("/").last),
        "title": title,
        "category": category.toString(),
        "starts_at": startsat,
        "ends_at": endsat,
        "coupon_amount": discountValue,
        "description": description,
        "merchant": merchantId,
        "buy_amount": discountValue
      });

      print(formData.fields);

      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(addCouponsURL,
          options: Options(
              headers: {'Authorization': 'Bearer $authtoken'},
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formData);
      print("::::::::<Add Coupons api services>::::::::status code::::::::::");
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
