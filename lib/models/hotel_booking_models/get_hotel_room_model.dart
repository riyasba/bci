// To parse this JSON data, do
//
//     final getHotelRoomModel = getHotelRoomModelFromJson(jsonString);

import 'dart:convert';

GetHotelRoomModel getHotelRoomModelFromJson(String str) =>
    GetHotelRoomModel.fromJson(json.decode(str));

String getHotelRoomModelToJson(GetHotelRoomModel data) =>
    json.encode(data.toJson());

class GetHotelRoomModel {
  String userIp;
  String searchToken;
  Error error;
  HotelRoomData result;

  GetHotelRoomModel({
    required this.userIp,
    required this.searchToken,
    required this.error,
    required this.result,
  });

  factory GetHotelRoomModel.fromJson(Map<String, dynamic> json) =>
      GetHotelRoomModel(
        userIp: json["UserIp"],
        searchToken: json["Search_Token"],
        error: Error.fromJson(json["Error"]),
        result: HotelRoomData.fromJson(json["Result"]),
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

class HotelRoomData {
  bool isUnderCancellationAllowed;
  bool isPolicyPerStay;
  List<HotelRoomsDetail> hotelRoomsDetails;
  RoomCombinations roomCombinations;

  HotelRoomData({
    required this.isUnderCancellationAllowed,
    required this.isPolicyPerStay,
    required this.hotelRoomsDetails,
    required this.roomCombinations,
  });

  factory HotelRoomData.fromJson(Map<String, dynamic> json) => HotelRoomData(
        isUnderCancellationAllowed: json["IsUnderCancellationAllowed"],
        isPolicyPerStay: json["IsPolicyPerStay"],
        hotelRoomsDetails: List<HotelRoomsDetail>.from(
            json["HotelRoomsDetails"].map((x) => HotelRoomsDetail.fromJson(x))),
        roomCombinations: RoomCombinations.fromJson(json["RoomCombinations"]),
      );

  Map<String, dynamic> toJson() => {
        "IsUnderCancellationAllowed": isUnderCancellationAllowed,
        "IsPolicyPerStay": isPolicyPerStay,
        "HotelRoomsDetails":
            List<dynamic>.from(hotelRoomsDetails.map((x) => x.toJson())),
        "RoomCombinations": roomCombinations.toJson(),
      };
}

class HotelRoomsDetail {
  dynamic availabilityType;
  dynamic childCount;
  dynamic requireAllPaxDetails;
  dynamic roomId;
  dynamic roomStatus;
  dynamic roomIndex;
  dynamic roomTypeCode;
  dynamic roomDescription;
  dynamic ratePlanName;
  dynamic roomTypeName;
  dynamic ratePlanCode;
  dynamic ratePlan;
  dynamic infoSource;
  dynamic sequenceNo;
  List<DayRate> dayRates;
  dynamic isPerStay;
  dynamic supplierPrice;
  Price price;
  dynamic roomPromotion;
  List<String> amenities;
  List<String> amenity;
  dynamic smokingPreference;
  List<dynamic> bedTypes;
  List<dynamic> hotelSupplements;
  DateTime lastCancellationDate;
  List<CancellationPolicy> cancellationPolicies;
  DateTime lastVoucherDate;
  dynamic cancellationPolicy;
  List<String> inclusion;
  dynamic isPassportMandatory;
  dynamic isPanMandatory;

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
    required this.infoSource,
    required this.sequenceNo,
    required this.dayRates,
    required this.ratePlanName,
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
    required this.isPassportMandatory,
    required this.isPanMandatory,
  });

  factory HotelRoomsDetail.fromJson(Map<String, dynamic> json) =>
      HotelRoomsDetail(
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
        dayRates: List<DayRate>.from(
            json["DayRates"].map((x) => DayRate.fromJson(x))),
        isPerStay: json["IsPerStay"],
        supplierPrice: json["SupplierPrice"],
        price: Price.fromJson(json["Price"]),
        roomPromotion: json["RoomPromotion"],
        amenities: List<String>.from(json["Amenities"].map((x) => x)),
        amenity: List<String>.from(json["Amenity"].map((x) => x)),
        smokingPreference: json["SmokingPreference"],
        bedTypes: List<dynamic>.from(json["BedTypes"].map((x) => x)),
        hotelSupplements:
            List<dynamic>.from(json["HotelSupplements"].map((x) => x)),
        lastCancellationDate: DateTime.parse(json["LastCancellationDate"]),
        cancellationPolicies: List<CancellationPolicy>.from(
            json["CancellationPolicies"]
                .map((x) => CancellationPolicy.fromJson(x))),
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
        "SmokingPreference": 0,
        "BedTypes": List<dynamic>.from(bedTypes.map((x) => x)),
        "HotelSupplements": List<dynamic>.from(hotelSupplements.map((x) => x)),
        "LastCancellationDate": lastCancellationDate.toIso8601String(),
        "CancellationPolicies":
            List<dynamic>.from(cancellationPolicies.map((x) => x.toJson())),
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
  dynamic currency;
  DateTime fromDate;
  DateTime toDate;

  CancellationPolicy({
    required this.charge,
    required this.chargeType,
    required this.currency,
    required this.fromDate,
    required this.toDate,
  });

  factory CancellationPolicy.fromJson(Map<String, dynamic> json) =>
      CancellationPolicy(
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
  dynamic amount;
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
  dynamic roomPrice;
  dynamic tax;
  dynamic extraGuestCharge;
  dynamic childCharge;
  dynamic otherCharges;
  dynamic discount;
  dynamic publishedPrice;
  dynamic publishedPriceRoundedOff;
  dynamic offeredPrice;
  dynamic offeredPriceRoundedOff;
  dynamic agentCommission;
  dynamic agentMarkUp;
  dynamic serviceTax;
  dynamic tcs;
  dynamic tds;
  dynamic serviceCharge;
  dynamic totalGstAmount;
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
        roomPrice: json["RoomPrice"],
        tax: json["Tax"],
        extraGuestCharge: json["ExtraGuestCharge"],
        childCharge: json["ChildCharge"],
        otherCharges: json["OtherCharges"],
        discount: json["Discount"],
        publishedPrice: json["PublishedPrice"],
        publishedPriceRoundedOff: json["PublishedPriceRoundedOff"],
        offeredPrice: json["OfferedPrice"],
        offeredPriceRoundedOff: json["OfferedPriceRoundedOff"],
        agentCommission: json["AgentCommission"],
        agentMarkUp: json["AgentMarkUp"],
        serviceTax: json["ServiceTax"],
        tcs: json["TCS"],
        tds: json["TDS"],
        serviceCharge: json["ServiceCharge"],
        totalGstAmount: json["TotalGSTAmount"],
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
  dynamic cgstAmount;
  dynamic cgstRate;
  dynamic cessAmount;
  dynamic cessRate;
  dynamic igstAmount;
  dynamic igstRate;
  dynamic sgstAmount;
  dynamic sgstRate;
  dynamic taxableAmount;

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
        igstAmount: json["IGSTAmount"],
        igstRate: json["IGSTRate"],
        sgstAmount: json["SGSTAmount"],
        sgstRate: json["SGSTRate"],
        taxableAmount: json["TaxableAmount"],
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

class RoomCombinations {
  String infoSource;
  bool isPolicyPerStay;
  List<RoomCombination> roomCombination;

  RoomCombinations({
    required this.infoSource,
    required this.isPolicyPerStay,
    required this.roomCombination,
  });

  factory RoomCombinations.fromJson(Map<String, dynamic> json) =>
      RoomCombinations(
        infoSource: json["InfoSource"],
        isPolicyPerStay: json["IsPolicyPerStay"],
        roomCombination: List<RoomCombination>.from(
            json["RoomCombination"].map((x) => RoomCombination.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "InfoSource": infoSource,
        "IsPolicyPerStay": isPolicyPerStay,
        "RoomCombination":
            List<dynamic>.from(roomCombination.map((x) => x.toJson())),
      };
}

class RoomCombination {
  List<int> roomIndex;

  RoomCombination({
    required this.roomIndex,
  });

  factory RoomCombination.fromJson(Map<String, dynamic> json) =>
      RoomCombination(
        roomIndex: List<int>.from(json["RoomIndex"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "RoomIndex": List<dynamic>.from(roomIndex.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
