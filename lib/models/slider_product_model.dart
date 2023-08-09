// To parse this JSON data, do
//
//     final sliderProductModel = sliderProductModelFromJson(jsonString);

import 'dart:convert';

SliderProductModel sliderProductModelFromJson(String str) => SliderProductModel.fromJson(json.decode(str));

String sliderProductModelToJson(SliderProductModel data) => json.encode(data.toJson());

class SliderProductModel {
    String message;
    List<SliderData> posts;

    SliderProductModel({
        required this.message,
        required this.posts,
    });

    factory SliderProductModel.fromJson(Map<String, dynamic> json) => SliderProductModel(
        message: json["message"],
        posts: List<SliderData>.from(json["posts"].map((x) => SliderData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
    };
}

class SliderData {
    int id;
    String merchant;
    String product;
    dynamic actionUrl;
    String orderNo;
    String image;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    String vendorName;
    String mobile;

    SliderData({
        required this.id,
        required this.merchant,
        required this.product,
        this.actionUrl,
        required this.orderNo,
        required this.image,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.vendorName,
        required this.mobile,
    });

    factory SliderData.fromJson(Map<String, dynamic> json) => SliderData(
        id: json["id"]?? 0,
        merchant: json["merchant"]?? "",
        product: json["product"]?? "",
        actionUrl: json["action_url"]?? "",
        orderNo: json["order_no"]?? "",
        image: json["image"]?? "",
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        vendorName: json["vendor_name"]?? "",
        mobile: json["mobile"]?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "merchant": merchant,
        "product": product,
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
