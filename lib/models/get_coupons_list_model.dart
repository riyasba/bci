// To parse this JSON data, do
//
//     final getCouponListModel = getCouponListModelFromJson(jsonString);

import 'dart:convert';

GetCouponListModel getCouponListModelFromJson(String str) =>
    GetCouponListModel.fromJson(json.decode(str));

String getCouponListModelToJson(GetCouponListModel data) =>
    json.encode(data.toJson());

class GetCouponListModel {
  String message;
  List<CouponsListData> posts;

  GetCouponListModel({
    required this.message,
    required this.posts,
  });

  factory GetCouponListModel.fromJson(Map<String, dynamic> json) =>
      GetCouponListModel(
        message: json["message"],
        posts: List<CouponsListData>.from(json["posts"].map((x) => CouponsListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
      };
}

class CouponsListData {
  int id;
  String vendorId;
  String categoryId;
  String title;
  DateTime startsAt;
  DateTime endsAt;
  String couponAmount;
  String buyAmount;
  String status;
  String image;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  CouponsListData({
    required this.id,
    required this.vendorId,
    required this.categoryId,
    required this.title,
    required this.startsAt,
    required this.endsAt,
    required this.couponAmount,
    required this.buyAmount,
    required this.status,
    required this.image,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CouponsListData.fromJson(Map<String, dynamic> json) => CouponsListData(
        id: json["id"],
        vendorId: json["vendor_id"],
        categoryId: json["category_id"],
        title: json["title"],
        startsAt: DateTime.parse(json["starts_at"]),
        endsAt: DateTime.parse(json["ends_at"]),
        couponAmount: json["coupon_amount"],
        buyAmount: json["buy_amount"],
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
        "starts_at":
            "${startsAt.year.toString().padLeft(4, '0')}-${startsAt.month.toString().padLeft(2, '0')}-${startsAt.day.toString().padLeft(2, '0')}",
        "ends_at":
            "${endsAt.year.toString().padLeft(4, '0')}-${endsAt.month.toString().padLeft(2, '0')}-${endsAt.day.toString().padLeft(2, '0')}",
        "coupon_amount": couponAmount,
        "buy_amount": buyAmount,
        "status": status,
        "image": image,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
