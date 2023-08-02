// To parse this JSON data, do
//
//     final getEnquiryList = getEnquiryListFromJson(jsonString);

import 'dart:convert';

GetEnquiryList getEnquiryListFromJson(String str) => GetEnquiryList.fromJson(json.decode(str));

String getEnquiryListToJson(GetEnquiryList data) => json.encode(data.toJson());

class GetEnquiryList {
    String message;
    List<EnquiryData> data;

    GetEnquiryList({
        required this.message,
        required this.data,
    });

    factory GetEnquiryList.fromJson(Map<String, dynamic> json) => GetEnquiryList(
        message: json["message"],
        data: List<EnquiryData>.from(json["data"].map((x) => EnquiryData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class EnquiryData {
    int id;
    dynamic packageId;
    dynamic vendorId;
    String cityOfDeparture;
    String dateOfDeparture;
    String adultCount;
    String childCount;
    String infantCount;
    String name;
    String email;
    String mobile;
    dynamic status;
    DateTime createdAt;
    DateTime updatedAt;
    PackageDetails packageDetails;

    EnquiryData({
        required this.id,
        required this.packageId,
        required this.vendorId,
        required this.cityOfDeparture,
        required this.dateOfDeparture,
        required this.adultCount,
        required this.childCount,
        required this.infantCount,
        required this.name,
        required this.email,
        required this.mobile,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.packageDetails,
    });

    factory EnquiryData.fromJson(Map<String, dynamic> json) => EnquiryData(
        id: json["id"],
        packageId: json["package_id"],
        vendorId: json["vendor_id"],
        cityOfDeparture: json["city_of_departure"],
        dateOfDeparture: json["date_of_departure"],
        adultCount: json["adult_count"],
        childCount: json["child_count"],
        infantCount: json["infant_count"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        packageDetails:json["package_details"] == 'null' ? PackageDetails(id: 0 , vendorId: "", location: "", categoryId: "", title: "", image: [], isRecomended: "", amount: "", packageoverview: "", duration: "", placeToVisit: "", packageInclude: "", status: "", createdAt: DateTime.now(), updatedAt: DateTime.now()) : PackageDetails.fromJson(json["package_details"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "package_id": packageId,
        "vendor_id": vendorId,
        "city_of_departure": cityOfDeparture,
        "date_of_departure": dateOfDeparture,
        "adult_count": adultCount,
        "child_count": childCount,
        "infant_count": infantCount,
        "name": name,
        "email": email,
        "mobile": mobile,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "package_details": packageDetails.toJson(),
    };
}

class PackageDetails {
    int id;
    dynamic vendorId;
    String location;
    dynamic categoryId;
    String title;
    dynamic description;
    List<String> image;
    dynamic isRecomended;
    dynamic inclusion;
    dynamic exclusion;
    String amount;
    String packageoverview;
    String duration;
    String placeToVisit;
    String packageInclude;
    dynamic dayWiseItinerary;
    dynamic status;
    DateTime createdAt;
    DateTime updatedAt;

    PackageDetails({
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
    });

    factory PackageDetails.fromJson(Map<String, dynamic> json) => PackageDetails(
        id: json["id"],
        vendorId: json["vendor_id"],
        location: json["location"],
        categoryId: json["category_id"],
        title: json["title"],
        description: json["description"],
        image: List<String>.from(json["image"].map((x) => x)),
        isRecomended: json["is_recomended"],
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
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "location": location,
        "category_id": categoryId,
        "title": title,
        "description": description,
        "image": List<dynamic>.from(image.map((x) => x)),
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
    };
}
