// To parse this JSON data, do
//
//     final merchantCouponList = merchantCouponListFromJson(jsonString);

import 'dart:convert';

MerchantCouponList merchantCouponListFromJson(String str) => MerchantCouponList.fromJson(json.decode(str));

String merchantCouponListToJson(MerchantCouponList data) => json.encode(data.toJson());

class MerchantCouponList {
    String message;
    List<MerchantCouponData> data;

    MerchantCouponList({
        required this.message,
        required this.data,
    });

    factory MerchantCouponList.fromJson(Map<String, dynamic> json) => MerchantCouponList(
        message: json["message"],
        data: List<MerchantCouponData>.from(json["data"].map((x) => MerchantCouponData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class MerchantCouponData {
    int id;
    String vendorId;
    String categoryId;
    String title;
    DateTime startsAt;
    DateTime endsAt;
    String couponAmount;
    String? buyAmount;
    String planId;
    String couponCode;
    String status;
    String image;
    String description;
    DateTime createdAt;
    DateTime updatedAt;

    MerchantCouponData({
        required this.id,
        required this.vendorId,
        required this.categoryId,
        required this.title,
        required this.startsAt,
        required this.endsAt,
        required this.couponAmount,
        required this.buyAmount,
        required this.planId,
        required this.couponCode,
        required this.status,
        required this.image,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
    });

    factory MerchantCouponData.fromJson(Map<String, dynamic> json) => MerchantCouponData(
        id: json["id"],
        vendorId: json["vendor_id"],
        categoryId: json["category_id"],
        title: json["title"],
        startsAt: DateTime.parse(json["starts_at"]),
        endsAt: DateTime.parse(json["ends_at"]),
        couponAmount: json["coupon_amount"],
        buyAmount: json["buy_amount"],
        planId: json["plan_id"],
        couponCode: json["coupon_code"],
        status: json["status"],
        image: json["image"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "category_id": categoryId,
        "title": title,
        "starts_at": "${startsAt.year.toString().padLeft(4, '0')}-${startsAt.month.toString().padLeft(2, '0')}-${startsAt.day.toString().padLeft(2, '0')}",
        "ends_at": "${endsAt.year.toString().padLeft(4, '0')}-${endsAt.month.toString().padLeft(2, '0')}-${endsAt.day.toString().padLeft(2, '0')}",
        "coupon_amount": couponAmount,
        "buy_amount": buyAmount,
        "plan_id": planId,
        "coupon_code": couponCode,
        "status": status,
        "image": image,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
