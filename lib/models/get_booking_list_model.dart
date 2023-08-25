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
    String service;
    String image;
    String description;

    BookingListData({
        required this.id,
        required this.paymentId,
        required this.quantity,
        required this.purchasePrice,
        required this.status,
        required this.service,
        required this.image,
        required this.description,
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
    };
}




