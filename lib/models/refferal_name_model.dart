// To parse this JSON data, do
//
//     final refferalDataModel = refferalDataModelFromJson(jsonString);

import 'dart:convert';

RefferalDataModel refferalDataModelFromJson(String str) =>
    RefferalDataModel.fromJson(json.decode(str));

String refferalDataModelToJson(RefferalDataModel data) =>
    json.encode(data.toJson());

class RefferalDataModel {
  String message;
  Departments departments;

  RefferalDataModel({
    required this.message,
    required this.departments,
  });

  factory RefferalDataModel.fromJson(Map<String, dynamic> json) =>
      RefferalDataModel(
        message: json["message"],
        departments: Departments.fromJson(json["departments"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "departments": departments.toJson(),
      };
}

class Departments {
  int id;
  String roleId;
  String userId;
  String name;

  Departments({
    required this.id,
    required this.roleId,
    required this.userId,
    required this.name,
  });

  factory Departments.fromJson(Map<String, dynamic> json) => Departments(
        id: json["id"],
        roleId: json["role_id"],
        userId: json["user_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "user_id": userId,
        "name": name,
      };
}
