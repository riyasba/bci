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
    int categoryId;
    int vendorId;
    String title;
    String actualAmount;
    String saleAmount;
    int isOffer;
    dynamic offerPercentage;
    dynamic offerUptoAmount;
    int isCoupon;
    dynamic couponAmount;
    String description;
    String quantity;
    String unit;
    int isRecomended;
    int status;
    String amenties;
    String image;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic shareOption;
    dynamic bvcAmount;
    String name;
    String email;

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
        categoryId: json["category_id"]?? 0,
        vendorId: json["vendor_id"]?? 0,
        title: json["title"]?? "",
        actualAmount: json["actual_amount"]?? "",
        saleAmount: json["sale_amount"]?? "",
        isOffer: json["isOffer"]?? 0,
        offerPercentage: json["offerPercentage"]?? "",
        offerUptoAmount: json["offerUpto_amount"]?? "",
        isCoupon: json["isCoupon"]?? 0,
        couponAmount: json["coupon_amount"]?? "",
        description: json["description"]?? "",
        quantity: json["quantity"]?? "",
        unit: json["unit"]?? "",
        isRecomended: json["is_recomended"]?? 0,
        status: json["status"]?? 0,
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
