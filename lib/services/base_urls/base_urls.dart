abstract class BaseApiService {
  final String baseUrl = "https://bci.batechnology.in";

  //old url - https://bci.generation360tech.in
  //new url - https://bci.batechnology.in

  //register url
  final String registerURl =
      "https://bci.batechnology.in/api/register_user";

  //login url
  final String getOtpUrl = "https://bci.batechnology.in/api/get_otp";

  //login url
  final String loginURL = "https://bci.batechnology.in/api/login";

  //category url
  final String categoryURL = "https://bci.batechnology.in/api/category";

  //sub category URL
  final String subCategoryURL =
      "https://bci.batechnology.in/api/sub_category";

  //get profile api
  final String getProfileURL =
      "https://bci.batechnology.in/api/auth/profile";

//profile update API URL
  final String profileUpdateURL =
      "https://bci.batechnology.in/api/auth/profile_update";

  //sliders Api
  final String getSliderURL =
      "https://bci.batechnology.in/api/auth/get_slider";

  //Get plan list
  final String getPlanList =
      "https://bci.batechnology.in/api/auth/get_plan_list";

  //get plan detsila
  final String getPlanDetailsURL =
      "https://bci.batechnology.in/api/auth/get_plan_details";

  //add subscription plan
  final String addPlanUrl =
      "https://bci.batechnology.in/api/auth/add_subscription_plan";

  //service list
  final String serviceListApiUrl =
      "https://bci.batechnology.in/api/auth/service_list";

  //add to cart
  final String addToCartApiUrl =
      "https://bci.batechnology.in/api/auth/addtocart";

  //delete cart
  final String deleteCartApiUrl =
      "https://bci.batechnology.in/api/auth/deletecart";

  //get cart list
  final String getCartListApiUrl =
      "https://bci.batechnology.in/api/auth/cartlists";

  //add booking api
  final String addBookingApiUrl =
      "https://bci.batechnology.in/api/auth/addbooking";

  //our coupons api
  final String couponsApiUrl =
      "https://bci.batechnology.in/api/auth/getUserCoupons";

  //coupons redeem api
  final String redeemCouponsApiUrl =
      "https://bci.batechnology.in/api/auth/redeemCoupon";

  //get booking list
  final String bookingListApiUrl =
      "https://bci.batechnology.in/api/auth/booking_list";

  //get today offers list
  final String todayOffersListApiUrl =
      "https://bci.batechnology.in/api/auth/today_offers_list";

  // ----------- Flight bookings  ----------- //

  final String airSearchUrl =
      "https://bci.batechnology.in/api/auth/flight_search";

  final String airRepricingUrl =
      "https://bci.batechnology.in/api/auth/air_reprice";

  final String airTicketBookingUrl =
      "https://bci.batechnology.in/api/auth/air_temp_booking";

  final String airRePrinting =
      "https://bci.batechnology.in/api/auth/air_reprint";

  final String airAddPayment =
      "https://bci.batechnology.in/api/auth/add_payment";

  final String airportSearch = "https://openflights.org/php/apsearch.php";

  //----------- holidays bookings ---------------//

  final String getPackageCategoryApiUrl =
      "https://bci.batechnology.in/api/auth/get_package_category";

  final String getPackageListApiUrl =
      "https://bci.batechnology.in/api/auth/get_package_list";

  final String getPackageDetailsApiUrl =
      "https://bci.batechnology.in/api/auth/get_package_details";

  final String createEnquiryApiUrl =
      "https://bci.batechnology.in/api/auth/create_enquiry";

  final String searchPackageListApiUrl =
      "https://bci.batechnology.in/api/auth/search_packages";

  final String getEnquiryListApiUrl =
      "https://bci.batechnology.in/api/auth/get_enquiry";

  //settings api

  final String createSupportApiUrl =
      "https://bci.batechnology.in/api/auth/create_ticket";

  final String generateReferralCodeApiUrl =
      "https://bci.batechnology.in/api/auth/generateReferralCode";

  final String recomendedListApiUrl =
      "https://bci.batechnology.in/api/auth/recomended_list";

  final String ourPartnersApiUrl =
      "https://bci.batechnology.in/api/getpartners";

  //liquors api
  final getVendorByCategory =
      "https://bci.batechnology.in/api/auth/getVendorsByCategory";

  //bus booking api

  final getCityListApiUrl =
      "https://bci.batechnology.in/api/auth/Bus_CityList";

  final searchBusApiUrl =
      "https://bci.batechnology.in/api/auth/Bus_Search";

  final busSeatMapApiUrl =
      "https://bci.batechnology.in/api/auth/bus_seat_map";

  final busTempBooking =
      "https://bci.batechnology.in/api/auth/bus_temp_booking";

  final busTicketing =
      "https://bci.batechnology.in/api/auth/bus_ticketing";

  final busRequiryURL = "https://bci.batechnology.in/api/auth/bus_requery";

  final String addBusBookingHistoryURL =
      "https://bci.batechnology.in/api/auth/add_bus_booking_history";

  final String getBusBookingHistoryURL =
      "https://bci.batechnology.in/api/auth/get_bus_booking_history";

  final String addFlightBookingHistoryURL =
      "https://bci.batechnology.in/api/auth/add_flight_booking_history";

  final String getFlightBookingHistoryURL =
      "https://bci.batechnology.in/api/auth/get_flight_booking_history";

  //get wallet details
  final String getWalletDetailsApiUrl = "https://bci.batechnology.in/api/auth/getUserwallet";
}
