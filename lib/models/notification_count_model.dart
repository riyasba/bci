// To parse this JSON data, do
//
//     final notificationCount = notificationCountFromJson(jsonString);

import 'dart:convert';

NotificationCount notificationCountFromJson(String str) =>
    NotificationCount.fromJson(json.decode(str));

String notificationCountToJson(NotificationCount data) =>
    json.encode(data.toJson());

class NotificationCount {
  NotificationCountData data;

  NotificationCount({
    required this.data,
  });

  factory NotificationCount.fromJson(Map<String, dynamic> json) =>
      NotificationCount(
        data: NotificationCountData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class NotificationCountData {
  int totalCount;

  NotificationCountData({
    required this.totalCount,
  });

  factory NotificationCountData.fromJson(Map<String, dynamic> json) =>
      NotificationCountData(
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
      };
}
