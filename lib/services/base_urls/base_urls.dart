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

  final String airportSearch = "https://openflights.org/php/apsearch.php";
}
