import 'package:bci/models/hotel_booking_models/hotel_booking_list_model.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/hotel_booking_models/hotel_booking_store_data_model.dart';
import 'package:bci/models/hotel_booking_models/hotel_detials_model.dart' as htDetails;
import 'package:bci/models/hotel_booking_models/hotel_info_model.dart';
import 'package:bci/models/hotel_booking_models/search_hotel_list_model.dart';
import 'package:bci/models/hotel_booking_models/store_temp_search_data.dart';
import 'package:bci/screens/members/hottel/wigets/sucsessful.dart';
import 'package:bci/services/network/hotel_api_services/get_room_details_api_services.dart';
import 'package:bci/services/network/hotel_api_services/hotel_booking_list_api_service.dart';
import 'package:bci/services/network/hotel_api_services/hotel_info_api_service.dart';
import 'package:bci/services/network/hotel_api_services/store_hotel_booking_data_api.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import '../constands/app_fonts.dart';
import '../models/hotel_booking_models/block_room_api_model.dart';
import '../models/hotel_booking_models/get_hotel_room_model.dart';
import '../models/hotel_booking_models/search_city_list_model.dart';
import '../screens/members/hottel/Hotel_members.dart';
import '../services/network/hotel_api_services/block_room_api_service.dart';
import '../services/network/hotel_api_services/get_hotel_room_api_service.dart';
import '../services/network/hotel_api_services/hotel_booking_api_service.dart';
import '../services/network/hotel_api_services/hotel_citylist_api_service.dart';
import '../services/network/hotel_api_services/search_hotel_api_service.dart';
import 'package:bci/models/hotel_booking_models/get_hotel_room_model.dart'
    as ht;

class HotelBookingController extends GetxController {
  RxInt child = 0.obs;
  RxInt adult = 1.obs;
  RxInt roomno = 1.obs;
  RxBool isLoading = false.obs;
  List<SearchCityListModel> getHotelCityList = [];

  TempBookingModel? tempBookingModel;

  //search hotel
  SearchHotelListApiService searchBusListApiService =
      SearchHotelListApiService();

  StoreHotelBookingApiServices storeHotelBookingApiServices =
      StoreHotelBookingApiServices();

  RxString hotelSearchKey = "".obs;
  RxString hotelSearchKeyCode = "".obs;
  List<SearchHotelData> searchHotelData = [];

  searchHotel({
    required String destination,
    required String countryCode,
    required int child,
    required int adult,
    required String checkindate,
    required String checkoutdate,
    // required int childage,
    required String roomsno,
  }) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await searchBusListApiService.searchhotelListApiService(
            adult: adult,
            checkindate: checkindate,
            countryCode: countryCode,
            checkoutdate: checkoutdate,
            child: child,
            destination: destination,
            //   childage: childage,
            roomsno: roomsno);
            print(response.data);
    isLoading(false);
    if (response.data["Error"]["ErrorCode"] == 0) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("searchtoken", response.data["Search_Token"]);
      SearchHotelModel searchHotelModel =
          SearchHotelModel.fromJson(response.data);
      searchHotelData = searchHotelModel.result;
      Get.to(HotelListScreen());

      // if (response.data["Error_Code"] == "0001") {
      //   Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       "No hotel availbale for the given city Names.",
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ),
      //   );
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  //hotel info
  HotelInfoApiServices hotelInfoApiServices = HotelInfoApiServices();
  List<HotelInfoData> hotelInfoData = [];

  RxBool isPageLoading = false.obs;

  hotelInfo({
    required String userIp,
    required String resultIndex,
    required String hotelCode,
    required String searchToken,
  }) async {
    isPageLoading(true);
    hotelInfoData.clear();
    dio.Response<dynamic> response =
        await hotelInfoApiServices.hotelInfoApiServices(
            userIp: userIp,
            resultIndex: resultIndex,
            hotelCode: hotelCode,
            searchToken: searchToken);
    if (response.statusCode == 200) {
      HotelInfoModel hotelInfoModel = HotelInfoModel.fromJson(response.data);
      hotelInfoData.add(hotelInfoModel.result);
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  //get hotel room

  GetHotelRoomApiServices hotelroomsApiServices = GetHotelRoomApiServices();
  List<HotelRoomData> hotelRoomsData = [];

  getHotelRoomApiServices({
    required String userIp,
    required String resultIndex,
    required String hotelCode,
    required String searchToken,
  }) async {
    hotelRoomsData.clear();
    dio.Response<dynamic> response =
        await hotelroomsApiServices.getHotelRoomApiServices(
            userIp: userIp,
            resultIndex: resultIndex,
            hotelCode: hotelCode,
            searchToken: searchToken);
    isPageLoading(false);
    if (response.statusCode == 200) {
      GetHotelRoomModel hotelRoomsModel =
          GetHotelRoomModel.fromJson(response.data);
      hotelRoomsData.add(hotelRoomsModel.result);
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  //hotel city list
  GetHotelCityListApiService getBusCityListApiService =
      GetHotelCityListApiService();

  hotelCityList({required String searchCity}) async {
    dio.Response<dynamic> response = await getBusCityListApiService
        .getHotelCityListApiService(searchCity: searchCity.trim());

    if (response.statusCode == 200) {
      getHotelCityList = List<SearchCityListModel>.from(
          response.data.map((x) => SearchCityListModel.fromJson(x)));
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          "something went wrong ${response.statusCode}",
          style: primaryFont.copyWith(color: Colors.white),
        ),
      );
    }
    update();
  }

  //block room

  BlockRoomApiService blockroomapiservice = BlockRoomApiService();
  List<Result> blockroomdata = [];

  blockroomapi(
      {required String userIp,
      required String resultIndex,
      required String hotelCode,
      required String hotelName,
      required String searchToken,
      required HotelInfoData hotelInfoData,
      required ht.HotelRoomsDetail hotelRoomsDetail}) async {
    isLoading(true);
    hotelRoomsData.clear();
    dio.Response<dynamic> response =
        await blockroomapiservice.blockRoomApiService(
            hotelCode: hotelCode,
            hotelName: hotelName,
            hotelRoomsDetail: hotelRoomsDetail,
            resultIndex: resultIndex,
            searchToken: searchToken,
            userIp: userIp);
    if (response.statusCode == 200) {
      // BlockRoomApiModel blockroommodel =
      //     BlockRoomApiModel.fromJson(response.data);
      // blockroomdata.add(blockroommodel.result);
      hotelbookingapi(
        hotelCode: hotelCode,
        hotelName: hotelName,
        hotelRoomsDetail: hotelRoomsDetail,
        hotelInfoData: hotelInfoData,
        resultIndex: resultIndex,
        searchToken: searchToken,
        userIp: userIp,
      );
    } else {
      isLoading(false);
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  //hotel booking

  HotelBookingApiServices hotelbookingapiservice = HotelBookingApiServices();

  hotelbookingapi(
      {required String userIp,
      required String resultIndex,
      required String hotelCode,
      required String hotelName,
      required String searchToken,
      required HotelInfoData hotelInfoData,
      required ht.HotelRoomsDetail hotelRoomsDetail}) async {
    final profileController = Get.find<ProfileController>();

    dio.Response<dynamic> response =
        await hotelbookingapiservice.hotelBookingApiServices(
            hotelCode: hotelCode,
            hotelName: hotelName,
            hotelRoomsDetail: hotelRoomsDetail,
            resultIndex: resultIndex,
            searchToken: searchToken,
            emailId: profileController.profileData.first.email,
            userName: profileController.profileData.first.name,
            mobileNumber: profileController.profileData.first.mobile,
            pancard: profileController.profileData.first.panNo,
            userIp: userIp);
    isLoading(false);
    if (response.statusCode == 200) {
      if (response.data["Error"]["ErrorCode"] == 0) {
        // success page
        final profileController = Get.find<ProfileController>();
        HotelBookingStroreData hotelBookingStroreData = HotelBookingStroreData(
            bookingDate: tempBookingModel!.bookingDate,
            bookingId: response.data["Result"]["BookingId"].toString(),
            bookingRefNo: response.data["Result"]["BookingRefNo"].toString(),
            confirmationNo: response.data["Result"]["BookingRefNo"].toString(),
            hotelBookingStatus:
                response.data["Result"]["HotelBookingStatus"].toString(),
            isCancelPolicyChanged: response.data["Result"]
                    ["IsCancellationPolicyChanged"]
                .toString(),
            isPriceChanged:
                response.data["Result"]["IsPriceChanged"].toString(),
            noOfDays: tempBookingModel!.noOfDays,
            noOfPeople: tempBookingModel!.noOfPeople,
            place: tempBookingModel!.place,
            userId: profileController.profileData.first.id.toString(),
            hotelContact: hotelInfoData.hotelContactNo.toString(),
            hotelImage: hotelInfoData.images.first,
            hotelName: hotelInfoData.hotelName,
            price: hotelRoomsDetail.dayRates.first.amount.toString(),
            userName: profileController.profileData.first.name.toString());
        storeHotlBookingData(hotelBookingStoreData: hotelBookingStroreData);
        Get.to(() => const Sucessful_screen_hotel());
      } else {
        Get.rawSnackbar(
            backgroundColor: Colors.red,
            messageText: Text(
              response.data["Error"]["ErrorMessage"],
              style: primaryFont.copyWith(color: Colors.white),
            ));
      }
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  //get hotel booking list
  HotelBookingListApiServices hotelBookingListApiServices =
      HotelBookingListApiServices();
  List<BookingList> bookingList = [];

  hotelBookingList() async {
    dio.Response<dynamic> response =
        await hotelBookingListApiServices.hotelBookingListApiServices();
    if (response.statusCode == 200) {
      HotelBookingListModel hotelBookingListModel =
          HotelBookingListModel.fromJson(response.data);
      bookingList = hotelBookingListModel.bookingList;
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  storeHotlBookingData(
      {required HotelBookingStroreData hotelBookingStoreData}) async {
    dio.Response<dynamic> response = await storeHotelBookingApiServices
        .storeHotelBooking(hotelBookingStoreData: hotelBookingStoreData);

    if (response.statusCode == 200) {}
  }

GetHotelRoomDetailsApiServices getHotelRoomDetailsApiServices = GetHotelRoomDetailsApiServices();
  getHotelDetails(String bookingId) async{
     htDetails.Result? result;
    dio.Response<dynamic> response = await getHotelRoomDetailsApiServices.getHotelRoomDetailsApiServices(userIp: "", bookingId: bookingId);


    if(response.statusCode == 200){
      htDetails.HotelBookingDetailModel hotelBookingDetailModel = htDetails.HotelBookingDetailModel.fromJson(response.data);
      result = hotelBookingDetailModel.result;
    }
   return result;
  }
}
