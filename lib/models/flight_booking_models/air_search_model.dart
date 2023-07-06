// To parse this JSON data, do
//
//     final airSearchModel = airSearchModelFromJson(jsonString);

import 'dart:convert';

AirSearchModel airSearchModelFromJson(String str) =>
    AirSearchModel.fromJson(json.decode(str));

String airSearchModelToJson(AirSearchModel data) => json.encode(data.toJson());

class AirSearchModel {
  ResponseHeader responseHeader;
  String searchKey;
  List<TripDetail> tripDetails;

  AirSearchModel({
    required this.responseHeader,
    required this.searchKey,
    required this.tripDetails,
  });

  factory AirSearchModel.fromJson(Map<String, dynamic> json) => AirSearchModel(
        responseHeader: ResponseHeader.fromJson(json["Response_Header"]),
        searchKey: json["Search_Key"],
        tripDetails: List<TripDetail>.from(
            json["TripDetails"].map((x) => TripDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Response_Header": responseHeader.toJson(),
        "Search_Key": searchKey,
        "TripDetails": List<dynamic>.from(tripDetails.map((x) => x.toJson())),
      };
}

class ResponseHeader {
  String errorCode;
  String errorDesc;
  String errorInnerException;
  String requestId;
  String statusId;

  ResponseHeader({
    required this.errorCode,
    required this.errorDesc,
    required this.errorInnerException,
    required this.requestId,
    required this.statusId,
  });

  factory ResponseHeader.fromJson(Map<String, dynamic> json) => ResponseHeader(
        errorCode: json["Error_Code"],
        errorDesc: json["Error_Desc"],
        errorInnerException: json["Error_InnerException"],
        requestId: json["Request_Id"],
        statusId: json["Status_Id"],
      );

  Map<String, dynamic> toJson() => {
        "Error_Code": errorCode,
        "Error_Desc": errorDesc,
        "Error_InnerException": errorInnerException,
        "Request_Id": requestId,
        "Status_Id": statusId,
      };
}

class TripDetail {
  List<Flight> flights;
  int tripId;

  TripDetail({
    required this.flights,
    required this.tripId,
  });

  factory TripDetail.fromJson(Map<String, dynamic> json) => TripDetail(
        flights:
            List<Flight>.from(json["Flights"].map((x) => Flight.fromJson(x))),
        tripId: json["Trip_Id"],
      );

  Map<String, dynamic> toJson() => {
        "Flights": List<dynamic>.from(flights.map((x) => x.toJson())),
        "Trip_Id": tripId,
      };
}

class Flight {
  String airlineCode;
  bool blockTicketAllowed;
  bool cached;
  String destination;
  List<Fare> fares;
  String flightId;
  String flightKey;
  String flightNumbers;
  bool gstEntryAllowed;
  bool hasMoreClass;
  int inventoryType;
  bool isLcc;
  String origin;
  bool repriced;
  List<Segment> segments;
  String travelDate;

  Flight({
    required this.airlineCode,
    required this.blockTicketAllowed,
    required this.cached,
    required this.destination,
    required this.fares,
    required this.flightId,
    required this.flightKey,
    required this.flightNumbers,
    required this.gstEntryAllowed,
    required this.hasMoreClass,
    required this.inventoryType,
    required this.isLcc,
    required this.origin,
    required this.repriced,
    required this.segments,
    required this.travelDate,
  });

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
        airlineCode: json["Airline_Code"],
        blockTicketAllowed: json["Block_Ticket_Allowed"],
        cached: json["Cached"],
        destination: json["Destination"],
        fares: List<Fare>.from(json["Fares"].map((x) => Fare.fromJson(x))),
        flightId: json["Flight_Id"],
        flightKey: json["Flight_Key"],
        flightNumbers: json["Flight_Numbers"],
        gstEntryAllowed: json["GST_Entry_Allowed"],
        hasMoreClass: json["HasMoreClass"],
        inventoryType: json["InventoryType"],
        isLcc: json["IsLCC"],
        origin: json["Origin"],
        repriced: json["Repriced"],
        segments: List<Segment>.from(
            json["Segments"].map((x) => Segment.fromJson(x))),
        travelDate: json["TravelDate"],
      );

  Map<String, dynamic> toJson() => {
        "Airline_Code": airlineCode,
        "Block_Ticket_Allowed": blockTicketAllowed,
        "Cached": cached,
        "Destination": destination,
        "Fares": List<dynamic>.from(fares.map((x) => x.toJson())),
        "Flight_Id": flightId,
        "Flight_Key": flightKey,
        "Flight_Numbers": flightNumbers,
        "GST_Entry_Allowed": gstEntryAllowed,
        "HasMoreClass": hasMoreClass,
        "InventoryType": inventoryType,
        "IsLCC": isLcc,
        "Origin": origin,
        "Repriced": repriced,
        "Segments": List<dynamic>.from(segments.map((x) => x.toJson())),
        "TravelDate": travelDate,
      };
}

class Fare {
  List<FareDetail> fareDetails;
  int fareType;
  String fareId;
  dynamic fareKey;
  String foodOnboard;
  bool gstMandatory;
  dynamic lastFewSeats;
  String? productClass;
  dynamic promptMessage;
  bool refundable;
  String? seatsAvailable;
  dynamic warning;

  Fare({
    required this.fareDetails,
    required this.fareType,
    required this.fareId,
    this.fareKey,
    required this.foodOnboard,
    required this.gstMandatory,
    this.lastFewSeats,
    this.productClass,
    this.promptMessage,
    required this.refundable,
    this.seatsAvailable,
    this.warning,
  });

  factory Fare.fromJson(Map<String, dynamic> json) => Fare(
        fareDetails: List<FareDetail>.from(
            json["FareDetails"].map((x) => FareDetail.fromJson(x))),
        fareType: json["FareType"],
        fareId: json["Fare_Id"],
        fareKey: json["Fare_Key"],
        foodOnboard: json["Food_onboard"],
        gstMandatory: json["GSTMandatory"],
        lastFewSeats: json["LastFewSeats"],
        productClass: json["ProductClass"],
        promptMessage: json["PromptMessage"],
        refundable: json["Refundable"],
        seatsAvailable: json["Seats_Available"],
        warning: json["Warning"],
      );

  Map<String, dynamic> toJson() => {
        "FareDetails": List<dynamic>.from(fareDetails.map((x) => x.toJson())),
        "FareType": fareType,
        "Fare_Id": fareId,
        "Fare_Key": fareKey,
        "Food_onboard": foodOnboard,
        "GSTMandatory": gstMandatory,
        "LastFewSeats": lastFewSeats,
        "ProductClass": productClass,
        "PromptMessage": promptMessage,
        "Refundable": refundable,
        "Seats_Available": seatsAvailable,
        "Warning": warning,
      };
}

class FareDetail {
  double airportTaxAmount;
  List<AirportTax> airportTaxes;
  int basicAmount;
  List<Charge>? cancellationCharges;
  String currencyCode;
  List<FareClass> fareClasses;
  FreeBaggage freeBaggage;
  int gst;
  int grossCommission;
  int netCommission;
  int paxType;
  int promoDiscount;
  List<Charge>? rescheduleCharges;
  int serviceFeeAmount;
  int tds;
  int totalAmount;
  int tradeMarkupAmount;
  int yqAmount;

  FareDetail({
    required this.airportTaxAmount,
    required this.airportTaxes,
    required this.basicAmount,
    this.cancellationCharges,
    required this.currencyCode,
    required this.fareClasses,
    required this.freeBaggage,
    required this.gst,
    required this.grossCommission,
    required this.netCommission,
    required this.paxType,
    required this.promoDiscount,
    this.rescheduleCharges,
    required this.serviceFeeAmount,
    required this.tds,
    required this.totalAmount,
    required this.tradeMarkupAmount,
    required this.yqAmount,
  });

  factory FareDetail.fromJson(Map<String, dynamic> json) => FareDetail(
        airportTaxAmount: json["AirportTax_Amount"]?.toDouble(),
        airportTaxes: List<AirportTax>.from(
            json["AirportTaxes"].map((x) => AirportTax.fromJson(x))),
        basicAmount: json["Basic_Amount"],
        cancellationCharges: json["CancellationCharges"] == null
            ? []
            : List<Charge>.from(
                json["CancellationCharges"]!.map((x) => Charge.fromJson(x))),
        currencyCode: json["Currency_Code"],
        fareClasses: List<FareClass>.from(
            json["FareClasses"].map((x) => FareClass.fromJson(x))),
        freeBaggage: FreeBaggage.fromJson(json["Free_Baggage"]),
        gst: json["GST"],
        grossCommission: json["Gross_Commission"],
        netCommission: json["Net_Commission"],
        paxType: json["PAX_Type"],
        promoDiscount: json["Promo_Discount"],
        rescheduleCharges: json["RescheduleCharges"] == null
            ? []
            : List<Charge>.from(
                json["RescheduleCharges"]!.map((x) => Charge.fromJson(x))),
        serviceFeeAmount: json["Service_Fee_Amount"],
        tds: json["TDS"],
        totalAmount: json["Total_Amount"],
        tradeMarkupAmount: json["Trade_Markup_Amount"],
        yqAmount: json["YQ_Amount"],
      );

  Map<String, dynamic> toJson() => {
        "AirportTax_Amount": airportTaxAmount,
        "AirportTaxes": List<dynamic>.from(airportTaxes.map((x) => x.toJson())),
        "Basic_Amount": basicAmount,
        "CancellationCharges": cancellationCharges == null
            ? []
            : List<dynamic>.from(cancellationCharges!.map((x) => x.toJson())),
        "Currency_Code": currencyCode,
        "FareClasses": List<dynamic>.from(fareClasses.map((x) => x.toJson())),
        "Free_Baggage": freeBaggage.toJson(),
        "GST": gst,
        "Gross_Commission": grossCommission,
        "Net_Commission": netCommission,
        "PAX_Type": paxType,
        "Promo_Discount": promoDiscount,
        "RescheduleCharges": rescheduleCharges == null
            ? []
            : List<dynamic>.from(rescheduleCharges!.map((x) => x.toJson())),
        "Service_Fee_Amount": serviceFeeAmount,
        "TDS": tds,
        "Total_Amount": totalAmount,
        "Trade_Markup_Amount": tradeMarkupAmount,
        "YQ_Amount": yqAmount,
      };
}

class AirportTax {
  double taxAmount;
  String taxCode;
  String taxDesc;

  AirportTax({
    required this.taxAmount,
    required this.taxCode,
    required this.taxDesc,
  });

  factory AirportTax.fromJson(Map<String, dynamic> json) => AirportTax(
        taxAmount: json["Tax_Amount"]?.toDouble(),
        taxCode: json["Tax_Code"],
        taxDesc: json["Tax_Desc"],
      );

  Map<String, dynamic> toJson() => {
        "Tax_Amount": taxAmount,
        "Tax_Code": taxCode,
        "Tax_Desc": taxDesc,
      };
}

class Charge {
  int applicablility;
  int durationFrom;
  int durationTo;
  int durationTypeFrom;
  int durationTypeTo;
  int offlineServiceFee;
  int onlineServiceFee;
  int passengerType;
  String remarks;
  bool returnFlight;
  String value;
  int valueType;

  Charge({
    required this.applicablility,
    required this.durationFrom,
    required this.durationTo,
    required this.durationTypeFrom,
    required this.durationTypeTo,
    required this.offlineServiceFee,
    required this.onlineServiceFee,
    required this.passengerType,
    required this.remarks,
    required this.returnFlight,
    required this.value,
    required this.valueType,
  });

  factory Charge.fromJson(Map<String, dynamic> json) => Charge(
        applicablility: json["Applicablility"],
        durationFrom: json["DurationFrom"],
        durationTo: json["DurationTo"],
        durationTypeFrom: json["DurationTypeFrom"],
        durationTypeTo: json["DurationTypeTo"],
        offlineServiceFee: json["OfflineServiceFee"],
        onlineServiceFee: json["OnlineServiceFee"],
        passengerType: json["PassengerType"],
        remarks: json["Remarks"],
        returnFlight: json["Return_Flight"],
        value: json["Value"],
        valueType: json["ValueType"],
      );

  Map<String, dynamic> toJson() => {
        "Applicablility": applicablility,
        "DurationFrom": durationFrom,
        "DurationTo": durationTo,
        "DurationTypeFrom": durationTypeFrom,
        "DurationTypeTo": durationTypeTo,
        "OfflineServiceFee": offlineServiceFee,
        "OnlineServiceFee": onlineServiceFee,
        "PassengerType": passengerType,
        "Remarks": remarks,
        "Return_Flight": returnFlight,
        "Value": value,
        "ValueType": valueType,
      };
}

class FareClass {
  String? classCode;
  String classDesc;
  String fareBasis;
  dynamic privileges;
  int segmentId;

  FareClass({
    this.classCode,
    required this.classDesc,
    required this.fareBasis,
    this.privileges,
    required this.segmentId,
  });

  factory FareClass.fromJson(Map<String, dynamic> json) => FareClass(
        classCode: json["Class_Code"],
        classDesc: json["Class_Desc"],
        fareBasis: json["FareBasis"],
        privileges: json["Privileges"],
        segmentId: json["Segment_Id"],
      );

  Map<String, dynamic> toJson() => {
        "Class_Code": classCode,
        "Class_Desc": classDesc,
        "FareBasis": fareBasis,
        "Privileges": privileges,
        "Segment_Id": segmentId,
      };
}

class FreeBaggage {
  String checkInBaggage;
  String handBaggage;

  FreeBaggage({
    required this.checkInBaggage,
    required this.handBaggage,
  });

  factory FreeBaggage.fromJson(Map<String, dynamic> json) => FreeBaggage(
        checkInBaggage: json["Check_In_Baggage"] ?? "",
        handBaggage: json["Hand_Baggage"]?? "",
      );

  Map<String, dynamic> toJson() => {
        "Check_In_Baggage": checkInBaggage,
        "Hand_Baggage": handBaggage,
      };
}

class Segment {
  String aircraftType;
  String airlineCode;
  String airlineName;
  String arrivalDateTime;
  String departureDateTime;
  String destination;
  String destinationCity;
  String destinationTerminal;
  String duration;
  String flightNumber;
  int legIndex;
  dynamic operatedBy;
  String origin;
  String originCity;
  String originTerminal;
  bool returnFlight;
  int segmentId;
  dynamic stopOver;

  Segment({
    required this.aircraftType,
    required this.airlineCode,
    required this.airlineName,
    required this.arrivalDateTime,
    required this.departureDateTime,
    required this.destination,
    required this.destinationCity,
    required this.destinationTerminal,
    required this.duration,
    required this.flightNumber,
    required this.legIndex,
    this.operatedBy,
    required this.origin,
    required this.originCity,
    required this.originTerminal,
    required this.returnFlight,
    required this.segmentId,
    this.stopOver,
  });

  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
        aircraftType: json["Aircraft_Type"] ?? "",
        airlineCode: json["Airline_Code"] ?? "",
        airlineName: json["Airline_Name"] ?? "",
        arrivalDateTime: json["Arrival_DateTime"] ?? "",
      departureDateTime: json["Departure_DateTime"] ?? "",
        destination: json["Destination"] ?? "",
        destinationCity: json["Destination_City"] ?? "",
        destinationTerminal: json["Destination_Terminal"] ?? "",
        duration: json["Duration"] ??"",
        flightNumber: json["Flight_Number"] ?? "",
        legIndex: json["Leg_Index"] ?? "",
        operatedBy: json["OperatedBy"] ?? "",
        origin: json["Origin"] ?? "",
        originCity: json["Origin_City"] ?? "",
        originTerminal: json["Origin_Terminal"] ?? "",
        returnFlight: json["Return_Flight"] ?? "",
        segmentId: json["Segment_Id"] ?? "",
        stopOver: json["Stop_Over"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "Aircraft_Type": aircraftType,
        "Airline_Code": airlineCode,
        "Airline_Name": airlineName,
        "Arrival_DateTime": arrivalDateTime,
        "Departure_DateTime": departureDateTime,
        "Destination": destination,
        "Destination_City": destinationCity,
        "Destination_Terminal": destinationTerminal,
        "Duration": duration,
        "Flight_Number": flightNumber,
        "Leg_Index": legIndex,
        "OperatedBy": operatedBy,
        "Origin": origin,
        "Origin_City": originCity,
        "Origin_Terminal": originTerminal,
        "Return_Flight": returnFlight,
        "Segment_Id": segmentId,
        "Stop_Over": stopOver,
      };
}
