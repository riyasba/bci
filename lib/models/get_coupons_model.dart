// To parse this JSON data, do
//
//     final getCouponsList = getCouponsListFromJson(jsonString);

import 'dart:convert';

GetCouponsList getCouponsListFromJson(String str) =>
    GetCouponsList.fromJson(json.decode(str));

String getCouponsListToJson(GetCouponsList data) => json.encode(data.toJson());

class GetCouponsList {
  String message;
  List<CouponsData> data;

  GetCouponsList({
    required this.message,
    required this.data,
  });

  factory GetCouponsList.fromJson(Map<String, dynamic> json) => GetCouponsList(
        message: json["message"],
        data: List<CouponsData>.from(
            json["data"].map((x) => CouponsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CouponsData {
  int id;
  String userId;
  String cId;
  String planId;
  String? serviceId;
  String? vendorId;
  String couponcode;
  dynamic image;
  String amount;
  String isRedeemed;
  DateTime expiryAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic name;
  String description;

  CouponsData(
      {required this.id,
      required this.userId,
      required this.cId,
      required this.planId,
      required this.serviceId,
      required this.vendorId,
      required this.couponcode,
      required this.image,
      required this.amount,
      required this.isRedeemed,
      required this.expiryAt,
      required this.createdAt,
      required this.updatedAt,
      required this.name,
      required this.description});

  factory CouponsData.fromJson(Map<String, dynamic> json) => CouponsData(
      id: json["id"],
      userId: json["user_id"],
      cId: json["c_id"],
      planId: json["plan_id"],
      serviceId: json["service_id"],
      vendorId: json["vendor_id"],
      couponcode: json["couponcode"],
      image: json["image"] ?? "null",
      amount: json["amount"],
      isRedeemed: json["is_redeemed"],
      expiryAt: DateTime.parse(json["expiry_at"]),
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      name: json["name"],
      description: json["description"] ?? "");

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "c_id": cId,
        "plan_id": planId,
        "service_id": serviceId,
        "vendor_id": vendorId,
        "couponcode": couponcode,
        "image": image,
        "amount": amount,
        "is_redeemed": isRedeemed,
        "expiry_at": expiryAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
      };
}
