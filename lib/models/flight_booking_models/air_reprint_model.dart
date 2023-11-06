// To parse this JSON data, do
//
//     final airReprintModel = airReprintModelFromJson(jsonString);

import 'dart:convert';

AirReprintModel airReprintModelFromJson(String str) =>
    AirReprintModel.fromJson(json.decode(str));

String airReprintModelToJson(AirReprintModel data) =>
    json.encode(data.toJson());

class AirReprintModel {
  int adultCount;
  List<AirPnrDetail> airPnrDetails;
  String airRequeryResponseKey;
  int billerId;
  List<BookingPaymentDetail> bookingPaymentDetail;
  String bookingDateTime;
  String bookingRefNo;
  int bookingType;
  int childCount;
  int classOfTravel;
  CompanyDetail companyDetail;
  int corporatePaymentMode;
  CustomerDetail customerDetail;
  bool gst;
  String gstin;
  int infantCount;
  String invoiceNumber;
  String paxEmailId;
  String paxMobile;
  String remark;
  // ResponseHeader responseHeader;
  // RetailerDetail retailerDetail;
  int travelType;

  AirReprintModel({
    required this.adultCount,
    required this.airPnrDetails,
    required this.airRequeryResponseKey,
    required this.billerId,
    required this.bookingPaymentDetail,
    required this.bookingDateTime,
    required this.bookingRefNo,
    required this.bookingType,
    required this.childCount,
    required this.classOfTravel,
    required this.companyDetail,
    required this.corporatePaymentMode,
    required this.customerDetail,
    required this.gst,
    required this.gstin,
    required this.infantCount,
    required this.invoiceNumber,
    required this.paxEmailId,
    required this.paxMobile,
    required this.remark,
    // required this.responseHeader,
    // required this.retailerDetail,
    required this.travelType,
  });

  factory AirReprintModel.fromJson(Map<String, dynamic> json) =>
      AirReprintModel(
        adultCount: json["Adult_Count"] ?? 0,
        airPnrDetails: json["AirPNRDetails"] == null
            ? []
            : List<AirPnrDetail>.from(
                json["AirPNRDetails"].map((x) => AirPnrDetail.fromJson(x))),
        airRequeryResponseKey: json["AirRequeryResponse_Key"] ?? "",
        billerId: json["Biller_Id"] ?? 0,
        bookingPaymentDetail: json["BookingPaymentDetail"] == null
            ? []
            : List<BookingPaymentDetail>.from(json["BookingPaymentDetail"]
                .map((x) => BookingPaymentDetail.fromJson(x))),
        bookingDateTime: json["Booking_DateTime"] ?? "",
        bookingRefNo: json["Booking_RefNo"] ?? "",
        bookingType: json["Booking_Type"] ?? 0,
        childCount: json["Child_Count"] ?? 0,
        classOfTravel: json["Class_of_Travel"] ?? 0,
        companyDetail: CompanyDetail.fromJson(json["CompanyDetail"]),
        corporatePaymentMode: json["CorporatePaymentMode"] ?? 0,
        customerDetail: CustomerDetail.fromJson(json["CustomerDetail"]),
        gst: json["GST"] ?? false,
        gstin: json["GSTIN"] ?? "",
        infantCount: json["Infant_Count"] ?? 0,
        invoiceNumber: json["Invoice_Number"] ?? "",
        paxEmailId: json["PAX_EmailId"] ?? "",
        paxMobile: json["PAX_Mobile"] ?? "",
        remark: json["Remark"] ?? "",
        // responseHeader: ResponseHeader.fromJson(json["Response_Header"]),
        // retailerDetail: RetailerDetail.fromJson(json["RetailerDetail"]),
        travelType: json["Travel_Type"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "Adult_Count": adultCount,
        "AirPNRDetails":
            List<dynamic>.from(airPnrDetails.map((x) => x.toJson())),
        "AirRequeryResponse_Key": airRequeryResponseKey,
        "Biller_Id": billerId,
        "BookingPaymentDetail":
            List<dynamic>.from(bookingPaymentDetail.map((x) => x.toJson())),
        "Booking_DateTime": bookingDateTime,
        "Booking_RefNo": bookingRefNo,
        "Booking_Type": bookingType,
        "Child_Count": childCount,
        "Class_of_Travel": classOfTravel,
        "CompanyDetail": companyDetail.toJson(),
        "CorporatePaymentMode": corporatePaymentMode,
        "CustomerDetail": customerDetail.toJson(),
        "GST": gst,
        "GSTIN": gstin,
        "Infant_Count": infantCount,
        "Invoice_Number": invoiceNumber,
        "PAX_EmailId": paxEmailId,
        "PAX_Mobile": paxMobile,
        "Remark": remark,
        // "Response_Header": responseHeader.toJson(),
        // "RetailerDetail": retailerDetail.toJson(),
        "Travel_Type": travelType,
      };
}

class AirPnrDetail {
  String airlineCode;
  dynamic airlineName;
  String airlinePnr;
  List<dynamic> bookingChangeRequests;
  String crsCode;
  String crsPnr;
  dynamic failureRemark;
  List<AirFlight> flights;
  dynamic grossAmount;
  List<PaxTicketDetail> paxTicketDetails;
  dynamic postMarkup;
  String recordLocator;
  dynamic retailerPostMarkup;
  String supplierRefNo;
  String ticketStatusDesc;
  String ticketStatusId;
  String ticketingDate;

  AirPnrDetail({
    required this.airlineCode,
    this.airlineName,
    required this.airlinePnr,
    required this.bookingChangeRequests,
    required this.crsCode,
    required this.crsPnr,
    this.failureRemark,
    required this.flights,
    required this.grossAmount,
    required this.paxTicketDetails,
    required this.postMarkup,
    required this.recordLocator,
    required this.retailerPostMarkup,
    required this.supplierRefNo,
    required this.ticketStatusDesc,
    required this.ticketStatusId,
    required this.ticketingDate,
  });

  factory AirPnrDetail.fromJson(Map<String, dynamic> json) => AirPnrDetail(
        airlineCode: json["Airline_Code"] ?? "",
        airlineName: json["Airline_Name"] ?? "",
        airlinePnr: json["Airline_PNR"] ?? "",
        bookingChangeRequests: json["BookingChangeRequests"] == null
            ? []
            : List<dynamic>.from(json["BookingChangeRequests"].map((x) => x)),
        crsCode: json["CRS_Code"] ?? "",
        crsPnr: json["CRS_PNR"] ?? "",
        failureRemark: json["FailureRemark"] ?? "",
        flights: json["Flights"] == null
            ? []
            : List<AirFlight>.from(
                json["Flights"].map((x) => AirFlight.fromJson(x))),
        grossAmount: json["Gross_Amount"] ?? 0,
        paxTicketDetails: json["PAXTicketDetails"] == null
            ? []
            : List<PaxTicketDetail>.from(json["PAXTicketDetails"]
                .map((x) => PaxTicketDetail.fromJson(x))),
        postMarkup: json["Post_Markup"] ?? 0,
        recordLocator: json["Record_Locator"] ?? "",
        retailerPostMarkup: json["RetailerPostMarkup"] ?? 0,
        supplierRefNo: json["Supplier_RefNo"] ?? "",
        ticketStatusDesc: json["Ticket_Status_Desc"] ?? "",
        ticketStatusId: json["Ticket_Status_Id"] ?? "",
        ticketingDate: json["TicketingDate"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "Airline_Code": airlineCode,
        "Airline_Name": airlineName,
        "Airline_PNR": airlinePnr,
        "BookingChangeRequests":
            List<dynamic>.from(bookingChangeRequests.map((x) => x)),
        "CRS_Code": crsCode,
        "CRS_PNR": crsPnr,
        "FailureRemark": failureRemark,
        "Flights": List<dynamic>.from(flights.map((x) => x.toJson())),
        "Gross_Amount": grossAmount,
        "PAXTicketDetails":
            List<dynamic>.from(paxTicketDetails.map((x) => x.toJson())),
        "Post_Markup": postMarkup,
        "Record_Locator": recordLocator,
        "RetailerPostMarkup": retailerPostMarkup,
        "Supplier_RefNo": supplierRefNo,
        "Ticket_Status_Desc": ticketStatusDesc,
        "Ticket_Status_Id": ticketStatusId,
        "TicketingDate": ticketingDate,
      };
}

class AirFlight {
  String airlineCode;
  bool blockTicketAllowed;
  bool cached;
  String destination;
  List<Fare> fares;
  String flightId;
  String flightKey;
  dynamic flightNumbers;
  bool gstEntryAllowed;
  bool hasMoreClass;
  int inventoryType;
  bool isLcc;
  String origin;
  bool repriced;
  List<Segment> segments;
  String travelDate;

  AirFlight({
    required this.airlineCode,
    required this.blockTicketAllowed,
    required this.cached,
    required this.destination,
    required this.fares,
    required this.flightId,
    required this.flightKey,
    this.flightNumbers,
    required this.gstEntryAllowed,
    required this.hasMoreClass,
    required this.inventoryType,
    required this.isLcc,
    required this.origin,
    required this.repriced,
    required this.segments,
    required this.travelDate,
  });

  factory AirFlight.fromJson(Map<String, dynamic> json) => AirFlight(
        airlineCode: json["Airline_Code"] ?? "",
        blockTicketAllowed: json["Block_Ticket_Allowed"] ?? false,
        cached: json["Cached"] ?? false,
        destination: json["Destination"] ?? "",
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
  dynamic fareType;
  dynamic fareId;
  dynamic fareKey;
  String foodOnboard;
  bool gstMandatory;
  dynamic lastFewSeats;
  String productClass;
  dynamic promptMessage;
  bool refundable;
  dynamic seatsAvailable;
  String warning;

  Fare({
    required this.fareDetails,
    required this.fareType,
    this.fareId,
    this.fareKey,
    required this.foodOnboard,
    required this.gstMandatory,
    this.lastFewSeats,
    required this.productClass,
    this.promptMessage,
    required this.refundable,
    this.seatsAvailable,
    required this.warning,
  });

  factory Fare.fromJson(Map<String, dynamic> json) => Fare(
        fareDetails: json["FareDetails"] == null
            ? []
            : List<FareDetail>.from(
                json["FareDetails"].map((x) => FareDetail.fromJson(x))),
        fareType: json["FareType"] ?? 0,
        fareId: json["Fare_Id"] ?? "",
        fareKey: json["Fare_Key"] ?? "",
        foodOnboard: json["Food_onboard"] ?? "",
        gstMandatory: json["GSTMandatory"] ?? false,
        lastFewSeats: json["LastFewSeats"] ?? "",
        productClass: json["ProductClass"] ?? "",
        promptMessage: json["PromptMessage"] ?? "",
        refundable: json["Refundable"] ?? false,
        seatsAvailable: json["Seats_Available"] ?? "",
        warning: json["Warning"] ?? "",
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
  dynamic airportTaxAmount;
  List<AirportTax> airportTaxes;
  dynamic basicAmount;
  List<Charge> cancellationCharges;
  String currencyCode;
  List<FareClass> fareClasses;
  FreeBaggage freeBaggage;
  dynamic gst;
  dynamic grossCommission;
  dynamic netCommission;
  dynamic paxType;
  dynamic promoDiscount;
  List<Charge> rescheduleCharges;
  dynamic serviceFeeAmount;
  dynamic tds;
  dynamic totalAmount;
  dynamic tradeMarkupAmount;
  dynamic yqAmount;

  FareDetail({
    required this.airportTaxAmount,
    required this.airportTaxes,
    required this.basicAmount,
    required this.cancellationCharges,
    required this.currencyCode,
    required this.fareClasses,
    required this.freeBaggage,
    required this.gst,
    required this.grossCommission,
    required this.netCommission,
    required this.paxType,
    required this.promoDiscount,
    required this.rescheduleCharges,
    required this.serviceFeeAmount,
    required this.tds,
    required this.totalAmount,
    required this.tradeMarkupAmount,
    required this.yqAmount,
  });

  factory FareDetail.fromJson(Map<String, dynamic> json) => FareDetail(
        airportTaxAmount: json["AirportTax_Amount"],
        airportTaxes: json["AirportTaxes"] == null
            ? []
            : List<AirportTax>.from(
                json["AirportTaxes"].map((x) => AirportTax.fromJson(x))),
        basicAmount: json["Basic_Amount"] ?? "",
        cancellationCharges: json["CancellationCharges"] == null
            ? []
            : List<Charge>.from(
                json["CancellationCharges"].map((x) => Charge.fromJson(x))),
        currencyCode: json["Currency_Code"] ?? "",
        fareClasses: json["FareClasses"] == null
            ? []
            : List<FareClass>.from(
                json["FareClasses"].map((x) => FareClass.fromJson(x))),
        freeBaggage: FreeBaggage.fromJson(json["Free_Baggage"]),
        gst: json["GST"] ?? "",
        grossCommission: json["Gross_Commission"] ?? "",
        netCommission: json["Net_Commission"] ?? "",
        paxType: json["PAX_Type"] ?? "",
        promoDiscount: json["Promo_Discount"] ?? "",
        rescheduleCharges: json["RescheduleCharges"] == null
            ? []
            : List<Charge>.from(
                json["RescheduleCharges"].map((x) => Charge.fromJson(x))),
        serviceFeeAmount: json["Service_Fee_Amount"] ?? "",
        tds: json["TDS"] ?? "",
        totalAmount: json["Total_Amount"] ?? "",
        tradeMarkupAmount: json["Trade_Markup_Amount"] ?? "",
        yqAmount: json["YQ_Amount"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "AirportTax_Amount": airportTaxAmount,
        "AirportTaxes": List<dynamic>.from(airportTaxes.map((x) => x.toJson())),
        "Basic_Amount": basicAmount,
        "CancellationCharges":
            List<dynamic>.from(cancellationCharges.map((x) => x.toJson())),
        "Currency_Code": currencyCode,
        "FareClasses": List<dynamic>.from(fareClasses.map((x) => x.toJson())),
        "Free_Baggage": freeBaggage.toJson(),
        "GST": gst,
        "Gross_Commission": grossCommission,
        "Net_Commission": netCommission,
        "PAX_Type": paxType,
        "Promo_Discount": promoDiscount,
        "RescheduleCharges":
            List<dynamic>.from(rescheduleCharges.map((x) => x.toJson())),
        "Service_Fee_Amount": serviceFeeAmount,
        "TDS": tds,
        "Total_Amount": totalAmount,
        "Trade_Markup_Amount": tradeMarkupAmount,
        "YQ_Amount": yqAmount,
      };
}

class AirportTax {
  dynamic taxAmount;
  String taxCode;
  String taxDesc;

  AirportTax({
    required this.taxAmount,
    required this.taxCode,
    required this.taxDesc,
  });

  factory AirportTax.fromJson(Map<String, dynamic> json) => AirportTax(
        taxAmount: json["Tax_Amount"],
        taxCode: json["Tax_Code"] ?? "",
        taxDesc: json["Tax_Desc"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "Tax_Amount": taxAmount,
        "Tax_Code": taxCode,
        "Tax_Desc": taxDesc,
      };
}

class Charge {
  dynamic applicablility;
  dynamic durationFrom;
  dynamic durationTo;
  dynamic durationTypeFrom;
  dynamic durationTypeTo;
  dynamic offlineServiceFee;
  dynamic onlineServiceFee;
  dynamic passengerType;
  String remarks;
  bool returnFlight;
  String value;
  dynamic valueType;

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
        applicablility: json["Applicablility"] ?? 0,
        durationFrom: json["DurationFrom"] ?? 0,
        durationTo: json["DurationTo"] ?? 0,
        durationTypeFrom: json["DurationTypeFrom"] ?? 0,
        durationTypeTo: json["DurationTypeTo"] ?? 0,
        offlineServiceFee: json["OfflineServiceFee"] ?? 0,
        onlineServiceFee: json["OnlineServiceFee"] ?? 0,
        passengerType: json["PassengerType"] ?? 0,
        remarks: json["Remarks"] ?? "",
        returnFlight: json["Return_Flight"] ?? false,
        value: json["Value"] ?? "",
        valueType: json["ValueType"] ?? 0,
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
  String classCode;
  String classDesc;
  String fareBasis;
  dynamic privileges;
  dynamic segmentId;

  FareClass({
    required this.classCode,
    required this.classDesc,
    required this.fareBasis,
    this.privileges,
    required this.segmentId,
  });

  factory FareClass.fromJson(Map<String, dynamic> json) => FareClass(
        classCode: json["Class_Code"] ?? "",
        classDesc: json["Class_Desc"] ?? "",
        fareBasis: json["FareBasis"] ?? "",
        privileges: json["Privileges"],
        segmentId: json["Segment_Id"] ?? 0,
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
        handBaggage: json["Hand_Baggage"] ?? "",
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
  dynamic destinationCity;
  String destinationTerminal;
  String duration;
  String flightNumber;
  dynamic legIndex;
  String origin;
  dynamic originCity;
  String originTerminal;
  bool returnFlight;
  dynamic segmentId;
  dynamic stopOver;

  Segment({
    required this.aircraftType,
    required this.airlineCode,
    required this.airlineName,
    required this.arrivalDateTime,
    required this.departureDateTime,
    required this.destination,
    this.destinationCity,
    required this.destinationTerminal,
    required this.duration,
    required this.flightNumber,
    required this.legIndex,
    required this.origin,
    this.originCity,
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
        destinationCity: json["Destination_City"],
        destinationTerminal: json["Destination_Terminal"] ?? "",
        duration: json["Duration"] ?? "",
        flightNumber: json["Flight_Number"] ?? "",
        legIndex: json["Leg_Index"] ?? 0,
        origin: json["Origin"] ?? "",
        originCity: json["Origin_City"],
        originTerminal: json["Origin_Terminal"] ?? "",
        returnFlight: json["Return_Flight"] ?? false,
        segmentId: json["Segment_Id"] ?? 0,
        stopOver: json["Stop_Over"],
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
        "Origin": origin,
        "Origin_City": originCity,
        "Origin_Terminal": originTerminal,
        "Return_Flight": returnFlight,
        "Segment_Id": segmentId,
        "Stop_Over": stopOver,
      };
}

class PaxTicketDetail {
  String age;
  String dob;
  List<Fare> fares;
  String firstName;
  dynamic frequentFlyerDetails;
  int gender;
  String lastName;
  String nationality;
  String passportExpiry;
  String passportIssuingCountry;
  String passportNumber;
  int paxId;
  int paxType;
  List<dynamic> ssrDetails;
  List<TicketDetail> ticketDetails;
  String ticketStatus;
  String title;

  PaxTicketDetail({
    required this.age,
    required this.dob,
    required this.fares,
    required this.firstName,
    this.frequentFlyerDetails,
    required this.gender,
    required this.lastName,
    required this.nationality,
    required this.passportExpiry,
    required this.passportIssuingCountry,
    required this.passportNumber,
    required this.paxId,
    required this.paxType,
    required this.ssrDetails,
    required this.ticketDetails,
    required this.ticketStatus,
    required this.title,
  });

  factory PaxTicketDetail.fromJson(Map<String, dynamic> json) =>
      PaxTicketDetail(
        age: json["Age"] ?? "",
        dob: json["DOB"] ?? "",
        fares: json["Fares"] == null
            ? []
            : List<Fare>.from(json["Fares"].map((x) => Fare.fromJson(x))),
        firstName: json["First_Name"] ?? "",
        frequentFlyerDetails: json["FrequentFlyerDetails"],
        gender: json["Gender"],
        lastName: json["Last_Name"] ?? "",
        nationality: json["Nationality"] ?? "",
        passportExpiry: json["Passport_Expiry"] ?? "",
        passportIssuingCountry: json["Passport_Issuing_Country"] ?? "",
        passportNumber: json["Passport_Number"] ?? "",
        paxId: json["Pax_Id"] ?? 0,
        paxType: json["Pax_type"] ?? 0,
        ssrDetails: json["SSRDetails"] == null
            ? []
            : List<dynamic>.from(json["SSRDetails"].map((x) => x)),
        ticketDetails: json["TicketDetails"] == null
            ? []
            : List<TicketDetail>.from(
                json["TicketDetails"].map((x) => TicketDetail.fromJson(x))),
        ticketStatus: json["TicketStatus"] ?? "",
        title: json["Title"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "Age": age,
        "DOB": dob,
        "Fares": List<dynamic>.from(fares.map((x) => x.toJson())),
        "First_Name": firstName,
        "FrequentFlyerDetails": frequentFlyerDetails,
        "Gender": gender,
        "Last_Name": lastName,
        "Nationality": nationality,
        "Passport_Expiry": passportExpiry,
        "Passport_Issuing_Country": passportIssuingCountry,
        "Passport_Number": passportNumber,
        "Pax_Id": paxId,
        "Pax_type": paxType,
        "SSRDetails": List<dynamic>.from(ssrDetails.map((x) => x)),
        "TicketDetails":
            List<dynamic>.from(ticketDetails.map((x) => x.toJson())),
        "TicketStatus": ticketStatus,
        "Title": title,
      };
}

class TicketDetail {
  String flightId;
  String ticketNumber;

  TicketDetail({
    required this.flightId,
    required this.ticketNumber,
  });

  factory TicketDetail.fromJson(Map<String, dynamic> json) => TicketDetail(
        flightId: json["Flight_Id"] ?? "",
        ticketNumber: json["Ticket_Number"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "Flight_Id": flightId,
        "Ticket_Number": ticketNumber,
      };
}

class BookingPaymentDetail {
  String currencyCode;
  dynamic gatewayCharges;
  String paymentConfirmationNumber;
  dynamic paymentAmount;
  dynamic paymentMode;

  BookingPaymentDetail({
    required this.currencyCode,
    required this.gatewayCharges,
    required this.paymentConfirmationNumber,
    required this.paymentAmount,
    required this.paymentMode,
  });

  factory BookingPaymentDetail.fromJson(Map<String, dynamic> json) =>
      BookingPaymentDetail(
        currencyCode: json["Currency_Code"] ?? "",
        gatewayCharges: json["Gateway_Charges"],
        paymentConfirmationNumber: json["PaymentConfirmation_Number"] ?? "",
        paymentAmount: json["Payment_Amount"],
        paymentMode: json["Payment_Mode"],
      );

  Map<String, dynamic> toJson() => {
        "Currency_Code": currencyCode,
        "Gateway_Charges": gatewayCharges,
        "PaymentConfirmation_Number": paymentConfirmationNumber,
        "Payment_Amount": paymentAmount,
        "Payment_Mode": paymentMode,
      };
}

class CompanyDetail {
  String address;
  String city;
  String companyName;
  String contactPerson;
  String country;
  String email;
  String fax;
  String gstNo;
  String logo;
  String mobileNo;
  String panNo;
  String phoneNo;
  String pincode;
  String sacCode;
  String state;
  String website;

  CompanyDetail({
    required this.address,
    required this.city,
    required this.companyName,
    required this.contactPerson,
    required this.country,
    required this.email,
    required this.fax,
    required this.gstNo,
    required this.logo,
    required this.mobileNo,
    required this.panNo,
    required this.phoneNo,
    required this.pincode,
    required this.sacCode,
    required this.state,
    required this.website,
  });

  factory CompanyDetail.fromJson(Map<String, dynamic> json) => CompanyDetail(
        address: json["Address"] ?? "",
        city: json["City"] ?? "",
        companyName: json["CompanyName"] ?? "",
        contactPerson: json["ContactPerson"] ?? "",
        country: json["Country"] ?? "",
        email: json["Email"] ?? "",
        fax: json["Fax"] ?? "",
        gstNo: json["GSTNo"] ?? "",
        logo: json["Logo"] ?? "",
        mobileNo: json["MobileNo"] ?? "",
        panNo: json["PANNo"] ?? "",
        phoneNo: json["PhoneNo"] ?? "",
        pincode: json["Pincode"] ?? "",
        sacCode: json["SACCode"] ?? "",
        state: json["State"] ?? "",
        website: json["Website"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "Address": address,
        "City": city,
        "CompanyName": companyName,
        "ContactPerson": contactPerson,
        "Country": country,
        "Email": email,
        "Fax": fax,
        "GSTNo": gstNo,
        "Logo": logo,
        "MobileNo": mobileNo,
        "PANNo": panNo,
        "PhoneNo": phoneNo,
        "Pincode": pincode,
        "SACCode": sacCode,
        "State": state,
        "Website": website,
      };
}

class CustomerDetail {
  String customerEmail;
  String customerMobile;
  String customerName;
  String gstAddress;
  String gstHolderName;
  String gstNumber;

  CustomerDetail({
    required this.customerEmail,
    required this.customerMobile,
    required this.customerName,
    required this.gstAddress,
    required this.gstHolderName,
    required this.gstNumber,
  });

  factory CustomerDetail.fromJson(Map<String, dynamic> json) => CustomerDetail(
        customerEmail: json["Customer_Email"],
        customerMobile: json["Customer_Mobile"],
        customerName: json["Customer_Name"],
        gstAddress: json["GSTAddress"],
        gstHolderName: json["GSTHolderName"],
        gstNumber: json["GST_Number"],
      );

  Map<String, dynamic> toJson() => {
        "Customer_Email": customerEmail,
        "Customer_Mobile": customerMobile,
        "Customer_Name": customerName,
        "GSTAddress": gstAddress,
        "GSTHolderName": gstHolderName,
        "GST_Number": gstNumber,
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

class RetailerDetail {
  String bookedByOperatorName;
  String operatorName;
  String retailerAddress;
  String retailerArea;
  String retailerCity;
  String retailerCompanyName;
  String retailerEmailId;
  String retailerGsTno;
  String retailerId;
  String retailerLandmark;
  String retailerMobileNumber;
  String retailerName;
  String retailerPaNno;
  String retailerPincode;
  String retailerState;
  String subRetailerCompanyName;
  String subRetailerId;

  RetailerDetail({
    required this.bookedByOperatorName,
    required this.operatorName,
    required this.retailerAddress,
    required this.retailerArea,
    required this.retailerCity,
    required this.retailerCompanyName,
    required this.retailerEmailId,
    required this.retailerGsTno,
    required this.retailerId,
    required this.retailerLandmark,
    required this.retailerMobileNumber,
    required this.retailerName,
    required this.retailerPaNno,
    required this.retailerPincode,
    required this.retailerState,
    required this.subRetailerCompanyName,
    required this.subRetailerId,
  });

  factory RetailerDetail.fromJson(Map<String, dynamic> json) => RetailerDetail(
        bookedByOperatorName: json["BookedBy_Operator_Name"],
        operatorName: json["Operator_Name"],
        retailerAddress: json["Retailer_Address"],
        retailerArea: json["Retailer_Area"],
        retailerCity: json["Retailer_City"],
        retailerCompanyName: json["Retailer_CompanyName"],
        retailerEmailId: json["Retailer_Email_Id"],
        retailerGsTno: json["Retailer_GSTno"],
        retailerId: json["Retailer_Id"],
        retailerLandmark: json["Retailer_Landmark"],
        retailerMobileNumber: json["Retailer_Mobile_Number"],
        retailerName: json["Retailer_Name"],
        retailerPaNno: json["Retailer_PANno"],
        retailerPincode: json["Retailer_Pincode"],
        retailerState: json["Retailer_State"],
        subRetailerCompanyName: json["Sub_Retailer_CompanyName"],
        subRetailerId: json["Sub_Retailer_Id"],
      );

  Map<String, dynamic> toJson() => {
        "BookedBy_Operator_Name": bookedByOperatorName,
        "Operator_Name": operatorName,
        "Retailer_Address": retailerAddress,
        "Retailer_Area": retailerArea,
        "Retailer_City": retailerCity,
        "Retailer_CompanyName": retailerCompanyName,
        "Retailer_Email_Id": retailerEmailId,
        "Retailer_GSTno": retailerGsTno,
        "Retailer_Id": retailerId,
        "Retailer_Landmark": retailerLandmark,
        "Retailer_Mobile_Number": retailerMobileNumber,
        "Retailer_Name": retailerName,
        "Retailer_PANno": retailerPaNno,
        "Retailer_Pincode": retailerPincode,
        "Retailer_State": retailerState,
        "Sub_Retailer_CompanyName": subRetailerCompanyName,
        "Sub_Retailer_Id": subRetailerId,
      };
}
