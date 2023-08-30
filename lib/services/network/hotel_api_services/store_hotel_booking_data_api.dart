import 'dart:io';
import 'package:bci/models/hotel_booking_models/hotel_booking_store_data_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreHotelBookingApiServices extends BaseApiService {
  Future storeHotelBooking({
    required HotelBookingStroreData hotelBookingStoreData
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(storeHotelBookingURL,
          options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "user_id": hotelBookingStoreData.userId,
            "hotel_name": hotelBookingStoreData.hotelName,
            "hotel_image": hotelBookingStoreData.hotelImage,
            "hotel_contact": hotelBookingStoreData.hotelContact,
            "no_of_people": hotelBookingStoreData.noOfPeople,
            "no_of_days": hotelBookingStoreData.noOfDays,
            "place": hotelBookingStoreData.place,
            "user_name": hotelBookingStoreData.userName,
            "booking_ref_no": hotelBookingStoreData.bookingRefNo,
            "booking_id": hotelBookingStoreData.bookingId,
            "booking_date": hotelBookingStoreData.bookingDate,
            "hotel_booking_status": hotelBookingStoreData.hotelBookingStatus,
            "confirmation_no": hotelBookingStoreData.confirmationNo,
            "is_price_changed": hotelBookingStoreData.isPriceChanged,
            "is_cancel_policy_changed": hotelBookingStoreData.isCancelPolicyChanged,
            "price": hotelBookingStoreData.price
          });
      print(
          "::::::::<hotel store Services Api>:::::::::");
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
