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

  //Add services
  final String addServicesURL =
      "https://bci.generation360tech.in/api/auth/merchant_create_service";

  //get Services
  final String getServicesURL = "https://bci.generation360tech.in/api/auth/service_list";

  //get booking list
  final String bookingListApiUrl = "https://bci.generation360tech.in/api/auth/vendor_booking_list";


}
