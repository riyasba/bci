abstract class BaseApiService {
  final String baseUrl = "https://www.portal.bcipvtltd.com";

  // old url - https://bci.generation360tech.in/
  // new url - https://www.portal.bcipvtltd.com/

  //register url
  final String registerURl =
      "https://www.portal.bcipvtltd.com/api/register_user";

  //login url
  final String getOtpUrl = "https://www.portal.bcipvtltd.com/api/get_otp";

  //login url
  final String loginURL = "https://www.portal.bcipvtltd.com/api/login";

  //category url
  final String categoryURL = "https://www.portal.bcipvtltd.com/api/category";

  //sub category URL
  final String subCategoryURL =
      "https://www.portal.bcipvtltd.com/api/sub_category";

  //api URL
  final String otpVerifyApiUrl =
      "https://www.portal.bcipvtltd.com/api/otp_verrify";

  //get profile api
  final String getProfileURL =
      "https://www.portal.bcipvtltd.com/api/auth/profile";

//profile update API URL
  final String profileUpdateURL =
      "https://www.portal.bcipvtltd.com/api/auth/profile_update";

  //Add services
  final String addServicesURL =
      "https://www.portal.bcipvtltd.com/api/auth/merchant_create_service";

  //get Services
  final String getServicesURL =
      "https://www.portal.bcipvtltd.com/api/auth/service_list";

  //get booking list
  final String bookingListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/vendor_booking_list";

  // add today offers
  final String addTodayOffersApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/merchant_offers";

  //vendor offer list
  final String vendorOfferListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/vendor_offers_list";

  //create support
  final String createSupportApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/create_ticket";

  //get wallet details
  final String getWalletDetailsApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/getUserwallet";

  //generate referral code
  final String generateReferralCodeApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/generateReferralCode";

//Get Transactionhistory
  final String transactionHistoryApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/transaction_history";

  //Get notification_list
  final String notificationlistURL =
      "https://www.portal.bcipvtltd.com/api/auth/notification_list";

  //fcmtoken
  final String fcmTokenStoreApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/fcm-token";

  //vendorbanner
  final String vendorbannerURL =
      'https://www.portal.bcipvtltd.com/api/auth/get_vendor_slider';

  //vendor redeemption coupons
  final String redeemprtionCouponsApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/vedorRedeemCoupons";

  //generate referral code
  final String generateReferralApiUrl =
      "https://www.portal.bcipvtltd.com/api/generateReferralregister";

  //withdraw amount
  final String withdrawAmountURL =
      "https://www.portal.bcipvtltd.com/api/auth/withdraw_wallet";

  final String hotelBookingDetailsURL =
      "https://www.portal.bcipvtltd.com/api/auth/get_booking_detail";

  // add today offers
  final String addCouponsURL =
      "https://www.portal.bcipvtltd.com/api/auth/vendor_coupon";

  // add today offers
  final String addedCouponListURL =
      "https://www.portal.bcipvtltd.com/api/auth/vendor_coupon_list";

//add gallery
  final String addGallery =
      "https://www.portal.bcipvtltd.com/api/auth/user_gallery";

      
  //get gallery
  final String getGalleryURI =
      "https://www.portal.bcipvtltd.com/api/auth/get_gallery";

   //support admin details
      final String supportAdminDetailsApiUrl =
      "https://portal.bcipvtltd.com/api/get/app/support/details";

      //notification count
      final String notificationCountApiUrl =
      "https://portal.bcipvtltd.com/api/auth/notification/count";

      final String deleteUserURL = "https://portal.bcipvtltd.com/api/auth/delete_user";


  //changes
  final String serviceDetailsURL =
      "https://www.portal.bcipvtltd.com/api/auth/service_details"; 
}
