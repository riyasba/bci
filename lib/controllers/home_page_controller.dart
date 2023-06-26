import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/get_booking_list_model.dart';
import 'package:bci/models/get_cart_list_model.dart';
import 'package:bci/models/get_plan_details_model.dart';
import 'package:bci/models/get_plans_model.dart';
import 'package:bci/models/get_service_list_model.dart';
import 'package:bci/models/search_service_list_model.dart';
import 'package:bci/models/slider_model.dart';
import 'package:bci/screens/members/liquer_screen/cart_screen.dart';
import 'package:bci/screens/members/members%20widgets/bottumbavigation.dart';
import 'package:bci/screens/members/otcpayment/successful.dart';
import 'package:bci/services/network/categorys_api_services/add_booking_api_services.dart';
import 'package:bci/services/network/categorys_api_services/add_to_cart_api_services.dart';
import 'package:bci/services/network/categorys_api_services/delete_cart_api_services.dart';
import 'package:bci/services/network/categorys_api_services/get_booking_list_api_services.dart';
import 'package:bci/services/network/categorys_api_services/get_cart_list_api_services.dart';
import 'package:bci/services/network/categorys_api_services/get_filter_api_services.dart';
import 'package:bci/services/network/categorys_api_services/get_service_list_api_service.dart';
import 'package:bci/services/network/categorys_api_services/search_service_list_api_services.dart';
import 'package:bci/services/network/subscriptions_api_services/add_subscription_api_services.dart';
import 'package:bci/services/network/subscriptions_api_services/get_plan_details_api_services.dart';
import 'package:bci/services/network/subscriptions_api_services/get_plans_list_api_services.dart';
import 'package:dio/dio.dart' as dio;
import 'package:bci/services/network/slider_api_services/slider_api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  GetSliderApiServices getSliderApiServices = GetSliderApiServices();
  GetPlansApiServices getPlansApiServices = GetPlansApiServices();
  GetPlansDetailsApiServices getPlansDetailsApiServices =
      GetPlansDetailsApiServices();

  AddSubscriptionApiServices addSubscriptionApiServices =
      AddSubscriptionApiServices();

  List<SliderPost> sliderList = [];
  List<PlansData> plansdataList = [];
  List<PlansDetailsModel> planDetailsList = [];

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

  getPlanDetails({required int id}) async {
    planDetailsList.clear();
    dio.Response<dynamic> response =
        await getPlansDetailsApiServices.getPlansDetails(planId: id);

    if (response.statusCode == 200) {
      PlansDetailsModel plansDetailsModel =
          PlansDetailsModel.fromJson(response.data);

      planDetailsList.add(plansDetailsModel);
    }
    update();
  }

  addSubscription({required int planId, required int customerId}) async {
    dio.Response<dynamic> response = await addSubscriptionApiServices
        .addSubscription(planId: planId, customerId: customerId);

    if (response.statusCode == 200) {
      Get.to(const SucessfulScreenOtc());
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

  //get service list
  GetServiceListApiServices getServiceListApiServices =
      GetServiceListApiServices();
  List<GetServiceListData> serviceListData = [];

  serviceList() async {
    dio.Response<dynamic> response =
        await getServiceListApiServices.getServiceListApiServices();

    if (response.statusCode == 200) {
      GetServiceList getServiceList = GetServiceList.fromJson(response.data);
      serviceListData = getServiceList.data;
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  //search service list
  SearchServiceListApiServices searchServiceListApiServices =
      SearchServiceListApiServices();
  List<SearchServiceListData> searchServiceListData = [];

  searchServiceList({required String searchKey}) async {
    dio.Response<dynamic> response = await searchServiceListApiServices
        .searchServiceListApiServices(searchKey: searchKey);

    if (response.statusCode == 200) {
      SearchServiceList searchServiceList =
          SearchServiceList.fromJson(response.data);
      searchServiceListData = searchServiceList.data;
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  //add to cart
  AddToCartApiServices addToCartApiServices = AddToCartApiServices();

  RxBool isLoading = false.obs;

  addToCart({required String serviceid, required String amount}) async {
    isLoading(true);

    dio.Response<dynamic> response = await addToCartApiServices
        .addToCartApiServices(serviceid: serviceid, amount: amount);
    isLoading(false);

    if (response.statusCode == 201) {
      Get.off(const CartScreen());
      Get.rawSnackbar(
          message: response.data["message"], backgroundColor: Colors.green);
    } else if (response.statusCode == 400) {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["error"],
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

  //delete cart
  DeleteCartApiServices deleteCartApiServices = DeleteCartApiServices();

  deleteToCart({required String serviceid}) async {
    dio.Response<dynamic> response =
        await deleteCartApiServices.deleteCartApiServices(serviceid: serviceid);
    if (response.statusCode == 200) {
      getCartdetails();
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  //get cart list
  GetCartListApiServices getCartListApiServices = GetCartListApiServices();
  List<CartListData> cartListData = [];

  getCartdetails() async {
    dio.Response<dynamic> response =
        await getCartListApiServices.getCartListApiServices();

    if (response.statusCode == 201) {
      GetCartList getCartList = GetCartList.fromJson(response.data);
      cartListData = getCartList.data;
    } else if (response.statusCode == 200) {
      cartListData.clear();
      update();
      Get.rawSnackbar(
          backgroundColor: Colors.black,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  double getGrandTotal()  {
    double grandTotal = 0.0;

    for (var i = 0; i < cartListData.length; i++) {
      double amount = double.parse(cartListData[i].amount);
      int qty = int.parse(cartListData[i].quantity);
      double tempTotalAmount = amount * qty;

      grandTotal = grandTotal + tempTotalAmount;
    }

    return grandTotal;
  }

  //add booking api
  AddBookingApiServices addBookingApiServices = AddBookingApiServices();

  addBooking(
      {required String serviceid,
      required String cartid,
      required String qty,
      required String offerOrCoupon,
      required String couponcode,
      required String amount}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await addBookingApiServices.addBookingApiServices(
            serviceid: serviceid,
            cartid: cartid,
            qty: qty,
            offerOrCoupon: offerOrCoupon,
            couponcode: couponcode,
            amount: amount);
    isLoading(false);
    if (response.statusCode == 200) {
      deleteToCart(serviceid: serviceid);

      Get.rawSnackbar(
          message: response.data["message"], backgroundColor: Colors.green);
    } else if (response.statusCode == 400) {
      Get.rawSnackbar(
          backgroundColor: Colors.black,
          messageText: Text(
            response.data["error"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  //get booking api
  GetBookingListApiServices getBookingListApiServices =
      GetBookingListApiServices();
  List<BookingListData> bookingListData = [];

  getBooking() async {
    dio.Response<dynamic> response =
        await getBookingListApiServices.getBookingListApiServices();
    if (response.statusCode == 200) {
      GetBookingList getBookingList = GetBookingList.fromJson(response.data);
      bookingListData = getBookingList.data;
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  //get filter api
  FilterServiceListApiServices filterServiceListApiServices =
      FilterServiceListApiServices();
  List<SearchServiceListData> filterServiceListData = [];

  filter({required String category}) async {
    dio.Response<dynamic> response = await filterServiceListApiServices
        .filterServiceListApiServices(category: category);

    if (response.statusCode == 200) {
      SearchServiceList filterServiceList =
          SearchServiceList.fromJson(response.data);
      searchServiceListData = filterServiceList.data;
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }
}
