// To parse this JSON data, do
//
//     final userRedeemCouponsModel = userRedeemCouponsModelFromJson(jsonString);

import 'dart:convert';

UserRedeemCouponsModel userRedeemCouponsModelFromJson(String str) => UserRedeemCouponsModel.fromJson(json.decode(str));

String userRedeemCouponsModelToJson(UserRedeemCouponsModel data) => json.encode(data.toJson());

class UserRedeemCouponsModel {
    String message;
    List<UserRedeemData> data;

    UserRedeemCouponsModel({
        required this.message,
        required this.data,
    });

    factory UserRedeemCouponsModel.fromJson(Map<String, dynamic> json) => UserRedeemCouponsModel(
        message: json["message"],
        data: List<UserRedeemData>.from(json["data"].map((x) => UserRedeemData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class UserRedeemData {
    int id;
    String userId;
    String cId;
    String planId;
    String serviceId;
    String? vendorId;
    String couponcode;
    dynamic image;
    String amount;
    String isRedeemed;
    DateTime expiryAt;
    DateTime createdAt;
    DateTime updatedAt;
    Coupon coupon;

    UserRedeemData({
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

    factory UserRedeemData.fromJson(Map<String, dynamic> json) => UserRedeemData(
        id: json["id"],
        userId: json["user_id"],
        cId: json["c_id"],
        planId: json["plan_id"],
        serviceId: json["service_id"],
        vendorId: json["vendor_id"],
        couponcode: json["couponcode"],
        image: json["image"],
        amount: json["amount"],
        isRedeemed: json["is_redeemed"],
        expiryAt: DateTime.parse(json["expiry_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "coupon": coupon.toJson(),
    };
}

class Coupon {
    int id;
    String planId;
    OfferPercentage offerPercentage;
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
        offerPercentage: offerPercentageValues.map[json["offerPercentage"]]!,
        noOfCoupons: json["no_of_coupons"],
        category: json["category"],
        amount: json["amount"],
        couponImage: json["coupon_image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "plan_id": planId,
        "offerPercentage": offerPercentageValues.reverse[offerPercentage],
        "no_of_coupons": noOfCoupons,
        "category": category,
        "amount": amount,
        "coupon_image": couponImage,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum OfferPercentage {
    THE_10
}

final offerPercentageValues = EnumValues({
    "10%": OfferPercentage.THE_10
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
