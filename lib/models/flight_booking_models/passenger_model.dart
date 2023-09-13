class PassengerDetail {
  String firstName;
  String lastName;
  int age;
  int maleOrFemale;
  List<BookingSSrDetails> bookingSsrDetails; 

  PassengerDetail({
    required this.age,
    required this.firstName,
    required this.lastName,
    required this.maleOrFemale,
    required this.bookingSsrDetails,
  });
}

class BookingSSrDetails {
  int pax_Id;
  String sSR_Key;


BookingSSrDetails({
  required this.pax_Id,
  required this.sSR_Key,
});

}
