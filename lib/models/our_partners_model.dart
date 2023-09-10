// To parse this JSON data, do
//
//     final ourPartnersList = ourPartnersListFromJson(jsonString);

import 'dart:convert';

OurPartnersList ourPartnersListFromJson(String str) => OurPartnersList.fromJson(json.decode(str));

String ourPartnersListToJson(OurPartnersList data) => json.encode(data.toJson());

class OurPartnersList {
    List<OurPartnerData> data;

    OurPartnersList({
        required this.data,
    });

    factory OurPartnersList.fromJson(Map<String, dynamic> json) => OurPartnersList(
        data: List<OurPartnerData>.from(json["data"].map((x) => OurPartnerData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class OurPartnerData {
    int id;
    String title;
    String image;
    String description;
    String mapUrl;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    OurPartnerData({
        required this.id,
        required this.title,
        required this.image,
        required this.description,
        required this.mapUrl,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory OurPartnerData.fromJson(Map<String, dynamic> json) => OurPartnerData(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
        mapUrl: json["map_url"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "description": description,
        "map_url": mapUrl,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
