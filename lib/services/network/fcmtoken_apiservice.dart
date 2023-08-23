import 'dart:io';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FcmTokenStoreApiService extends BaseApiService {
  Future fcmTokenStoreApiService({required String token}) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      String? id = prefs.getString("id");
      var response = await dio.post(fcmTokenStoreApiUrl,
          options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $authtoken',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
              data: {
                "token":token,
                "id":id
              }
              );
              
      print("::::::::<fcmTokenStoreApiService-api>::::::::status code::::::::::::::");
      print(".....$token");
      print(".....$id");
      print(response.statusCode);
      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }
}