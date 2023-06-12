// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

SliderModel sliderModelFromJson(String str) =>
    SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  String message;
  List<SliderPost> posts;

  SliderModel({
    required this.message,
    required this.posts,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        message: json["message"],
        posts: List<SliderPost>.from(
            json["posts"].map((x) => SliderPost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
      };
}

class SliderPost {
  int id;
  String merchant;
  String actionUrl;
  String orderNo;
  String image;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String vendorName;
  String mobile;

  SliderPost({
    required this.id,
    required this.merchant,
    required this.actionUrl,
    required this.orderNo,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.vendorName,
    required this.mobile,
  });

  factory SliderPost.fromJson(Map<String, dynamic> json) => SliderPost(
        id: json["id"],
        merchant: json["merchant"],
        actionUrl: json["action_url"],
        orderNo: json["order_no"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        vendorName: json["vendor_name"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "merchant": merchant,
        "action_url": actionUrl,
        "order_no": orderNo,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "vendor_name": vendorName,
        "mobile": mobile,
      };
}
