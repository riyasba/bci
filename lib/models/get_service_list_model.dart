// To parse this JSON data, do
//
//     final getServiceList = getServiceListFromJson(jsonString);

import 'dart:convert';

import 'package:bci/models/search_service_list_model.dart';

GetServiceList getServiceListFromJson(String str) =>
    GetServiceList.fromJson(json.decode(str));

String getServiceListToJson(GetServiceList data) => json.encode(data.toJson());

class GetServiceList {
  String message;
  List<GetServiceListData> data;

  GetServiceList({
    required this.message,
    required this.data,
  });

  factory GetServiceList.fromJson(Map<String, dynamic> json) => GetServiceList(
        message: json["message"],
        data: List<GetServiceListData>.from(
            json["data"].map((x) => GetServiceListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GetServiceListData {
  int id;
  String categoryId;
  String vendorId;
  String title;
  String quantity;
  String actualAmount;
  String bvcAmount;
  String saleAmount;
  String description;
  String isBooking;
  String status;
  List<Amenty> amenties;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  GetServiceListData({
    required this.id,
    required this.categoryId,
    required this.vendorId,
    required this.title,
    required this.quantity,
    required this.actualAmount,
    required this.bvcAmount,
    required this.saleAmount,
    required this.description,
    required this.isBooking,
    required this.status,
    required this.amenties,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GetServiceListData.fromJson(Map<String, dynamic> json) =>
      GetServiceListData(
        id: json["id"] ?? 0,
        categoryId: json["category_id"] ?? 0,
        vendorId: json["vendor_id"] ?? "",
        title: json["title"] ?? "",
        quantity: json["quantity"] ?? "",
        actualAmount: json["actual_amount"] ?? "",
        bvcAmount: json["bvc_amount"] ?? "",
        saleAmount: json["sale_amount"] ?? "",
        description: json["description"] ?? "",
        isBooking: json["is_booking"] ?? "",
        status: json["status"] ?? "",
        amenties: json["amenties"] == null
            ? []
            : List<Amenty>.from(
                json["amenties"]!.map((x) => Amenty.fromJson(x))),
        image: json["image"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "vendor_id": vendorId,
        "title": title,
        "quantity": quantity,
        "actual_amount": actualAmount,
        "bvc_amount": bvcAmount,
        "sale_amount": saleAmount,
        "description": description,
        "is_booking": isBooking,
        "status": status,
        // "amenties": List<dynamic>.from(amenties.map((x) => x)),
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}


