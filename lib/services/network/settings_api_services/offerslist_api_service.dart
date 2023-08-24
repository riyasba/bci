import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../base_urls/base_urls.dart';

class OffersListApiService extends BaseApiService{
  
  Future offerslist()async{
    dynamic responseJson;
    try{
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString('auth_token');

      var response = await dio.post(
        todayOffersListApiUrl,
        options: Options(
          headers: {
            "Accept":'Application/json',
            "Authorization":"Bearer $authtoken"
          },
          followRedirects: false,
          validateStatus: (status) {
            return status!<=500;
          },

        )

      );
      print(':::::::::::<offers list api>:::::::::::::<status code>');
      print(response.data);
      print(response.statusCode);
      responseJson = response;
    }on SocketException{
      print('no internet');
    }
    return responseJson;
  }
   dynamic returnResponse(Response<dynamic>response){
    switch (response.statusCode){
      case 200:
      dynamic responseJson = response.data;
      print('here.>>>>>>>>');
      return responseJson;
    }
   }
}