// To parse this JSON data, do
//
//     final notificationListModel = notificationListModelFromJson(jsonString);

import 'dart:convert';

NotificationListModel notificationListModelFromJson(String str) => NotificationListModel.fromJson(json.decode(str));

String notificationListModelToJson(NotificationListModel data) => json.encode(data.toJson());

class NotificationListModel {
    List<NotificationData> data;

    NotificationListModel({
        required this.data,
    });

    factory NotificationListModel.fromJson(Map<String, dynamic> json) => NotificationListModel(
        data: List<NotificationData>.from(json["data"].map((x) => NotificationData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class NotificationData {
    int id;
    String title;
    String message;
    String recipientId;
    String vendorId;
    String notifiableType;
    String notifyId;
    String data;
    dynamic readAt;
    DateTime createdAt;
    DateTime updatedAt;

    NotificationData({
        required this.id,
        required this.title,
        required this.message,
        required this.recipientId,
        required this.vendorId,
        required this.notifiableType,
        required this.notifyId,
        required this.data,
        required this.readAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory NotificationData.fromJson(Map<String, dynamic> json) => NotificationData(
        id: json["id"]?? 0,
        title: json["title"]?? "",
        message: json["message"]?? "",
        recipientId: json["recipient_id"]?? "",
        vendorId: json["vendor_id"]?? "",
        notifiableType: json["notifiable_type"]?? "",
        notifyId: json["notify_id"]?? "",
        data: json["data"]?? "",
        readAt: json["read_at"]?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "message": message,
        "recipient_id": recipientId,
        "vendor_id": vendorId,
        "notifiable_type": notifiableType,
        "notify_id": notifyId,
        "data": data,
        "read_at": readAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
