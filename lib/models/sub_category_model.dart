// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

SubCategoryModel subCategoryModelFromJson(String str) =>
    SubCategoryModel.fromJson(json.decode(str));

String subCategoryModelToJson(SubCategoryModel data) =>
    json.encode(data.toJson());

class SubCategoryModel {
  String message;
  List<SubCategoryModelList> data;

  SubCategoryModel({
    required this.message,
    required this.data,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        message: json["message"],
        data: List<SubCategoryModelList>.from(json["data"].map((x) => SubCategoryModelList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SubCategoryModelList {
  int id;
  String categoryId;
  String title;
  String description;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  SubCategoryModelList({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubCategoryModelList.fromJson(Map<String, dynamic> json) => SubCategoryModelList(
        id: json["id"],
        categoryId: json["category_id"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "title": title,
        "description": description,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
