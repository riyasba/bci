// To parse this JSON data, do
//
//     final hotelBookingDetailModel = hotelBookingDetailModelFromJson(jsonString);

import 'dart:convert';

HotelBookingDetailModel hotelBookingDetailModelFromJson(String str) => HotelBookingDetailModel.fromJson(json.decode(str));

String hotelBookingDetailModelToJson(HotelBookingDetailModel data) => json.encode(data.toJson());

class HotelBookingDetailModel {
    String userIp;
    dynamic searchToken;
    Error error;
    Result result;

    HotelBookingDetailModel({
        required this.userIp,
        required this.searchToken,
        required this.error,
        required this.result,
    });

    factory HotelBookingDetailModel.fromJson(Map<String, dynamic> json) => HotelBookingDetailModel(
        userIp: json["UserIp"],
        searchToken: json["Search_Token"],
        error: Error.fromJson(json["Error"]),
        result: Result.fromJson(json["Result"]),
    );

    Map<String, dynamic> toJson() => {
        "UserIp": userIp,
        "Search_Token": searchToken,
        "Error": error.toJson(),
        "Result": result.toJson(),
    };
}

class Error {
    int errorCode;
    dynamic errorMessage;

    Error({
        required this.errorCode,
        required this.errorMessage,
    });

    factory Error.fromJson(Map<String, dynamic> json) => Error(
        errorCode: json["ErrorCode"],
        errorMessage: json["ErrorMessage"],
    );

    Map<String, dynamic> toJson() => {
        "ErrorCode": errorCode,
        "ErrorMessage": errorMessage,
    };
}

class Result {
    bool voucherStatus;
    int responseStatus;
    int status;
    String hotelBookingStatus;
    String confirmationNo;
    String bookingRefNo;
    int bookingId;
    bool isPriceChanged;
    bool isCancellationPolicyChanged;
    List<HotelRoomsDetail> hotelRoomsDetails;
    String agentRemarks;
    String bookingSource;
    dynamic creditNoteGstin;
    String gstin;
    String guestNationality;
    String hotelPolicyDetail;
    dynamic intHotelPassportDetails;
    int invoiceAmount;
    DateTime invoiceCreatedOn;
    String invoiceNo;
    bool isCorporate;
    List<dynamic> validationInfo;
    dynamic hotelConfirmationNo;
    String hotelCode;
    int hotelId;
    String hotelName;
    String tboHotelCode;
    int starRating;
    String addressLine1;
    String addressLine2;
    String countryCode;
    String latitude;
    String longitude;
    String city;
    int cityId;
    DateTime checkInDate;
    DateTime initialCheckInDate;
    DateTime checkOutDate;
    DateTime initialCheckOutDate;
    DateTime lastCancellationDate;
    DateTime lastVoucherDate;
    int noOfRooms;
    DateTime bookingDate;
    String specialRequest;
    bool isDomestic;
    String departureFlightInfo;
    String flightInfo;
    bool bookingAllowedForRoamer;

    Result({
        required this.voucherStatus,
        required this.responseStatus,
        required this.status,
        required this.hotelBookingStatus,
        required this.confirmationNo,
        required this.bookingRefNo,
        required this.bookingId,
        required this.isPriceChanged,
        required this.isCancellationPolicyChanged,
        required this.hotelRoomsDetails,
        required this.agentRemarks,
        required this.bookingSource,
        required this.creditNoteGstin,
        required this.gstin,
        required this.guestNationality,
        required this.hotelPolicyDetail,
        required this.intHotelPassportDetails,
        required this.invoiceAmount,
        required this.invoiceCreatedOn,
        required this.invoiceNo,
        required this.isCorporate,
        required this.validationInfo,
        required this.hotelConfirmationNo,
        required this.hotelCode,
        required this.hotelId,
        required this.hotelName,
        required this.tboHotelCode,
        required this.starRating,
        required this.addressLine1,
        required this.addressLine2,
        required this.countryCode,
        required this.latitude,
        required this.longitude,
        required this.city,
        required this.cityId,
        required this.checkInDate,
        required this.initialCheckInDate,
        required this.checkOutDate,
        required this.initialCheckOutDate,
        required this.lastCancellationDate,
        required this.lastVoucherDate,
        required this.noOfRooms,
        required this.bookingDate,
        required this.specialRequest,
        required this.isDomestic,
        required this.departureFlightInfo,
        required this.flightInfo,
        required this.bookingAllowedForRoamer,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        voucherStatus: json["VoucherStatus"],
        responseStatus: json["ResponseStatus"],
        status: json["Status"],
        hotelBookingStatus: json["HotelBookingStatus"],
        confirmationNo: json["ConfirmationNo"],
        bookingRefNo: json["BookingRefNo"],
        bookingId: json["BookingId"],
        isPriceChanged: json["IsPriceChanged"],
        isCancellationPolicyChanged: json["IsCancellationPolicyChanged"],
        hotelRoomsDetails: List<HotelRoomsDetail>.from(json["HotelRoomsDetails"].map((x) => HotelRoomsDetail.fromJson(x))),
        agentRemarks: json["AgentRemarks"],
        bookingSource: json["BookingSource"],
        creditNoteGstin: json["CreditNoteGSTIN"],
        gstin: json["GSTIN"],
        guestNationality: json["GuestNationality"],
        hotelPolicyDetail: json["HotelPolicyDetail"],
        intHotelPassportDetails: json["IntHotelPassportDetails"],
        invoiceAmount: json["InvoiceAmount"],
        invoiceCreatedOn: DateTime.parse(json["InvoiceCreatedOn"]),
        invoiceNo: json["InvoiceNo"],
        isCorporate: json["IsCorporate"],
        validationInfo: List<dynamic>.from(json["ValidationInfo"].map((x) => x)),
        hotelConfirmationNo: json["HotelConfirmationNo"],
        hotelCode: json["HotelCode"],
        hotelId: json["HotelId"],
        hotelName: json["HotelName"],
        tboHotelCode: json["TBOHotelCode"],
        starRating: json["StarRating"],
        addressLine1: json["AddressLine1"],
        addressLine2: json["AddressLine2"],
        countryCode: json["CountryCode"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        city: json["City"],
        cityId: json["CityId"],
        checkInDate: DateTime.parse(json["CheckInDate"]),
        initialCheckInDate: DateTime.parse(json["InitialCheckInDate"]),
        checkOutDate: DateTime.parse(json["CheckOutDate"]),
        initialCheckOutDate: DateTime.parse(json["InitialCheckOutDate"]),
        lastCancellationDate: DateTime.parse(json["LastCancellationDate"]),
        lastVoucherDate: DateTime.parse(json["LastVoucherDate"]),
        noOfRooms: json["NoOfRooms"],
        bookingDate: DateTime.parse(json["BookingDate"]),
        specialRequest: json["SpecialRequest"],
        isDomestic: json["IsDomestic"],
        departureFlightInfo: json["DepartureFlightInfo"],
        flightInfo: json["FlightInfo"],
        bookingAllowedForRoamer: json["BookingAllowedForRoamer"],
    );

    Map<String, dynamic> toJson() => {
        "VoucherStatus": voucherStatus,
        "ResponseStatus": responseStatus,
        "Status": status,
        "HotelBookingStatus": hotelBookingStatus,
        "ConfirmationNo": confirmationNo,
        "BookingRefNo": bookingRefNo,
        "BookingId": bookingId,
        "IsPriceChanged": isPriceChanged,
        "IsCancellationPolicyChanged": isCancellationPolicyChanged,
        "HotelRoomsDetails": List<dynamic>.from(hotelRoomsDetails.map((x) => x.toJson())),
        "AgentRemarks": agentRemarks,
        "BookingSource": bookingSource,
        "CreditNoteGSTIN": creditNoteGstin,
        "GSTIN": gstin,
        "GuestNationality": guestNationality,
        "HotelPolicyDetail": hotelPolicyDetail,
        "IntHotelPassportDetails": intHotelPassportDetails,
        "InvoiceAmount": invoiceAmount,
        "InvoiceCreatedOn": invoiceCreatedOn.toIso8601String(),
        "InvoiceNo": invoiceNo,
        "IsCorporate": isCorporate,
        "ValidationInfo": List<dynamic>.from(validationInfo.map((x) => x)),
        "HotelConfirmationNo": hotelConfirmationNo,
        "HotelCode": hotelCode,
        "HotelId": hotelId,
        "HotelName": hotelName,
        "TBOHotelCode": tboHotelCode,
        "StarRating": starRating,
        "AddressLine1": addressLine1,
        "AddressLine2": addressLine2,
        "CountryCode": countryCode,
        "Latitude": latitude,
        "Longitude": longitude,
        "City": city,
        "CityId": cityId,
        "CheckInDate": checkInDate.toIso8601String(),
        "InitialCheckInDate": initialCheckInDate.toIso8601String(),
        "CheckOutDate": checkOutDate.toIso8601String(),
        "InitialCheckOutDate": initialCheckOutDate.toIso8601String(),
        "LastCancellationDate": lastCancellationDate.toIso8601String(),
        "LastVoucherDate": lastVoucherDate.toIso8601String(),
        "NoOfRooms": noOfRooms,
        "BookingDate": bookingDate.toIso8601String(),
        "SpecialRequest": specialRequest,
        "IsDomestic": isDomestic,
        "DepartureFlightInfo": departureFlightInfo,
        "FlightInfo": flightInfo,
        "BookingAllowedForRoamer": bookingAllowedForRoamer,
    };
}

class HotelRoomsDetail {
    int adultCount;
    String availabilityType;
    int childCount;
    List<HotelPassenger> hotelPassenger;
    bool requireAllPaxDetails;
    int roomId;
    int roomStatus;
    int roomIndex;
    String roomTypeCode;
    String roomDescription;
    String roomTypeName;
    String ratePlanCode;
    int ratePlan;
    List<DayRate> dayRates;
    bool isPerStay;
    dynamic supplierPrice;
    Price price;
    String roomPromotion;
    List<String> amenities;
    List<String> amenity;
    String smokingPreference;
    List<dynamic> bedTypes;
    dynamic hotelSupplements;
    DateTime lastCancellationDate;
    List<CancellationPolicy> cancellationPolicies;
    DateTime lastVoucherDate;
    String cancellationPolicy;
    List<String> inclusion;

    HotelRoomsDetail({
        required this.adultCount,
        required this.availabilityType,
        required this.childCount,
        required this.hotelPassenger,
        required this.requireAllPaxDetails,
        required this.roomId,
        required this.roomStatus,
        required this.roomIndex,
        required this.roomTypeCode,
        required this.roomDescription,
        required this.roomTypeName,
        required this.ratePlanCode,
        required this.ratePlan,
        required this.dayRates,
        required this.isPerStay,
        required this.supplierPrice,
        required this.price,
        required this.roomPromotion,
        required this.amenities,
        required this.amenity,
        required this.smokingPreference,
        required this.bedTypes,
        required this.hotelSupplements,
        required this.lastCancellationDate,
        required this.cancellationPolicies,
        required this.lastVoucherDate,
        required this.cancellationPolicy,
        required this.inclusion,
    });

    factory HotelRoomsDetail.fromJson(Map<String, dynamic> json) => HotelRoomsDetail(
        adultCount: json["AdultCount"],
        availabilityType: json["AvailabilityType"],
        childCount: json["ChildCount"],
        hotelPassenger: List<HotelPassenger>.from(json["HotelPassenger"].map((x) => HotelPassenger.fromJson(x))),
        requireAllPaxDetails: json["RequireAllPaxDetails"],
        roomId: json["RoomId"],
        roomStatus: json["RoomStatus"],
        roomIndex: json["RoomIndex"],
        roomTypeCode: json["RoomTypeCode"],
        roomDescription: json["RoomDescription"],
        roomTypeName: json["RoomTypeName"],
        ratePlanCode: json["RatePlanCode"],
        ratePlan: json["RatePlan"],
        dayRates: List<DayRate>.from(json["DayRates"].map((x) => DayRate.fromJson(x))),
        isPerStay: json["IsPerStay"],
        supplierPrice: json["SupplierPrice"],
        price: Price.fromJson(json["Price"]),
        roomPromotion: json["RoomPromotion"],
        amenities: List<String>.from(json["Amenities"].map((x) => x)),
        amenity: List<String>.from(json["Amenity"].map((x) => x)),
        smokingPreference: json["SmokingPreference"],
        bedTypes: List<dynamic>.from(json["BedTypes"].map((x) => x)),
        hotelSupplements: json["HotelSupplements"],
        lastCancellationDate: DateTime.parse(json["LastCancellationDate"]),
        cancellationPolicies: List<CancellationPolicy>.from(json["CancellationPolicies"].map((x) => CancellationPolicy.fromJson(x))),
        lastVoucherDate: DateTime.parse(json["LastVoucherDate"]),
        cancellationPolicy: json["CancellationPolicy"],
        inclusion: List<String>.from(json["Inclusion"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "AdultCount": adultCount,
        "AvailabilityType": availabilityType,
        "ChildCount": childCount,
        "HotelPassenger": List<dynamic>.from(hotelPassenger.map((x) => x.toJson())),
        "RequireAllPaxDetails": requireAllPaxDetails,
        "RoomId": roomId,
        "RoomStatus": roomStatus,
        "RoomIndex": roomIndex,
        "RoomTypeCode": roomTypeCode,
        "RoomDescription": roomDescription,
        "RoomTypeName": roomTypeName,
        "RatePlanCode": ratePlanCode,
        "RatePlan": ratePlan,
        "DayRates": List<dynamic>.from(dayRates.map((x) => x.toJson())),
        "IsPerStay": isPerStay,
        "SupplierPrice": supplierPrice,
        "Price": price.toJson(),
        "RoomPromotion": roomPromotion,
        "Amenities": List<dynamic>.from(amenities.map((x) => x)),
        "Amenity": List<dynamic>.from(amenity.map((x) => x)),
        "SmokingPreference": smokingPreference,
        "BedTypes": List<dynamic>.from(bedTypes.map((x) => x)),
        "HotelSupplements": hotelSupplements,
        "LastCancellationDate": lastCancellationDate.toIso8601String(),
        "CancellationPolicies": List<dynamic>.from(cancellationPolicies.map((x) => x.toJson())),
        "LastVoucherDate": lastVoucherDate.toIso8601String(),
        "CancellationPolicy": cancellationPolicy,
        "Inclusion": List<dynamic>.from(inclusion.map((x) => x)),
    };
}

class CancellationPolicy {
    int charge;
    int chargeType;
    String currency;
    DateTime fromDate;
    DateTime toDate;

    CancellationPolicy({
        required this.charge,
        required this.chargeType,
        required this.currency,
        required this.fromDate,
        required this.toDate,
    });

    factory CancellationPolicy.fromJson(Map<String, dynamic> json) => CancellationPolicy(
        charge: json["Charge"],
        chargeType: json["ChargeType"],
        currency: json["Currency"],
        fromDate: DateTime.parse(json["FromDate"]),
        toDate: DateTime.parse(json["ToDate"]),
    );

    Map<String, dynamic> toJson() => {
        "Charge": charge,
        "ChargeType": chargeType,
        "Currency": currency,
        "FromDate": fromDate.toIso8601String(),
        "ToDate": toDate.toIso8601String(),
    };
}

class DayRate {
    double amount;
    DateTime date;

    DayRate({
        required this.amount,
        required this.date,
    });

    factory DayRate.fromJson(Map<String, dynamic> json) => DayRate(
        amount: json["Amount"]?.toDouble(),
        date: DateTime.parse(json["Date"]),
    );

    Map<String, dynamic> toJson() => {
        "Amount": amount,
        "Date": date.toIso8601String(),
    };
}

class HotelPassenger {
    int age;
    String email;
    dynamic fileDocument;
    String firstName;
    dynamic gstCompanyAddress;
    dynamic gstCompanyContactNumber;
    dynamic gstCompanyEmail;
    dynamic gstCompanyName;
    dynamic gstNumber;
    dynamic guardianDetail;
    String lastName;
    bool leadPassenger;
    dynamic middleName;
    String pan;
    dynamic passportExpDate;
    dynamic passportIssueDate;
    dynamic passportNo;
    int paxId;
    int paxType;
    String phoneno;
    String title;

    HotelPassenger({
        required this.age,
        required this.email,
        required this.fileDocument,
        required this.firstName,
        required this.gstCompanyAddress,
        required this.gstCompanyContactNumber,
        required this.gstCompanyEmail,
        required this.gstCompanyName,
        required this.gstNumber,
        required this.guardianDetail,
        required this.lastName,
        required this.leadPassenger,
        required this.middleName,
        required this.pan,
        required this.passportExpDate,
        required this.passportIssueDate,
        required this.passportNo,
        required this.paxId,
        required this.paxType,
        required this.phoneno,
        required this.title,
    });

    factory HotelPassenger.fromJson(Map<String, dynamic> json) => HotelPassenger(
        age: json["Age"],
        email: json["Email"],
        fileDocument: json["FileDocument"],
        firstName: json["FirstName"],
        gstCompanyAddress: json["GSTCompanyAddress"],
        gstCompanyContactNumber: json["GSTCompanyContactNumber"],
        gstCompanyEmail: json["GSTCompanyEmail"],
        gstCompanyName: json["GSTCompanyName"],
        gstNumber: json["GSTNumber"],
        guardianDetail: json["GuardianDetail"],
        lastName: json["LastName"],
        leadPassenger: json["LeadPassenger"],
        middleName: json["MiddleName"],
        pan: json["PAN"],
        passportExpDate: json["PassportExpDate"],
        passportIssueDate: json["PassportIssueDate"],
        passportNo: json["PassportNo"],
        paxId: json["PaxId"],
        paxType: json["PaxType"],
        phoneno: json["Phoneno"],
        title: json["Title"],
    );

    Map<String, dynamic> toJson() => {
        "Age": age,
        "Email": email,
        "FileDocument": fileDocument,
        "FirstName": firstName,
        "GSTCompanyAddress": gstCompanyAddress,
        "GSTCompanyContactNumber": gstCompanyContactNumber,
        "GSTCompanyEmail": gstCompanyEmail,
        "GSTCompanyName": gstCompanyName,
        "GSTNumber": gstNumber,
        "GuardianDetail": guardianDetail,
        "LastName": lastName,
        "LeadPassenger": leadPassenger,
        "MiddleName": middleName,
        "PAN": pan,
        "PassportExpDate": passportExpDate,
        "PassportIssueDate": passportIssueDate,
        "PassportNo": passportNo,
        "PaxId": paxId,
        "PaxType": paxType,
        "Phoneno": phoneno,
        "Title": title,
    };
}

class Price {
    String currencyCode;
    double roomPrice;
    double tax;
    int extraGuestCharge;
    int childCharge;
    double otherCharges;
    int discount;
    double publishedPrice;
    int publishedPriceRoundedOff;
    double offeredPrice;
    int offeredPriceRoundedOff;
    int agentCommission;
    int agentMarkUp;
    double serviceTax;
    int tcs;
    int tds;
    int serviceCharge;
    double totalGstAmount;
    Gst gst;

    Price({
        required this.currencyCode,
        required this.roomPrice,
        required this.tax,
        required this.extraGuestCharge,
        required this.childCharge,
        required this.otherCharges,
        required this.discount,
        required this.publishedPrice,
        required this.publishedPriceRoundedOff,
        required this.offeredPrice,
        required this.offeredPriceRoundedOff,
        required this.agentCommission,
        required this.agentMarkUp,
        required this.serviceTax,
        required this.tcs,
        required this.tds,
        required this.serviceCharge,
        required this.totalGstAmount,
        required this.gst,
    });

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        currencyCode: json["CurrencyCode"],
        roomPrice: json["RoomPrice"]?.toDouble(),
        tax: json["Tax"]?.toDouble(),
        extraGuestCharge: json["ExtraGuestCharge"],
        childCharge: json["ChildCharge"],
        otherCharges: json["OtherCharges"]?.toDouble(),
        discount: json["Discount"],
        publishedPrice: json["PublishedPrice"]?.toDouble(),
        publishedPriceRoundedOff: json["PublishedPriceRoundedOff"],
        offeredPrice: json["OfferedPrice"]?.toDouble(),
        offeredPriceRoundedOff: json["OfferedPriceRoundedOff"],
        agentCommission: json["AgentCommission"],
        agentMarkUp: json["AgentMarkUp"],
        serviceTax: json["ServiceTax"]?.toDouble(),
        tcs: json["TCS"],
        tds: json["TDS"],
        serviceCharge: json["ServiceCharge"],
        totalGstAmount: json["TotalGSTAmount"]?.toDouble(),
        gst: Gst.fromJson(json["GST"]),
    );

    Map<String, dynamic> toJson() => {
        "CurrencyCode": currencyCode,
        "RoomPrice": roomPrice,
        "Tax": tax,
        "ExtraGuestCharge": extraGuestCharge,
        "ChildCharge": childCharge,
        "OtherCharges": otherCharges,
        "Discount": discount,
        "PublishedPrice": publishedPrice,
        "PublishedPriceRoundedOff": publishedPriceRoundedOff,
        "OfferedPrice": offeredPrice,
        "OfferedPriceRoundedOff": offeredPriceRoundedOff,
        "AgentCommission": agentCommission,
        "AgentMarkUp": agentMarkUp,
        "ServiceTax": serviceTax,
        "TCS": tcs,
        "TDS": tds,
        "ServiceCharge": serviceCharge,
        "TotalGSTAmount": totalGstAmount,
        "GST": gst.toJson(),
    };
}

class Gst {
    int cgstAmount;
    int cgstRate;
    int cessAmount;
    int cessRate;
    double igstAmount;
    int igstRate;
    int sgstAmount;
    int sgstRate;
    double taxableAmount;

    Gst({
        required this.cgstAmount,
        required this.cgstRate,
        required this.cessAmount,
        required this.cessRate,
        required this.igstAmount,
        required this.igstRate,
        required this.sgstAmount,
        required this.sgstRate,
        required this.taxableAmount,
    });

    factory Gst.fromJson(Map<String, dynamic> json) => Gst(
        cgstAmount: json["CGSTAmount"],
        cgstRate: json["CGSTRate"],
        cessAmount: json["CessAmount"],
        cessRate: json["CessRate"],
        igstAmount: json["IGSTAmount"]?.toDouble(),
        igstRate: json["IGSTRate"],
        sgstAmount: json["SGSTAmount"],
        sgstRate: json["SGSTRate"],
        taxableAmount: json["TaxableAmount"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "CGSTAmount": cgstAmount,
        "CGSTRate": cgstRate,
        "CessAmount": cessAmount,
        "CessRate": cessRate,
        "IGSTAmount": igstAmount,
        "IGSTRate": igstRate,
        "SGSTAmount": sgstAmount,
        "SGSTRate": sgstRate,
        "TaxableAmount": taxableAmount,
    };
}
