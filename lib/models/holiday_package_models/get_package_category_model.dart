// To parse this JSON data, do
//
//     final getPackageCategoryList = getPackageCategoryListFromJson(jsonString);

import 'dart:convert';

GetPackageCategoryList getPackageCategoryListFromJson(String str) => GetPackageCategoryList.fromJson(json.decode(str));

String getPackageCategoryListToJson(GetPackageCategoryList data) => json.encode(data.toJson());

class GetPackageCategoryList {
    String message;
    List<PackageCategoryData> data;

    GetPackageCategoryList({
        required this.message,
        required this.data,
    });

    factory GetPackageCategoryList.fromJson(Map<String, dynamic> json) => GetPackageCategoryList(
        message: json["message"],
        data: List<PackageCategoryData>.from(json["data"].map((x) => PackageCategoryData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class PackageCategoryData {
    int id;
    String name;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    PackageCategoryData({
        required this.id,
        required this.name,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory PackageCategoryData.fromJson(Map<String, dynamic> json) => PackageCategoryData(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
