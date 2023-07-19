// To parse this JSON data, do
//
//     final recomendedList = recomendedListFromJson(jsonString);

import 'dart:convert';

RecomendedList recomendedListFromJson(String str) => RecomendedList.fromJson(json.decode(str));

String recomendedListToJson(RecomendedList data) => json.encode(data.toJson());

class RecomendedList {
    String message;
    List<RecomendedListData> data;

    RecomendedList({
        required this.message,
        required this.data,
    });

    factory RecomendedList.fromJson(Map<String, dynamic> json) => RecomendedList(
        message: json["message"],
        data: List<RecomendedListData>.from(json["data"].map((x) => RecomendedListData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class RecomendedListData {
    int id;
    dynamic categoryId;
    dynamic vendorId;
    String title;
    dynamic location;
    String actualAmount;
    String saleAmount;
    String isOffer;
    dynamic offerPercentage;
    dynamic offerUptoAmount;
    String isCoupon;
    dynamic couponAmount;
    String description;
    String? quantity;
    String? unit;
    dynamic isRecomended;
    dynamic status;
    List<Amenty> amenties;
    String image;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic shareOption;
    dynamic bvcAmount;
    List<String>? images;

    RecomendedListData({
        required this.id,
        required this.categoryId,
        required this.vendorId,
        required this.title,
        this.location,
        required this.actualAmount,
        required this.saleAmount,
        required this.isOffer,
        this.offerPercentage,
        this.offerUptoAmount,
        required this.isCoupon,
        this.couponAmount,
        required this.description,
        this.quantity,
        this.unit,
        required this.isRecomended,
        required this.status,
        required this.amenties,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        this.shareOption,
        this.bvcAmount,
        this.images,
    });

    factory RecomendedListData.fromJson(Map<String, dynamic> json) => RecomendedListData(
        id: json["id"]?? 0,
        categoryId: json["category_id"]?? "",
        vendorId: json["vendor_id"]?? "",
        title: json["title"]?? "",
        location: json["location"]?? "",
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
        bvcAmount: json["bvc_amount"]?? "",
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "vendor_id": vendorId,
        "title": title,
        "location": location,
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
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
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
