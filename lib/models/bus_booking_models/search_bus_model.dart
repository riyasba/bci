// To parse this JSON data, do
//
//     final searchBusList = searchBusListFromJson(jsonString);

import 'dart:convert';

SearchBusList searchBusListFromJson(String str) => SearchBusList.fromJson(json.decode(str));

String searchBusListToJson(SearchBusList data) => json.encode(data.toJson());

class SearchBusList {
    List<Bus> buses;
    ResponseHeader responseHeader;
    String searchKey;

    SearchBusList({
        required this.buses,
        required this.responseHeader,
        required this.searchKey,
    });

    factory SearchBusList.fromJson(Map<String, dynamic> json) => SearchBusList(
        buses: List<Bus>.from(json["Buses"].map((x) => Bus.fromJson(x))),
        responseHeader: ResponseHeader.fromJson(json["Response_Header"]),
        searchKey: json["Search_Key"],
    );

    Map<String, dynamic> toJson() => {
        "Buses": List<dynamic>.from(buses.map((x) => x.toJson())),
        "Response_Header": responseHeader.toJson(),
        "Search_Key": searchKey,
    };
}

class Bus {
    bool ac;
    String arrivalTime;
    int availableSeats;
    List<BoardingDetail> boardingDetails;
    bool bookable;
    String busKey;
    String busType;
    String departureTime;
    bool dropPointMandatory;
    List<DroppingDetail> droppingDetails;
    List<FareMaster> fareMasters;
    String fromCity;
    bool getFareMandatory;
    String operatorName;
    bool partialCancellationAllowed;
    bool seatLayout;
    int seatType;
    String toCity;
    dynamic travelDate;
    dynamic vehicleType;
    bool mTicket;

    Bus({
        required this.ac,
        required this.arrivalTime,
        required this.availableSeats,
        required this.boardingDetails,
        required this.bookable,
        required this.busKey,
        required this.busType,
        required this.departureTime,
        required this.dropPointMandatory,
        required this.droppingDetails,
        required this.fareMasters,
        required this.fromCity,
        required this.getFareMandatory,
        required this.operatorName,
        required this.partialCancellationAllowed,
        required this.seatLayout,
        required this.seatType,
        required this.toCity,
         this.travelDate,
         this.vehicleType,
        required this.mTicket,
    });

    factory Bus.fromJson(Map<String, dynamic> json) => Bus(
        ac: json["AC"],
        arrivalTime: json["Arrival_Time"],
        availableSeats: json["Available_Seats"],
        boardingDetails: List<BoardingDetail>.from(json["BoardingDetails"].map((x) => BoardingDetail.fromJson(x))),
        bookable: json["Bookable"],
        busKey: json["Bus_Key"],
        busType: json["Bus_Type"],
        departureTime: json["Departure_Time"],
        dropPointMandatory: json["DropPoint_Mandatory"],
        droppingDetails: List<DroppingDetail>.from(json["DroppingDetails"].map((x) => DroppingDetail.fromJson(x))),
        fareMasters: List<FareMaster>.from(json["FareMasters"].map((x) => FareMaster.fromJson(x))),
        fromCity: json["From_City"],
        getFareMandatory: json["GetFareMandatory"],
        operatorName: json["Operator_Name"],
        partialCancellationAllowed: json["Partial_Cancellation_Allowed"],
        seatLayout: json["Seat_Layout"],
        seatType: json["Seat_Type"],
        toCity: json["To_City"],
        travelDate:json["TravelDate"]?? "",
        vehicleType: json["Vehicle_Type"]?? "",
        mTicket: json["mTicket"],
    );

    Map<String, dynamic> toJson() => {
        "AC": ac,
        "Arrival_Time": arrivalTime,
        "Available_Seats": availableSeats,
        "BoardingDetails": List<dynamic>.from(boardingDetails.map((x) => x.toJson())),
        "Bookable": bookable,
        "Bus_Key": busKey,
        "Bus_Type": busType,
        "Departure_Time": departureTime,
        "DropPoint_Mandatory": dropPointMandatory,
        "DroppingDetails": List<dynamic>.from(droppingDetails.map((x) => x.toJson())),
        "FareMasters": List<dynamic>.from(fareMasters.map((x) => x.toJson())),
        "From_City": fromCity,
        "GetFareMandatory": getFareMandatory,
        "Operator_Name": operatorName,
        "Partial_Cancellation_Allowed": partialCancellationAllowed,
        "Seat_Layout": seatLayout,
        "Seat_Type": seatType,
        "To_City": toCity,
        "TravelDate": travelDate,
        "Vehicle_Type": vehicleType,
        "mTicket": mTicket,
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
