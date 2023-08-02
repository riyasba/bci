// To parse this JSON data, do
//
//     final liquorVendorList = liquorVendorListFromJson(jsonString);

import 'dart:convert';

LiquorVendorList liquorVendorListFromJson(String str) => LiquorVendorList.fromJson(json.decode(str));

String liquorVendorListToJson(LiquorVendorList data) => json.encode(data.toJson());

class LiquorVendorList {
    List<VendorListData> vendors;

    LiquorVendorList({
        required this.vendors,
    });

    factory LiquorVendorList.fromJson(Map<String, dynamic> json) => LiquorVendorList(
        vendors: List<VendorListData>.from(json["vendors"].map((x) => VendorListData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "vendors": List<dynamic>.from(vendors.map((x) => x.toJson())),
    };
}

class VendorListData {
    int id;
    dynamic categoryId;
    dynamic vendorId;
    dynamic title;
    dynamic actualAmount;
    dynamic saleAmount;
    dynamic isOffer;
    dynamic offerPercentage;
    dynamic offerUptoAmount;
    dynamic isCoupon;
    dynamic couponAmount;
    dynamic description;
    dynamic quantity;
    dynamic unit;
    dynamic isRecomended;
    dynamic status;
    dynamic amenties;
    dynamic image;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic shareOption;
    dynamic bvcAmount;
    dynamic name;
    dynamic email;

    VendorListData({
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
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        this.shareOption,
        this.bvcAmount,
        required this.name,
        required this.email,
    });

    factory VendorListData.fromJson(Map<String, dynamic> json) => VendorListData(
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
        amenties: json["amenties"]?? "",
        image: json["image"]?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        shareOption: json["share_option"]?? "",
        bvcAmount: json["bvc_amount"]?? "",
        name: json["name"]?? "",
        email: json["email"]?? "",
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
        "amenties": amenties,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "share_option": shareOption,
        "bvc_amount": bvcAmount,
        "name": name,
        "email": email,
    };
}
