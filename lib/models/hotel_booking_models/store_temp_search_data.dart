class TempBookingModel {
  final String bookingDate;
  final String noOfDays;
  final String place;
  final String noOfPeople;

  TempBookingModel({
    required this.bookingDate,
    required this.noOfDays,
    required this.place,
    required this.noOfPeople,
  });

  factory TempBookingModel.fromJson(Map<String, dynamic> json) {
    return TempBookingModel(
      bookingDate: json['bookingDate'],
      noOfDays: json['noOfDays'],
      place: json['place'],
      noOfPeople: json['noOfPeople'],
    );
  }
}
