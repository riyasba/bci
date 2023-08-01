// To parse this JSON data, do
//
//     final busRequeryModel = busRequeryModelFromJson(jsonString);

import 'dart:convert';

BusRequeryModel busRequeryModelFromJson(String str) =>
    BusRequeryModel.fromJson(json.decode(str));

String busRequeryModelToJson(BusRequeryModel data) =>
    json.encode(data.toJson());

class BusRequeryModel {
  List<dynamic> bookingChangeRequests;
  String bookingDate;
  List<BookingPaymentDetail> bookingPaymentDetails;
  String bookingRefNo;
  BusDetail busDetail;
  String cancellationPolicy;
  List<CompanyDetail> companyDetail;
  int corporatePaymentMode;
  CustomerDetail customerDetail;
  String noofPax;
  List<PaxDetail> paxDetails;
  ResponseHeader responseHeader;
  RetailerDetail retailerDetail;
  String ticketStatusDesc;
  String ticketStatusId;
  String transportPnr;

  BusRequeryModel({
    required this.bookingChangeRequests,
    required this.bookingDate,
    required this.bookingPaymentDetails,
    required this.bookingRefNo,
    required this.busDetail,
    required this.cancellationPolicy,
    required this.companyDetail,
    required this.corporatePaymentMode,
    required this.customerDetail,
    required this.noofPax,
    required this.paxDetails,
    required this.responseHeader,
    required this.retailerDetail,
    required this.ticketStatusDesc,
    required this.ticketStatusId,
    required this.transportPnr,
  });

  factory BusRequeryModel.fromJson(Map<String, dynamic> json) =>
      BusRequeryModel(
        bookingChangeRequests:
            List<dynamic>.from(json["BookingChangeRequests"].map((x) => x)),
        bookingDate: json["BookingDate"],
        bookingPaymentDetails: List<BookingPaymentDetail>.from(
            json["BookingPaymentDetails"]
                .map((x) => BookingPaymentDetail.fromJson(x))),
        bookingRefNo: json["Booking_RefNo"],
        busDetail: BusDetail.fromJson(json["Bus_Detail"]),
        cancellationPolicy: json["CancellationPolicy"],
        companyDetail: List<CompanyDetail>.from(
            json["CompanyDetail"].map((x) => CompanyDetail.fromJson(x))),
        corporatePaymentMode: json["CorporatePaymentMode"],
        customerDetail: CustomerDetail.fromJson(json["CustomerDetail"]),
        noofPax: json["NoofPax"],
        paxDetails: List<PaxDetail>.from(
            json["PAX_Details"].map((x) => PaxDetail.fromJson(x))),
        responseHeader: ResponseHeader.fromJson(json["Response_Header"]),
        retailerDetail: RetailerDetail.fromJson(json["RetailerDetail"]),
        ticketStatusDesc: json["Ticket_Status_Desc"],
        ticketStatusId: json["Ticket_Status_Id"],
        transportPnr: json["Transport_PNR"],
      );

  Map<String, dynamic> toJson() => {
        "BookingChangeRequests":
            List<dynamic>.from(bookingChangeRequests.map((x) => x)),
        "BookingDate": bookingDate,
        "BookingPaymentDetails":
            List<dynamic>.from(bookingPaymentDetails.map((x) => x.toJson())),
        "Booking_RefNo": bookingRefNo,
        "Bus_Detail": busDetail.toJson(),
        "CancellationPolicy": cancellationPolicy,
        "CompanyDetail":
            List<dynamic>.from(companyDetail.map((x) => x.toJson())),
        "CorporatePaymentMode": corporatePaymentMode,
        "CustomerDetail": customerDetail.toJson(),
        "NoofPax": noofPax,
        "PAX_Details": List<dynamic>.from(paxDetails.map((x) => x.toJson())),
        "Response_Header": responseHeader.toJson(),
        "RetailerDetail": retailerDetail.toJson(),
        "Ticket_Status_Desc": ticketStatusDesc,
        "Ticket_Status_Id": ticketStatusId,
        "Transport_PNR": transportPnr,
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
        currencyCode: json["Currency_Code"],
        gatewayCharges: json["Gateway_Charges"],
        paymentConfirmationNumber: json["PaymentConfirmation_Number"],
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

class BusDetail {
  bool ac;
  String arrivalTime;
  BoardingDetails boardingDetails;
  String busType;
  String cancellationPolicy;
  String departureTime;
  DroppingDetails droppingDetails;
  bool freeWifi;
  String fromCity;
  bool lastMinuteZeroCancellation;
  bool liveTracking;
  String operatorId;
  String operatorName;
  bool partialCancellationAllowed;
  String remarks;
  int seatType;
  String supplierRefNo;
  String toCity;
  String travelDate;
  String vehicleType;
  bool mTicket;

  BusDetail({
    required this.ac,
    required this.arrivalTime,
    required this.boardingDetails,
    required this.busType,
    required this.cancellationPolicy,
    required this.departureTime,
    required this.droppingDetails,
    required this.freeWifi,
    required this.fromCity,
    required this.lastMinuteZeroCancellation,
    required this.liveTracking,
    required this.operatorId,
    required this.operatorName,
    required this.partialCancellationAllowed,
    required this.remarks,
    required this.seatType,
    required this.supplierRefNo,
    required this.toCity,
    required this.travelDate,
    required this.vehicleType,
    required this.mTicket,
  });

  factory BusDetail.fromJson(Map<String, dynamic> json) => BusDetail(
        ac: json["AC"],
        arrivalTime: json["Arrival_Time"],
        boardingDetails: BoardingDetails.fromJson(json["BoardingDetails"]),
        busType: json["Bus_Type"],
        cancellationPolicy: json["CancellationPolicy"],
        departureTime: json["Departure_Time"],
        droppingDetails: DroppingDetails.fromJson(json["DroppingDetails"]),
        freeWifi: json["Free_WIFI"],
        fromCity: json["From_City"],
        lastMinuteZeroCancellation: json["LastMinute_Zero_Cancellation"],
        liveTracking: json["Live_Tracking"],
        operatorId: json["Operator_Id"],
        operatorName: json["Operator_Name"],
        partialCancellationAllowed: json["Partial_Cancellation_Allowed"],
        remarks: json["Remarks"],
        seatType: json["Seat_Type"],
        supplierRefNo: json["Supplier_RefNo"],
        toCity: json["To_City"],
        travelDate: json["TravelDate"],
        vehicleType: json["Vehicle_Type"],
        mTicket: json["mTicket"],
      );

  Map<String, dynamic> toJson() => {
        "AC": ac,
        "Arrival_Time": arrivalTime,
        "BoardingDetails": boardingDetails.toJson(),
        "Bus_Type": busType,
        "CancellationPolicy": cancellationPolicy,
        "Departure_Time": departureTime,
        "DroppingDetails": droppingDetails.toJson(),
        "Free_WIFI": freeWifi,
        "From_City": fromCity,
        "LastMinute_Zero_Cancellation": lastMinuteZeroCancellation,
        "Live_Tracking": liveTracking,
        "Operator_Id": operatorId,
        "Operator_Name": operatorName,
        "Partial_Cancellation_Allowed": partialCancellationAllowed,
        "Remarks": remarks,
        "Seat_Type": seatType,
        "Supplier_RefNo": supplierRefNo,
        "To_City": toCity,
        "TravelDate": travelDate,
        "Vehicle_Type": vehicleType,
        "mTicket": mTicket,
      };
}

class BoardingDetails {
  String boardingAddress;
  String boardingContact;
  dynamic boardingId;
  String boardingLandmark;
  String boardingName;
  String boardingTime;
  dynamic filler;

  BoardingDetails({
    required this.boardingAddress,
    required this.boardingContact,
    this.boardingId,
    required this.boardingLandmark,
    required this.boardingName,
    required this.boardingTime,
    this.filler,
  });

  factory BoardingDetails.fromJson(Map<String, dynamic> json) =>
      BoardingDetails(
        boardingAddress: json["Boarding_Address"],
        boardingContact: json["Boarding_Contact"],
        boardingId: json["Boarding_Id"],
        boardingLandmark: json["Boarding_Landmark"],
        boardingName: json["Boarding_Name"],
        boardingTime: json["Boarding_Time"],
        filler: json["Filler"],
      );

  Map<String, dynamic> toJson() => {
        "Boarding_Address": boardingAddress,
        "Boarding_Contact": boardingContact,
        "Boarding_Id": boardingId,
        "Boarding_Landmark": boardingLandmark,
        "Boarding_Name": boardingName,
        "Boarding_Time": boardingTime,
        "Filler": filler,
      };
}

class DroppingDetails {
  String droppingAddress;
  String droppingContact;
  dynamic droppingId;
  dynamic droppingLandmark;
  String droppingName;
  String droppingTime;
  dynamic filler;

  DroppingDetails({
    required this.droppingAddress,
    required this.droppingContact,
    this.droppingId,
    this.droppingLandmark,
    required this.droppingName,
    required this.droppingTime,
    this.filler,
  });

  factory DroppingDetails.fromJson(Map<String, dynamic> json) =>
      DroppingDetails(
        droppingAddress: json["Dropping_Address"],
        droppingContact: json["Dropping_Contact"],
        droppingId: json["Dropping_Id"],
        droppingLandmark: json["Dropping_Landmark"],
        droppingName: json["Dropping_Name"],
        droppingTime: json["Dropping_Time"],
        filler: json["Filler"],
      );

  Map<String, dynamic> toJson() => {
        "Dropping_Address": droppingAddress,
        "Dropping_Contact": droppingContact,
        "Dropping_Id": droppingId,
        "Dropping_Landmark": droppingLandmark,
        "Dropping_Name": droppingName,
        "Dropping_Time": droppingTime,
        "Filler": filler,
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
        address: json["Address"],
        city: json["City"],
        companyName: json["CompanyName"],
        contactPerson: json["ContactPerson"],
        country: json["Country"],
        email: json["Email"],
        fax: json["Fax"],
        gstNo: json["GSTNo"],
        logo: json["Logo"],
        mobileNo: json["MobileNo"],
        panNo: json["PANNo"],
        phoneNo: json["PhoneNo"],
        pincode: json["Pincode"],
        sacCode: json["SACCode"],
        state: json["State"],
        website: json["Website"],
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
  String customerAddress;
  String customerCity;
  String customerEmail;
  dynamic customerId;
  String customerMobile;
  String customerName;

  CustomerDetail({
    required this.customerAddress,
    required this.customerCity,
    required this.customerEmail,
    this.customerId,
    required this.customerMobile,
    required this.customerName,
  });

  factory CustomerDetail.fromJson(Map<String, dynamic> json) => CustomerDetail(
        customerAddress: json["Customer_Address"],
        customerCity: json["Customer_City"],
        customerEmail: json["Customer_Email"],
        customerId: json["Customer_Id"],
        customerMobile: json["Customer_Mobile"],
        customerName: json["Customer_Name"],
      );

  Map<String, dynamic> toJson() => {
        "Customer_Address": customerAddress,
        "Customer_City": customerCity,
        "Customer_Email": customerEmail,
        "Customer_Id": customerId,
        "Customer_Mobile": customerMobile,
        "Customer_Name": customerName,
      };
}

class PaxDetail {
  int age;
  dynamic dob;
  Fare fare;
  int gender;
  dynamic idNumber;
  int idType;
  bool ladiesSeat;
  int paxId;
  String paxName;
  dynamic penaltyCharge;
  bool primary;
  String seatNumber;
  String status;
  String ticketNumber;
  String title;

  PaxDetail({
    required this.age,
    this.dob,
    required this.fare,
    required this.gender,
    this.idNumber,
    required this.idType,
    required this.ladiesSeat,
    required this.paxId,
    required this.paxName,
    this.penaltyCharge,
    required this.primary,
    required this.seatNumber,
    required this.status,
    required this.ticketNumber,
    required this.title,
  });

  factory PaxDetail.fromJson(Map<String, dynamic> json) => PaxDetail(
        age: json["Age"],
        dob: json["DOB"],
        fare: Fare.fromJson(json["Fare"]),
        gender: json["Gender"],
        idNumber: json["Id_Number"],
        idType: json["Id_Type"],
        ladiesSeat: json["Ladies_Seat"],
        paxId: json["PAX_Id"],
        paxName: json["PAX_Name"],
        penaltyCharge: json["Penalty_Charge"],
        primary: json["Primary"],
        seatNumber: json["Seat_Number"],
        status: json["Status"],
        ticketNumber: json["Ticket_Number"],
        title: json["Title"],
      );

  Map<String, dynamic> toJson() => {
        "Age": age,
        "DOB": dob,
        "Fare": fare.toJson(),
        "Gender": gender,
        "Id_Number": idNumber,
        "Id_Type": idType,
        "Ladies_Seat": ladiesSeat,
        "PAX_Id": paxId,
        "PAX_Name": paxName,
        "Penalty_Charge": penaltyCharge,
        "Primary": primary,
        "Seat_Number": seatNumber,
        "Status": status,
        "Ticket_Number": ticketNumber,
        "Title": title,
      };
}

class Fare {
  dynamic basicAmount;
  dynamic cancellationCharges;
  List<dynamic> fareDetails;
  dynamic gst;
  dynamic grossCommission;
  dynamic netCommission;
  dynamic otherAmount;
  dynamic serviceFeeAmount;
  dynamic totalAmount;
  dynamic tradeMarkupAmount;

  Fare({
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

  factory Fare.fromJson(Map<String, dynamic> json) => Fare(
        basicAmount: json["Basic_Amount"],
        cancellationCharges: json["Cancellation_Charges"],
        fareDetails: List<dynamic>.from(json["FareDetails"].map((x) => x)),
        gst: json["GST"],
        grossCommission: json["Gross_Commission"],
        netCommission: json["Net_Commission"],
        otherAmount: json["Other_Amount"],
        serviceFeeAmount: json["Service_Fee_Amount"],
        totalAmount: json["Total_Amount"],
        tradeMarkupAmount: json["Trade_Markup_Amount"],
      );

  Map<String, dynamic> toJson() => {
        "Basic_Amount": basicAmount,
        "Cancellation_Charges": cancellationCharges,
        "FareDetails": List<dynamic>.from(fareDetails.map((x) => x)),
        "GST": gst,
        "Gross_Commission": grossCommission,
        "Net_Commission": netCommission,
        "Other_Amount": otherAmount,
        "Service_Fee_Amount": serviceFeeAmount,
        "Total_Amount": totalAmount,
        "Trade_Markup_Amount": tradeMarkupAmount,
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
  String emailId;
  String mobileNumber;
  dynamic operatorName;
  int retailerServiceFee;
  String retailerAddress;
  String retailerArea;
  String retailerCity;
  String retailerCompanyName;
  String retailerEmail;
  String retailerGsTno;
  String retailerId;
  String retailerLandmark;
  String retailerName;
  String retailerPaNno;
  String retailerPincode;
  String retailerState;

  RetailerDetail({
    required this.emailId,
    required this.mobileNumber,
    this.operatorName,
    required this.retailerServiceFee,
    required this.retailerAddress,
    required this.retailerArea,
    required this.retailerCity,
    required this.retailerCompanyName,
    required this.retailerEmail,
    required this.retailerGsTno,
    required this.retailerId,
    required this.retailerLandmark,
    required this.retailerName,
    required this.retailerPaNno,
    required this.retailerPincode,
    required this.retailerState,
  });

  factory RetailerDetail.fromJson(Map<String, dynamic> json) => RetailerDetail(
        emailId: json["Email_Id"],
        mobileNumber: json["Mobile_Number"],
        operatorName: json["Operator_Name"],
        retailerServiceFee: json["RetailerServiceFee"],
        retailerAddress: json["Retailer_Address"],
        retailerArea: json["Retailer_Area"],
        retailerCity: json["Retailer_City"],
        retailerCompanyName: json["Retailer_CompanyName"],
        retailerEmail: json["Retailer_Email"],
        retailerGsTno: json["Retailer_GSTno"],
        retailerId: json["Retailer_Id"],
        retailerLandmark: json["Retailer_Landmark"],
        retailerName: json["Retailer_Name"],
        retailerPaNno: json["Retailer_PANno"],
        retailerPincode: json["Retailer_Pincode"],
        retailerState: json["Retailer_State"],
      );

  Map<String, dynamic> toJson() => {
        "Email_Id": emailId,
        "Mobile_Number": mobileNumber,
        "Operator_Name": operatorName,
        "RetailerServiceFee": retailerServiceFee,
        "Retailer_Address": retailerAddress,
        "Retailer_Area": retailerArea,
        "Retailer_City": retailerCity,
        "Retailer_CompanyName": retailerCompanyName,
        "Retailer_Email": retailerEmail,
        "Retailer_GSTno": retailerGsTno,
        "Retailer_Id": retailerId,
        "Retailer_Landmark": retailerLandmark,
        "Retailer_Name": retailerName,
        "Retailer_PANno": retailerPaNno,
        "Retailer_Pincode": retailerPincode,
        "Retailer_State": retailerState,
      };
}
