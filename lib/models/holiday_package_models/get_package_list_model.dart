// To parse this JSON data, do
//
//     final getPackageList = getPackageListFromJson(jsonString);

import 'dart:convert';

GetPackageList getPackageListFromJson(String str) => GetPackageList.fromJson(json.decode(str));

String getPackageListToJson(GetPackageList data) => json.encode(data.toJson());

class GetPackageList {
    String message;
    List<PackageListData> data;

    GetPackageList({
        required this.message,
        required this.data,
    });

    factory GetPackageList.fromJson(Map<String, dynamic> json) => GetPackageList(
        message: json["message"],
        data: List<PackageListData>.from(json["data"].map((x) => PackageListData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class PackageListData {
    int id;
    String vendorId;
    String categoryId;
    String title;
    String description;
    String image;
    String inclusion;
    String exclusion;
    String amount;
    String packageoverview;
    String duration;
    String placeToVisit;
    String packageInclude;
    String dayWiseItinerary;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    List<String> images;
    String categoryName;

    PackageListData({
        required this.id,
        required this.vendorId,
        required this.categoryId,
        required this.title,
        required this.description,
        required this.image,
        required this.inclusion,
        required this.exclusion,
        required this.amount,
        required this.packageoverview,
        required this.duration,
        required this.placeToVisit,
        required this.packageInclude,
        required this.dayWiseItinerary,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.images,
        required this.categoryName,
    });

    factory PackageListData.fromJson(Map<String, dynamic> json) => PackageListData(
        id: json["id"],
        vendorId: json["vendor_id"],
        categoryId: json["category_id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        inclusion: json["inclusion"],
        exclusion: json["exclusion"],
        amount: json["Amount"],
        packageoverview: json["packageoverview"],
        duration: json["Duration"],
        placeToVisit: json["place_to_visit"],
        packageInclude: json["package_include"],
        dayWiseItinerary: json["day_wise_itinerary"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        images: List<String>.from(json["images"].map((x) => x)),
        categoryName: json["category_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "category_id": categoryId,
        "title": title,
        "description": description,
        "image": image,
        "inclusion": inclusion,
        "exclusion": exclusion,
        "Amount": amount,
        "packageoverview": packageoverview,
        "Duration": duration,
        "place_to_visit": placeToVisit,
        "package_include": packageInclude,
        "day_wise_itinerary": dayWiseItinerary,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "category_name": categoryName,
    };
}
