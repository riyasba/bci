// To parse this JSON data, do
//
//     final getBusCityList = getBusCityListFromJson(jsonString);

import 'dart:convert';

List<GetBusCityList> getBusCityListFromJson(String str) => List<GetBusCityList>.from(json.decode(str).map((x) => GetBusCityList.fromJson(x)));

String getBusCityListToJson(List<GetBusCityList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetBusCityList {
    int cityId;
    String cityName;

    GetBusCityList({
        required this.cityId,
        required this.cityName,
    });

    factory GetBusCityList.fromJson(Map<String, dynamic> json) => GetBusCityList(
        cityId: json["CityID"],
        cityName: json["CityName"],
    );

    Map<String, dynamic> toJson() => {
        "CityID": cityId,
        "CityName": cityName,
    };
}
