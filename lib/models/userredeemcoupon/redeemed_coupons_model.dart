// To parse this JSON data, do
//
//     final redeemedCouponsModel = redeemedCouponsModelFromJson(jsonString);

import 'dart:convert';

RedeemedCouponsModel redeemedCouponsModelFromJson(String str) =>
    RedeemedCouponsModel.fromJson(json.decode(str));

String redeemedCouponsModelToJson(RedeemedCouponsModel data) =>
    json.encode(data.toJson());

class RedeemedCouponsModel {
  String message;
  List<CouponsRedeemedData> data;

  RedeemedCouponsModel({
    required this.message,
    required this.data,
  });

  factory RedeemedCouponsModel.fromJson(Map<String, dynamic> json) =>
      RedeemedCouponsModel(
        message: json["message"],
        data: List<CouponsRedeemedData>.from(
            json["data"].map((x) => CouponsRedeemedData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CouponsRedeemedData {
  int id;
  String userId;
  String cId;
  String planId;
  String serviceId;
  String vendorId;
  String couponcode;
  String image;
  String amount;
  String isRedeemed;
  DateTime expiryAt;
  DateTime createdAt;
  DateTime updatedAt;
  RedeemedCoupon coupon;

  CouponsRedeemedData({
    required this.id,
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
    required this.coupon,
  });

  factory CouponsRedeemedData.fromJson(Map<String, dynamic> json) =>
      CouponsRedeemedData(
        id: json["id"],
        userId: json["user_id"],
        cId: json["c_id"],
        planId: json["plan_id"],
        serviceId: json["service_id"],
        vendorId: json["vendor_id"],
        couponcode: json["couponcode"],
        image: json["image"] ?? "",
        amount: json["amount"],
        isRedeemed: json["is_redeemed"],
        expiryAt: DateTime.parse(json["expiry_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        coupon: json["coupon"] == null
            ? RedeemedCoupon(
                amount: "",
                category: "",
                couponImage: "",
                createdAt: DateTime.now(),
                description: "",
                id: json["id"],
                image: json["image"] ?? "",
                name: json["name"] ?? "",
                noOfCoupons: "",
                offerPercentage: "",
                planId: '',
                validTo: DateTime.now(),
                status: "",
                updatedAt: DateTime.now(),
                validFrom: DateTime.now())
            : RedeemedCoupon.fromJson(json["coupon"]),
      );

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
        "coupon": coupon.toJson(),
      };
}

class RedeemedCoupon {
  int id;
  String planId;
  String offerPercentage;
  String noOfCoupons;
  String category;
  String amount;
  String couponImage;
  String status;
  DateTime validFrom;
  DateTime validTo;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic name;
  String description;
  String image;

  RedeemedCoupon({
    required this.id,
    required this.planId,
    required this.offerPercentage,
    required this.noOfCoupons,
    required this.category,
    required this.amount,
    required this.couponImage,
    required this.status,
    required this.validFrom,
    required this.validTo,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.image,
  });

  factory RedeemedCoupon.fromJson(Map<String, dynamic> json) => RedeemedCoupon(
        id: json["id"],
        planId: json["plan_id"],
        offerPercentage: json["offerPercentage"],
        noOfCoupons: json["no_of_coupons"],
        category: json["category"],
        amount: json["amount"],
        couponImage: json["coupon_image"] ?? "",
        status: json["status"],
        validFrom: DateTime.parse(json["valid_from"]),
        validTo: DateTime.parse(json["valid_to"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        description: json["description"],
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "plan_id": planId,
        "offerPercentage": offerPercentage,
        "no_of_coupons": noOfCoupons,
        "category": category,
        "amount": amount,
        "coupon_image": couponImage,
        "status": status,
        "valid_from":
            "${validFrom.year.toString().padLeft(4, '0')}-${validFrom.month.toString().padLeft(2, '0')}-${validFrom.day.toString().padLeft(2, '0')}",
        "valid_to":
            "${validTo.year.toString().padLeft(4, '0')}-${validTo.month.toString().padLeft(2, '0')}-${validTo.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "description": description,
        "image": image,
      };
}
