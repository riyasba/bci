// To parse this JSON data, do
//
//     final creditProfileModel = creditProfileModelFromJson(jsonString);

import 'dart:convert';

CreditProfileModel creditProfileModelFromJson(String str) =>
    CreditProfileModel.fromJson(json.decode(str));

String creditProfileModelToJson(CreditProfileModel data) =>
    json.encode(data.toJson());

class CreditProfileModel {
  String creditLimit;
  String availableLimit;
  String pendingLimit;
  String totalPaidAmountCurrentMonth;
  String totalUnpaidAmountCurrentMonth;

  CreditProfileModel({
    required this.creditLimit,
    required this.availableLimit,
    required this.pendingLimit,
    required this.totalPaidAmountCurrentMonth,
    required this.totalUnpaidAmountCurrentMonth,
  });

  factory CreditProfileModel.fromJson(Map<String, dynamic> json) =>
      CreditProfileModel(
        creditLimit: json["credit_limit"].toString(),
        availableLimit: json["available_limit"].toString(),
        pendingLimit: json["pending_limit"].toString(),
        totalPaidAmountCurrentMonth:
            json["total_paid_amount_current_month"].toString(),
        totalUnpaidAmountCurrentMonth:
            json["total_unpaid_amount_current_month"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "credit_limit": creditLimit,
        "used_limit": availableLimit,
        "pending_limit": pendingLimit,
        "total_paid_amount_current_month": totalPaidAmountCurrentMonth,
        "total_unpaid_amount_current_month": totalUnpaidAmountCurrentMonth,
      };
}
