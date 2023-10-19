// To parse this JSON data, do
//
//     final ininitiatePaymentModel = ininitiatePaymentModelFromJson(jsonString);

import 'dart:convert';

IninitiatePaymentModel ininitiatePaymentModelFromJson(String str) =>
    IninitiatePaymentModel.fromJson(json.decode(str));

String ininitiatePaymentModelToJson(IninitiatePaymentModel data) =>
    json.encode(data.toJson());

class IninitiatePaymentModel {
  bool success;
  String code;
  String message;
  Data data;

  IninitiatePaymentModel({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });

  factory IninitiatePaymentModel.fromJson(Map<String, dynamic> json) =>
      IninitiatePaymentModel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String merchantId;
  String merchantTransactionId;
  InstrumentResponse instrumentResponse;

  Data({
    required this.merchantId,
    required this.merchantTransactionId,
    required this.instrumentResponse,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        merchantId: json["merchantId"],
        merchantTransactionId: json["merchantTransactionId"],
        instrumentResponse:
            InstrumentResponse.fromJson(json["instrumentResponse"]),
      );

  Map<String, dynamic> toJson() => {
        "merchantId": merchantId,
        "merchantTransactionId": merchantTransactionId,
        "instrumentResponse": instrumentResponse.toJson(),
      };
}

class InstrumentResponse {
  String type;
  RedirectInfo redirectInfo;

  InstrumentResponse({
    required this.type,
    required this.redirectInfo,
  });

  factory InstrumentResponse.fromJson(Map<String, dynamic> json) =>
      InstrumentResponse(
        type: json["type"],
        redirectInfo: RedirectInfo.fromJson(json["redirectInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "redirectInfo": redirectInfo.toJson(),
      };
}

class RedirectInfo {
  String url;
  String method;

  RedirectInfo({
    required this.url,
    required this.method,
  });

  factory RedirectInfo.fromJson(Map<String, dynamic> json) => RedirectInfo(
        url: json["url"],
        method: json["method"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "method": method,
      };
}
