// To parse this JSON data, do
//
//     final plansDetailsModel = plansDetailsModelFromJson(jsonString);

import 'dart:convert';

PlansDetailsModel plansDetailsModelFromJson(String str) => PlansDetailsModel.fromJson(json.decode(str));

String plansDetailsModelToJson(PlansDetailsModel data) => json.encode(data.toJson());

class PlansDetailsModel {
    String message;
    SubscribePlansData plan;
    List<dynamic> coupons;

    PlansDetailsModel({
        required this.message,
        required this.plan,
        required this.coupons,
    });

    factory PlansDetailsModel.fromJson(Map<String, dynamic> json) => PlansDetailsModel(
        message: json["message"],
        plan: SubscribePlansData.fromJson(json["plan"]),
        coupons: List<dynamic>.from(json["coupons"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "plan": plan.toJson(),
        "coupons": List<dynamic>.from(coupons.map((x) => x)),
    };
}

class SubscribePlansData {
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
    dynamic status;
    DateTime createdAt;
    DateTime updatedAt;

    SubscribePlansData({
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

    factory SubscribePlansData.fromJson(Map<String, dynamic> json) => SubscribePlansData(
        id: json["id"]?? 0,
        title: json["title"]?? "",
        validityDays: json["validity_days"]?? "",
        userType: json["user_type"]?? "",
        actualAmount: json["actual_amount"]?? "",
        saleAmount: json["sale_amount"]?? "",
        dsaCommision: json["dsa_commision"]?? "",
        referalCommision: json["referal_commision"]?? "",
        amc: json["amc"]?? "",
        amcCommision: json["amc_commision"]?? "",
        cardNo: json["card_no"]?? "0000000000000000",
        planImage: json["plan_image"]?? "",
        planDescription: json["plan_description"]?? "",
        amcImage: json["amc_image"]?? "",
        cardImg: json["card_img"]?? "",
        amcDescription: json["amc_description"]?? "",
        status: json["status"]?? "",
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
