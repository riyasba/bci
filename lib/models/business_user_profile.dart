// To parse this JSON data, do
//
//     final businessProfileModel = businessProfileModelFromJson(jsonString);

import 'dart:convert';

BusinessProfileModel businessProfileModelFromJson(String str) => BusinessProfileModel.fromJson(json.decode(str));

String businessProfileModelToJson(BusinessProfileModel data) => json.encode(data.toJson());

class BusinessProfileModel {
    String message;
    bool subscription;
    int remainingDays;
    int percentage;
    dynamic planId;
    BusinessUser user;

    BusinessProfileModel({
        required this.message,
        required this.subscription,
        required this.remainingDays,
        required this.percentage,
        this.planId,
        required this.user,
    });

    factory BusinessProfileModel.fromJson(Map<String, dynamic> json) => BusinessProfileModel(
        message: json["message"],
        subscription: json["subscription"],
        remainingDays: json["remaining_days"],
        percentage: json["percentage"],
        planId: json["plan_id"],
        user: BusinessUser.fromJson(json["user"]),
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

class BusinessUser {
    int id;
    int roleId;
    String name;
    String email;
    String mobile;
    int isVerrifiedMobile;
    String otp;
    String referralCode;
    dynamic referredBy;
    dynamic walletAmount;
    dynamic category;
    dynamic subCategory;
    dynamic alternateMobile;
    dynamic gstNo;
    dynamic adharProof;
    dynamic panProof;
    String profilePicture;
    dynamic clientSecret;
    dynamic clientId;
    dynamic keyName;
    String keyStatus;
    dynamic emailVerifiedAt;
    String address;
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
    dynamic gender;
    dynamic spouse;
    dynamic noOfChild;
    dynamic childName;
    dynamic weddingDate;
    dynamic memberType;
    dynamic branch;
    dynamic qualification;
    dynamic doorNo;
    String bciShareType;
    String bciShareAmount;
    String bankName;
    String bankAccountName;
    String accountType;
    String bankAccountNumber;
    String ifscCode;
    String shopImage;
    DateTime createdAt;
    DateTime updatedAt;

    BusinessUser({
        required this.id,
        required this.roleId,
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
        this.alternateMobile,
        this.gstNo,
        this.adharProof,
        this.panProof,
        required this.profilePicture,
        this.clientSecret,
        this.clientId,
        this.keyName,
        required this.keyStatus,
        this.emailVerifiedAt,
        required this.address,
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
        this.gender,
        this.spouse,
        this.noOfChild,
        this.childName,
        this.weddingDate,
        this.memberType,
        this.branch,
        this.qualification,
        this.doorNo,
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

    factory BusinessUser.fromJson(Map<String, dynamic> json) => BusinessUser(
        id: json["id"]?? 0,
        roleId: json["role_id"]?? 0,
        name: json["name"]?? "",
        email: json["email"]?? "",
        mobile: json["mobile"]?? "",
        isVerrifiedMobile: json["is_verrified_mobile"]?? 0,
        otp: json["otp"]?? "",
        referralCode: json["referral_code"]?? "",
        referredBy: json["referred_by"]?? "",
        walletAmount: json["wallet_amount"]?? "",
        category: json["category"]?? "",
        subCategory: json["sub_category"]?? "",
        alternateMobile: json["alternate_mobile"]?? "",
        gstNo: json["gst_no"]?? "",
        adharProof: json["adhar_proof"]?? "",
        panProof: json["pan_proof"]?? "",
        profilePicture: json["profile_picture"]?? "",
        clientSecret: json["client_secret"]?? "",
        clientId: json["client_id"]?? "",
        keyName: json["Key_name"]?? "",
        keyStatus: json["Key_status"]?? "",
        emailVerifiedAt: json["email_verified_at"]?? "",
        address: json["address"]?? "",
        dob: json["dob"]?? "",
        occupation: json["occupation"]?? "",
        fatherName: json["father_name"]?? "",
        motherName: json["mother_name"]?? "",
        isMarried: json["is_married"]?? "",
        residentialAddress: json["residential_address"]?? "",
        officialAddress: json["official_address"]?? "",
        panNo: json["pan_no"]?? "",
        aadharNo: json["aadhar_no"]?? "",
        bio: json["bio"]?? "",
        pincode: json["pincode"]?? "",
        city: json["city"]?? "",
        state: json["state"]?? "",
        status: json["status"]?? "",
        gender: json["gender"]?? "",
        spouse: json["spouse"]?? "",
        noOfChild: json["no_of_child"]?? "",
        childName: json["child_name"]?? "",
        weddingDate: json["wedding_date"]?? "",
        memberType: json["member_type"]?? "",
        branch: json["branch"]?? "",
        qualification: json["qualification"]?? "",
        doorNo: json["door_no"]?? "",
        bciShareType: json["bci_share_type"]?? "",
        bciShareAmount: json["bci_share_amount"]?? "",
        bankName: json["bank_name"]?? "",
        bankAccountName: json["bank_account_name"]?? "",
        accountType: json["account_type"]?? "",
        bankAccountNumber: json["bank_account_number"]?? "",
        ifscCode: json["ifsc_code"]?? "",
        shopImage: json["shop_image"]?? "",
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
