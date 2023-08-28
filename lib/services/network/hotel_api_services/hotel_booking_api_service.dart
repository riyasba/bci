import 'dart:io';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/hotel_booking_models/get_hotel_room_model.dart';



class HotelBookingApiServices extends BaseApiService {
  Future hotelBookingApiServices({
     required String hotelName,
    required String userIp,
    required String resultIndex,
    required String hotelCode,
    required String searchToken,
    required HotelRoomsDetail hotelRoomsDetail
    }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(
        hotelBookingApiUrl,
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
    "IsPackageFare": false,
    "IsPackageDetailsMandatory": false,
    "ArrivalTransport": {
        "ArrivalTransportType": 1,
        "TransportInfoId": "DL 5H 2569",
        "Time": "2023-07-12T11:03:00"
    },
    "DepartureTransport": {
        "DepartureTransportType": 1,
        "TransportInfoId": "DL 5K 5487",
        "Time": "2023-07-13T11:04:00"
    },
    "ResultIndex": resultIndex,
    "HotelCode": hotelCode,
    "HotelName":hotelName,
    "GuestNationality": "IN",
    "NoOfRooms": "1",
    "ClientReferenceNo": 0,
    "IsVoucherBooking": true,
    "HotelRoomsDetails": [
        {
            "RoomIndex": hotelRoomsDetail.roomIndex,
            "RoomTypeCode":hotelRoomsDetail.roomTypeCode,
            "RoomTypeName":hotelRoomsDetail.roomTypeName,
            "RatePlanCode": hotelRoomsDetail.ratePlanCode,
            "BedTypeCode": null,
            "SmokingPreference": "0",
            "Supplements": null,
            "Price": {
                 "CurrencyCode": "INR",
                    "RoomPrice": hotelRoomsDetail.price.roomPrice,
                    "Tax": hotelRoomsDetail.price.tax,
                    "ExtraGuestCharge": hotelRoomsDetail.price.extraGuestCharge,
                    "ChildCharge": hotelRoomsDetail.price.childCharge,
                    "OtherCharges": hotelRoomsDetail.price.otherCharges,
                    "Discount": hotelRoomsDetail.price.discount,
                    "PublishedPrice": hotelRoomsDetail.price.publishedPrice,
                    "PublishedPriceRoundedOff": hotelRoomsDetail.price.publishedPriceRoundedOff,
                    "OfferedPrice": hotelRoomsDetail.price.offeredPrice,
                    "OfferedPriceRoundedOff": hotelRoomsDetail.price.offeredPriceRoundedOff,
                    "AgentCommission": hotelRoomsDetail.price.agentCommission,
                    "AgentMarkUp": hotelRoomsDetail.price.agentMarkUp,
                    "ServiceTax": hotelRoomsDetail.price.serviceTax,
                    "TCS": hotelRoomsDetail.price.tcs,
                    "TDS": hotelRoomsDetail.price.tds,
                    "ServiceCharge": hotelRoomsDetail.price.serviceCharge,
                    "TotalGSTAmount": hotelRoomsDetail.price.totalGstAmount,
                "GST": {
                   "CGSTAmount": hotelRoomsDetail.price.gst.cgstAmount,
                        "CGSTRate": hotelRoomsDetail.price.gst.cessRate,
                        "CessAmount": hotelRoomsDetail.price.gst.cessAmount,
                        "CessRate": hotelRoomsDetail.price.gst.cessRate,
                        "IGSTAmount": hotelRoomsDetail.price.gst.igstAmount,
                        "IGSTRate": hotelRoomsDetail.price.gst.igstRate,
                        "SGSTAmount": hotelRoomsDetail.price.gst.sgstAmount,
                        "SGSTRate": hotelRoomsDetail.price.gst.sgstRate,
                        "TaxableAmount": hotelRoomsDetail.price.gst.taxableAmount
                }
            },
            "HotelPassenger": [
                {
                    "Title": "Mr",
                    "FirstName": "Kundan",
                    "MiddleName": "Kumar",
                    "LastName": "Kumar",
                    "Phoneno": "+919910967739",
                    "Email": "anil@sctechnologies.in",
                    "PaxType": 1,
                    "LeadPassenger": "true",
                    "Age": "0",
                    "PassportNo": null,
                    "PassportIssueDate": null,
                    "PassportExpDate": null,
                    "PAN": "FCWPA5041A"
                }
            ]
        }
    ],
    "UserIp": userIp,
    "Search_Token": searchToken
}
      );
      print("::::::::<hotel booking api Services>::::::::status code::::::::::");
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
