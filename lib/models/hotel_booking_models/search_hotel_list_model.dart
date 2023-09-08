// To parse this JSON data, do
//
//     final searchHotelModel = searchHotelModelFromJson(jsonString);

import 'dart:convert';

SearchHotelModel searchHotelModelFromJson(String str) => SearchHotelModel.fromJson(json.decode(str));

String searchHotelModelToJson(SearchHotelModel data) => json.encode(data.toJson());

class SearchHotelModel {
    String userIp;
    String searchToken;
    Error error;
    List<SearchHotelData> result;

    SearchHotelModel({
        required this.userIp,
        required this.searchToken,
        required this.error,
        required this.result,
    });

    factory SearchHotelModel.fromJson(Map<String, dynamic> json) => SearchHotelModel(
        userIp: json["UserIp"],
        searchToken: json["Search_Token"],
        error: Error.fromJson(json["Error"]),
        result: List<SearchHotelData>.from(json["Result"].map((x) => SearchHotelData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "UserIp": userIp,
        "Search_Token": searchToken,
        "Error": error.toJson(),
        "Result": List<dynamic>.from(result.map((x) => x.toJson())),
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

class SearchHotelData {
    bool isHotDeal;
    int resultIndex;
    String hotelCode;
    String hotelName;
    String hotelCategory;
    int starRating;
    String hotelDescription;
    String hotelPromotion;
    String hotelPolicy;
    Price price;
    String hotelPicture;
    String hotelAddress;
    String hotelContactNo;
    dynamic hotelMap;
    String latitude;
    String longitude;
    dynamic hotelLocation;
    dynamic supplierPrice;
    List<dynamic> roomDetails;

    SearchHotelData({
        required this.isHotDeal,
        required this.resultIndex,
        required this.hotelCode,
        required this.hotelName,
        required this.hotelCategory,
        required this.starRating,
        required this.hotelDescription,
        required this.hotelPromotion,
        required this.hotelPolicy,
        required this.price,
        required this.hotelPicture,
        required this.hotelAddress,
        required this.hotelContactNo,
        required this.hotelMap,
        required this.latitude,
        required this.longitude,
        required this.hotelLocation,
        required this.supplierPrice,
        required this.roomDetails,
    });

    factory SearchHotelData.fromJson(Map<String, dynamic> json) => SearchHotelData(
        isHotDeal: json["IsHotDeal"],
        resultIndex: json["ResultIndex"],
        hotelCode: json["HotelCode"],
        hotelName: json["HotelName"],
        hotelCategory: json["HotelCategory"],
        starRating: json["StarRating"],
        hotelDescription: json["HotelDescription"],
        hotelPromotion: json["HotelPromotion"],
        hotelPolicy: json["HotelPolicy"],
        price: Price.fromJson(json["Price"]),
        hotelPicture: json["HotelPicture"],
        hotelAddress: json["HotelAddress"],
        hotelContactNo: json["HotelContactNo"],
        hotelMap: json["HotelMap"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        hotelLocation: json["HotelLocation"],
        supplierPrice: json["SupplierPrice"],
        roomDetails: List<dynamic>.from(json["RoomDetails"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "IsHotDeal": isHotDeal,
        "ResultIndex": resultIndex,
        "HotelCode": hotelCode,
        "HotelName": hotelName,
        "HotelCategory": hotelCategory,
        "StarRating": starRating,
        "HotelDescription": hotelDescription,
        "HotelPromotion": hotelPromotion,
        "HotelPolicy": hotelPolicy,
        "Price": price.toJson(),
        "HotelPicture": hotelPicture,
        "HotelAddress": hotelAddress,
        "HotelContactNo": hotelContactNo,
        "HotelMap": hotelMap,
        "Latitude": latitude,
        "Longitude": longitude,
        "HotelLocation": hotelLocation,
        "SupplierPrice": supplierPrice,
        "RoomDetails": List<dynamic>.from(roomDetails.map((x) => x)),
    };
}

class Price {
    CurrencyCode currencyCode;
    double roomPrice;
    dynamic tax;
    dynamic extraGuestCharge;
    dynamic childCharge;
    double otherCharges;
    dynamic discount;
    double publishedPrice;
    dynamic publishedPriceRoundedOff;
    dynamic offeredPrice;
    dynamic offeredPriceRoundedOff;
    dynamic agentCommission;
    dynamic agentMarkUp;
    double serviceTax;
    dynamic tcs;
    dynamic tds;
    dynamic serviceCharge;
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
        currencyCode: currencyCodeValues.map[json["CurrencyCode"]]!,
        roomPrice: json["RoomPrice"]?.toDouble(),
        tax: json["Tax"],
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
        "CurrencyCode": currencyCodeValues.reverse[currencyCode],
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

enum CurrencyCode {
    INR
}

final currencyCodeValues = EnumValues({
    "INR": CurrencyCode.INR
});

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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
