// To parse this JSON data, do
//
//     final serviceListModel = serviceListModelFromJson(jsonString);

import 'dart:convert';

ServiceListModel serviceListModelFromJson(String str) =>
    ServiceListModel.fromJson(json.decode(str));

String serviceListModelToJson(ServiceListModel data) =>
    json.encode(data.toJson());

class ServiceListModel {
  String message;
  List<ServiceData> data;

  ServiceListModel({
    required this.message,
    required this.data,
  });

  factory ServiceListModel.fromJson(Map<String, dynamic> json) =>
      ServiceListModel(
        message: json["message"],
        data: List<ServiceData>.from(
            json["data"].map((x) => ServiceData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ServiceData {
  int id;
  String categoryId;
  String vendorId;
  String title;
  String actualAmount;
  String quantity;
  String unit;
  // String bvcAmount;
  String saleAmount;
  String isOffer;
  String? offerPercentage;
  String? offerUptoAmount;
  String isCoupon;
  String? couponAmount;
  String description;
  String isBooking;
  String status;
  List<Amenty>? amenties;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  String shareOption;

  ServiceData({
    required this.id,
    required this.categoryId,
    required this.vendorId,
    required this.title,
    required this.actualAmount,
    required this.quantity,
    required this.unit,
    // required this.bvcAmount,
    required this.saleAmount,
    required this.isOffer,
    this.offerPercentage,
    this.offerUptoAmount,
    required this.isCoupon,
    this.couponAmount,
    required this.description,
    required this.isBooking,
    required this.status,
    this.amenties,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.shareOption,
  });

  factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
        id: json["id"],
        categoryId: json["category_id"],
        vendorId: json["vendor_id"],
        title: json["title"],
        actualAmount: json["actual_amount"],
        quantity: json["quantity"]?? "",
        unit: json["unit"]?? "",
        saleAmount: json["sale_amount"],
        isOffer: json["isOffer"],
        offerPercentage: json["offerPercentage"]?? "",
        offerUptoAmount: json["offerUpto_amount"]?? "",
        isCoupon: json["isCoupon"],
        couponAmount: json["coupon_amount"],
        description: json["description"],
        isBooking: json["is_booking"]?? "",
        status: json["status"],
        amenties: json["amenties"] == null
            ? []
            : List<Amenty>.from(
                json["amenties"]!.map((x) => Amenty.fromJson(x))),
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        shareOption: json["share_option"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "vendor_id": vendorId,
        "title": title,
        "actual_amount": actualAmount,
        "quantity": quantity,
        "unit": unit,
        // "bvc_amount": bvcAmount,
        "sale_amount": saleAmount,
        "isOffer": isOffer,
        "offerPercentage": offerPercentage,
        "offerUpto_amount": offerUptoAmount,
        "isCoupon": isCoupon,
        "coupon_amount": couponAmount,
        "description": description,
        "is_booking": isBooking,
        "status": status,
        "amenties": amenties == null
            ? []
            : List<dynamic>.from(amenties!.map((x) => x.toJson())),
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "share_option": shareOption
      };
}

class Amenty {
  String value;

  Amenty({
    required this.value,
  });

  factory Amenty.fromJson(Map<String, dynamic> json) => Amenty(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}
