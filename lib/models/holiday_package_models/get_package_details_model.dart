// To parse this JSON data, do
//
//     final getPackageDetails = getPackageDetailsFromJson(jsonString);

import 'dart:convert';

GetPackageDetails getPackageDetailsFromJson(String str) => GetPackageDetails.fromJson(json.decode(str));

String getPackageDetailsToJson(GetPackageDetails data) => json.encode(data.toJson());

class GetPackageDetails {
    String message;
    GetPackageDetailsData data;

    GetPackageDetails({
        required this.message,
        required this.data,
    });

    factory GetPackageDetails.fromJson(Map<String, dynamic> json) => GetPackageDetails(
        message: json["message"],
        data: GetPackageDetailsData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class GetPackageDetailsData {
    int id;
    dynamic vendorId;
    String location;
    dynamic categoryId;
    String title;
    dynamic description;
    String image;
    dynamic isRecomended;
    dynamic inclusion;
    dynamic exclusion;
    String amount;
    String packageoverview;
    String duration;
    String placeToVisit;
    dynamic packageInclude;
    dynamic dayWiseItinerary;
    dynamic status;
    DateTime createdAt;
    DateTime updatedAt;
    List<String> images;
    List<Include> includes;
    String categoryName;

    GetPackageDetailsData({
        required this.id,
        required this.vendorId,
        required this.location,
        required this.categoryId,
        required this.title,
        this.description,
        required this.image,
        required this.isRecomended,
        this.inclusion,
        this.exclusion,
        required this.amount,
        required this.packageoverview,
        required this.duration,
        required this.placeToVisit,
        required this.packageInclude,
        this.dayWiseItinerary,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.images,
        required this.includes,
        required this.categoryName,
    });

    factory GetPackageDetailsData.fromJson(Map<String, dynamic> json) => GetPackageDetailsData(
        id: json["id"]?? 0,
        vendorId: json["vendor_id"]?? "",
        location: json["location"]?? "",
        categoryId: json["category_id"]?? "",
        title: json["title"]?? "",
        description: json["description"]?? "",
        image: json["image"]?? "",
        isRecomended: json["is_recomended"]?? "",
        inclusion: json["inclusion"]?? "",
        exclusion: json["exclusion"]?? "",
        amount: json["Amount"]?? "",
        packageoverview: json["packageoverview"]?? "",
        duration: json["Duration"]?? "",
        placeToVisit: json["place_to_visit"]?? "",
        packageInclude: json["package_include"]?? "",
        dayWiseItinerary: json["day_wise_itinerary"]?? "",
        status: json["status"]?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        images: List<String>.from(json["images"].map((x) => x)),
        includes: List<Include>.from(
            json["includes"].map((x) => Include.fromJson(x))),
        categoryName: json["category_name"]?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "location": location,
        "category_id": categoryId,
        "title": title,
        "description": description,
        "image": image,
        "is_recomended": isRecomended,
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


class Include {
    String value;

    Include({
        required this.value,
    });

    factory Include.fromJson(Map<String, dynamic> json) => Include(
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
    };
}

