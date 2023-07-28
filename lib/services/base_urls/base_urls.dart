abstract class BaseApiService {
  final String baseUrl = "https://bci.generation360tech.in";

  //register url
  final String registerURl =
      "https://bci.generation360tech.in/api/register_user";

  //login url
  final String getOtpUrl = "https://bci.generation360tech.in/api/get_otp";

  //login url
  final String loginURL = "https://bci.generation360tech.in/api/login";

  //category url
  final String categoryURL = "https://bci.generation360tech.in/api/category";

  //sub category URL
  final String subCategoryURL =
      "https://bci.generation360tech.in/api/sub_category";

  //get profile api
  final String getProfileURL =
      "https://bci.generation360tech.in/api/auth/profile";

//profile update API URL
  final String profileUpdateURL =
      "https://bci.generation360tech.in/api/auth/profile_update";

  //sliders Api
  final String getSliderURL =
      "https://bci.generation360tech.in/api/auth/get_slider";

  //Get plan list
  final String getPlanList =
      "https://bci.generation360tech.in/api/auth/get_plan_list";

  //get plan detsila
  final String getPlanDetailsURL =
      "https://bci.generation360tech.in/api/auth/get_plan_details";

  //add subscription plan
  final String addPlanUrl =
      "https://bci.generation360tech.in/api/auth/add_subscription_plan";

  //service list
  final String serviceListApiUrl =
      "https://bci.generation360tech.in/api/auth/service_list";

  //add to cart
  final String addToCartApiUrl =
      "https://bci.generation360tech.in/api/auth/addtocart";

  //delete cart
  final String deleteCartApiUrl =
      "https://bci.generation360tech.in/api/auth/deletecart";

  //get cart list
  final String getCartListApiUrl =
      "https://bci.generation360tech.in/api/auth/cartlists";

  //add booking api
  final String addBookingApiUrl =
      "https://bci.generation360tech.in/api/auth/addbooking";

  //our coupons api
  final String couponsApiUrl =
      "https://bci.generation360tech.in/api/auth/getUserCoupons";

  //coupons redeem api
  final String redeemCouponsApiUrl =
      "https://bci.generation360tech.in/api/auth/redeemCoupon";

  //get booking list
  final String bookingListApiUrl =
      "https://bci.generation360tech.in/api/auth/booking_list";

  //get today offers list
  final String todayOffersListApiUrl =
      "https://bci.generation360tech.in/api/auth/today_offers_list";

  // ----------- Flight bookings  ----------- //

  final String airSearchUrl =
      "https://bci.generation360tech.in/api/auth/flight_search";

  final String airRepricingUrl =
      "https://bci.generation360tech.in/api/auth/air_reprice";

  final String airTicketBookingUrl =
      "https://bci.generation360tech.in/api/auth/air_temp_booking";

  final String airRePrinting =
      "https://bci.generation360tech.in/api/auth/air_reprint";

  final String airAddPayment =
      "https://bci.generation360tech.in/api/auth/add_payment";

  final String airportSearch = "https://openflights.org/php/apsearch.php";

  //----------- holidays bookings ---------------//

  final String getPackageCategoryApiUrl =
      "https://bci.generation360tech.in/api/auth/get_package_category";

  final String getPackageListApiUrl =
      "https://bci.generation360tech.in/api/auth/get_package_list";

  final String getPackageDetailsApiUrl =
      "https://bci.generation360tech.in/api/auth/get_package_details";

  final String createEnquiryApiUrl =
      "https://bci.generation360tech.in/api/auth/create_enquiry";

  final String searchPackageListApiUrl =
      "https://bci.generation360tech.in/api/auth/search_packages";

  final String getEnquiryListApiUrl =
      "https://bci.generation360tech.in/api/auth/get_enquiry";

  //settings api

  final String createSupportApiUrl =
      "https://bci.generation360tech.in/api/auth/create_ticket";

  final String generateReferralCodeApiUrl =
      "https://bci.generation360tech.in/api/auth/generateReferralCode";

  final String recomendedListApiUrl =
      "https://bci.generation360tech.in/api/auth/recomended_list";

  final String ourPartnersApiUrl =
      "https://bci.generation360tech.in/api/getpartners";

  //liquors api
  final getVendorByCategory =
      "https://bci.generation360tech.in/api/auth/getVendorsByCategory";

  //bus booking api

  final getCityListApiUrl =
      "https://bci.generation360tech.in/api/auth/Bus_CityList";

  final searchBusApiUrl =
      "https://bci.generation360tech.in/api/auth/Bus_Search";

  final busSeatMapApiUrl =
      "https://bci.generation360tech.in/api/auth/bus_seat_map";

  final busTempBooking =
      "https://bci.generation360tech.in/api/auth/bus_temp_booking";

  final busTicketing =
      "https://bci.generation360tech.in/api/auth/bus_ticketing";

  final busRequiryURL = "https://bci.generation360tech.in/api/auth/bus_requery";
}
