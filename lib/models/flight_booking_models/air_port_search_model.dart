// To parse this JSON data, do
//
//     final airportSearchModel = airportSearchModelFromJson(jsonString);

import 'dart:convert';

AirportSearchModel airportSearchModelFromJson(String str) =>
    AirportSearchModel.fromJson(json.decode(str));

String airportSearchModelToJson(AirportSearchModel data) =>
    json.encode(data.toJson());

class AirportSearchModel {
  int status;
  int offset;
  String max;
  List<Airport> airports;

  AirportSearchModel({
    required this.status,
    required this.offset,
    required this.max,
    required this.airports,
  });

  factory AirportSearchModel.fromJson(Map<String, dynamic> json) =>
      AirportSearchModel(
        status: json["status"],
        offset: json["offset"],
        max: json["max"],
        airports: List<Airport>.from(
            json["airports"].map((x) => Airport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "offset": offset,
        "max": max,
        "airports": List<dynamic>.from(airports.map((x) => x.toJson())),
      };
}

class Airport {
  String name;
  String city;
  String country;
  dynamic countryCode;
  String iata;
  String icao;
  String x;
  String y;
  String elevation;
  String apid;
  String timezone;
  String dst;
  String tzId;
  String type;
  String source;
  dynamic apUid;
  String apName;

  Airport({
    required this.name,
    required this.city,
    required this.country,
    this.countryCode,
    required this.iata,
    required this.icao,
    required this.x,
    required this.y,
    required this.elevation,
    required this.apid,
    required this.timezone,
    required this.dst,
    required this.tzId,
    required this.type,
    required this.source,
    this.apUid,
    required this.apName,
  });

  factory Airport.fromJson(Map<String, dynamic> json) => Airport(
        name: json["name"] ?? "",
        city: json["city"] ?? "",
        country: json["country"] ?? "",
        countryCode: json["country_code"] ?? "",
        iata: json["iata"],
        icao: json["icao"] ?? "",
        x: json["x"] ?? "",
        y: json["y"] ?? "",
        elevation: json["elevation"] ?? "",
        apid: json["apid"] ?? "",
        timezone: json["timezone"] ?? "",
        dst: json["dst"] ?? "",
        tzId: json["tz_id"] ?? "",
        type: json["type"] ?? "",
        source: json["source"] ?? "",
        apUid: json["ap_uid"] ?? "",
        apName: json["ap_name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "city": city,
        "country": country,
        "country_code": countryCode,
        "iata": iata,
        "icao": icao,
        "x": x,
        "y": y,
        "elevation": elevation,
        "apid": apid,
        "timezone": timezone,
        "dst": dst,
        "tz_id": tzId,
        "type": type,
        "source": source,
        "ap_uid": apUid,
        "ap_name": apName,
      };
}
