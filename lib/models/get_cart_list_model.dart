// To parse this JSON data, do
//
//     final getCartList = getCartListFromJson(jsonString);

import 'dart:convert';

List<GetCartList> getCartListFromJson(String str) => List<GetCartList>.from(json.decode(str).map((x) => GetCartList.fromJson(x)));

String getCartListToJson(List<GetCartList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCartList {
    int id;
    String userId;
    String serviceId;
    String quantity;
    DateTime createdAt;
    DateTime updatedAt;
    String serviceName;

    GetCartList({
        required this.id,
        required this.userId,
        required this.serviceId,
        required this.quantity,
        required this.createdAt,
        required this.updatedAt,
        required this.serviceName,
    });

    factory GetCartList.fromJson(Map<String, dynamic> json) => GetCartList(
        id: json["id"],
        userId: json["user_id"],
        serviceId: json["service_id"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        serviceName: json["service_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "service_id": serviceId,
        "quantity": quantity,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "service_name": serviceName,
    };
}
