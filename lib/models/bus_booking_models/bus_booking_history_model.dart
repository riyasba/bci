// To parse this JSON data, do
//
//     final busHistoryModel = busHistoryModelFromJson(jsonString);

import 'dart:convert';

BusHistoryModel busHistoryModelFromJson(String str) =>
    BusHistoryModel.fromJson(json.decode(str));

String busHistoryModelToJson(BusHistoryModel data) =>
    json.encode(data.toJson());

class BusHistoryModel {
  String message;
  bool status;
  List<BookingHistoryData> data;

  BusHistoryModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory BusHistoryModel.fromJson(Map<String, dynamic> json) =>
      BusHistoryModel(
        message: json["message"],
        status: json["status"],
        data: List<BookingHistoryData>.from(
            json["data"].map((x) => BookingHistoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BookingHistoryData {
  int id;
  dynamic userId;
  String remarks;
  String fromCitycode;
  String toCitycode;
  String fromCityname;
  String toCityname;
  String bookingRefno;
  String busName;
  String bookingDate;
  dynamic createdBy;
  DateTime createdAt;
  DateTime updatedAt;

  BookingHistoryData({
    required this.id,
    required this.userId,
    required this.remarks,
    required this.fromCitycode,
    required this.toCitycode,
    required this.fromCityname,
    required this.toCityname,
    required this.bookingRefno,
    required this.busName,
    required this.bookingDate,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingHistoryData.fromJson(Map<String, dynamic> json) =>
      BookingHistoryData(
        id: json["id"],
        userId: json["user_id"],
        remarks: json["remarks"],
        fromCitycode: json["from_citycode"],
        toCitycode: json["to_citycode"],
        fromCityname: json["from_cityname"],
        toCityname: json["to_cityname"],
        bookingRefno: json["booking_refno"],
        busName: json["busName"],
        bookingDate: json["booking_date"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "remarks": remarks,
        "from_citycode": fromCitycode,
        "to_citycode": toCitycode,
        "from_cityname": fromCityname,
        "to_cityname": toCityname,
        "booking_refno": bookingRefno,
        "busName": busName,
        "booking_date": bookingDate,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
