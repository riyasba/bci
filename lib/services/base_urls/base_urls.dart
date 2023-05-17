abstract class BaseApiService {
  final String baseUrl = "https://bci.batechnology.in.net";

  //register url
  final String registerURl =
      "https://bci.batechnology.in.net/api/register_user";

  //login url
  final String getOtpUrl = "https://bci.batechnology.in.net/api/get_otp";

  //login url
  final String loginURL = "https://bci.batechnology.in.net/api/login";

  //category url
  final String categoryURL = "https://bci.batechnology.in.net/api/category";

  //sub category URL
  final String subCategoryURL =
      "https://bci.batechnology.in.net/api/sub_category";

  //get profile api
  final String getProfileURL =
      "https://bci.batechnology.in.net/api/auth/profile";

//profile update API URL
  final String profileUpdateURL =
      "https://bci.batechnology.in.net/api/auth/profile_update";
}
