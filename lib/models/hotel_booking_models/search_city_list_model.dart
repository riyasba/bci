// To parse this JSON data, do
//
//     final searchCityListModel = searchCityListModelFromJson(jsonString);

import 'dart:convert';

List<SearchCityListModel> searchCityListModelFromJson(String str) => List<SearchCityListModel>.from(json.decode(str).map((x) => SearchCityListModel.fromJson(x)));

String searchCityListModelToJson(List<SearchCityListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchCityListModel {


    String cityid;
    String destination;
    String stateprovince;
    String stateProvinceCode;
    String country;
    String countrycode;


    SearchCityListModel({

        required this.cityid,
        required this.destination,
        required this.stateprovince,
        required this.stateProvinceCode,
        required this.country,
        required this.countrycode,

    });

    factory SearchCityListModel.fromJson(Map<String, dynamic> json) => SearchCityListModel(
        cityid: json["cityid"]?? "",
        destination: json["Destination"]?? "",
        stateprovince: json["stateprovince"]?? "",
        stateProvinceCode: json["StateProvinceCode"]?? "",
        country: json["country"]?? "",
        countrycode: json["countrycode"]?? "",
    );

    Map<String, dynamic> toJson() => {
        "cityid": cityid,
        "Destination": destination,
        "stateprovince": stateprovince,
        "StateProvinceCode": stateProvinceCode,
        "country": country,
        "countrycode": countrycode,
    };
}
