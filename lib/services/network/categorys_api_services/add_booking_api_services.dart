import 'dart:io';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddBookingApiServices extends BaseApiService {
  Future addBookingApiServices({
    required String serviceid,
    required String cartid,
    required String qty,
    required String offerOrCoupon,
    required String couponcode,
    required String amount,
    required String bookDateTime
    }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(
        addBookingApiUrl,
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
              "service_id" : serviceid,
              "cart_id": cartid,
              "quantity":qty,
              "offer_or_coupon": "offer",
              "coupon_code": couponcode,
              "amount": amount,
              "book_date_time": bookDateTime
            }
      );
      print("::::::::<Add booking Api Services Api>::::::::status code::::::::::");
      print("....<$serviceid>...<$cartid>...<$qty>...<$amount>...<$couponcode>..<$bookDateTime>.***");
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
