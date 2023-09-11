// To parse this JSON data, do
//
//     final vendorOfferList = vendorOfferListFromJson(jsonString);

import 'dart:convert';

List<VendorOfferList> vendorOfferListFromJson(String str) => List<VendorOfferList>.from(json.decode(str).map((x) => VendorOfferList.fromJson(x)));

String vendorOfferListToJson(List<VendorOfferList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VendorOfferList {
    int id;
    String vendorId;
    String categoryId;
    String title;
    DateTime startsAt;
    DateTime endsAt;
    String businessValue;
    String discountValue;
    String noOfClaimUser;
    String status;
    String image;
    dynamic description;
    DateTime createdAt;
    DateTime updatedAt;

    VendorOfferList({
        required this.id,
        required this.vendorId,
        required this.categoryId,
        required this.title,
        required this.startsAt,
        required this.endsAt,
        required this.businessValue,
        required this.discountValue,
        required this.noOfClaimUser,
        required this.status,
        required this.image,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
    });

    factory VendorOfferList.fromJson(Map<String, dynamic> json) => VendorOfferList(
        id: json["id"],
        vendorId: json["vendor_id"],
        categoryId: json["category_id"],
        title: json["title"],
        startsAt: DateTime.parse(json["starts_at"]),
        endsAt: DateTime.parse(json["ends_at"]),
        businessValue: json["business_value"] ?? "",
        discountValue: json["discount_value"],
        noOfClaimUser: json["no_of_claim_user"],
        status: json["status"],
        image: json["image"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "category_id": categoryId,
        "title": title,
        "starts_at": "${startsAt.year.toString().padLeft(4, '0')}-${startsAt.month.toString().padLeft(2, '0')}-${startsAt.day.toString().padLeft(2, '0')}",
        "ends_at": "${endsAt.year.toString().padLeft(4, '0')}-${endsAt.month.toString().padLeft(2, '0')}-${endsAt.day.toString().padLeft(2, '0')}",
        "business_value": businessValue,
        "discount_value": discountValue,
        "no_of_claim_user": noOfClaimUser,
        "status": status,
        "image": image,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
