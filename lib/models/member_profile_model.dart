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
  bool subscription;
  int remainingDays;
  int percentage;
  String planId;
  MemberUser user;

  MemberProfileModel({
    required this.message,
    required this.subscription,
    required this.remainingDays,
    required this.percentage,
    required this.planId,
    required this.user,
  });

  factory MemberProfileModel.fromJson(Map<String, dynamic> json) =>
      MemberProfileModel(
        message: json["message"],
        subscription: json["subscription"] ?? false,
        remainingDays: json["remaining_days"] ?? 0,
        percentage: json["percentage"] ?? 0,
        planId: json["plan_id"] ?? "",
        user: MemberUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "subscription": subscription,
        "remaining_days": remainingDays,
        "percentage": percentage,
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
  String category;
  String subCategory;
  String alternateMobile;
  String gstNo;
  String adharProof;
  String panProof;
  dynamic profilePicture;
  dynamic clientSecret;
  dynamic clientId;
  dynamic keyName;
  String keyStatus;
  dynamic emailVerifiedAt;
  dynamic address;
  dynamic dob;
  dynamic occupation;
  dynamic fatherName;
  dynamic motherName;
  dynamic isMarried;
  dynamic residentialAddress;
  dynamic officialAddress;
  dynamic panNo;
  dynamic aadharNo;
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
    required this.category,
    required this.subCategory,
    required this.alternateMobile,
    required this.gstNo,
    required this.adharProof,
    required this.panProof,
    this.profilePicture,
    this.clientSecret,
    this.clientId,
    this.keyName,
    required this.keyStatus,
    this.emailVerifiedAt,
    this.address,
    this.dob,
    this.occupation,
    this.fatherName,
    this.motherName,
    this.isMarried,
    this.residentialAddress,
    this.officialAddress,
    this.panNo,
    this.aadharNo,
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
        isVerrifiedMobile: json["is_verrified_mobile"],
        otp: json["otp"],
        category: json["category"] ?? "",
        subCategory: json["sub_category"] ?? "",
        alternateMobile: json["alternate_mobile"],
        gstNo: json["gst_no"] ?? "",
        adharProof: json["adhar_proof"] ?? '',
        panProof: json["pan_proof"] ?? '',
        profilePicture: json["profile_picture"],
        clientSecret: json["client_secret"],
        clientId: json["client_id"],
        keyName: json["Key_name"],
        keyStatus: json["Key_status"],
        emailVerifiedAt: json["email_verified_at"] ?? '',
        address: json["address"] ?? "",
        dob: json["dob"] ?? "",
        occupation: json["occupation"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        isMarried: json["is_married"],
        residentialAddress: json["residential_address"],
        officialAddress: json["official_address"],
        panNo: json["pan_no"],
        aadharNo: json["aadhar_no"],
        bio: json["bio"],
        pincode: json["pincode"],
        city: json["city"],
        state: json["state"],
        status: json["status"],
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
        "residential_address": residentialAddress,
        "official_address": officialAddress,
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
