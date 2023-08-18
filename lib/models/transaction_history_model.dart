// To parse this JSON data, do
//
//     final transactionHistoryModel = transactionHistoryModelFromJson(jsonString);

import 'dart:convert';

TransactionHistoryModel transactionHistoryModelFromJson(String str) => TransactionHistoryModel.fromJson(json.decode(str));

String transactionHistoryModelToJson(TransactionHistoryModel data) => json.encode(data.toJson());

class TransactionHistoryModel {
    List<TransactionHistory> transactionHistory;

    TransactionHistoryModel({
        required this.transactionHistory,
    });

    factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) => TransactionHistoryModel(
        transactionHistory: List<TransactionHistory>.from(json["Transaction History"].map((x) => TransactionHistory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Transaction History": List<dynamic>.from(transactionHistory.map((x) => x.toJson())),
    };
}

class TransactionHistory {
    int id;
    String transactionId;
    String userId;
    String amount;
    String type;
    dynamic status;
    DateTime createdAt;
    DateTime updatedAt;

    TransactionHistory({
        required this.id,
        required this.transactionId,
        required this.userId,
        required this.amount,
        required this.type,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory TransactionHistory.fromJson(Map<String, dynamic> json) => TransactionHistory(
        id: json["id"],
        transactionId: json["transaction_id"],
        userId: json["user_id"],
        amount: json["amount"],
        type: json["type"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "transaction_id": transactionId,
        "user_id": userId,
        "amount": amount,
        "type": type,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
