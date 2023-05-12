// To parse this JSON data, do
//
//     final merchantRegisterModel = merchantRegisterModelFromJson(jsonString);

import 'dart:convert';

MerchantRegisterModel merchantRegisterModelFromJson(String str) =>
    MerchantRegisterModel.fromJson(json.decode(str));

String merchantRegisterModelToJson(MerchantRegisterModel data) =>
    json.encode(data.toJson());

class MerchantRegisterModel {
  String categoryId;
  String subcategoryId;
  String name;
  String email;
  String mobile;
  String alternateMobile;
  String gstNo;
  String address;
  String aadharProof;
  String panProof;
  String roleId;
  String password;
  String passwordConfirmation;

  MerchantRegisterModel({
    required this.categoryId,
    required this.subcategoryId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.alternateMobile,
    required this.gstNo,
    required this.address,
    required this.aadharProof,
    required this.panProof,
    required this.roleId,
    required this.password,
    required this.passwordConfirmation,
  });

  factory MerchantRegisterModel.fromJson(Map<String, dynamic> json) =>
      MerchantRegisterModel(
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        alternateMobile: json["alternate_mobile"],
        gstNo: json["gst_no"],
        address: json["address"],
        aadharProof: json["aadhar_proof"],
        panProof: json["pan_proof"],
        roleId: json["role_id"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "name": name,
        "email": email,
        "mobile": mobile,
        "alternate_mobile": alternateMobile,
        "gst_no": gstNo,
        "address": address,
        "aadhar_proof": aadharProof,
        "pan_proof": panProof,
        "role_id": roleId,
        "password": password,
        "password_confirmation": passwordConfirmation,
      };
}
