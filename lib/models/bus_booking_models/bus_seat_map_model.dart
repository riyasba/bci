// To parse this JSON data, do
//
//     final busSeatMapList = busSeatMapListFromJson(jsonString);

import 'dart:convert';

BusSeatMapList busSeatMapListFromJson(String str) => BusSeatMapList.fromJson(json.decode(str));

String busSeatMapListToJson(BusSeatMapList data) => json.encode(data.toJson());

class BusSeatMapList {
    List<BoardingDetail> boardingDetails;
    bool dropPointMandatory;
    List<DroppingDetail> droppingDetails;
    RequiredPaxDetail requiredPaxDetail;
    ResponseHeader responseHeader;
    List<SeatMap> seatMap;
    String seatMapKey;

    BusSeatMapList({
        required this.boardingDetails,
        required this.dropPointMandatory,
        required this.droppingDetails,
        required this.requiredPaxDetail,
        required this.responseHeader,
        required this.seatMap,
        required this.seatMapKey,
    });

    factory BusSeatMapList.fromJson(Map<String, dynamic> json) => BusSeatMapList(
        boardingDetails: List<BoardingDetail>.from(json["BoardingDetails"].map((x) => BoardingDetail.fromJson(x))),
        dropPointMandatory: json["DropPoint_Mandatory"],
        droppingDetails: List<DroppingDetail>.from(json["DroppingDetails"].map((x) => DroppingDetail.fromJson(x))),
        requiredPaxDetail: RequiredPaxDetail.fromJson(json["Required_PAX_Detail"]),
        responseHeader: ResponseHeader.fromJson(json["Response_Header"]),
        seatMap: List<SeatMap>.from(json["SeatMap"].map((x) => SeatMap.fromJson(x))),
        seatMapKey: json["SeatMap_Key"],
    );

    Map<String, dynamic> toJson() => {
        "BoardingDetails": List<dynamic>.from(boardingDetails.map((x) => x.toJson())),
        "DropPoint_Mandatory": dropPointMandatory,
        "DroppingDetails": List<dynamic>.from(droppingDetails.map((x) => x.toJson())),
        "Required_PAX_Detail": requiredPaxDetail.toJson(),
        "Response_Header": responseHeader.toJson(),
        "SeatMap": List<dynamic>.from(seatMap.map((x) => x.toJson())),
        "SeatMap_Key": seatMapKey,
    };
}

class BoardingDetail {
    String boardingAddress;
    String boardingContact;
    String boardingId;
    String boardingLandmark;
    String boardingName;
    String boardingTime;

    BoardingDetail({
        required this.boardingAddress,
        required this.boardingContact,
        required this.boardingId,
        required this.boardingLandmark,
        required this.boardingName,
        required this.boardingTime,
    });

    factory BoardingDetail.fromJson(Map<String, dynamic> json) => BoardingDetail(
        boardingAddress: json["Boarding_Address"],
        boardingContact: json["Boarding_Contact"],
        boardingId: json["Boarding_Id"],
        boardingLandmark: json["Boarding_Landmark"],
        boardingName: json["Boarding_Name"],
        boardingTime: json["Boarding_Time"],
    );

    Map<String, dynamic> toJson() => {
        "Boarding_Address": boardingAddress,
        "Boarding_Contact": boardingContact,
        "Boarding_Id": boardingId,
        "Boarding_Landmark": boardingLandmark,
        "Boarding_Name": boardingName,
        "Boarding_Time": boardingTime,
    };
}

class DroppingDetail {
    String droppingAddress;
    String droppingContact;
    String droppingId;
    String droppingLandmark;
    String droppingName;
    String droppingTime;

    DroppingDetail({
        required this.droppingAddress,
        required this.droppingContact,
        required this.droppingId,
        required this.droppingLandmark,
        required this.droppingName,
        required this.droppingTime,
    });

    factory DroppingDetail.fromJson(Map<String, dynamic> json) => DroppingDetail(
        droppingAddress: json["Dropping_Address"],
        droppingContact: json["Dropping_Contact"],
        droppingId: json["Dropping_Id"],
        droppingLandmark: json["Dropping_Landmark"],
        droppingName: json["Dropping_Name"],
        droppingTime: json["Dropping_Time"],
    );

    Map<String, dynamic> toJson() => {
        "Dropping_Address": droppingAddress,
        "Dropping_Contact": droppingContact,
        "Dropping_Id": droppingId,
        "Dropping_Landmark": droppingLandmark,
        "Dropping_Name": droppingName,
        "Dropping_Time": droppingTime,
    };
}

class RequiredPaxDetail {
    bool age;
    bool dob;
    bool gender;
    bool idProof;
    bool name;
    bool title;

    RequiredPaxDetail({
        required this.age,
        required this.dob,
        required this.gender,
        required this.idProof,
        required this.name,
        required this.title,
    });

    factory RequiredPaxDetail.fromJson(Map<String, dynamic> json) => RequiredPaxDetail(
        age: json["Age"],
        dob: json["DOB"],
        gender: json["Gender"],
        idProof: json["ID_Proof"],
        name: json["Name"],
        title: json["Title"],
    );

    Map<String, dynamic> toJson() => {
        "Age": age,
        "DOB": dob,
        "Gender": gender,
        "ID_Proof": idProof,
        "Name": name,
        "Title": title,
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

class SeatMap {
    bool bookable;
    int column;
    FareMaster fareMaster;
    bool ladiesSeat;
    String length;
    String row;
    String seatKey;
    String seatNumber;
    String width;
    String zIndex;
    bool isSelect;

    SeatMap({
        required this.bookable,
        required this.column,
        required this.fareMaster,
        required this.ladiesSeat,
        required this.length,
        required this.row,
        required this.seatKey,
        required this.seatNumber,
        required this.width,
        required this.zIndex,
        this.isSelect = false,
    });

    factory SeatMap.fromJson(Map<String, dynamic> json) => SeatMap(
        bookable: json["Bookable"],
        column: json["Column"],
        fareMaster: FareMaster.fromJson(json["FareMaster"]),
        ladiesSeat: json["Ladies_Seat"],
        length: json["Length"],
        row: json["Row"],
        seatKey: json["Seat_Key"],
        seatNumber: json["Seat_Number"],
        width: json["Width"],
        zIndex: json["ZIndex"],
    );

    Map<String, dynamic> toJson() => {
        "Bookable": bookable,
        "Column": column,
        "FareMaster": fareMaster.toJson(),
        "Ladies_Seat": ladiesSeat,
        "Length": length,
        "Row": row,
        "Seat_Key": seatKey,
        "Seat_Number": seatNumber,
        "Width": width,
        "ZIndex": zIndex,
    };
}

class FareMaster {
    int basicAmount;
    int cancellationCharges;
    List<FareDetail> fareDetails;
    int gst;
    int grossCommission;
    int netCommission;
    double otherAmount;
    int serviceFeeAmount;
    double totalAmount;
    int tradeMarkupAmount;

    FareMaster({
        required this.basicAmount,
        required this.cancellationCharges,
        required this.fareDetails,
        required this.gst,
        required this.grossCommission,
        required this.netCommission,
        required this.otherAmount,
        required this.serviceFeeAmount,
        required this.totalAmount,
        required this.tradeMarkupAmount,
    });

    factory FareMaster.fromJson(Map<String, dynamic> json) => FareMaster(
        basicAmount: json["Basic_Amount"],
        cancellationCharges: json["Cancellation_Charges"],
        fareDetails: List<FareDetail>.from(json["FareDetails"].map((x) => FareDetail.fromJson(x))),
        gst: json["GST"],
        grossCommission: json["Gross_Commission"],
        netCommission: json["Net_Commission"],
        otherAmount: json["Other_Amount"]?.toDouble(),
        serviceFeeAmount: json["Service_Fee_Amount"],
        totalAmount: json["Total_Amount"]?.toDouble(),
        tradeMarkupAmount: json["Trade_Markup_Amount"],
    );

    Map<String, dynamic> toJson() => {
        "Basic_Amount": basicAmount,
        "Cancellation_Charges": cancellationCharges,
        "FareDetails": List<dynamic>.from(fareDetails.map((x) => x.toJson())),
        "GST": gst,
        "Gross_Commission": grossCommission,
        "Net_Commission": netCommission,
        "Other_Amount": otherAmount,
        "Service_Fee_Amount": serviceFeeAmount,
        "Total_Amount": totalAmount,
        "Trade_Markup_Amount": tradeMarkupAmount,
    };
}

class FareDetail {
    double amount;
    FareDesc fareDesc;
    bool refundable;

    FareDetail({
        required this.amount,
        required this.fareDesc,
        required this.refundable,
    });

    factory FareDetail.fromJson(Map<String, dynamic> json) => FareDetail(
        amount: json["Amount"]?.toDouble(),
        fareDesc: fareDescValues.map[json["Fare_Desc"]]!,
        refundable: json["Refundable"],
    );

    Map<String, dynamic> toJson() => {
        "Amount": amount,
        "Fare_Desc": fareDescValues.reverse[fareDesc],
        "Refundable": refundable,
    };
}

enum FareDesc { OPERATOR_SERVICE_CHARGE, GST, TOLL_FEE, LEVY_FARE, BOOKING_FEE, OTHERS }

final fareDescValues = EnumValues({
    "BookingFee": FareDesc.BOOKING_FEE,
    "GST": FareDesc.GST,
    "levyFare": FareDesc.LEVY_FARE,
    "OperatorServiceCharge": FareDesc.OPERATOR_SERVICE_CHARGE,
    "Others": FareDesc.OTHERS,
    "TollFee": FareDesc.TOLL_FEE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
