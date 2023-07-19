// To parse this JSON data, do
//
//     final searchServiceList = searchServiceListFromJson(jsonString);

import 'dart:convert';

SearchServiceList searchServiceListFromJson(String str) => SearchServiceList.fromJson(json.decode(str));

String searchServiceListToJson(SearchServiceList data) => json.encode(data.toJson());

class SearchServiceList {
    String message;
    List<SearchServiceListData> data;

    SearchServiceList({
        required this.message,
        required this.data,
    });

    factory SearchServiceList.fromJson(Map<String, dynamic> json) => SearchServiceList(
        message: json["message"],
        data: List<SearchServiceListData>.from(json["data"].map((x) => SearchServiceListData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class SearchServiceListData {
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
    String image;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic shareOption;
    dynamic bvcAmount;

    SearchServiceListData({
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
    });

    factory SearchServiceListData.fromJson(Map<String, dynamic> json) => SearchServiceListData(
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
        amenties:json["amenties"] == null ? [] : List<Amenty>.from(json["amenties"].map((x) => Amenty.fromJson(x))),
        image: json["image"]?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        shareOption: json["share_option"]?? "",
        bvcAmount: json["bvc_amount"]?? "",
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
        "bvc_amount": bvcAmount,
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
