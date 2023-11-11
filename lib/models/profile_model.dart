// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String message;
  User user;

  ProfileModel({
    required this.message,
    required this.user,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
      };
}

class User {
  int id;
  dynamic roleId;
  String name;
  String email;
  String mobile;
  dynamic isVerrifiedMobile;
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
  dynamic keyStatus;
  dynamic emailVerifiedAt;
  dynamic address;
  dynamic dob;
  String occupation;
  String fatherName;
  String motherName;
  String isMarried;
  String residentialAddress;
  String officialAddress;
  String panNo;
  String aadharNo;
  dynamic bio;
  dynamic pincode;
  dynamic city;
  dynamic state;
  dynamic status;
  DateTime createdAt;
  DateTime updatedAt;
  List<Child> children;

  User({
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
    required this.children,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        roleId: json["role_id"] ?? "",
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        mobile: json["mobile"] ?? "",
        isVerrifiedMobile: json["is_verrified_mobile"] ?? "",
        otp: json["otp"] ?? "",
        category: json["category"] ?? "",
        subCategory: json["sub_category"] ?? "",
        alternateMobile: json["alternate_mobile"] ?? "",
        gstNo: json["gst_no"] ?? "",
        adharProof: json["adhar_proof"] ?? "",
        panProof: json["pan_proof"] ?? "",
        profilePicture: json["profile_picture"] ?? "",
        clientSecret: json["client_secret"] ?? "",
        clientId: json["client_id"] ?? "",
        keyName: json["Key_name"] ?? "",
        keyStatus: json["Key_status"] ?? "",
        emailVerifiedAt: json["email_verified_at"] ?? "",
        address: json["address"] ?? "",
        dob: json["dob"] ?? "",
        occupation: json["occupation"] ?? "",
        fatherName: json["father_name"] ?? "",
        motherName: json["mother_name"] ?? "",
        isMarried: json["is_married"] ?? "",
        residentialAddress: json["residential_address"] ?? "",
        officialAddress: json["official_address"] ?? "",
        panNo: json["pan_no"] ?? "",
        aadharNo: json["aadhar_no"] ?? "",
        bio: json["bio"] ?? "",
        pincode: json["pincode"] ?? "",
        city: json["city"] ?? "",
        state: json["state"] ?? "",
        status: json["status"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        children:
            List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
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



class Child {
  int id;
  String userId;
  String childName;
  String dob;
  DateTime createdAt;
  DateTime updatedAt;

  Child({
    required this.id,
    required this.userId,
    required this.childName,
    required this.dob,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json["id"],
        userId: json["user_id"],
        childName: json["child_name"],
        dob: json["dob"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "child_name": childName,
        "dob": dob,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
