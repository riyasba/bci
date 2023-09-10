// To parse this JSON data, do
//
//     final vendorOfferList = vendorOfferListFromJson(jsonString);

import 'dart:convert';

VendorListModel vendorOfferListFromJson(String str) =>
    VendorListModel.fromJson(json.decode(str));

String vendorOfferListToJson(VendorListModel data) =>
    json.encode(data.toJson());

class VendorListModel {
  List<VendorListModelData> data;

  VendorListModel({
    required this.data,
  });

  factory VendorListModel.fromJson(Map<String, dynamic> json) =>
      VendorListModel(
        data: List<VendorListModelData>.from(json["data"].map((x) => VendorListModelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class VendorListModelData {
  int id;
  String roleId;
  String userId;
  String name;
  String email;
  String? fcmToken;
  String mobile;
  String isVerrifiedMobile;
  String otp;
  String referralCode;
  dynamic referredBy;
  dynamic walletAmount;
  dynamic category;
  dynamic subCategory;
  dynamic alternateMobile;
  dynamic latitude;
  dynamic logitude;
  dynamic locationAddress;
  dynamic gstNo;
  String? adharProof;
  String? panProof;
  String? profilePicture;
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
  String? panNo;
  String? aadharNo;
  dynamic bio;
  String? pincode;
  String? city;
  String? state;
  String status;
  String? gender;
  dynamic spouse;
  dynamic noOfChild;
  dynamic childName;
  dynamic weddingDate;
  dynamic memberType;
  dynamic branch;
  dynamic qualification;
  String? doorNo;
  String? bciShareType;
  String? bciShareAmount;
  dynamic bankName;
  dynamic bankAccountName;
  dynamic accountType;
  dynamic bankAccountNumber;
  dynamic ifscCode;
  dynamic shopImage;
  DateTime createdAt;
  DateTime updatedAt;

  VendorListModelData({
    required this.id,
    required this.roleId,
    required this.userId,
    required this.name,
    required this.email,
    required this.fcmToken,
    required this.mobile,
    required this.isVerrifiedMobile,
    required this.otp,
    required this.referralCode,
    required this.referredBy,
    required this.walletAmount,
    required this.category,
    required this.subCategory,
    required this.alternateMobile,
    required this.latitude,
    required this.logitude,
    required this.locationAddress,
    required this.gstNo,
    required this.adharProof,
    required this.panProof,
    required this.profilePicture,
    required this.clientSecret,
    required this.clientId,
    required this.keyName,
    required this.keyStatus,
    required this.emailVerifiedAt,
    required this.address,
    required this.dob,
    required this.occupation,
    required this.fatherName,
    required this.motherName,
    required this.isMarried,
    required this.residentialAddress,
    required this.officialAddress,
    required this.panNo,
    required this.aadharNo,
    required this.bio,
    required this.pincode,
    required this.city,
    required this.state,
    required this.status,
    required this.gender,
    required this.spouse,
    required this.noOfChild,
    required this.childName,
    required this.weddingDate,
    required this.memberType,
    required this.branch,
    required this.qualification,
    required this.doorNo,
    required this.bciShareType,
    required this.bciShareAmount,
    required this.bankName,
    required this.bankAccountName,
    required this.accountType,
    required this.bankAccountNumber,
    required this.ifscCode,
    required this.shopImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VendorListModelData.fromJson(Map<String, dynamic> json) => VendorListModelData(
        id: json["id"],
        roleId: json["role_id"],
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        fcmToken: json["fcm_token"],
        mobile: json["mobile"],
        isVerrifiedMobile: json["is_verrified_mobile"],
        otp: json["otp"],
        referralCode: json["referral_code"],
        referredBy: json["referred_by"],
        walletAmount: json["wallet_amount"],
        category: json["category"],
        subCategory: json["sub_category"],
        alternateMobile: json["alternate_mobile"],
        latitude: json["latitude"],
        logitude: json["logitude"],
        locationAddress: json["location_address"],
        gstNo: json["gst_no"],
        adharProof: json["adhar_proof"],
        panProof: json["pan_proof"],
        profilePicture: json["profile_picture"],
        clientSecret: json["client_secret"],
        clientId: json["client_id"],
        keyName: json["Key_name"],
        keyStatus: json["Key_status"],
        emailVerifiedAt: json["email_verified_at"],
        address: json["address"],
        dob: json["dob"],
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
        gender: json["gender"],
        spouse: json["spouse"],
        noOfChild: json["no_of_child"],
        childName: json["child_name"],
        weddingDate: json["wedding_date"],
        memberType: json["member_type"],
        branch: json["branch"],
        qualification: json["qualification"],
        doorNo: json["door_no"],
        bciShareType: json["bci_share_type"],
        bciShareAmount: json["bci_share_amount"],
        bankName: json["bank_name"],
        bankAccountName: json["bank_account_name"],
        accountType: json["account_type"],
        bankAccountNumber: json["bank_account_number"],
        ifscCode: json["ifsc_code"],
        shopImage: json["shop_image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "user_id": userId,
        "name": name,
        "email": email,
        "fcm_token": fcmToken,
        "mobile": mobile,
        "is_verrified_mobile": isVerrifiedMobile,
        "otp": otp,
        "referral_code": referralCode,
        "referred_by": referredBy,
        "wallet_amount": walletAmount,
        "category": category,
        "sub_category": subCategory,
        "alternate_mobile": alternateMobile,
        "latitude": latitude,
        "logitude": logitude,
        "location_address": locationAddress,
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
