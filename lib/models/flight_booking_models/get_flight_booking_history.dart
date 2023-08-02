// To parse this JSON data, do
//
//     final getFlightsModel = getFlightsModelFromJson(jsonString);

import 'dart:convert';

GetFlightsModel getFlightsModelFromJson(String str) =>
    GetFlightsModel.fromJson(json.decode(str));

String getFlightsModelToJson(GetFlightsModel data) =>
    json.encode(data.toJson());

class GetFlightsModel {
  String message;
  bool status;
  List<FlightBookedData> data;

  GetFlightsModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory GetFlightsModel.fromJson(Map<String, dynamic> json) =>
      GetFlightsModel(
        message: json["message"],
        status: json["status"],
        data: List<FlightBookedData>.from(
            json["data"].map((x) => FlightBookedData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FlightBookedData {
  int id;
  dynamic userId;
  String invoiceNumber;
  String remark;
  String fromCitycode;
  String toCitycode;
  String fromCityname;
  String toCityname;
  String bookingRefNo;
  String airlineCode;
  String bookingDate;
  dynamic createdBy;
  DateTime createdAt;
  DateTime updatedAt;

  FlightBookedData({
    required this.id,
    required this.userId,
    required this.invoiceNumber,
    required this.remark,
    required this.fromCitycode,
    required this.toCitycode,
    required this.fromCityname,
    required this.toCityname,
    required this.bookingRefNo,
    required this.airlineCode,
    required this.bookingDate,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FlightBookedData.fromJson(Map<String, dynamic> json) =>
      FlightBookedData(
        id: json["id"],
        userId: json["user_id"],
        invoiceNumber: json["invoice_number"],
        remark: json["remark"],
        fromCitycode: json["from_citycode"],
        toCitycode: json["to_citycode"],
        fromCityname: json["from_cityname"],
        toCityname: json["to_cityname"],
        bookingRefNo: json["booking_ref_no"],
        airlineCode: json["airline_code"],
        bookingDate: json["booking_date"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "invoice_number": invoiceNumber,
        "remark": remark,
        "from_citycode": fromCitycode,
        "to_citycode": toCitycode,
        "from_cityname": fromCityname,
        "to_cityname": toCityname,
        "booking_ref_no": bookingRefNo,
        "airline_code": airlineCode,
        "booking_date": bookingDate,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
