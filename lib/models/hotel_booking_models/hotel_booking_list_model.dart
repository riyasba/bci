// To parse this JSON data, do
//
//     final hotelBookingListModel = hotelBookingListModelFromJson(jsonString);

import 'dart:convert';

HotelBookingListModel hotelBookingListModelFromJson(String str) =>
    HotelBookingListModel.fromJson(json.decode(str));

String hotelBookingListModelToJson(HotelBookingListModel data) =>
    json.encode(data.toJson());

class HotelBookingListModel {
  List<BookingList> bookingList;

  HotelBookingListModel({
    required this.bookingList,
  });

  factory HotelBookingListModel.fromJson(Map<String, dynamic> json) =>
      HotelBookingListModel(
        bookingList: List<BookingList>.from(
            json["Booking List"].map((x) => BookingList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Booking List": List<dynamic>.from(bookingList.map((x) => x.toJson())),
      };
}

class BookingList {
  int id;
  String userId;
  String hotelName;
  String hotelContact;
  String noOfPeople;
  String noOfDays;
  dynamic hotelImage;
  String place;
  String price;
  String userName;
  String bookingRefNo;
  String bookingId;
  String bookingDate;
  String hotelBookingStatus;
  String confirmationNo;
  String isPriceChanged;
  String isCancelPolicyChanged;
  String status;
  String searchKey;
  DateTime createdAt;
  DateTime updatedAt;

  BookingList({
    required this.id,
    required this.userId,
    required this.hotelName,
    required this.hotelContact,
    required this.noOfPeople,
    required this.noOfDays,
    required this.hotelImage,
    required this.place,
    required this.price,
    required this.userName,
    required this.bookingRefNo,
    required this.bookingId,
    required this.bookingDate,
    required this.hotelBookingStatus,
    required this.confirmationNo,
    required this.isPriceChanged,
    required this.isCancelPolicyChanged,
    required this.status,
    required this.searchKey,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingList.fromJson(Map<String, dynamic> json) => BookingList(
        id: json["id"],
        userId: json["user_id"],
        hotelName: json["hotel_name"] ?? "",
        hotelContact: json["hotel_contact"] ?? "",
        noOfPeople: json["no_of_people"] ?? "",
        noOfDays: json["no_of_days"] ?? "",
        hotelImage: json["hotel_image"] ?? "null",
        place: json["place"] ?? "",
        price: json["price"] ?? "0.0",
        userName: json["user_name"] ?? "",
        bookingRefNo: json["booking_ref_no"] ?? "",
        bookingId: json["booking_id"] ?? "",
        bookingDate: json["booking_date"] ?? "",
        hotelBookingStatus: json["hotel_booking_status"] ?? "",
        confirmationNo: json["confirmation_no"] ?? "",
        isPriceChanged: json["is_price_changed"] ?? "",
        isCancelPolicyChanged: json["is_cancel_policy_changed"] ?? "",
        status: json["status"] ?? "",
        searchKey: json["search_token"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "hotel_name": hotelName,
        "hotel_contact": hotelContact,
        "no_of_people": noOfPeople,
        "no_of_days": noOfDays,
        "hotel_image": hotelImage,
        "place": place,
        "price": price,
        "user_name": userName,
        "booking_ref_no": bookingRefNo,
        "booking_id": bookingId,
        "booking_date": bookingDate,
        "hotel_booking_status": hotelBookingStatus,
        "confirmation_no": confirmationNo,
        "is_price_changed": isPriceChanged,
        "is_cancel_policy_changed": isCancelPolicyChanged,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
