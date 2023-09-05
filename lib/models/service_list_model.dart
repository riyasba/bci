// To parse this JSON data, do
//
//     final serviceListModel = serviceListModelFromJson(jsonString);

import 'dart:convert';

ServiceListModel serviceListModelFromJson(String str) => ServiceListModel.fromJson(json.decode(str));

String serviceListModelToJson(ServiceListModel data) => json.encode(data.toJson());

class ServiceListModel {
    String message;
    List<ServiceData> data;

    ServiceListModel({
        required this.message,
        required this.data,
    });

    factory ServiceListModel.fromJson(Map<String, dynamic> json) => ServiceListModel(
        message: json["message"],
        data: List<ServiceData>.from(json["data"].map((x) => ServiceData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ServiceData {
    int id;
    dynamic categoryId;
    dynamic vendorId;
    String title;
    String actualAmount;
    String saleAmount;
    dynamic isOffer;
    dynamic offerPercentage;
    dynamic offerUptoAmount;
    dynamic isCoupon;
    dynamic couponAmount;
    String description;
    String quantity;
    String unit;
    dynamic isRecomended;
    dynamic status;
    List<Amenty> amenties;
    dynamic image;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic shareOption;
    // dynamic bvcAmount;
    dynamic sgst;
    dynamic cgst;

    ServiceData({
        required this.id,
        required this.categoryId,
        required this.vendorId,
        required this.title,
        required this.actualAmount,
        required this.saleAmount,
        required this.isOffer,
        this.offerPercentage,
        this.offerUptoAmount,
        required this.isCoupon,
        this.couponAmount,
        required this.description,
        required this.quantity,
        required this.unit,
        required this.isRecomended,
        required this.status,
        required this.amenties,
         this.image,
        required this.createdAt,
        required this.updatedAt,
        this.shareOption,
        // this.bvcAmount,
        this.sgst,
        this.cgst,
    });

    factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
        id: json["id"]?? 0,
        categoryId: json["category_id"]?? "",
        vendorId: json["vendor_id"]?? "",
        title: json["title"]?? "",
        actualAmount: json["actual_amount"]?? "",
        saleAmount: json["sale_amount"]?? "",
        isOffer: json["isOffer"]?? "",
        offerPercentage: json["offerPercentage"]?? "",
        offerUptoAmount: json["offerUpto_amount"]?? "",
        isCoupon: json["isCoupon"]?? "",
        couponAmount: json["coupon_amount"]?? "",
        description: json["description"]?? "",
        quantity: json["quantity"]?? "",
        unit: json["unit"]?? "",
        isRecomended: json["is_recomended"]?? "",
        status: json["status"]?? "",
        amenties:json["amenties"] == null ? [] : List<Amenty>.from(json["amenties"].map((x) => Amenty.fromJson(x))),
        image: json["image"]?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        shareOption: json["share_option"]?? "",
        // bvcAmount: json["bvc_amount"]?? "",
        sgst: json["cgst"],
        cgst: json["sgst"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "vendor_id": vendorId,
        "title": title,
        "actual_amount": actualAmount,
        "sale_amount": saleAmount,
        "isOffer": isOffer,
        "offerPercentage": offerPercentage,
        "offerUpto_amount": offerUptoAmount,
        "isCoupon": isCoupon,
        "coupon_amount": couponAmount,
        "description": description,
        "quantity": quantity,
        "unit": unit,
        "is_recomended": isRecomended,
        "status": status,
        "amenties": List<dynamic>.from(amenties.map((x) => x.toJson())),
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "share_option": shareOption,
        // "bvc_amount": bvcAmount,
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
