class FlightSearchDataModel {
  int isOneWayOrRoundTrip;
  String fromIata;
  String fromName;
  String toIata;
  String toName;
  String fromCountry;
  String toCountry;
  DateTime depatureDate;
  DateTime returnDate;
  int cabinClass;
  int adultsCount;
  int childCount;
  int isDomOrINTL;

  FlightSearchDataModel({
    required this.isOneWayOrRoundTrip,
    required this.fromIata,
    required this.fromName,
    required this.toName,
    required this.fromCountry,
    required this.toCountry,
    required this.adultsCount,
    required this.cabinClass,
    required this.childCount,
    required this.depatureDate,
    required this.returnDate,
    required this.toIata,
    required this.isDomOrINTL,
  });
}
