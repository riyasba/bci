import 'dart:convert';

import 'package:bci/constands/app_fonts.dart';
import 'package:bci/models/get_booking_list_model.dart';
import 'package:bci/models/get_cart_list_model.dart';
import 'package:bci/models/get_plan_details_model.dart';
import 'package:bci/models/get_plans_model.dart';
import 'package:bci/models/get_service_list_model.dart';
import 'package:bci/models/get_today_offers_list_model.dart';
import 'package:bci/models/liquor_vendor_list_models/liquor_vendor_list_model.dart';
import 'package:bci/models/notification_models/notification_count_model.dart';
import 'package:bci/models/search_service_list_model.dart';
import 'package:bci/models/slider_model.dart';
import 'package:bci/models/slider_product_model.dart';
import 'package:bci/models/support_admin_details_model.dart';
import 'package:bci/models/vendor_list_model.dart';
import 'package:bci/screens/members/liquer_screen/cart_screen.dart';
import 'package:bci/screens/members/otcpayment/member_sub_successful.dart';
import 'package:bci/services/network/categorys_api_services/add_booking_api_services.dart';
import 'package:bci/services/network/categorys_api_services/add_to_cart_api_services.dart';
import 'package:bci/services/network/categorys_api_services/delete_cart_api_services.dart';
import 'package:bci/services/network/categorys_api_services/get_booking_list_api_services.dart';
import 'package:bci/services/network/categorys_api_services/get_cart_list_api_services.dart';
import 'package:bci/services/network/categorys_api_services/get_filter_api_services.dart';
import 'package:bci/services/network/categorys_api_services/get_service_list_api_service.dart';
import 'package:bci/services/network/categorys_api_services/get_services_by_vendor_id.dart';
import 'package:bci/services/network/categorys_api_services/get_today_offers_list_api_service.dart';
import 'package:bci/services/network/categorys_api_services/search_service_list_api_services.dart';
import 'package:bci/services/network/liquors_api_services/liquor_service_list.dart';
import 'package:bci/services/network/liquors_api_services/liquor_vendor_list_api_service.dart';
import 'package:bci/services/network/slider_api_services/get_ads_api_services.dart';
import 'package:bci/services/network/slider_api_services/slider_product_api_services.dart';
import 'package:bci/services/network/subscriptions_api_services/add_subscription_api_services.dart';
import 'package:bci/services/network/subscriptions_api_services/get_plan_details_api_services.dart';
import 'package:bci/services/network/subscriptions_api_services/get_plans_list_api_services.dart';
import 'package:bci/services/network/vendor_list_api_services/vendor_list_api_services.dart';
import 'package:dio/dio.dart' as dio;
import 'package:bci/services/network/slider_api_services/slider_api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:isgpayui_plugin/isgpayui_plugin.dart';
import '../models/banner_model.dart';
import '../models/get_gallery_model.dart';
import '../services/network/get_gallery_apiservice.dart';
import '../services/network/notification_api_services/notification_count_api_service.dart';
import '../services/network/profile_api_services/support_admin_details_api_service.dart';
import '../services/network/settings_api_services/banner_api_service.dart';

class HomeController extends GetxController {
  GetSliderApiServices getSliderApiServices = GetSliderApiServices();
  GetPlansApiServices getPlansApiServices = GetPlansApiServices();
  GetPlansDetailsApiServices getPlansDetailsApiServices =
      GetPlansDetailsApiServices();

  AddSubscriptionApiServices addSubscriptionApiServices =
      AddSubscriptionApiServices();

  List<SliderPost> sliderList = [];
  List<SliderPost> adsSliderList = [];
  List<PlansData> plansdataList = [];
  List<PlansDetailsModel> planDetailsList = [];

  GetAdSliderApiServices getAdSliderApiServices = GetAdSliderApiServices();

  getAdsSlider() async {
    dio.Response<dynamic> response =
        await getAdSliderApiServices.getAdsSlider();
    print("------------------------------------------------>> changes ");
    print(response.data);
    if (response.statusCode == 200) {
      SliderModel sliderModel = SliderModel.fromJson(response.data);
      adsSliderList = sliderModel.posts;
    }
    update();
  }

  getSlider() async {
    dio.Response<dynamic> response = await getSliderApiServices.getSlider();
    print("------------->> slider");
    print(response.data);
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

  addSubscription(
      {required int planId,
      required int customerId,
      required String paymentMenthod,
      required String gstPercentage,
      required String percentageAmount,
      required String totalAmount,
      required String amount,
      required String utrNumber}) async {
    dio.Response<dynamic> response =
        await addSubscriptionApiServices.addSubscription(
            planId: planId,
            customerId: customerId,
            paymentMenthod: paymentMenthod,
            gstPercentage: gstPercentage,
            percentageAmount: percentageAmount,
            totalAmount: totalAmount,
            amount: amount,
            status: "Success",
            utrNumber: utrNumber);

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

  addSubscriptionManual(
      {required int planId,
      required int customerId,
      required String paymentMenthod,
      required String gstPercentage,
      required String percentageAmount,
      required String totalAmount,
      required String amount,
      required String utrNumber}) async {
    dio.Response<dynamic> response =
        await addSubscriptionApiServices.addSubscription(
            planId: planId,
            customerId: customerId,
            paymentMenthod: paymentMenthod,
            gstPercentage: gstPercentage,
            percentageAmount: percentageAmount,
            totalAmount: totalAmount,
            amount: amount,
            status: "Pending",
            utrNumber: utrNumber);

    if (response.statusCode == 200) {
      // Get.to(const SucessfulScreenOtc());
      // Get.rawSnackbar(
      //     backgroundColor: Colors.green,
      //     messageText: Text(
      //       "Plan Activated Successfully",
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
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

  VendorServiceListApiServices vendorServiceListApiServices =
      VendorServiceListApiServices();
  List<GetServiceListData> vendorServiceListData = [];

  vendorServiceList(String vendorId) async {
    dio.Response<dynamic> response = await vendorServiceListApiServices
        .vendorServiceListApiServices(vendorId: vendorId);

    if (response.statusCode == 200) {
      GetServiceList getServiceList = GetServiceList.fromJson(response.data);
      vendorServiceListData = getServiceList.data;
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

  searchServiceList({required String searchKey, dynamic categoryid}) async {
    dio.Response<dynamic> response =
        await searchServiceListApiServices.searchServiceListApiServices(
            searchKey: searchKey, categoryid: categoryid);

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

  addToCart(
      {required String serviceid,
      required String amount,
      required String startTime}) async {
    isLoading(true);

    dio.Response<dynamic> response =
        await addToCartApiServices.addToCartApiServices(
            serviceid: serviceid, amount: amount, startTime: startTime);
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
      // Get.rawSnackbar(
      //     backgroundColor: Colors.black,
      //     messageText: Text(
      //       response.data["message"],
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    } else {
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       "Something went wrong",
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    }
    update();
  }

  double getGrandTotal() {
    double grandTotal = 0.0;

    for (var i = 0; i < cartListData.length; i++) {
      double amount = double.parse(cartListData[i].amount);
      int qty = int.parse(cartListData[i].quantity.toString());
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
      required String amount,
      required String bookDateTime}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await addBookingApiServices.addBookingApiServices(
            serviceid: serviceid,
            cartid: cartid,
            qty: qty,
            offerOrCoupon: offerOrCoupon,
            couponcode: couponcode,
            amount: amount,
            bookDateTime: bookDateTime);
    isLoading(false);
    if (response.statusCode == 200) {
      deleteToCart(serviceid: serviceid);

      // Get.rawSnackbar(
      //     message: response.data["message"], backgroundColor: Colors.green);
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

  //get today offers list
  GetTodayOffersListApiServices getTodayOffersListApiServices =
      GetTodayOffersListApiServices();
  List<OffersListModel> todayOfferListData = [];

  todayOffers() async {
    dio.Response<dynamic> response =
        await getTodayOffersListApiServices.getTodayOffersListApiServices();
    if (response.statusCode == 200) {
      List<OffersListModel> getTodayOffersList = List<OffersListModel>.from(
          response.data.map((x) => OffersListModel.fromJson(x)));
      todayOfferListData = getTodayOffersList;
    } else if (response.statusCode == 404) {
    } else {
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       "Something went wrong",
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    }
    update();
  }

  //liquor list api
  LiquorVendorListApiService liquorVendorListApiService =
      LiquorVendorListApiService();
  List<VendorListData> vendorListData = [];

  liquorVendors({required String categoryid}) async {
    dio.Response<dynamic> response = await liquorVendorListApiService
        .liquorVendorListApiService(categoryid: categoryid);
    if (response.statusCode == 200) {
      LiquorVendorList liquorVendorList =
          LiquorVendorList.fromJson(response.data);
      vendorListData = liquorVendorList.vendors;
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

  //liquor service list
  LiquorServiceListApiService liquorServiceListApiService =
      LiquorServiceListApiService();

  liquorService({required String vendor, required String categoryid}) async {
    dio.Response<dynamic> response = await liquorServiceListApiService
        .liquorServiceListApiService(vendor: vendor, categoryid: categoryid);
    if (response.statusCode == 200) {
      SearchServiceList searchServiceList =
          SearchServiceList.fromJson(response.data);
      searchServiceListData = searchServiceList.data;
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

  //get slider product
  GetSliderProductApiServices getSliderProductApiServices =
      GetSliderProductApiServices();
  List<SliderData> sliderData = [];

  sliderProduct() async {
    dio.Response<dynamic> response =
        await getSliderProductApiServices.getSliderproduct();
    if (response.statusCode == 200) {
      SliderProductModel sliderProductModel =
          SliderProductModel.fromJson(response.data);
      sliderData = sliderProductModel.posts;
    }
    update();
  }

  // String responseData = "Nothing";
  final _isgpayuiPlugin = IsgpayuiPlugin();

  void startPlugin() async {
    String? result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _isgpayuiPlugin.initiateISGPayUI(getArguments(100)) ??
          'Unknown platform version';
    } on PlatformException catch (e) {
      result = e.message;
    }
    debugPrint('Result ::: $result');

    var responseData = jsonDecode(result!);
    print("<<----response-data---->>");
    print(responseData);
  }

  Map<String, String> getArguments(var amount) {
    var randomStr = DateTime.now().microsecondsSinceEpoch.toString();
    Map<String, String> map = {
      'version': "1",
      'txnRefNo': "ORD00011", // Should change on every request
      'amount': "$amount",
      'passCode': 'SVPL4257',
      'bankId': '000004',
      'terminalId': '10100781',
      'merchantId': '101000000000781',
      'mcc': "4112",
      'paymentType': 'Pay',
      'currency': "356",
      'email': 'manu@gmail.com',
      'phone': '+917907886767',
      'hashKey': 'E59CD2BF6F4D86B5FB3897A680E0DD3E',
      'aesKey': '5EC4A697141C8CE45509EF485EE7D4B1',
      'payOpt': 'cc',
      'orderInfo': 'NARUTO00001',
      'env': 'UAT', //UAT PROD
      'url': 'https://sandbox.isgpay.com/ISGPay-Genius/request.action',
    };
    return map;
  }

  VendorListApiServices vendorListApiServices = VendorListApiServices();
  List<VendorListModelData> vendorList = [];
  getVendorsList() async {
    dio.Response<dynamic> response =
        await vendorListApiServices.vendorListApiServices();

    if (response.statusCode == 200) {
      VendorListModel vendorListModel = VendorListModel.fromJson(response.data);
      vendorList = vendorListModel.data;
    }
    update();
  }

  //get slider product
  BannersApiService bannerapiservice = BannersApiService();
  List<Post> bannerData = [];

  banners({required String catogories}) async {
    dio.Response<dynamic> response =
        await bannerapiservice.bannersApiService(catogories: catogories);
    if (response.statusCode == 200) {
      BannerModel bannerermodel = BannerModel.fromJson(response.data);
      //  sliderData = sliderProductModel.posts;
    }
    update();
  }

  //get GALLERY

  GetGalleryApiServices getgalleryApiService = GetGalleryApiServices();
  List<GalleryListModel> galleryListData = [];
  getInstance({required String userid}) async {
    dio.Response<dynamic> response =
        await getgalleryApiService.getgalleryApiServices(userid: userid);
    if (response.statusCode == 200) {
      GetGalleryModel getGalleryList = GetGalleryModel.fromJson(response.data);
      galleryListData = getGalleryList.data;
    } else {
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       response.data["message"],
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    }
    update();
  }

  //notification count
  NotificationCountApiServices notificationCountApiServices =
      NotificationCountApiServices();
  NotificationCountData? countData;

  notifyCount() async {
    dio.Response<dynamic> response =
        await notificationCountApiServices.notificationCountApiServices();
    if (response.statusCode == 200) {
      NotificationCount notificationCount =
          NotificationCount.fromJson(response.data);
      countData = notificationCount.data;
    }
    update();
  }

  //support admin details
  SupportAdminDetailsApiServices supportAdminDetailsApiServices =
      SupportAdminDetailsApiServices();
  ContactDetailsData? contactDetailsData;

  supportAdminDetail() async {
    dio.Response<dynamic> response =
        await supportAdminDetailsApiServices.supportAdminDetailsApiServices();
    if (response.statusCode == 200) {
      SupportAdminModel supportAdminModel =
          SupportAdminModel.fromJson(response.data);
      contactDetailsData = supportAdminModel.data;
    }
    update();
  }
}
