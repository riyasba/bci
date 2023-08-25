import 'dart:io';
import 'package:bci/models/hotel_booking_models/get_hotel_room_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlockRoomApiService extends BaseApiService {
  Future blockRoomApiService({
    required String userIp,
    required String resultIndex,
    required String hotelCode,
    required String hotelName,
    required String searchToken,
    required HotelRoomsDetail hotelRoomsDetail
    }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(
        blockRoomApiUrl,
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
    "ResultIndex": resultIndex,
    "HotelCode": hotelCode,
    "HotelName": hotelName,
    "GuestNationality": "IN",
    "NoOfRooms": "1",
    "HotelRoomsDetails": [
        {
            "AvailabilityType": hotelRoomsDetail.availabilityType,
            "ChildCount": hotelRoomsDetail.childCount,
            "RequireAllPaxDetails": hotelRoomsDetail.requireAllPaxDetails,
            "RoomId": hotelRoomsDetail.roomId,
            "RoomStatus": hotelRoomsDetail.roomStatus,
            "RoomIndex": hotelRoomsDetail.roomIndex,
            "RoomTypeCode": hotelRoomsDetail.roomTypeCode,
                "RoomDescription": hotelRoomsDetail.roomDescription,
                "RoomTypeName": hotelRoomsDetail.roomTypeName,
                "RatePlanCode": hotelRoomsDetail.ratePlanCode,
                "RatePlan": hotelRoomsDetail.ratePlan,
                "RatePlanName": hotelRoomsDetail.ratePlanName,
                "InfoSource": hotelRoomsDetail.infoSource,
                "SequenceNo": hotelRoomsDetail.sequenceNo,
            "DayRates": [
                    {
                        "Amount": hotelRoomsDetail.dayRates.first.amount,
                        "Date": hotelRoomsDetail.dayRates.first.date
                    }
                ],
                "IsPerStay": hotelRoomsDetail.isPerStay,
                "SupplierPrice": hotelRoomsDetail.supplierPrice,
            "Price": {
                    "CurrencyCode": hotelRoomsDetail.price.currencyCode,
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
           "RoomPromotion": hotelRoomsDetail.roomPromotion,
                "Amenities": hotelRoomsDetail.amenities,
                "Amenity": hotelRoomsDetail.amenity,
                "SmokingPreference": hotelRoomsDetail.smokingPreference,
            "BedTypes": hotelRoomsDetail.bedTypes,
            "HotelSupplements": hotelRoomsDetail.hotelSupplements,
             "LastCancellationDate": hotelRoomsDetail.lastCancellationDate,
                "CancellationPolicies": [
                  for(int i = 0; i < hotelRoomsDetail.cancellationPolicies.length; i++ )
                    {
                        "Charge": hotelRoomsDetail.cancellationPolicies[i].charge,
                        "ChargeType": hotelRoomsDetail.cancellationPolicies[i].chargeType,
                        "Currency": hotelRoomsDetail.cancellationPolicies[i].currency,
                        "FromDate": hotelRoomsDetail.cancellationPolicies[i].fromDate,
                        "ToDate": hotelRoomsDetail.cancellationPolicies[i].toDate
                    },
                   
                ],
                "LastVoucherDate": hotelRoomsDetail.lastVoucherDate,
                "CancellationPolicy": hotelRoomsDetail.cancellationPolicy,
                "Inclusion": hotelRoomsDetail.inclusion,
            "IsPassportMandatory": hotelRoomsDetail.isPassportMandatory,
            "IsPANMandatory": hotelRoomsDetail.isPanMandatory,
            "BedTypeCode": hotelRoomsDetail.bedTypes,
            "Supplements": null
        }
    ],
    "UserIp": userIp,
    "Search_Token": searchToken
}
      );
      print("::::::::<block room api service>::::::::status code::::::::::");
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
