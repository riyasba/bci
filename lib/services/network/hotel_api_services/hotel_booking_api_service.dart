import 'dart:convert';
import 'dart:io';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;
import '../../../models/hotel_booking_models/get_hotel_room_model.dart';

class HotelBookingApiServices extends BaseApiService {
  Future hotelBookingApiServices(
      {required String hotelName,
      required String userIp,
      required String resultIndex,
      required String hotelCode,
      required String searchToken,
      required String userName,
      required String mobileNumber,
      required String emailId,
      required String pancard,
      required HotelRoomsDetail hotelRoomsDetail}) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var data = {
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
        "HotelName": hotelName,
        "GuestNationality": "IN",
        "NoOfRooms": "1",
        "ClientReferenceNo": 0,
        "IsVoucherBooking": true,
        "HotelRoomsDetails": [
          {
            "RoomIndex": hotelRoomsDetail.roomIndex,
            "RoomTypeCode": hotelRoomsDetail.roomTypeCode,
            "RoomTypeName": hotelRoomsDetail.roomTypeName,
            "RatePlanCode": hotelRoomsDetail.ratePlanCode,
            "BedTypeCode": hotelRoomsDetail,
            "SmokingPreference": hotelRoomsDetail.smokingPreference,
            "Supplements": null,
            "Price": {
              "CurrencyCode": hotelRoomsDetail.price.currencyCode,
              "RoomPrice": hotelRoomsDetail.price.roomPrice,
              "Tax": hotelRoomsDetail.price.tax,
              "ExtraGuestCharge": hotelRoomsDetail.price.extraGuestCharge,
              "ChildCharge": hotelRoomsDetail.price.childCharge,
              "OtherCharges": hotelRoomsDetail.price.otherCharges,
              "Discount": hotelRoomsDetail.price.discount,
              "PublishedPrice": hotelRoomsDetail.price.publishedPrice,
              "PublishedPriceRoundedOff":
                  hotelRoomsDetail.price.publishedPriceRoundedOff,
              "OfferedPrice": hotelRoomsDetail.price.offeredPrice,
              "OfferedPriceRoundedOff":
                  hotelRoomsDetail.price.offeredPriceRoundedOff,
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
                "FirstName": userName,
                "MiddleName": "",
                "LastName": ".",
                "Phoneno": mobileNumber,
                "Email": emailId,
                "PaxType": 1,
                "LeadPassenger": "true",
                "Age": "0",
                "PassportNo": null,
                "PassportIssueDate": null,
                "PassportExpDate": null,
                "PAN": null
              }
            ]
          }
        ],
        "UserIp": "122.160.83.78",
        "Search_Token": searchToken
      };

      var data2 = {
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
        "HotelName": hotelName,
        "GuestNationality": "IN",
        "NoOfRooms": "1",
        "ClientReferenceNo": 0,
        "IsVoucherBooking": true,
        "HotelRoomsDetails": [
          {
            "AvailabilityType": hotelRoomsDetail.availabilityType.toString(),
            "ChildCount": hotelRoomsDetail.childCount,
            "RequireAllPaxDetails": hotelRoomsDetail.requireAllPaxDetails,
            "RoomId": hotelRoomsDetail.roomId,
            "RoomStatus": hotelRoomsDetail.roomStatus,
            "RoomIndex": hotelRoomsDetail.roomIndex,
            "RoomTypeCode": hotelRoomsDetail.roomTypeCode.toString(),
            "RoomDescription": hotelRoomsDetail.roomDescription.toString(),
            "RoomTypeName": hotelRoomsDetail.roomTypeName.toString(),
            "RatePlanCode": hotelRoomsDetail.ratePlanCode.toString(),
            "RatePlan": hotelRoomsDetail.ratePlan,
            "RatePlanName": hotelRoomsDetail.ratePlanName.toString(),
            "InfoSource": hotelRoomsDetail.infoSource.toString(),
            "SequenceNo": hotelRoomsDetail.sequenceNo.toString(),
            "DayRates": [
              for (int i = 0; i < hotelRoomsDetail.dayRates.length; i++)
                {
                  "Amount": hotelRoomsDetail.dayRates[i].amount,
                  "Date": hotelRoomsDetail.dayRates[i].date.toIso8601String()
                }
            ],
            "IsPerStay": hotelRoomsDetail.isPerStay,
            "SupplierPrice": hotelRoomsDetail.supplierPrice,
            "Price": {
              "CurrencyCode": hotelRoomsDetail.price.currencyCode.toString(),
              "RoomPrice": hotelRoomsDetail.price.roomPrice,
              "Tax": hotelRoomsDetail.price.tax,
              "ExtraGuestCharge": hotelRoomsDetail.price.extraGuestCharge,
              "ChildCharge": hotelRoomsDetail.price.childCharge,
              "OtherCharges":
                  hotelRoomsDetail.price.otherCharges,
              "Discount": hotelRoomsDetail.price.discount,
              "PublishedPrice": hotelRoomsDetail.price.publishedPrice,
              "PublishedPriceRoundedOff": hotelRoomsDetail.price.publishedPriceRoundedOff,
              "OfferedPrice": hotelRoomsDetail.price.offeredPrice,
              "OfferedPriceRoundedOff": hotelRoomsDetail.price.offeredPriceRoundedOff,
              "AgentCommission":
                  hotelRoomsDetail.price.agentCommission,
              "AgentMarkUp":hotelRoomsDetail.price.agentMarkUp
                  ,
              "ServiceTax": hotelRoomsDetail.price.serviceTax,
              "TCS": hotelRoomsDetail.price.tcs,
              "TDS": hotelRoomsDetail.price.tds,
              "ServiceCharge": hotelRoomsDetail.price.serviceCharge,
              "TotalGSTAmount": hotelRoomsDetail.price.totalGstAmount,
              "GST": {
                "CGSTAmount": hotelRoomsDetail.price.gst.cgstAmount,
                "CGSTRate": hotelRoomsDetail.price.gst.cgstRate,
                "CessAmount": hotelRoomsDetail.price.gst.cessAmount,
                "CessRate": hotelRoomsDetail.price.gst.cessRate,
                "IGSTAmount": hotelRoomsDetail.price.gst.igstAmount,
                "IGSTRate": hotelRoomsDetail.price.gst.igstRate,
                "SGSTAmount": hotelRoomsDetail.price.gst.sgstAmount,
                "SGSTRate": hotelRoomsDetail.price.gst.sgstRate,
                "TaxableAmount": hotelRoomsDetail.price.gst.taxableAmount,
              }
            },
            "HotelPassenger": [
              {
                "Title": "Mr",
                "FirstName": userName.trim().split(" ").first,
                "MiddleName": "",
                "LastName": userName.trim().split(" ").length > 1 ?  userName.trim().split(" ").last : ".",
                "Phoneno": mobileNumber,
                "Email": emailId,
                "PaxType": 1,
                "LeadPassenger": true,
                "Age": 0,
                "PassportNo": null,
                "PassportIssueDate": null,
                "PassportExpDate": null,
                "PAN": pancard
              }
            ]
          }
        ],
        "UserIp": "122.160.83.78",
        "Search_Token": searchToken
      };

      developer.log(
          "----------------------------------------------------->>Booking data");
      developer.log(data2.toString(), name: "hotel booking");

      var response = await dio.post(hotelBookingApiUrl,
          options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: data2);
      print(
          "::::::::<hotel booking api Services>::::::::status code::::::::::");
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
