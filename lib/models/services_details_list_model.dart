// To parse this JSON data, do
//
//     final serviceDetailsModel = serviceDetailsModelFromJson(jsonString);

import 'dart:convert';

ServiceDetailsModel serviceDetailsModelFromJson(String str) =>
    ServiceDetailsModel.fromJson(json.decode(str));

String serviceDetailsModelToJson(ServiceDetailsModel data) =>
    json.encode(data.toJson());

class ServiceDetailsModel {
  List<SlotDetail> slotDetail;

  ServiceDetailsModel({
    required this.slotDetail,
  });

  factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) =>
      ServiceDetailsModel(
        slotDetail: List<SlotDetail>.from(
            json["slot_detail"].map((x) => SlotDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slot_detail": List<dynamic>.from(slotDetail.map((x) => x.toJson())),
      };
}

class SlotDetail {
  int id;
  String weekday;
  String startTime;
  String endTime;
  String merchantServiceId;
  DateTime createdAt;
  DateTime updatedAt;

  SlotDetail({
    required this.id,
    required this.weekday,
    required this.startTime,
    required this.endTime,
    required this.merchantServiceId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SlotDetail.fromJson(Map<String, dynamic> json) => SlotDetail(
        id: json["id"],
        weekday: json["weekday"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        merchantServiceId: json["merchant_service_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "weekday": weekday,
        "start_time": startTime,
        "end_time": endTime,
        "merchant_service_id": merchantServiceId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
