// To parse this JSON data, do
//
//     final redeemtioncouponsListModel = redeemtioncouponsListModelFromJson(jsonString);

import 'dart:convert';

RedeemtioncouponsListModel redeemtioncouponsListModelFromJson(String str) => RedeemtioncouponsListModel.fromJson(json.decode(str));

String redeemtioncouponsListModelToJson(RedeemtioncouponsListModel data) => json.encode(data.toJson());

class RedeemtioncouponsListModel {
    String message;
    List<CouponRedeemptionData> data;

    RedeemtioncouponsListModel({
        required this.message,
        required this.data,
    });

    factory RedeemtioncouponsListModel.fromJson(Map<String, dynamic> json) => RedeemtioncouponsListModel(
        message: json["message"],
        data: List<CouponRedeemptionData>.from(json["data"].map((x) => CouponRedeemptionData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CouponRedeemptionData {
    int id;
    String userId;
    String cId;
    String planId;
    String serviceId;
    String vendorId;
    String couponcode;
    dynamic image;
    String amount;
    String isRedeemed;
    DateTime expiryAt;
    DateTime createdAt;
    DateTime updatedAt;
    String userName;
    Coupon coupon;

    CouponRedeemptionData({
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
        required this.userName,
        required this.coupon,
    });

    factory CouponRedeemptionData.fromJson(Map<String, dynamic> json) => CouponRedeemptionData(
        id: json["id"],
        userId: json["user_id"],
        cId: json["c_id"],
        planId: json["plan_id"],
        serviceId: json["service_id"],
        vendorId: json["vendor_id"],
        couponcode: json["couponcode"],
        image: json["image"]?? "",
        amount: json["amount"],
        isRedeemed: json["is_redeemed"],
        expiryAt: DateTime.parse(json["expiry_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userName: json["user_name"],
        coupon: Coupon.fromJson(json["coupon"]),
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
        "user_name": userName,
        "coupon": coupon.toJson(),
    };
}

class Coupon {
    int id;
    String planId;
    String offerPercentage;
    String noOfCoupons;
    String category;
    String amount;
    dynamic couponImage;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    Coupon({
        required this.id,
        required this.planId,
        required this.offerPercentage,
        required this.noOfCoupons,
        required this.category,
        required this.amount,
        required this.couponImage,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        planId: json["plan_id"],
        offerPercentage: json["offerPercentage"],
        noOfCoupons: json["no_of_coupons"],
        category: json["category"],
        amount: json["amount"],
        couponImage: json["coupon_image"]?? "",
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
