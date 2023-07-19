// To parse this JSON data, do
//
//     final getCouponsList = getCouponsListFromJson(jsonString);

import 'dart:convert';

GetCouponsList getCouponsListFromJson(String str) => GetCouponsList.fromJson(json.decode(str));

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
        data: List<CouponsData>.from(json["data"].map((x) => CouponsData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CouponsData {
    int id;
    int userId;
    int cId;
    int planId;
    String couponcode;
    String amount;
    int isRedeemed;
    DateTime expiryAt;
    DateTime createdAt;
    DateTime updatedAt;
    Name name;

    CouponsData({
        required this.id,
        required this.userId,
        required this.cId,
        required this.planId,
        required this.couponcode,
        required this.amount,
        required this.isRedeemed,
        required this.expiryAt,
        required this.createdAt,
        required this.updatedAt,
        required this.name,
    });

    factory CouponsData.fromJson(Map<String, dynamic> json) => CouponsData(
        id: json["id"]?? 0,
        userId: json["user_id"]?? 0,
        cId: json["c_id"]?? 0,
        planId: json["plan_id"]?? 0,
        couponcode: json["couponcode"]?? "",
        amount: json["amount"]?? "",
        isRedeemed: json["is_redeemed"]?? 0,
        expiryAt: DateTime.parse(json["expiry_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: nameValues.map[json["name"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "c_id": cId,
        "plan_id": planId,
        "couponcode": couponcode,
        "amount": amount,
        "is_redeemed": isRedeemed,
        "expiry_at": expiryAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": nameValues.reverse[name],
    };
}

enum Name { FLAT_10_OFFER_FOR_SPA_COMPLEMENTARY, THE_5_YEARS_COMPLEMENTARY, FLAT_10_OFFER_FOR_LIQUOR_COMPLEMENTARY }

final nameValues = EnumValues({
    "flat 10% offer for liquor complementary": Name.FLAT_10_OFFER_FOR_LIQUOR_COMPLEMENTARY,
    "flat 10% offer for spa complementary": Name.FLAT_10_OFFER_FOR_SPA_COMPLEMENTARY,
    "5 years complementary": Name.THE_5_YEARS_COMPLEMENTARY
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
