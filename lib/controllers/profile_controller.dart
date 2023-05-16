import 'package:bci/models/business_user_profile.dart';
import 'package:bci/models/profile_model.dart';
import 'package:bci/services/network/profile_api_services/profile_api_services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class ProfileController extends GetxController {
  GetProfileApiServices getProfileApiServices = GetProfileApiServices();
  List<BusinessUser> profileData = [];

  getProfile() async {
    profileData.clear();
    dio.Response<dynamic> response = await getProfileApiServices.getProfile();

    if (response.statusCode == 200) {
      BusinessProfileModel profileModel =
          BusinessProfileModel.fromJson(response.data);
      profileData.add(profileModel.user);
      update();
    }
  }
}
