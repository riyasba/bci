import 'dart:io';
import 'dart:math';
import 'package:bci/models/bus_booking_models/pax_list_model.dart';
import 'package:bci/models/bus_booking_models/search_bus_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusTempTicketBookingApiService extends BaseApiService {
  Future busTempTicketBooking(
      {required String boardingId,
      required String droppingId,
      required Bus busData,
      required String searcKey,
      required String seatMapKey,
      required String mobileNumber,
      required String customerEmail,
      required List<PaxDetailslist> paxDetailslist}) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      // var sendingData = {
      //   "imei_Number": "726736735476234",
      //   "boarding_id": boardingId,
      //   "dropping_id": droppingId,
      //   "bus_key": busData.busKey,
      //   "search_key": searcKey
      // };

      // print(sendingData);
      // print(searcKey);

      var response = await dio.post(busTempBooking,
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
            "Auth_Header": {
              "Request_Id": "${Random().nextInt(10000000)}",
              "IP_Address": "101.188.67.134",
              "IMEI_Number": "87678678686"
            },
            "Boarding_Id": boardingId,
            "Bus_Key": busData.busKey,
            "CorporatePaymentMode": 0,
            "CorporateStatus": "0",
            "CostCenterId": 0,
            "Customer_Mobile": mobileNumber,
            "Deal_Key": "",
            "Dropping_Id": droppingId,
            "GST": false,
            "GSTIN": "",
            "GSTINHolderAddress": "",
            "GSTINHolderName": "",
            "PAX_Details": [
              for (int i = 0; i < paxDetailslist.length; i++)
                {
                  "Age": paxDetailslist[i].age,
                  "DOB": "05/06/1984",
                  "Gender": paxDetailslist[i].gender,
                  "Id_Number": "0",
                  "Id_Type": 0,
                  "Ladies_Seat": paxDetailslist[i].isLadies,
                  "PAX_Id": i + 1,
                  "PAX_Name": paxDetailslist[i].paxName,
                  "Penalty_Charge": "",
                  "Primary": false,
                  "Seat_Number": paxDetailslist[i].seatNumber,
                  "Status": "",
                  "Ticket_Number": "",
                  "Title": "Mr"
                }
            ],
            "Passenger_Email": customerEmail,
            "Passenger_Mobile": mobileNumber,
            "ProjectId": 1,
            "Remarks":
                "Bus ${busData.fromCity} - ${busData.toCity} - ${busData.travelDate}",
            "Search_Key": searcKey,
            "SeatMap_Key": seatMapKey,
            "SendEmail": "false",
            "SendSMS": "false"
          });
      print("::::::::<bus-seat map list Api>::::::::status code::::::::::");
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
