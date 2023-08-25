// To parse this JSON data, do
//
//     final getWalletDetails = getWalletDetailsFromJson(jsonString);

import 'dart:convert';

GetWalletDetails getWalletDetailsFromJson(String str) => GetWalletDetails.fromJson(json.decode(str));

String getWalletDetailsToJson(GetWalletDetails data) => json.encode(data.toJson());

class GetWalletDetails {
    Coupon coupon;
    Referrals referrals;
    Bookings bookings;
    Earnings earnings;

    GetWalletDetails({
        required this.coupon,
        required this.referrals,
        required this.bookings,
        required this.earnings,
    });

    factory GetWalletDetails.fromJson(Map<String, dynamic> json) => GetWalletDetails(
        coupon: Coupon.fromJson(json["coupon"]),
        referrals: Referrals.fromJson(json["referrals"]),
        bookings: Bookings.fromJson(json["bookings"]),
        earnings: Earnings.fromJson(json["earnings"]),
    );

    Map<String, dynamic> toJson() => {
        "coupon": coupon.toJson(),
        "referrals": referrals.toJson(),
        "bookings": bookings.toJson(),
        "earnings": earnings.toJson(),
    };
}

class Bookings {
    int totalBooking;
    int todayBooking;
    int thisMonthBooking;

    Bookings({
        required this.totalBooking,
        required this.todayBooking,
        required this.thisMonthBooking,
    });

    factory Bookings.fromJson(Map<String, dynamic> json) => Bookings(
        totalBooking: json["total_booking"],
        todayBooking: json["today_booking"],
        thisMonthBooking: json["this_month_booking"],
    );

    Map<String, dynamic> toJson() => {
        "total_booking": totalBooking,
        "today_booking": todayBooking,
        "this_month_booking": thisMonthBooking,
    };
}

class Coupon {
    int totalCouponCodes;
    int thisMonthUsed;
    int todayUsed;

    Coupon({
        required this.totalCouponCodes,
        required this.thisMonthUsed,
        required this.todayUsed,
    });

    factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        totalCouponCodes: json["total_coupon_codes"],
        thisMonthUsed: json["this_month_used"],
        todayUsed: json["today_used"],
    );

    Map<String, dynamic> toJson() => {
        "total_coupon_codes": totalCouponCodes,
        "this_month_used": thisMonthUsed,
        "today_used": todayUsed,
    };
}

class Earnings {
    int totalEarnings;
    int todayEarnings;
    int thisMonthEarnings;

    Earnings({
        required this.totalEarnings,
        required this.todayEarnings,
        required this.thisMonthEarnings,
    });

    factory Earnings.fromJson(Map<String, dynamic> json) => Earnings(
        totalEarnings: json["total_earnings"],
        todayEarnings: json["today_earnings"],
        thisMonthEarnings: json["this_month_earnings"],
    );

    Map<String, dynamic> toJson() => {
        "total_earnings": totalEarnings,
        "today_earnings": todayEarnings,
        "this_month_earnings": thisMonthEarnings,
    };
}

class Referrals {
    int totalReferrals;
    int todayReferrals;
    int thisMonthReferrals;

    Referrals({
        required this.totalReferrals,
        required this.todayReferrals,
        required this.thisMonthReferrals,
    });

    factory Referrals.fromJson(Map<String, dynamic> json) => Referrals(
        totalReferrals: json["total_referrals"]?? 0,
        todayReferrals: json["today_referrals"],
        thisMonthReferrals: json["this_month_referrals"],
    );

    Map<String, dynamic> toJson() => {
        "total_referrals": totalReferrals,
        "today_referrals": todayReferrals,
        "this_month_referrals": thisMonthReferrals,
    };
}
