// To parse this JSON data, do
//
//     final merchantRegisterModel = merchantRegisterModelFromJson(jsonString);

import 'dart:convert';

MemberRegisterModel merchantRegisterModelFromJson(String str) =>
    MemberRegisterModel.fromJson(json.decode(str));

String merchantRegisterModelToJson(MemberRegisterModel data) =>
    json.encode(data.toJson());

class MemberRegisterModel {
  String name;
  String mobile;
  String email;
  // String occupation;
  // String fatherName;
  // String motherName;
  // String isMarried;
  // String panNo;
  // String aadharNo;
  String roleId;
  // String password;
  // String passwordConfirmation;

  MemberRegisterModel({
    required this.name,
    required this.mobile,
    required this.email,
    // required this.occupation,
    // required this.fatherName,
    // required this.motherName,
    // required this.isMarried,
    // required this.panNo,
    // required this.aadharNo,
    required this.roleId,
    // required this.password,
    // required this.passwordConfirmation,
  });

  factory MemberRegisterModel.fromJson(Map<String, dynamic> json) =>
      MemberRegisterModel(
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        // occupation: json["occupation"],
        // fatherName: json["father_name"],
        // motherName: json["mother_name"],
        // isMarried: json["is_married"],
        // panNo: json["pan_no"],
        // aadharNo: json["aadhar_no"],
        roleId: json["role_id"],
        // password: json["password"],
        // passwordConfirmation: json["password_confirmation"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mobile": mobile,
        "email": email,
        // "occupation": occupation,
        // "father_name": fatherName,
        // "mother_name": motherName,
        // "is_married": isMarried,
        // "pan_no": panNo,
        // "aadhar_no": aadharNo,
        "role_id": roleId,
        // "password": password,
        // "password_confirmation": passwordConfirmation,
      };
}

class AddressModel {
  String doorNo;
  String buildingName;
  String address;
  String city;
  String state;
  String personalId;
  String aadhrId;
  String pincode;

  AddressModel({
    required this.doorNo,
    required this.buildingName,
    required this.address,
    required this.city,
    required this.state,
    required this.personalId,
    required this.aadhrId,
    required this.pincode
  });
}
