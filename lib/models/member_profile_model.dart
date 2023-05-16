// To parse this JSON data, do
//
//     final memberProfileModel = memberProfileModelFromJson(jsonString);

import 'dart:convert';

MemberProfileModel memberProfileModelFromJson(String str) =>
    MemberProfileModel.fromJson(json.decode(str));

String memberProfileModelToJson(MemberProfileModel data) =>
    json.encode(data.toJson());

class MemberProfileModel {
  String message;
  MemberUser user;

  MemberProfileModel({
    required this.message,
    required this.user,
  });

  factory MemberProfileModel.fromJson(Map<String, dynamic> json) =>
      MemberProfileModel(
        message: json["message"],
        user: MemberUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
      };
}

class MemberUser {
  int id;
  String roleId;
  String name;
  String email;
  String mobile;
  String isVerrifiedMobile;
  String otp;
  dynamic category;
  dynamic subCategory;
  dynamic alternateMobile;
  dynamic gstNo;
  dynamic adharProof;
  dynamic panProof;
  dynamic profilePicture;
  dynamic clientSecret;
  dynamic clientId;
  dynamic keyName;
  String keyStatus;
  dynamic emailVerifiedAt;
  dynamic address;
  dynamic dob;
  String occupation;
  String fatherName;
  String motherName;
  String isMarried;
  ResidentialAddress residentialAddress;
  OfficialAddress officialAddress;
  String panNo;
  String aadharNo;
  dynamic bio;
  dynamic pincode;
  dynamic city;
  dynamic state;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  MemberUser({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.isVerrifiedMobile,
    required this.otp,
    this.category,
    this.subCategory,
    this.alternateMobile,
    this.gstNo,
    this.adharProof,
    this.panProof,
    this.profilePicture,
    this.clientSecret,
    this.clientId,
    this.keyName,
    required this.keyStatus,
    this.emailVerifiedAt,
    this.address,
    this.dob,
    required this.occupation,
    required this.fatherName,
    required this.motherName,
    required this.isMarried,
    required this.residentialAddress,
    required this.officialAddress,
    required this.panNo,
    required this.aadharNo,
    this.bio,
    this.pincode,
    this.city,
    this.state,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MemberUser.fromJson(Map<String, dynamic> json) => MemberUser(
        id: json["id"],
        roleId: json["role_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        isVerrifiedMobile: json["is_verrified_mobile"] ?? "",
        otp: json["otp"] ?? "",
        category: json["category"] ?? "",
        subCategory: json["sub_category"] ?? "",
        alternateMobile: json["alternate_mobile"],
        gstNo: json["gst_no"],
        adharProof: json["adhar_proof"],
        panProof: json["pan_proof"],
        profilePicture: json["profile_picture"],
        clientSecret: json["client_secret"],
        clientId: json["client_id"],
        keyName: json["Key_name"],
        keyStatus: json["Key_status"] ?? "",
        emailVerifiedAt: json["email_verified_at"] ?? "",
        address: json["address"] ?? "",
        dob: json["dob"],
        occupation: json["occupation"] ?? "",
        fatherName: json["father_name"] ?? "",
        motherName: json["mother_name"] ?? "",
        isMarried: json["is_married"] ?? "",
        residentialAddress:
            ResidentialAddress.fromJson(json["residential_address"]),
        officialAddress: OfficialAddress.fromJson(json["official_address"]),
        panNo: json["pan_no"] ?? "",
        aadharNo: json["aadhar_no"] ?? "",
        bio: json["bio"],
        pincode: json["pincode"],
        city: json["city"],
        state: json["state"],
        status: json["status"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "name": name,
        "email": email,
        "mobile": mobile,
        "is_verrified_mobile": isVerrifiedMobile,
        "otp": otp,
        "category": category,
        "sub_category": subCategory,
        "alternate_mobile": alternateMobile,
        "gst_no": gstNo,
        "adhar_proof": adharProof,
        "pan_proof": panProof,
        "profile_picture": profilePicture,
        "client_secret": clientSecret,
        "client_id": clientId,
        "Key_name": keyName,
        "Key_status": keyStatus,
        "email_verified_at": emailVerifiedAt,
        "address": address,
        "dob": dob,
        "occupation": occupation,
        "father_name": fatherName,
        "mother_name": motherName,
        "is_married": isMarried,
        "residential_address": residentialAddress.toJson(),
        "official_address": officialAddress.toJson(),
        "pan_no": panNo,
        "aadhar_no": aadharNo,
        "bio": bio,
        "pincode": pincode,
        "city": city,
        "state": state,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class OfficialAddress {
  String doorNo;
  String address;
  String buildingName;
  String state;
  String city;

  OfficialAddress({
    required this.doorNo,
    required this.address,
    required this.buildingName,
    required this.state,
    required this.city,
  });

  factory OfficialAddress.fromJson(Map<String, dynamic> json) =>
      OfficialAddress(
        doorNo: json["door_no"] ?? "",
        address: json["address"] ?? "",
        buildingName: json["building_name"] ?? "",
        state: json["state"] ?? "",
        city: json["city"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "door_no": doorNo,
        "address": address,
        "building_name": buildingName,
        "state": state,
        "city": city,
      };
}

class ResidentialAddress {
  String doorNo;
  String address;
  String buildingName;
  String state;
  String city;
  String personalId;
  String aadharId;

  ResidentialAddress({
    required this.doorNo,
    required this.address,
    required this.buildingName,
    required this.state,
    required this.city,
    required this.personalId,
    required this.aadharId,
  });

  factory ResidentialAddress.fromJson(Map<String, dynamic> json) =>
      ResidentialAddress(
        doorNo: json["door_no"] ?? "",
        address: json["address"] ?? "",
        buildingName: json["building_name"] ?? "",
        state: json["state"] ?? "",
        city: json["city"] ?? "",
        personalId: json["personal_id"] ?? "",
        aadharId: json["aadhar_id"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "door_no": doorNo,
        "address": address,
        "building_name": buildingName,
        "state": state,
        "city": city,
        "personal_id": personalId,
        "aadhar_id": aadharId,
      };
}
