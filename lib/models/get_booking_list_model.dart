// To parse this JSON data, do
//
//     final getBookingList = getBookingListFromJson(jsonString);

import 'dart:convert';

GetBookingList getBookingListFromJson(String str) => GetBookingList.fromJson(json.decode(str));

String getBookingListToJson(GetBookingList data) => json.encode(data.toJson());

class GetBookingList {
    String message;
    List<BookingListData> data;

    GetBookingList({
        required this.message,
        required this.data,
    });

    factory GetBookingList.fromJson(Map<String, dynamic> json) => GetBookingList(
        message: json["message"],
        data: List<BookingListData>.from(json["data"].map((x) => BookingListData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class BookingListData {
    int id;
    String paymentId;
    String quantity;
    String purchasePrice;
    String status;
    dynamic service;
    dynamic image;
    dynamic description;
    User user;

    BookingListData({
        required this.id,
        required this.paymentId,
        required this.quantity,
        required this.purchasePrice,
        required this.status,
        required this.service,
        required this.image,
        required this.description,
        required this.user,
    });

    factory BookingListData.fromJson(Map<String, dynamic> json) => BookingListData(
        id: json["id"]?? 0,
        paymentId: json["payment_id"]?? "",
        quantity: json["quantity"]?? "",
        purchasePrice: json["purchase_price"]?? "",
        status: json["status"],
        service: json["service"]?? "",
        image: json["image"]?? "",
        description: json["description"]?? "",
        user:User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "payment_id": paymentId,
        "quantity": quantity,
        "purchase_price": purchasePrice,
        "status": status,
        "service": service,
        "image": image,
        "description": description,
        "user": user.toJson(),
    };
}




class User {
    int id;
    String name;
    String email;
    dynamic profile;
    dynamic mobile;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.profile,
        required this.mobile,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"]?? 0,
        name: json["name"]?? "",
        email: json["email"]?? "",
        profile: json["profile"]?? "",
        mobile: json["mobile"]?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "profile": profile,
        "mobile": mobile,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
