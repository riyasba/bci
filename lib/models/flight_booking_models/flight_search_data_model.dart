class FlightSearchDataModel {
  int isOneWayOrRoundTrip;
  String fromIata;
  String toIata;
  DateTime depatureDate;
  DateTime returnDate;
  int cabinClass;
  int adultsCount;
  int childCount;

  FlightSearchDataModel({
    required this.isOneWayOrRoundTrip,
    required this.fromIata,
    required this.adultsCount,
    required this.cabinClass,
    required this.childCount,
    required this.depatureDate,
    required this.returnDate,
    required this.toIata,
  });
}
