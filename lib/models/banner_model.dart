// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
    String message;
    List<Post> posts;

    BannerModel({
        required this.message,
        required this.posts,
    });

    factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        message: json["message"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
    };
}

class Post {
    int id;
    String merchant;
    String product;
    String type;
    String actionUrl;
    String orderNo;
    String image;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    String vendorName;
    String mobile;

    Post({
        required this.id,
        required this.merchant,
        required this.product,
        required this.type,
        required this.actionUrl,
        required this.orderNo,
        required this.image,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.vendorName,
        required this.mobile,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        merchant: json["merchant"],
        product: json["product"],
        type: json["type"],
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
        "product": product,
        "type": type,
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
