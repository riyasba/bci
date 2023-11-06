// To parse this JSON data, do
//
//     final merhantCategory = merhantCategoryFromJson(jsonString);

import 'dart:convert';

MerhantCategory merhantCategoryFromJson(String str) =>
    MerhantCategory.fromJson(json.decode(str));

String merhantCategoryToJson(MerhantCategory data) =>
    json.encode(data.toJson());

class MerhantCategory {
  String status;
  String message;
  List<MerchatCategoryData> data;

  MerhantCategory({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MerhantCategory.fromJson(Map<String, dynamic> json) =>
      MerhantCategory(
        status: json["status"],
        message: json["message"],
        data: List<MerchatCategoryData>.from(
            json["data"].map((x) => MerchatCategoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MerchatCategoryData {
  String title;
  String image;
  int id;

  MerchatCategoryData({
    required this.title,
    required this.image,
    required this.id,
  });

  factory MerchatCategoryData.fromJson(Map<String, dynamic> json) =>
      MerchatCategoryData(
        title: json["title"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
      };
}
