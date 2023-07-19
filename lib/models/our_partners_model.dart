// To parse this JSON data, do
//
//     final ourPartnersList = ourPartnersListFromJson(jsonString);

import 'dart:convert';

OurPartnersList ourPartnersListFromJson(String str) => OurPartnersList.fromJson(json.decode(str));

String ourPartnersListToJson(OurPartnersList data) => json.encode(data.toJson());

class OurPartnersList {
    List<OurPartnersData> data;

    OurPartnersList({
        required this.data,
    });

    factory OurPartnersList.fromJson(Map<String, dynamic> json) => OurPartnersList(
        data: List<OurPartnersData>.from(json["data"].map((x) => OurPartnersData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class OurPartnersData {
    int id;
    String title;
    String image;
    dynamic status;
    DateTime createdAt;
    DateTime updatedAt;

    OurPartnersData({
        required this.id,
        required this.title,
        required this.image,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory OurPartnersData.fromJson(Map<String, dynamic> json) => OurPartnersData(
        id: json["id"]?? 0,
        title: json["title"]?? "",
        image: json["image"]?? "",
        status: json["status"]?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
