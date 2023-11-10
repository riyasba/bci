// To parse this JSON data, do
//
//     final flightSearchModel = flightSearchModelFromJson(jsonString);

import 'dart:convert';

List<FlightSearchModel> flightSearchModelFromJson(String str) =>
    List<FlightSearchModel>.from(
        json.decode(str).map((x) => FlightSearchModel.fromJson(x)));

String flightSearchModelToJson(List<FlightSearchModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FlightSearchModel {
  int id;
  String airportcode;
  String airportName;
  String city;
  String countrycode;
  String status;
  String isDomestic;
  String? popularCity;
  String? orderNo;
  DateTime createdAt;
  DateTime updatedAt;

  FlightSearchModel({
    required this.id,
    required this.airportcode,
    required this.airportName,
    required this.city,
    required this.countrycode,
    required this.status,
    required this.isDomestic,
    required this.popularCity,
    required this.orderNo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FlightSearchModel.fromJson(Map<String, dynamic> json) =>
      FlightSearchModel(
        id: json["id"] ?? 0,
        airportcode: json["airportcode"] ?? "",
        airportName: json["airport_name"] ?? "",
        city: json["city"] ?? "",
        countrycode: json["countrycode"] ?? "",
        status: json["status"] ?? "",
        isDomestic: json["is_domestic"] ?? "",
        popularCity: json["popular_city"] ?? "",
        orderNo: json["order_no"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "airportcode": airportcode,
        "airport_name": airportName,
        "city": city,
        "countrycode": countrycode,
        "status": status,
        "is_domestic": isDomestic,
        "popular_city": popularCity,
        "order_no": orderNo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
