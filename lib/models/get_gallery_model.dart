// To parse this JSON data, do
//
//     final getGalleryModel = getGalleryModelFromJson(jsonString);

import 'dart:convert';

GetGalleryModel getGalleryModelFromJson(String str) => GetGalleryModel.fromJson(json.decode(str));

String getGalleryModelToJson(GetGalleryModel data) => json.encode(data.toJson());

class GetGalleryModel {
    List<GalleryListModel> data;

    GetGalleryModel({
        required this.data,
    });

    factory GetGalleryModel.fromJson(Map<String, dynamic> json) => GetGalleryModel(
        data: List<GalleryListModel>.from(json["data"].map((x) => GalleryListModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class GalleryListModel {
    int id;
    String userId;
    String image;
    String description;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    GalleryListModel({
        required this.id,
        required this.userId,
        required this.image,
        required this.description,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory GalleryListModel.fromJson(Map<String, dynamic> json) => GalleryListModel(
        id: json["id"],
        userId: json["user_id"],
        image: json["image"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image": image,
        "description": description,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
