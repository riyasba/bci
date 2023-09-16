



import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/get_plan_details_model.dart';
import 'package:bci/models/get_plans_model.dart';
import 'package:bci/models/slider_model.dart';
import 'package:bci/services/network/subscriptions_api_services/add_subscription_api_services.dart';
import 'package:bci/services/network/subscriptions_api_services/get_plan_details_api_services.dart';
import 'package:bci/services/network/subscriptions_api_services/get_plans_list_api_services.dart';
import 'package:dio/dio.dart' as dio;
import 'package:bci/services/network/slider_api_services/slider_api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PlanController extends GetxController {
  GetSliderApiServices getSliderApiServices = GetSliderApiServices();
  GetPlansApiServices getPlansApiServices = GetPlansApiServices();
  GetPlansDetailsApiServices getPlansDetailsApiServices =
      GetPlansDetailsApiServices();

  AddSubscriptionApiServices addSubscriptionApiServices =
      AddSubscriptionApiServices();

  List<SliderPost> sliderList = [];
  List<PlansData> plansdataList = [];
  //List<PlansData> planDetailsList = [];
  List<SubscribePlansData> subscribePlansData = [];

  getSlider() async {
    dio.Response<dynamic> response = await getSliderApiServices.getSlider();

    if (response.statusCode == 200) {
      SliderModel sliderModel = SliderModel.fromJson(response.data);
      sliderList = sliderModel.posts;
    }
    update();
  }

  getplansList() async {
    dio.Response<dynamic> response = await getPlansApiServices.getPlans();
    if (response.statusCode == 200) {
      PlansModel plansModel = PlansModel.fromJson(response.data);
      plansdataList = plansModel.data;
    }
    update();
  }

  getPlanDetails({required dynamic id}) async {
    subscribePlansData.clear();
    dio.Response<dynamic> response =
        await getPlansDetailsApiServices.getPlansDetails(planId: id);

    if (response.statusCode == 200) {
      PlansDetailsModel plansDetailsModel =
          PlansDetailsModel.fromJson(response.data);

      subscribePlansData.add(plansDetailsModel.plan);
       update();
    }
    update();
  }

  addSubscription({required int planId}) async {
    dio.Response<dynamic> response =
        await addSubscriptionApiServices.addSubscription(
            planId: planId,
            customerId: Get.find<ProfileController>().profileData.first.id);

    if (response.statusCode == 200) {
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Plan Activated Successfully",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }
}
