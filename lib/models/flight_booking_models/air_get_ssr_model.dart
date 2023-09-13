// To parse this JSON data, do
//
//     final getSsrModel = getSsrModelFromJson(jsonString);

import 'dart:convert';

GetSsrModel getSsrModelFromJson(String str) =>
    GetSsrModel.fromJson(json.decode(str));

String getSsrModelToJson(GetSsrModel data) => json.encode(data.toJson());

class GetSsrModel {
  ResponseHeader responseHeader;
  List<SsrFlightDetail> ssrFlightDetails;

  GetSsrModel({
    required this.responseHeader,
    required this.ssrFlightDetails,
  });

  factory GetSsrModel.fromJson(Map<String, dynamic> json) => GetSsrModel(
        responseHeader: ResponseHeader.fromJson(json["Response_Header"]),
        ssrFlightDetails: List<SsrFlightDetail>.from(
            json["SSRFlightDetails"].map((x) => SsrFlightDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Response_Header": responseHeader.toJson(),
        "SSRFlightDetails":
            List<dynamic>.from(ssrFlightDetails.map((x) => x.toJson())),
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

class SsrFlightDetail {
  List<SsrDetail> ssrDetails;

  SsrFlightDetail({
    required this.ssrDetails,
  });

  factory SsrFlightDetail.fromJson(Map<String, dynamic> json) =>
      SsrFlightDetail(
        ssrDetails: List<SsrDetail>.from(
            json["SSRDetails"].map((x) => SsrDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "SSRDetails": List<dynamic>.from(ssrDetails.map((x) => x.toJson())),
      };
}

class SsrDetail {
  List<int> applicablePaxTypes;
  String currencyCode;
  String flightId;
  int legIndex;
  String? ssrCode;
  String ssrKey;
  int ssrStatus;
  int ssrType;
  String ssrTypeDesc;
  String ssrTypeName;
  int segmentId;
  bool segmentWise;
  int totalAmount;

  SsrDetail({
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

  factory SsrDetail.fromJson(Map<String, dynamic> json) => SsrDetail(
        applicablePaxTypes:
            List<int>.from(json["ApplicablePaxTypes"].map((x) => x)),
        currencyCode: json["Currency_Code"],
        flightId: json["Flight_ID"],
        legIndex: json["Leg_Index"],
        ssrCode: json["SSR_Code"],
        ssrKey: json["SSR_Key"],
        ssrStatus: json["SSR_Status"],
        ssrType: json["SSR_Type"],
        ssrTypeDesc: json["SSR_TypeDesc"],
        ssrTypeName: json["SSR_TypeName"],
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


