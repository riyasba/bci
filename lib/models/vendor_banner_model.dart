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
    String title;
    String description;
    String image;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    Post({
        required this.id,
        required this.title,
        required this.description,
        required this.image,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
