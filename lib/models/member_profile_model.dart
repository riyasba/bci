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
  dynamic remainingDays;
  dynamic percentage;
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
        subscription: json["subscription"],
        remainingDays: json["remaining_days"],
        percentage: json["percentage"],
        planId: json["plan_id"] ?? "",
        user: MemberUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "subscription": subscription,
        "remaining_days": remainingDays,
        "percentage": percentage,
        "plan_id": planId,
        "user": user.toJson(),
      };
}

class MemberUser {
  int id;
  String roleId;
  String userId;
  String name;
  String email;
  String mobile;
  String isVerrifiedMobile;
  String otp;
  String referralCode;
  dynamic referredBy;
  dynamic walletAmount;
  dynamic category;
  dynamic subCategory;
  String alternateMobile;
  String gstNo;
  String adharProof;
  String panProof;
  String profilePicture;
  dynamic clientSecret;
  dynamic clientId;
  dynamic keyName;
  String keyStatus;
  dynamic emailVerifiedAt;
  dynamic address;
  String dob;
  String spouseDob;
  String occupation;
  String fatherName;
  String motherName;
  dynamic isMarried;
  ResidentialAddress residentialAddress;
  OfficialAddress officialAddress;
  String panNo;
  String aadharNo;
  dynamic bio;
  dynamic pincode;
  dynamic city;
  dynamic state;
  String status;
  dynamic gender;
  dynamic spouse;
  dynamic noOfChild;
  dynamic childName;
  dynamic weddingDate;
  dynamic memberType;
  dynamic branch;
  String qualification;
  dynamic doorNo;
  dynamic bciShareType;
  dynamic bciShareAmount;
  dynamic bankName;
  dynamic bankAccountName;
  dynamic accountType;
  dynamic bankAccountNumber;
  dynamic ifscCode;
  dynamic shopImage;
  DateTime createdAt;
  DateTime updatedAt;
  String creditPayDate;
  String rewardPoints;
  List<Child> children;

  MemberUser(
      {required this.id,
      required this.roleId,
      required this.userId,
      required this.name,
      required this.email,
      required this.mobile,
      required this.isVerrifiedMobile,
      required this.otp,
      required this.referralCode,
      this.referredBy,
      this.walletAmount,
      this.category,
      this.subCategory,
      required this.alternateMobile,
      required this.gstNo,
      required this.adharProof,
      required this.panProof,
      required this.profilePicture,
      this.clientSecret,
      this.clientId,
      this.keyName,
      required this.keyStatus,
      this.emailVerifiedAt,
      this.address,
      required this.dob,
      required this.spouseDob,
      required this.occupation,
      required this.fatherName,
      required this.motherName,
      this.isMarried,
      required this.residentialAddress,
      required this.officialAddress,
      required this.panNo,
      required this.aadharNo,
      this.bio,
      this.pincode,
      this.city,
      this.state,
      required this.status,
      this.gender,
      this.spouse,
      this.noOfChild,
      required this.childName,
      this.weddingDate,
      this.memberType,
      this.branch,
      required this.qualification,
      this.doorNo,
      this.bciShareType,
      this.bciShareAmount,
      this.bankName,
      this.bankAccountName,
      this.accountType,
      this.bankAccountNumber,
      this.ifscCode,
      this.shopImage,
      required this.createdAt,
      required this.updatedAt,
      required this.creditPayDate,
      required this.children,
      required this.rewardPoints});

  factory MemberUser.fromJson(Map<String, dynamic> json) => MemberUser(
        id: json["id"] ?? 0,
        roleId: json["role_id"] ?? "",
        userId: json["user_id"] ?? "",
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        mobile: json["mobile"] ?? "",
        isVerrifiedMobile: json["is_verrified_mobile"] ?? "",
        otp: json["otp"] ?? "",
        referralCode: json["referral_code"] ?? "",
        referredBy: json["referred_by"] ?? "",
        walletAmount: json["wallet_amount"] ?? "0.0",
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
        spouseDob: json["wife_dob"] ?? "",
        occupation: json["occupation"] ?? "",
        fatherName: json["father_name"] ?? "",
        motherName: json["mother_name"] ?? "",
        isMarried: json["is_married"],
        residentialAddress: json["residential_address"] == null
            ? ResidentialAddress(
                doorNo: "",
                address: "",
                buildingName: "",
                state: "",
                city: "",
                personalId: "",
                pincode: "",
              )
            : ResidentialAddress.fromJson(json["residential_address"]),
        officialAddress: json["official_address"] == null
            ? OfficialAddress(
                doorNo: "",
                address: "",
                buildingName: "",
                state: "",
                city: "",
                proofIdNo: "",
                pincode: "")
            : OfficialAddress.fromJson(json["official_address"]),
        panNo: json["pan_no"] ?? "",
        aadharNo: json["aadhar_no"] ?? "",
        bio: json["bio"] ?? "",
        pincode: json["pincode"] ?? "",
        city: json["city"] ?? "",
        state: json["state"] ?? "",
        status: json["status"] ?? "",
        gender: json["gender"] ?? "",
        spouse: json["spouse"] ?? "",
        noOfChild: json["no_of_child"] ?? "",
        childName: json["child_name"] ?? "",
        weddingDate: json["wedding_date"] ?? "",
        memberType: json["member_type"] ?? "",
        branch: json["branch"] ?? "",
        qualification: json["qualification"] ?? "",
        doorNo: json["door_no"] ?? "",
        bciShareType: json["bci_share_type"] ?? "",
        bciShareAmount: json["bci_share_amount"] ?? "",
        bankName: json["bank_name"] ?? "",
        bankAccountName: json["bank_account_name"] ?? "",
        accountType: json["account_type"] ?? "",
        bankAccountNumber: json["bank_account_number"] ?? "",
        ifscCode: json["ifsc_code"] ?? "",
        shopImage: json["shop_image"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        creditPayDate: json["credit_pay_date"] ?? "",
        rewardPoints: json["reward_points"] ?? "",
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
        "referral_code": referralCode,
        "referred_by": referredBy,
        "wallet_amount": walletAmount,
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
        "gender": gender,
        "spouse": spouse,
        "no_of_child": noOfChild,
        "child_name": childName,
        "wedding_date": weddingDate,
        "member_type": memberType,
        "branch": branch,
        "qualification": qualification,
        "door_no": doorNo,
        "bci_share_type": bciShareType,
        "bci_share_amount": bciShareAmount,
        "bank_name": bankName,
        "bank_account_name": bankAccountName,
        "account_type": accountType,
        "bank_account_number": bankAccountNumber,
        "ifsc_code": ifscCode,
        "shop_image": shopImage,
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
  String proofIdNo;
  String pincode;

  OfficialAddress({
    required this.doorNo,
    required this.address,
    required this.buildingName,
    required this.state,
    required this.city,
    required this.proofIdNo,
    required this.pincode,
  });

  factory OfficialAddress.fromJson(Map<String, dynamic> json) =>
      OfficialAddress(
        doorNo: json["door_no"] ?? "",
        address: json["address"] ?? "",
        buildingName: json["building_name"] ?? "",
        state: json["state"] ?? "",
        city: json["city"] ?? "",
        proofIdNo: json["proof_id_no"] ?? "",
        pincode: json["pincode"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "door_no": doorNo,
        "address": address,
        "building_name": buildingName,
        "state": state,
        "city": city,
        "proof_id_no": proofIdNo,
        "pincode": pincode,
      };
}

class ResidentialAddress {
  String doorNo;
  String address;
  String buildingName;
  String state;
  String city;
  String personalId;
  String pincode;

  ResidentialAddress({
    required this.doorNo,
    required this.address,
    required this.buildingName,
    required this.state,
    required this.city,
    required this.personalId,
    required this.pincode,
  });

  factory ResidentialAddress.fromJson(Map<String, dynamic> json) =>
      ResidentialAddress(
        doorNo: json["door_no"] ?? "",
        address: json["address"] ?? "",
        buildingName: json["building_name"] ?? "",
        state: json["state"] ?? "",
        city: json["city"] ?? "",
        personalId: json["personal_id"] ?? "",
        pincode: json["pincode"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "door_no": doorNo,
        "address": address,
        "building_name": buildingName,
        "state": state,
        "city": city,
        "personal_id": personalId,
        "pincode": pincode,
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
