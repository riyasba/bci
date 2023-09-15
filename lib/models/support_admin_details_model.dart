// To parse this JSON data, do
//
//     final supportAdminModel = supportAdminModelFromJson(jsonString);

import 'dart:convert';

SupportAdminModel supportAdminModelFromJson(String str) =>
    SupportAdminModel.fromJson(json.decode(str));

String supportAdminModelToJson(SupportAdminModel data) =>
    json.encode(data.toJson());

class SupportAdminModel {
  ContactDetailsData data;

  SupportAdminModel({
    required this.data,
  });

  factory SupportAdminModel.fromJson(Map<String, dynamic> json) =>
      SupportAdminModel(
        data: ContactDetailsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class ContactDetailsData {
  String appName;
  String appEmail;
  String appPhone;
  String appAddress;

  ContactDetailsData({
    required this.appName,
    required this.appEmail,
    required this.appPhone,
    required this.appAddress,
  });

  factory ContactDetailsData.fromJson(Map<String, dynamic> json) =>
      ContactDetailsData(
        appName: json["app_name"],
        appEmail: json["app_email"],
        appPhone: json["app_phone"],
        appAddress: json["app_address"],
      );

  Map<String, dynamic> toJson() => {
        "app_name": appName,
        "app_email": appEmail,
        "app_phone": appPhone,
        "app_address": appAddress,
      };
}
