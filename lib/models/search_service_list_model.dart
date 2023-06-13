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
    String categoryId;
    String vendorId;
    String title;
    String actualAmount;
    String bvcAmount;
    String saleAmount;
    String description;
    String isBooking;
    String status;
    //List<String>? amenties;
    String image;
    DateTime createdAt;
    DateTime updatedAt;

    SearchServiceListData({
        required this.id,
        required this.categoryId,
        required this.vendorId,
        required this.title,
        required this.actualAmount,
        required this.bvcAmount,
        required this.saleAmount,
        required this.description,
        required this.isBooking,
        required this.status,
        //this.amenties,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    factory SearchServiceListData.fromJson(Map<String, dynamic> json) => SearchServiceListData(
        id: json["id"],
        categoryId: json["category_id"],
        vendorId: json["vendor_id"],
        title: json["title"],
        actualAmount: json["actual_amount"],
        bvcAmount: json["bvc_amount"],
        saleAmount: json["sale_amount"],
        description: json["description"],
        isBooking: json["is_booking"],
        status: json["status"],
        //amenties: json["amenties"] == null ? [] : List<String>.from(json["amenties"]!.map((x) => x)),
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "vendor_id": vendorId,
        "title": title,
        "actual_amount": actualAmount,
        "bvc_amount": bvcAmount,
        "sale_amount": saleAmount,
        "description": description,
        "is_booking": isBooking,
        "status": status,
        //"amenties": amenties == null ? [] : List<dynamic>.from(amenties!.map((x) => x)),
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
