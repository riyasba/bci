// To parse this JSON data, do
//
//     final blockRoomApiModel = blockRoomApiModelFromJson(jsonString);

import 'dart:convert';

BlockRoomApiModel blockRoomApiModelFromJson(String str) => BlockRoomApiModel.fromJson(json.decode(str));

String blockRoomApiModelToJson(BlockRoomApiModel data) => json.encode(data.toJson());

class BlockRoomApiModel {
    String userIp;
    String searchToken;
    Error error;
    Result result;

    BlockRoomApiModel({
        required this.userIp,
        required this.searchToken,
        required this.error,
        required this.result,
    });

    factory BlockRoomApiModel.fromJson(Map<String, dynamic> json) => BlockRoomApiModel(
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
    int responseStatus;
    bool isCancellationPolicyChanged;
    bool isHotelPolicyChanged;
    bool isPriceChanged;
    bool isPackageFare;
    bool isDepartureDetailsMandatory;
    bool isPackageDetailsMandatory;
    String availabilityType;
    bool gstAllowed;
    String hotelNorms;
    String hotelName;
    String addressLine1;
    dynamic addressLine2;
    int starRating;
    String hotelPolicyDetail;
    String latitude;
    String longitude;
    bool bookingAllowedForRoamer;
    List<dynamic> ancillaryServices;
    List<HotelRoomsDetail> hotelRoomsDetails;
    ValidationInfo validationInfo;

    Result({
        required this.responseStatus,
        required this.isCancellationPolicyChanged,
        required this.isHotelPolicyChanged,
        required this.isPriceChanged,
        required this.isPackageFare,
        required this.isDepartureDetailsMandatory,
        required this.isPackageDetailsMandatory,
        required this.availabilityType,
        required this.gstAllowed,
        required this.hotelNorms,
        required this.hotelName,
        required this.addressLine1,
        required this.addressLine2,
        required this.starRating,
        required this.hotelPolicyDetail,
        required this.latitude,
        required this.longitude,
        required this.bookingAllowedForRoamer,
        required this.ancillaryServices,
        required this.hotelRoomsDetails,
        required this.validationInfo,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        responseStatus: json["ResponseStatus"],
        isCancellationPolicyChanged: json["IsCancellationPolicyChanged"],
        isHotelPolicyChanged: json["IsHotelPolicyChanged"],
        isPriceChanged: json["IsPriceChanged"],
        isPackageFare: json["IsPackageFare"],
        isDepartureDetailsMandatory: json["IsDepartureDetailsMandatory"],
        isPackageDetailsMandatory: json["IsPackageDetailsMandatory"],
        availabilityType: json["AvailabilityType"],
        gstAllowed: json["GSTAllowed"],
        hotelNorms: json["HotelNorms"],
        hotelName: json["HotelName"],
        addressLine1: json["AddressLine1"],
        addressLine2: json["AddressLine2"],
        starRating: json["StarRating"],
        hotelPolicyDetail: json["HotelPolicyDetail"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        bookingAllowedForRoamer: json["BookingAllowedForRoamer"],
        ancillaryServices: List<dynamic>.from(json["AncillaryServices"].map((x) => x)),
        hotelRoomsDetails: List<HotelRoomsDetail>.from(json["HotelRoomsDetails"].map((x) => HotelRoomsDetail.fromJson(x))),
        validationInfo: ValidationInfo.fromJson(json["ValidationInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "ResponseStatus": responseStatus,
        "IsCancellationPolicyChanged": isCancellationPolicyChanged,
        "IsHotelPolicyChanged": isHotelPolicyChanged,
        "IsPriceChanged": isPriceChanged,
        "IsPackageFare": isPackageFare,
        "IsDepartureDetailsMandatory": isDepartureDetailsMandatory,
        "IsPackageDetailsMandatory": isPackageDetailsMandatory,
        "AvailabilityType": availabilityType,
        "GSTAllowed": gstAllowed,
        "HotelNorms": hotelNorms,
        "HotelName": hotelName,
        "AddressLine1": addressLine1,
        "AddressLine2": addressLine2,
        "StarRating": starRating,
        "HotelPolicyDetail": hotelPolicyDetail,
        "Latitude": latitude,
        "Longitude": longitude,
        "BookingAllowedForRoamer": bookingAllowedForRoamer,
        "AncillaryServices": List<dynamic>.from(ancillaryServices.map((x) => x)),
        "HotelRoomsDetails": List<dynamic>.from(hotelRoomsDetails.map((x) => x.toJson())),
        "ValidationInfo": validationInfo.toJson(),
    };
}

class HotelRoomsDetail {
    String availabilityType;
    int childCount;
    bool requireAllPaxDetails;
    int roomId;
    int roomStatus;
    int roomIndex;
    String roomTypeCode;
    String roomDescription;
    String roomTypeName;
    String ratePlanCode;
    int ratePlan;
    String ratePlanName;
    String infoSource;
    String sequenceNo;
    List<DayRate> dayRates;
    bool isPerStay;
    dynamic supplierPrice;
    Price price;
    String roomPromotion;
    List<String> amenities;
    List<String> amenity;
    String smokingPreference;
    List<dynamic> bedTypes;
    List<dynamic> hotelSupplements;
    DateTime lastCancellationDate;
    String supplierSpecificData;
    List<CancellationPolicy> cancellationPolicies;
    DateTime lastVoucherDate;
    String cancellationPolicy;
    List<String> inclusion;
    bool isPassportMandatory;
    bool isPanMandatory;

    HotelRoomsDetail({
        required this.availabilityType,
        required this.childCount,
        required this.requireAllPaxDetails,
        required this.roomId,
        required this.roomStatus,
        required this.roomIndex,
        required this.roomTypeCode,
        required this.roomDescription,
        required this.roomTypeName,
        required this.ratePlanCode,
        required this.ratePlan,
        required this.ratePlanName,
        required this.infoSource,
        required this.sequenceNo,
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
        required this.supplierSpecificData,
        required this.cancellationPolicies,
        required this.lastVoucherDate,
        required this.cancellationPolicy,
        required this.inclusion,
        required this.isPassportMandatory,
        required this.isPanMandatory,
    });

    factory HotelRoomsDetail.fromJson(Map<String, dynamic> json) => HotelRoomsDetail(
        availabilityType: json["AvailabilityType"],
        childCount: json["ChildCount"],
        requireAllPaxDetails: json["RequireAllPaxDetails"],
        roomId: json["RoomId"],
        roomStatus: json["RoomStatus"],
        roomIndex: json["RoomIndex"],
        roomTypeCode: json["RoomTypeCode"],
        roomDescription: json["RoomDescription"],
        roomTypeName: json["RoomTypeName"],
        ratePlanCode: json["RatePlanCode"],
        ratePlan: json["RatePlan"],
        ratePlanName: json["RatePlanName"],
        infoSource: json["InfoSource"],
        sequenceNo: json["SequenceNo"],
        dayRates: List<DayRate>.from(json["DayRates"].map((x) => DayRate.fromJson(x))),
        isPerStay: json["IsPerStay"],
        supplierPrice: json["SupplierPrice"],
        price: Price.fromJson(json["Price"]),
        roomPromotion: json["RoomPromotion"],
        amenities: List<String>.from(json["Amenities"].map((x) => x)),
        amenity: List<String>.from(json["Amenity"].map((x) => x)),
        smokingPreference: json["SmokingPreference"],
        bedTypes: List<dynamic>.from(json["BedTypes"].map((x) => x)),
        hotelSupplements: List<dynamic>.from(json["HotelSupplements"].map((x) => x)),
        lastCancellationDate: DateTime.parse(json["LastCancellationDate"]),
        supplierSpecificData: json["SupplierSpecificData"],
        cancellationPolicies: List<CancellationPolicy>.from(json["CancellationPolicies"].map((x) => CancellationPolicy.fromJson(x))),
        lastVoucherDate: DateTime.parse(json["LastVoucherDate"]),
        cancellationPolicy: json["CancellationPolicy"],
        inclusion: List<String>.from(json["Inclusion"].map((x) => x)),
        isPassportMandatory: json["IsPassportMandatory"],
        isPanMandatory: json["IsPANMandatory"],
    );

    Map<String, dynamic> toJson() => {
        "AvailabilityType": availabilityType,
        "ChildCount": childCount,
        "RequireAllPaxDetails": requireAllPaxDetails,
        "RoomId": roomId,
        "RoomStatus": roomStatus,
        "RoomIndex": roomIndex,
        "RoomTypeCode": roomTypeCode,
        "RoomDescription": roomDescription,
        "RoomTypeName": roomTypeName,
        "RatePlanCode": ratePlanCode,
        "RatePlan": ratePlan,
        "RatePlanName": ratePlanName,
        "InfoSource": infoSource,
        "SequenceNo": sequenceNo,
        "DayRates": List<dynamic>.from(dayRates.map((x) => x.toJson())),
        "IsPerStay": isPerStay,
        "SupplierPrice": supplierPrice,
        "Price": price.toJson(),
        "RoomPromotion": roomPromotion,
        "Amenities": List<dynamic>.from(amenities.map((x) => x)),
        "Amenity": List<dynamic>.from(amenity.map((x) => x)),
        "SmokingPreference": smokingPreference,
        "BedTypes": List<dynamic>.from(bedTypes.map((x) => x)),
        "HotelSupplements": List<dynamic>.from(hotelSupplements.map((x) => x)),
        "LastCancellationDate": lastCancellationDate.toIso8601String(),
        "SupplierSpecificData": supplierSpecificData,
        "CancellationPolicies": List<dynamic>.from(cancellationPolicies.map((x) => x.toJson())),
        "LastVoucherDate": lastVoucherDate.toIso8601String(),
        "CancellationPolicy": cancellationPolicy,
        "Inclusion": List<dynamic>.from(inclusion.map((x) => x)),
        "IsPassportMandatory": isPassportMandatory,
        "IsPANMandatory": isPanMandatory,
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

class ValidationInfo {
    ValidationAt validationAtConfirm;
    ValidationAt validationAtVoucher;

    ValidationInfo({
        required this.validationAtConfirm,
        required this.validationAtVoucher,
    });

    factory ValidationInfo.fromJson(Map<String, dynamic> json) => ValidationInfo(
        validationAtConfirm: ValidationAt.fromJson(json["ValidationAtConfirm"]),
        validationAtVoucher: ValidationAt.fromJson(json["ValidationAtVoucher"]),
    );

    Map<String, dynamic> toJson() => {
        "ValidationAtConfirm": validationAtConfirm.toJson(),
        "ValidationAtVoucher": validationAtVoucher.toJson(),
    };
}

class ValidationAt {
    bool isAgencyOwnPanAllowed;
    bool isCorporateBookingAllowed;
    bool isCrpPanMandatory;
    bool isCrpPassportCopyMandatory;
    bool isCrpPassportMandatory;
    bool isCrpSamePanForAllAllowed;
    bool isEmailMandatory;
    bool isPanCopyPanMandatory;
    bool isPanMandatory;
    bool isPassportCopyMandatory;
    bool isPassportMandatory;
    bool isSamePanForAllAllowed;
    bool isTcsApplicableOnCrp;
    int noOfPanRequired;

    ValidationAt({
        required this.isAgencyOwnPanAllowed,
        required this.isCorporateBookingAllowed,
        required this.isCrpPanMandatory,
        required this.isCrpPassportCopyMandatory,
        required this.isCrpPassportMandatory,
        required this.isCrpSamePanForAllAllowed,
        required this.isEmailMandatory,
        required this.isPanCopyPanMandatory,
        required this.isPanMandatory,
        required this.isPassportCopyMandatory,
        required this.isPassportMandatory,
        required this.isSamePanForAllAllowed,
        required this.isTcsApplicableOnCrp,
        required this.noOfPanRequired,
    });

    factory ValidationAt.fromJson(Map<String, dynamic> json) => ValidationAt(
        isAgencyOwnPanAllowed: json["IsAgencyOwnPANAllowed"],
        isCorporateBookingAllowed: json["IsCorporateBookingAllowed"],
        isCrpPanMandatory: json["IsCrpPANMandatory"],
        isCrpPassportCopyMandatory: json["IsCrpPassportCopyMandatory"],
        isCrpPassportMandatory: json["IsCrpPassportMandatory"],
        isCrpSamePanForAllAllowed: json["IsCrpSamePANForAllAllowed"],
        isEmailMandatory: json["IsEmailMandatory"],
        isPanCopyPanMandatory: json["IsPANCopyPANMandatory"],
        isPanMandatory: json["IsPANMandatory"],
        isPassportCopyMandatory: json["IsPassportCopyMandatory"],
        isPassportMandatory: json["IsPassportMandatory"],
        isSamePanForAllAllowed: json["IsSamePANForAllAllowed"],
        isTcsApplicableOnCrp: json["IsTCSApplicableOnCrp"],
        noOfPanRequired: json["NoOfPANRequired"],
    );

    Map<String, dynamic> toJson() => {
        "IsAgencyOwnPANAllowed": isAgencyOwnPanAllowed,
        "IsCorporateBookingAllowed": isCorporateBookingAllowed,
        "IsCrpPANMandatory": isCrpPanMandatory,
        "IsCrpPassportCopyMandatory": isCrpPassportCopyMandatory,
        "IsCrpPassportMandatory": isCrpPassportMandatory,
        "IsCrpSamePANForAllAllowed": isCrpSamePanForAllAllowed,
        "IsEmailMandatory": isEmailMandatory,
        "IsPANCopyPANMandatory": isPanCopyPanMandatory,
        "IsPANMandatory": isPanMandatory,
        "IsPassportCopyMandatory": isPassportCopyMandatory,
        "IsPassportMandatory": isPassportMandatory,
        "IsSamePANForAllAllowed": isSamePanForAllAllowed,
        "IsTCSApplicableOnCrp": isTcsApplicableOnCrp,
        "NoOfPANRequired": noOfPanRequired,
    };
}
