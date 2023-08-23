// To parse this JSON data, do
//
//     final airSeatMapModel = airSeatMapModelFromJson(jsonString);

import 'dart:convert';

AirSeatMapModel airSeatMapModelFromJson(String str) =>
    AirSeatMapModel.fromJson(json.decode(str));

String airSeatMapModelToJson(AirSeatMapModel data) =>
    json.encode(data.toJson());

class AirSeatMapModel {
  List<AirSeatMap> airSeatMaps;
  ResponseHeader responseHeader;

  AirSeatMapModel({
    required this.airSeatMaps,
    required this.responseHeader,
  });

  factory AirSeatMapModel.fromJson(Map<String, dynamic> json) =>
      AirSeatMapModel(
        airSeatMaps: List<AirSeatMap>.from(
            json["AirSeatMaps"].map((x) => AirSeatMap.fromJson(x))),
        responseHeader: ResponseHeader.fromJson(json["Response_Header"]),
      );

  Map<String, dynamic> toJson() => {
        "AirSeatMaps": List<dynamic>.from(airSeatMaps.map((x) => x.toJson())),
        "Response_Header": responseHeader.toJson(),
      };
}

class AirSeatMap {
  String flightId;
  List<SeatSegment> seatSegments;

  AirSeatMap({
    required this.flightId,
    required this.seatSegments,
  });

  factory AirSeatMap.fromJson(Map<String, dynamic> json) => AirSeatMap(
        flightId: json["Flight_Id"],
        seatSegments: List<SeatSegment>.from(
            json["Seat_Segments"].map((x) => SeatSegment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Flight_Id": flightId,
        "Seat_Segments":
            List<dynamic>.from(seatSegments.map((x) => x.toJson())),
      };
}

class SeatSegment {
  int legIndex;
  List<SeatRow> seatRow;

  SeatSegment({
    required this.legIndex,
    required this.seatRow,
  });

  factory SeatSegment.fromJson(Map<String, dynamic> json) => SeatSegment(
        legIndex: json["Leg_Index"],
        seatRow: List<SeatRow>.from(
            json["Seat_Row"].map((x) => SeatRow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Leg_Index": legIndex,
        "Seat_Row": List<dynamic>.from(seatRow.map((x) => x.toJson())),
      };
}

class SeatRow {
  List<SeatDetail> seatDetails;

  SeatRow({
    required this.seatDetails,
  });

  factory SeatRow.fromJson(Map<String, dynamic> json) => SeatRow(
        seatDetails: List<SeatDetail>.from(
            json["Seat_Details"].map((x) => SeatDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Seat_Details": List<dynamic>.from(seatDetails.map((x) => x.toJson())),
      };
}

class SeatDetail {
  List<int> applicablePaxTypes;
  dynamic currencyCode;
  String flightId;
  int legIndex;
  dynamic ssrCode;
  String ssrKey;
  int ssrStatus;
  int ssrType;
  String ssrTypeDesc;
  String ssrTypeName;
  int segmentId;
  bool segmentWise;
  int totalAmount;

  SeatDetail({
    required this.applicablePaxTypes,
    required this.currencyCode,
    required this.flightId,
    required this.legIndex,
    required this.ssrCode,
    required this.ssrKey,
    required this.ssrStatus,
    required this.ssrType,
    required this.ssrTypeDesc,
    required this.ssrTypeName,
    required this.segmentId,
    required this.segmentWise,
    required this.totalAmount,
  });

  factory SeatDetail.fromJson(Map<String, dynamic> json) => SeatDetail(
        applicablePaxTypes:
            List<int>.from(json["ApplicablePaxTypes"].map((x) => x)),
        currencyCode: json["Currency_Code"],
        flightId: json["Flight_ID"] ?? "",
        legIndex: json["Leg_Index"],
        ssrCode: json["SSR_Code"],
        ssrKey: json["SSR_Key"] ?? "",
        ssrStatus: json["SSR_Status"],
        ssrType: json["SSR_Type"],
        ssrTypeDesc: json["SSR_TypeDesc"] ?? "",
        ssrTypeName: json["SSR_TypeName"] ?? "",
        segmentId: json["Segment_Id"],
        segmentWise: json["Segment_Wise"],
        totalAmount: json["Total_Amount"],
      );

  Map<String, dynamic> toJson() => {
        "ApplicablePaxTypes":
            List<dynamic>.from(applicablePaxTypes.map((x) => x)),
        "Currency_Code": currencyCode,
        "Flight_ID": flightId,
        "Leg_Index": legIndex,
        "SSR_Code": ssrCode,
        "SSR_Key": ssrKey,
        "SSR_Status": ssrStatus,
        "SSR_Type": ssrType,
        "SSR_TypeDesc": ssrTypeDesc,
        "SSR_TypeName": ssrTypeName,
        "Segment_Id": segmentId,
        "Segment_Wise": segmentWise,
        "Total_Amount": totalAmount,
      };
}



class ResponseHeader {
  String errorCode;
  String errorDesc;
  String errorInnerException;
  String requestId;
  String statusId;

  ResponseHeader({
    required this.errorCode,
    required this.errorDesc,
    required this.errorInnerException,
    required this.requestId,
    required this.statusId,
  });

  factory ResponseHeader.fromJson(Map<String, dynamic> json) => ResponseHeader(
        errorCode: json["Error_Code"],
        errorDesc: json["Error_Desc"],
        errorInnerException: json["Error_InnerException"],
        requestId: json["Request_Id"],
        statusId: json["Status_Id"],
      );

  Map<String, dynamic> toJson() => {
        "Error_Code": errorCode,
        "Error_Desc": errorDesc,
        "Error_InnerException": errorInnerException,
        "Request_Id": requestId,
        "Status_Id": statusId,
      };
}


