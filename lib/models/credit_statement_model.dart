// To parse this JSON data, do
//
//     final creditStatementModel = creditStatementModelFromJson(jsonString);

import 'dart:convert';

CreditStatementModel creditStatementModelFromJson(String str) =>
    CreditStatementModel.fromJson(json.decode(str));

String creditStatementModelToJson(CreditStatementModel data) =>
    json.encode(data.toJson());

class CreditStatementModel {
  bool status;
  int totalUsed;
  List<CreditTransaction> creditTransactions;

  CreditStatementModel({
    required this.status,
    required this.totalUsed,
    required this.creditTransactions,
  });

  factory CreditStatementModel.fromJson(Map<String, dynamic> json) =>
      CreditStatementModel(
        status: json["status"],
        totalUsed: json["total_used"],
        creditTransactions: List<CreditTransaction>.from(
            json["credit_transactions"]
                .map((x) => CreditTransaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "total_used": totalUsed,
        "credit_transactions":
            List<dynamic>.from(creditTransactions.map((x) => x.toJson())),
      };
}

class CreditTransaction {
  int id;
  String userId;
  String amount;
  DateTime transactionDate;
  String creditFor;
  String creditForId;
  String status;
  String isPaid;
  DateTime createdAt;
  DateTime updatedAt;

  CreditTransaction({
    required this.id,
    required this.userId,
    required this.amount,
    required this.transactionDate,
    required this.creditFor,
    required this.creditForId,
    required this.status,
    required this.isPaid,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CreditTransaction.fromJson(Map<String, dynamic> json) =>
      CreditTransaction(
        id: json["id"],
        userId: json["user_id"],
        amount: json["amount"],
        transactionDate: DateTime.parse(json["transaction_date"]),
        creditFor: json["credit_for"],
        creditForId: json["credit_for_id"],
        status: json["status"],
        isPaid: json["is_paid"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "amount": amount,
        "transaction_date": transactionDate.toIso8601String(),
        "credit_for": creditFor,
        "credit_for_id": creditForId,
        "status": status,
        "is_paid": isPaid,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
