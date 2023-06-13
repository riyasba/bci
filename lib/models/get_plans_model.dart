// To parse this JSON data, do
//
//     final plansModel = plansModelFromJson(jsonString);

import 'dart:convert';

PlansModel plansModelFromJson(String str) =>
    PlansModel.fromJson(json.decode(str));

String plansModelToJson(PlansModel data) => json.encode(data.toJson());

class PlansModel {
  String message;
  List<PlansData> data;

  PlansModel({
    required this.message,
    required this.data,
  });

  factory PlansModel.fromJson(Map<String, dynamic> json) => PlansModel(
        message: json["message"],
        data: List<PlansData>.from(json["data"].map((x) => PlansData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PlansData {
  int id;
  String title;
  String validityDays;
  String userType;
  String actualAmount;
  String saleAmount;
  String dsaCommision;
  String referalCommision;
  String amc;
  String amcCommision;
  String cardNo;
  String planImage;
  String planDescription;
  String amcImage;
  String cardImg;
  String amcDescription;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  PlansData({
    required this.id,
    required this.title,
    required this.validityDays,
    required this.userType,
    required this.actualAmount,
    required this.saleAmount,
    required this.dsaCommision,
    required this.referalCommision,
    required this.amc,
    required this.amcCommision,
    required this.cardNo,
    required this.planImage,
    required this.planDescription,
    required this.amcImage,
    required this.cardImg,
    required this.amcDescription,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PlansData.fromJson(Map<String, dynamic> json) => PlansData(
        id: json["id"],
        title: json["title"],
        validityDays: json["validity_days"],
        userType: json["user_type"],
        actualAmount: json["actual_amount"],
        saleAmount: json["sale_amount"],
        dsaCommision: json["dsa_commision"],
        referalCommision: json["referal_commision"],
        amc: json["amc"],
        amcCommision: json["amc_commision"],
        cardNo: json["card_no"],
        planImage: json["plan_image"],
        planDescription: json["plan_description"],
        amcImage: json["amc_image"],
        cardImg: json["card_img"],
        amcDescription: json["amc_description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "validity_days": validityDays,
        "user_type": userType,
        "actual_amount": actualAmount,
        "sale_amount": saleAmount,
        "dsa_commision": dsaCommision,
        "referal_commision": referalCommision,
        "amc": amc,
        "amc_commision": amcCommision,
        "card_no": cardNo,
        "plan_image": planImage,
        "plan_description": planDescription,
        "amc_image": amcImage,
        "card_img": cardImg,
        "amc_description": amcDescription,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
