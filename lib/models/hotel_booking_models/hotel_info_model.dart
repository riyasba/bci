// To parse this JSON data, do
//
//     final hotelInfoModel = hotelInfoModelFromJson(jsonString);

import 'dart:convert';

HotelInfoModel hotelInfoModelFromJson(String str) => HotelInfoModel.fromJson(json.decode(str));

String hotelInfoModelToJson(HotelInfoModel data) => json.encode(data.toJson());

class HotelInfoModel {
    String userIp;
    String searchToken;
    Error error;
    HotelInfoData result;

    HotelInfoModel({
        required this.userIp,
        required this.searchToken,
        required this.error,
        required this.result,
    });

    factory HotelInfoModel.fromJson(Map<String, dynamic> json) => HotelInfoModel(
        userIp: json["UserIp"],
        searchToken: json["Search_Token"],
        error: Error.fromJson(json["Error"]),
        result: HotelInfoData.fromJson(json["Result"]),
    );

    Map<String, dynamic> toJson() => {
        "UserIp": userIp,
        "Search_Token": searchToken,
        "Error": error.toJson(),
        "Result": result.toJson(),
    };
}

class Error {
    int errorCode;
    dynamic errorMessage;

    Error({
        required this.errorCode,
        required this.errorMessage,
    });

    factory Error.fromJson(Map<String, dynamic> json) => Error(
        errorCode: json["ErrorCode"],
        errorMessage: json["ErrorMessage"],
    );

    Map<String, dynamic> toJson() => {
        "ErrorCode": errorCode,
        "ErrorMessage": errorMessage,
    };
}

class HotelInfoData {
    String hotelCode;
    String hotelName;
    int starRating;
    dynamic hotelUrl;
    String description;
    dynamic attractions;
    List<String> hotelFacilities;
    String hotelPolicy;
    dynamic specialInstructions;
    dynamic hotelPicture;
    List<String> images;
    String address;
    dynamic countryName;
    dynamic pinCode;
    dynamic hotelContactNo;
    dynamic faxNumber;
    dynamic email;
    String latitude;
    String longitude;
    dynamic roomData;
    dynamic roomFacilities;
    dynamic services;

    HotelInfoData({
        required this.hotelCode,
        required this.hotelName,
        required this.starRating,
        required this.hotelUrl,
        required this.description,
        required this.attractions,
        required this.hotelFacilities,
        required this.hotelPolicy,
        required this.specialInstructions,
         required this.hotelPicture,
        required this.images,
        required this.address,
        required this.countryName,
        required this.pinCode,
        required this.hotelContactNo,
        required this.faxNumber,
        required this.email,
        required this.latitude,
        required this.longitude,
        required this.roomData,
        required this.roomFacilities,
        required this.services,
    });

    factory HotelInfoData.fromJson(Map<String, dynamic> json) => HotelInfoData(
        hotelCode: json["HotelCode"],
        hotelName: json["HotelName"],
        starRating: json["StarRating"],
        hotelUrl: json["HotelURL"],
        description: json["Description"] ?? "",
        attractions: json["Attractions"],
        hotelFacilities: List<String>.from(json["HotelFacilities"].map((x) => x)),
        hotelPolicy: json["HotelPolicy"]??"",
        specialInstructions: json["SpecialInstructions"],
        hotelPicture: json["HotelPicture"],
        images: List<String>.from(json["Images"].map((x) => x)),
        address: json["Address"],
        countryName: json["CountryName"],
        pinCode: json["PinCode"],
        hotelContactNo: json["HotelContactNo"],
        faxNumber: json["FaxNumber"],
        email: json["Email"],
        latitude: json["Latitude"] ?? "",
        longitude: json["Longitude"] ?? "",
        roomData: json["RoomData"],
        roomFacilities: json["RoomFacilities"],
        services: json["Services"],
    );

    Map<String, dynamic> toJson() => {
        "HotelCode": hotelCode,
        "HotelName": hotelName,
        "StarRating": starRating,
        "HotelURL": hotelUrl,
        "Description": description,
        "Attractions": attractions,
        "HotelFacilities": List<dynamic>.from(hotelFacilities.map((x) => x)),
        "HotelPolicy": hotelPolicy,
        "SpecialInstructions": specialInstructions,
        "HotelPicture": hotelPicture,
        "Images": List<dynamic>.from(images.map((x) => x)),
        "Address": address,
        "CountryName": countryName,
        "PinCode": pinCode,
        "HotelContactNo": hotelContactNo,
        "FaxNumber": faxNumber,
        "Email": email,
        "Latitude": latitude,
        "Longitude": longitude,
        "RoomData": roomData,
        "RoomFacilities": roomFacilities,
        "Services": services,
    };
}
