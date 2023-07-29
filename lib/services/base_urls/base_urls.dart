abstract class BaseApiService {
  final String baseUrl = "https://bci.generation360tech.in";

  //register url
  final String registerURl =
      "https://bci.generation360tech.in/api/register_user";

  //login url
  final String getOtpUrl = "https://bci.generation360tech.in/api/get_otp";

  //otp verify
  final String otpVerifyApiUrl = "https://bci.generation360tech.in/api/otp_verrify";

  //login url
  final String loginURL = "https://bci.generation360tech.in/api/login";

  //category url
  final String categoryURL = "https://bci.generation360tech.in/api/category";

  //sub category URL
  final String subCategoryURL = "https://bci.generation360tech.in/api/sub_category";

  //get profile api
  final String getProfileURL = "https://bci.generation360tech.in/api/auth/profile";

//profile update API URL
  final String profileUpdateURL = "https://bci.generation360tech.in/api/auth/profile_update";

  //Add services
  final String addServicesURL = "https://bci.generation360tech.in/api/auth/merchant_create_service";

  //get Services
  final String getServicesURL = "https://bci.generation360tech.in/api/auth/service_list";

  //get booking list
  final String bookingListApiUrl = "https://bci.generation360tech.in/api/auth/vendor_booking_list";

  // add today offers 
  final String addTodayOffersApiUrl = "https://bci.generation360tech.in/api/auth/merchant_offers";

  //vendor offer list
  final String vendorOfferListApiUrl = "https://bci.generation360tech.in/api/auth/vendor_offers_list";

  //create support
  final String createSupportApiUrl = "https://bci.generation360tech.in/api/auth/create_ticket";

  //get wallet details
  final String getWalletDetailsApiUrl = "https://bci.generation360tech.in/api/auth/getUserwallet"; 
  
  //generate referral code
  final String generateReferralCodeApiUrl =
      "https://bci.generation360tech.in/api/auth/generateReferralCode";

}
 