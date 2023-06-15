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
    Status status;
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
        status: statusValues.map[json["status"]]!,
        service: json["service"]?? "",
        image: json["image"]?? "",
        description: json["description"]?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "payment_id": paymentId,
        "quantity": quantity,
        "purchase_price": purchasePrice,
        "status": statusValues.reverse[status],
        "service": serviceValues.reverse[service],
        "image": image,
        "description": description,
    };
}

enum Service { CHANGES, PRIYADHARSHINI, CTZ }

final serviceValues = EnumValues({
    "changes": Service.CHANGES,
    "Ctz": Service.CTZ,
    "Priyadharshini": Service.PRIYADHARSHINI
});

enum Status { COMPLETED }

final statusValues = EnumValues({
    "completed": Status.COMPLETED
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
