// To parse this JSON data, do
//
//     final getCouponsList = getCouponsListFromJson(jsonString);

import 'dart:convert';
import 'dart:math';

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
    String userId;
    String cId;
    String planId;
    String couponcode;
    String amount;
    String isRedeemed;
    DateTime expiryAt;
    DateTime createdAt;
    DateTime updatedAt;
    Name name;
    int colorIndex;

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
        required this.colorIndex,
    });

    factory CouponsData.fromJson(Map<String, dynamic> json) => CouponsData(
        id: json["id"],
        userId: json["user_id"],
        cId: json["c_id"],
        planId: json["plan_id"],
        couponcode: json["couponcode"],
        amount: json["amount"],
        isRedeemed: json["is_redeemed"],
        expiryAt: DateTime.parse(json["expiry_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: nameValues.map[json["name"]]!,
        colorIndex: Random().nextInt(4),
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

enum Name { THE_25_OFF_IN_MY_SHOP, THE_55_OFF_IN_MY_SHOP }

final nameValues = EnumValues({
    "25% Off In My Shop": Name.THE_25_OFF_IN_MY_SHOP,
    "55% Off In My Shop": Name.THE_55_OFF_IN_MY_SHOP
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
