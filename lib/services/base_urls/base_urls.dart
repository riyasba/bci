abstract class BaseApiService {
  final String baseUrl = "https://www.portal.bcipvtltd.com";

  //old url - https://www.portal.bcipvtltd.com
  //new url - https://www.portal.bcipvtltd.com

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

  //get profile api
  final String getProfileURL =
      "https://www.portal.bcipvtltd.com/api/auth/profile";

//profile update API URL
  final String profileUpdateURL =
      "https://www.portal.bcipvtltd.com/api/auth/profile_update";

  //sliders Api
  final String getSliderURL =
      "https://www.portal.bcipvtltd.com/api/auth/get_slider";

  //sliders Api
  final String getAdsURL =
      "https://www.portal.bcipvtltd.com/api/auth/getslider_ads";

  //Get plan list
  final String getPlanList =
      "https://www.portal.bcipvtltd.com/api/auth/get_plan_list";

  //get plan detsila
  final String getPlanDetailsURL =
      "https://www.portal.bcipvtltd.com/api/auth/get_plan_details";

  //add subscription plan
  final String addPlanUrl =
      "https://www.portal.bcipvtltd.com/api/auth/add_subscription_plan";

  //service list
  final String serviceListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/service_list";

  //add to cart
  final String addToCartApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/addtocart";

  //delete cart
  final String deleteCartApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/deletecart";

  //get cart list
  final String getCartListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/cartlists";

  //add booking api
  final String addBookingApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/addbooking";

  //our coupons api
  final String couponsApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/getUserCoupons";

  //coupons redeem api --//
  final String redeemCouponsApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/redeemCoupon";

  //coupons redeem api --//
  final String subRedeemCouponsApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/subscriptionCoupon";

  //get booking list --//
  final String bookingListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/booking_list";

  //get today offers list
  final String todayOffersListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/today_offers_list";

  // ----------- Flight bookings  ----------- //

  final String airSearchUrl =
      "https://www.portal.bcipvtltd.com/api/auth/flight_search";

  final String airRepricingUrl =
      "https://www.portal.bcipvtltd.com/api/auth/air_reprice";

  final String airTicketBookingUrl =
      "https://www.portal.bcipvtltd.com/api/auth/air_temp_booking";

  final String airRePrinting =
      "https://www.portal.bcipvtltd.com/api/auth/air_reprint";

  final String airGetSsrURL =
      "https://www.portal.bcipvtltd.com/api/auth/air_get_ssr";

  final String airCancelApiURL =
      "https://www.portal.bcipvtltd.com/api/auth/air_ticket_cancellation";

  final String airAddPayment =
      "https://www.portal.bcipvtltd.com/api/auth/add_payment";

  final String airGetSeatMap =
      "https://www.portal.bcipvtltd.com/api/auth/air_get_seat_map";

  final String airportSearch = "https://openflights.org/php/apsearch.php";

  //----------- holidays bookings ---------------//
  final String getPackageCategoryApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/get_package_category";

  final String getPackageListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/get_package_list";

  final String getPackageDetailsApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/get_package_details";

  final String createEnquiryApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/create_enquiry";

  final String searchPackageListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/search_packages";

  final String getEnquiryListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/get_enquiry";

  //settings api

  final String createSupportApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/create_ticket";

  final String generateReferralCodeApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/generateReferralCode";

  final String recomendedListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/recomended_list";

  final String ourPartnersApiUrl =
      "https://www.portal.bcipvtltd.com/api/getpartners";

  //liquors api
  final getVendorByCategory =
      "https://www.portal.bcipvtltd.com/api/auth/getVendorsByCategory";

  //bus booking api
  final getCityListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/Bus_CityList";

  final searchBusApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/Bus_Search";

  final busSeatMapApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/bus_seat_map";

  final busTempBooking =
      "https://www.portal.bcipvtltd.com/api/auth/bus_temp_booking";

  final busTicketing =
      "https://www.portal.bcipvtltd.com/api/auth/bus_ticketing";

  final busRequiryURL = "https://www.portal.bcipvtltd.com/api/auth/bus_requery";

  final String addBusBookingHistoryURL =
      "https://www.portal.bcipvtltd.com/api/auth/add_bus_booking_history";

  final String getBusBookingHistoryURL =
      "https://www.portal.bcipvtltd.com/api/auth/get_bus_booking_history";

  final String addFlightBookingHistoryURL =
      "https://www.portal.bcipvtltd.com/api/auth/add_flight_booking_history";

  final String getFlightBookingHistoryURL =
      "https://www.portal.bcipvtltd.com/api/auth/get_flight_booking_history";

  //get wallet details
  final String getWalletDetailsApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/getUserwallet";

  //home screen banner api
  final String getSliderProductApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/get_slider_product";

  //generate referral code
  final String generateReferralApiUrl =
      "https://www.portal.bcipvtltd.com/api/generateReferralregister";

  //add transaction
  final String addTransactionApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/add_transaction";

  //get transaction history
  final String transactionHistoryApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/transaction_history";

  //fcm token
  final String fcmTokenStoreApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/fcm-token";

  //hotel info
  final String hotelInfoApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/hotelinfo";

  //hotel get hotel room
  final String getHotelRoomApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/get_hotel_room";

  //hotel search
  final String searchHotelApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/search_hotels";

  //hotel search city
  final String searchHotelcityApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/destination_list";

  //hotel booking api
  final String hotelBookingApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/hotel_booking";

  //block room api
  final blockRoomApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/block_room";

  //notification list
  final String notificationListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/notification_list";

  //user redeemded coupon
  final String userRedeemCoupons =
      "https://www.portal.bcipvtltd.com/api/auth/userRedeemCoupons";

  //hotel booking list
  final String hotelBookinglistApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/list_hotel_booking";

  final String storeHotelBookingURL =
      "https://www.portal.bcipvtltd.com/api/auth/store_hotel_booking";

  final String hotelBookingDetailsURL =
      "https://www.portal.bcipvtltd.com/api/auth/get_booking_detail";

  final String vendorListURL =
      "https://www.portal.bcipvtltd.com/api/auth/vendor_list";

  //withdraw amount
  final String withdrawAmountURL =
      "https://www.portal.bcipvtltd.com/api/auth/withdrawAmount";

  //banner
  final String bannerURL =
      "https://www.portal.bcipvtltd.com/api/auth/getslider_booking";

  //get gallery
  final String getGalleryURI =
      "https://www.portal.bcipvtltd.com/api/auth/get_gallery";

  //cancel
  // final String airTicketCancelURL = 'https://www.portal.bcipvtltd.com/api/auth/airTicketCancelDetails';

  //notication count
  final String notificationCountApiUrl =
      "https://portal.bcipvtltd.com/api/auth/notification/count";

  //support admin details
  final String supportAdminDetailsApiUrl =
      "https://portal.bcipvtltd.com/api/get/app/support/details";

  //plan check api url
  final String planCheckApi =
      "https://portal.bcipvtltd.com/api/auth/plan_trans_check";

  //support admin details
  final String paymentInitiateURL =
      "https://www.portal.bcipvtltd.com/api/pay_phonepay";

  //plan check api url
  final String paymentStatusURL =
      "https://www.portal.bcipvtltd.com/api/checkPaymentStatus";

  //
  // final String busBookingCancelationURL = "http://uat.etrav.in/BusHost/BusAPIService.svc/JSONService/Bus_Cancellation";

  final String busBookingCancelationURL =
      "http://api.etrav.in/BusHost/BusAPIService.svc/JSONService/Bus_Cancellation";

  final String busBookingCancelationChargeURL =
      "http://api.etrav.in/BusHost/BusAPIService.svc/JSONService/Bus_CancellationCharge";

  final String hotelBookingCancelationURL =
      "https://www.portal.bcipvtltd.com/api/auth/cancel_request";

  // ----- //
  final String getMerchantCaregoryURL = "https://www.portal.bcipvtltd.com/api/auth/merchant_service_category";
  
}
