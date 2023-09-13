import 'dart:io';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

class SearchHotelListApiService extends BaseApiService {
  Future searchhotelListApiService({
    required String checkindate,
    required String destination,
    required String countryCode,
    required String checkoutdate,
    required int adult,
    required int child,
  //  required int childage,
    required String roomsno,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      // var data = {
      //   "BookingMode": "5",
      //   "CheckInDate": checkindate,
      //   "CheckOutDate": checkoutdate,
      //   "NoOfNights": "1",
      //   "CountryCode": "IN",
      //   "DestinationCityId": destination,
      //   "ResultCount": Null,
      //   "Currency": "INR",
      //   "GuestNationality": "IN",
      //   "NoOfRooms": roomsno,
      //   "RoomGuests": [
      //     {
      //       "Adult": adult,
      //       "Child": child,
      //       "ChildAge": Null,
      //     }
      //   ],
      //   "MaxRating": "5",
      //   "MinRating": "0",
      //   "UserIp": "122.160.83.78"
      // };

      var data2={
    "BookingMode": "5",
    "CheckInDate": checkindate,
    "CheckOutDate": checkoutdate,
    "NoOfNights": "1",
    "CountryCode": "IN",
    "DestinationCityId": destination,
    "ResultCount": null,
    "Currency": "INR",
    "GuestNationality": "IN",
    "NoOfRooms": roomsno,
    "RoomGuests": [
        {
            "Adult": adult.toString(),
            "Child": child.toString(),
            "ChildAge":null,
            // child < 0 ? 2 : null,
        }
    ],
    "MaxRating": "5",
    "MinRating": "0",
    "UserIp": "122.160.83.78"
};
   
       developer.log(
          "----------------------------------------------------->>Search Data");
      developer.log(data2.toString(), name: "hotel Search request");

      var response = await dio.post(searchHotelApiUrl,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $authtoken'
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
          ),
          data: data2);
      print("::::::::<search HOTEL - list Api>::::::::status code::::::::::");
        print(response.statusCode);
        developer.log(
          "----------------------------------------------------->>Search Data Response");
      developer.log(response.data.toString(), name: "hotel Search response");
     
      // print(response.data);
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