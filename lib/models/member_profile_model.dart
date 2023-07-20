// To parse this JSON data, do
//
//     final memberProfileModel = memberProfileModelFromJson(jsonString);

import 'dart:convert';

MemberProfileModel memberProfileModelFromJson(String str) => MemberProfileModel.fromJson(json.decode(str));

String memberProfileModelToJson(MemberProfileModel data) => json.encode(data.toJson());

class MemberProfileModel {
    String message;
    bool subscription;
    int remainingDays;
    dynamic percentage;
    dynamic planId;
    MemberUser user;

    MemberProfileModel({
        required this.message,
        required this.subscription,
        required this.remainingDays,
        required this.percentage,
        this.planId,
        required this.user,
    });

    factory MemberProfileModel.fromJson(Map<String, dynamic> json) => MemberProfileModel(
        message: json["message"],
        subscription: json["subscription"],
        remainingDays: json["remaining_days"],
        percentage: json["percentage"]?? "",
        planId: json["plan_id"]?? "",
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
    dynamic status;
    dynamic gender;
    dynamic spouse;
    dynamic noOfChild;
    dynamic childName;
    dynamic weddingDate;
    dynamic memberType;
    dynamic branch;
    dynamic qualification;
    dynamic doorNo;
    dynamic bciShareType;
    dynamic bciShareAmount;
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
        required this.referralCode,
        this.referredBy,
        this.walletAmount,
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
        this.bciShareType,
        this.bciShareAmount,
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
        referralCode: json["referral_code"],
        referredBy: json["referred_by"],
        walletAmount: json["wallet_amount"],
        category: json["category"],
        subCategory: json["sub_category"],
        alternateMobile: json["alternate_mobile"],
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
