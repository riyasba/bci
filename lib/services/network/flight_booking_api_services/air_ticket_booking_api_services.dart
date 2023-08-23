import 'dart:io';
import 'package:bci/models/flight_booking_models/air_search_model.dart';
import 'package:bci/models/flight_booking_models/booking_model.dart';
import 'package:bci/models/flight_booking_models/flight_search_data_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AirTicketBookingApiServices extends BaseApiService {
  Future airTicketBookingApiServices({
    required BookingModel bookingModel,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var data = {
        "Auth_Header": {
          "UserId": "benzclub",
          "Password": "B39F285E37EDCE355386E79CFD8A979ACE740A1E",
          "IP_Address": "101.188.67.134",
          "Request_Id": "5645645645646674",
          "IMEI_Number": "2232323232323"
        },
        "Customer_Mobile": bookingModel.customerMobile,
        "Passenger_Mobile": bookingModel.passengerMobile,
        "WhatsAPP_Mobile": null,
        "Passenger_Email": bookingModel.passengerEmail,
        // "PAX_Details":
        //     List<dynamic>.from(bookingModel.paxDetails.map((x) => x.toJson())),
        "PAX_Details": [
          {
            "Pax_Id": 1,
            "Pax_type": 0,
            "Title": "Mr",
            "First_Name": "Testing",
            "Last_Name": "Sample",
            "Gender": 0,
            "Age": null,
            "DOB": null,
            "Passport_Number": null,
            "Passport_Issuing_Country": null,
            "Passport_Expiry": null,
            "Nationality": null,
            "FrequentFlyerDetails": null
          }
        ],
        "GST": false,
        "GST_Number": "",
        "GST_HolderName": "GST Holder Name",
        "GST_Address": "GST Address",
        "BookingFlightDetails": [
          {
            "Search_Key": bookingModel.searchKey,
            "Flight_Key": bookingModel.flightKey,
            "BookingSSRDetails": []
          }
        ],
        "CostCenterId": 0,
        "ProjectId": 0,
        "BookingRemark": bookingModel.bookingRemark,
        "CorporateStatus": 0,
        "CorporatePaymentMode": 0,
        "MissedSavingReason": null,
        "CorpTripType": null,
        "CorpTripSubType": null,
        "TripRequestId": null,
        "BookingAlertIds": null
      };

      var data2 = {
        "Auth_Header": {
          "UserId": "benzclub",
          "Password": "B39F285E37EDCE355386E79CFD8A979ACE740A1E",
          "IP_Address": "101.188.67.134",
          "Request_Id": "5645645645646674",
          "IMEI_Number": "2232323232323"
        },
        "Customer_Mobile": "8157868869",
        "Passenger_Mobile": "8157868869",
        "WhatsAPP_Mobile": null,
        "Passenger_Email": "demo@outlook.com",
        "PAX_Details": [
          {
            "Pax_Id": 1,
            "Pax_type": 0,
            "Title": "Mr",
            "First_Name": "Testing",
            "Last_Name": "Sample",
            "Gender": 0,
            "Age": null,
            "DOB": null,
            "Passport_Number": null,
            "Passport_Issuing_Country": null,
            "Passport_Expiry": null,
            "Nationality": null,
            "FrequentFlyerDetails": null
          }
        ],
        "GST": false,
        "GST_Number": "",
        "GST_HolderName": "GST Holder Name",
        "GST_Address": "GST Address",
        "BookingFlightDetails": [
          {
            "Search_Key":
                "AOpXy8FMqMwsMbSclpdQNGBvbD/sbrBkITV1Jj6uwQ546+bjOEAV1iz8W/PzCN1ZJ4HpZ6atNspc9xsgJOigvpJcylfC5Oj6UV3TRtys09LVCLQsgLuCeTnB96uMQ6IibqQ5BT242N83qCQTWiwX3Tk8lDWGhLx3idXvfM1KmTI3OMcPmJrRd9/jERAhsz+P091A/F68S/fPLRzCB8+9Nv1bHPHIxb/jiTOtEhU4PO7jKSiTZoBHKzqyF3vChFlT8dGj2C9l3JkHNgWJp598qUZzFFdqgva8noh0jkC9jdUmvu5hykveprcB3yamFBggbGs8yB27FWAhhFmVtEQpEh7ti1+1LSVlohbY2F+NSYcFze022J5/AyqsJNA6xcerqb8MY9a7hNn+x4dmF1EpGkoIa35F38/BJLq5lujc+NmWjjjJ0nJDcvLrOXKTR9jS68a/CbkQZAqYvoCquJchf4KhnceOUVL/OsU/rDoGlkyANi1Cd75HDBY5n3AnWLKHEsIYzI6Z5ppVZ/ttwo8uBtdyCcSWLGuVbjdYaPcbGcICOWswm2V9IpzwFQOVU93wId3V1C2XCoJD8Ws//VJGqxJPGLNzvXrmiwb0Ne6+F6pgiZD+/c70WMF8HvCcKO2rXuGa7QigUoEJnqfLN6cR8RC9/TX/eEsLNGaHvrsGJ39qsOmD3BnWIeF6aDWpSRw1",
            "Flight_Key":
                "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",
            "BookingSSRDetails": []
          }
        ],
        "CostCenterId": 0,
        "ProjectId": 0,
        "BookingRemark": "MAA-COK  25-Jul-2023  Test API With GST",
        "CorporateStatus": 0,
        "CorporatePaymentMode": 0,
        "MissedSavingReason": null,
        "CorpTripType": null,
        "CorpTripSubType": null,
        "TripRequestId": null,
        "BookingAlertIds": null
      };

      var data3 = {
        "Auth_Header": {
          "UserId": "benzclub",
          "Password": "B39F285E37EDCE355386E79CFD8A979ACE740A1E",
          "IP_Address": "101.188.67.134",
          "Request_Id": "5645645645646674",
          "IMEI_Number": "2232323232323"
        },
        "Customer_Mobile": "8157868869",
        "Passenger_Mobile": "8157868869",
        "WhatsAPP_Mobile": null,
        "Passenger_Email": "demo@outlook.com",
        "PAX_Details": [
          {
            "Pax_Id": 1,
            "Pax_type": 0,
            "Title": "Mr",
            "First_Name": "Testing",
            "Last_Name": "Sample",
            "Gender": 0,
            "Age": null,
            "DOB": null,
            "Passport_Number": null,
            "Passport_Issuing_Country": null,
            "Passport_Expiry": null,
            "Nationality": null,
            "FrequentFlyerDetails": null
          }
        ],
        "GST": false,
        "GST_Number": "",
        "GST_HolderName": "GST Holder Name",
        "GST_Address": "GST Address",
        "BookingFlightDetails": [
          {
            "Search_Key": "AueFBsc7uAypjB73Wf23TYVuWPHiJDicQl0PJi1tp8I6AstGC8tJ2pC+RtjIV3Pa9mKFRxgSO1cDG9w88l75wunJaYCO3WV4PxzIz7zxp4o52uq4CKOGSVM5xSUFhc8QVq7oiuuPKchXzpuvjfT7paykp8DZW5W3o231LAOwLGkha8LiHZYcMxgW2RXGb6+c0OmOwngy4pGtA+CDh6wzQ48iOsvEWeA+1fQJqagiDwm9X64d5H0OF436vPcXPZpWh1mY2E7L6Hg/JeYJgaFtrXAmZJ+rB0ImJrPxZraqz59sPp4SYxcT7YsMewxNqlCu3vwvxOM9oDhCGQDNMxVk7iWS+vB2Yey6f2NI3P0sD8nsekj1fh8rC1f8njdhunki9A/PaiuSxiCfPsb5BhOKGSvO9KOZOzsgCpK7NlMM11QkXN21/U8BfyI6XyM/wnB9z28awWElIHA6tiTzkR7lRtv4RS3Yqxp2Yd4CRsznDv4/jEL9zvaaKZtnxHs1x+yDE64rlI9Tt9XfY/bq1wjIV9zmb46eGu9TyawzCl97Dr/w73Z+e8wxG6EO3pqFaDiza2gLd5zvlptH0NPVEyb4IdT8qdqGCYHR+LNuASwbvJpNE+3zQLGYJ1waQSQRPadH1onc3285JCDhuVwm3JiZmEOwJglSMLDeNNFftzdboe+YJIUYBQ3DUjEvM6S7c/IY",
            "Flight_Key": "X4cGw7WJYawDuDNaolNU8yDr1M5s8ekWXUj4dyF1jSd3R1G8D5ns2aDxglfJKQPr03/JslI2+5W3vJwEdoF8bF4NKr1i+EqXxOXzkOisJkfUsFIPCKhBBhg3bW/T7oIdpG6fUw58pTUpIw7QjarPP+L7UZaWnSfa+nQMCXAuFMeZo5iPQH4M16rObnU7oB0IZsYD5/K78V4xibuPdLvlL4e1FkUZZDz4X5L1dwz6xe5HvfX1YJ0IZtZ6UbZno51wnvKD/2CpnLMIuxhdjsxPCiAkmZjCotGK7j+6D5SR9n7As6f4f53X33CG71G98DOou8JnX5qY9TDUJ1cg/kDkQfaeusiuW5MLLXDm43o4BRxjS1uWUNqRB0so5kn5BlUR9fhy2x2GAZBetaV0hUaMHThrsfqGRaJCTV3gz059GJl6GOd8UQPz//bhX9MZ+Ir/xvQ9wTqn2vMmybjJqX8sHE1VvbEPNkyzhxwuNTClBgThruM6uLZNFMVY/jsnAZMtyj6L4N1CrdZIbPNZToOXXP2LXKcB91/wSLNBM85cSYK2VOK1lQaJMTYa2pORFPtPbXuw8FPFZi07hrjYciQSPX3v9g1A0/9pjV6BtSaDN5AZCdIcXR+Bj6NpzHa7c5PVGTFlxqVlb49Tf9uenmFRaAPFp8uMPvGZbNN8avqCATmf0/HCa/RinVyUPOtuOJI/msRa8elogEQvPE7fEeEcy5JTgEj24igt8tz6FC+Xf0SG8vIQbE5jkdduwMKLsNz25/mi6BNhZEwZ7cxy4nQU8MLoAnaaBblFHgyU+7GCWTJmLeFDZmhm00HKsLfVxP+HF8jl0xuClHmMCXx4m1QKO/h5sytylxdFRZ3dmV9VhWZ556OBo3Ic9V4mXlIHLt218XbMXKkAesP5OTgSLQKYKuLkPx1o2KEP0b06neMNN7MbV+ElXx5VKowNtSStuQBbdjfbQGesFeBHmvJXteRdE491wpZgwMxxCAHx0U758Sn11dvQPbC/y9k9PDbm5Ku",
            "BookingSSRDetails": []
          }
        ],
        "CostCenterId": 0,
        "ProjectId": 0,
        "BookingRemark": "MAA-COK  25-Jul-2023  Test API With GST",
        "CorporateStatus": 0,
        "CorporatePaymentMode": 0,
        "MissedSavingReason": null,
        "CorpTripType": null,
        "CorpTripSubType": null,
        "TripRequestId": null,
        "BookingAlertIds": null
      };

      print(data);

      var response = await dio.post(airTicketBookingUrl,
          options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: data);
      print("::::::::<--Air Ticket booking-->::::::::status code::::::::::");
      print("---------->>Search key");
      print(bookingModel.searchKey);
      print("---------->>Flight key");
      print(bookingModel.flightKey);
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
