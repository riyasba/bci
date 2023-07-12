class BookingModel {
  String customerMobile;
  String passengerMobile;
  String passengerEmail;
  List<PaxDetails> paxDetails;
  String searchKey;
  String flightKey;
  String bookingRemark;

  BookingModel({
    required this.customerMobile,
    required this.passengerEmail,
    required this.passengerMobile,
    required this.paxDetails,
    required this.searchKey,
    required this.flightKey,
    required this.bookingRemark,
  });
}

class PaxDetails {
  String title;
  String firstName;
  String lastName;
  int gender;

  PaxDetails(
      {required this.firstName,
      required this.gender,
      required this.lastName,
      required this.title});

  Map<String, dynamic> toJson() => {
        "Pax_Id": 1,
        "Pax_type": 0,
        "Title": title,
        "First_Name": firstName,
        "Last_Name": lastName,
        "Gender": gender,
        "Age": null,
        "DOB": null,
        "Passport_Number": null,
        "Passport_Issuing_Country": null,
        "Passport_Expiry": null,
        "Nationality": null,
        "FrequentFlyerDetails": null
};
     
}
