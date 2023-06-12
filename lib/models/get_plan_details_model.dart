// To parse this JSON data, do
//
//     final plansDetailsModel = plansDetailsModelFromJson(jsonString);

import 'dart:convert';

PlansDetailsModel plansDetailsModelFromJson(String str) =>
    PlansDetailsModel.fromJson(json.decode(str));

String plansDetailsModelToJson(PlansDetailsModel data) =>
    json.encode(data.toJson());

class PlansDetailsModel {
  String message;
  Plan plan;
  Coupon coupon;

  PlansDetailsModel({
    required this.message,
    required this.plan,
    required this.coupon,
  });

  factory PlansDetailsModel.fromJson(Map<String, dynamic> json) =>
      PlansDetailsModel(
        message: json["message"],
        plan: Plan.fromJson(json["plan"]),
        coupon: Coupon.fromJson(json["coupon"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "plan": plan.toJson(),
        "coupon": coupon.toJson(),
      };
}

class Coupon {
  int id;
  String planId;
  String noOfCoupons;
  String category;
  String amount;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Coupon({
    required this.id,
    required this.planId,
    required this.noOfCoupons,
    required this.category,
    required this.amount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        planId: json["plan_id"],
        noOfCoupons: json["no_of_coupons"],
        category: json["category"],
        amount: json["amount"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "plan_id": planId,
        "no_of_coupons": noOfCoupons,
        "category": category,
        "amount": amount,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Plan {
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
  String couponDetails;
  String cardNo;
  String planImage;
  String planDescription;
  String amcImage;
  String cardImg;
  String amcDescription;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Plan({
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
    required this.couponDetails,
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

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
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
        couponDetails: json["coupon_details"],
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
        "coupon_details": couponDetails,
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
