import 'dart:io';
import 'package:bci/controllers/services_controller.dart';
import 'package:bci/models/create_services_model.dart';
import 'package:bci/models/members_register_model.dart';
import 'package:bci/models/merchant_update_profile.dart';
import 'package:bci/models/merchants_register_model.dart';
import 'package:bci/services/base_urls/base_urls.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as gtx;
import 'package:shared_preferences/shared_preferences.dart';

class AddServicesApiServices extends BaseApiService {
  Future addServices({
    required CreateServiceModel createServiceModel,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();

      var ameneity = List<dynamic>.from(
          createServiceModel.amenities.map((element) => element.toJson()));
      print(createServiceModel.image);
      FormData formData = FormData.fromMap({
        for (int i = 0; i < createServiceModel.image.length; i++)
          "image[$i]": await MultipartFile.fromFile(
              createServiceModel.image[i].path,
              filename: createServiceModel.image[i].path.split("/").last),
        "title": createServiceModel.title,
        "category": createServiceModel.category.toString(),
        "sale_amount": createServiceModel.saleAmount,
        "actual_amount": createServiceModel.actualAmount,
        // "share": createServiceModel.share,
        // "bvc_amount": createServiceModel.bvcAmount,
        //"booking": createServiceModel.booking,
        "amenties": ameneity.toString(),
        "unit": createServiceModel.unit,
        "quantity": createServiceModel.quantity,
        "editor-value": createServiceModel.description,
        "isOffer": createServiceModel.isOfferAvailable,
        "isCoupon": createServiceModel.isCouponsAvailable,
        "cgst": createServiceModel.cgst,
        "sgst": createServiceModel.sgst,
        "start_time": createServiceModel.startTime,
        "end_time": createServiceModel.endTime,
        // "weekdays[0]":"Monday",
        // "from.Monday[0]":"00:00:00",
        // "to.Monday[0]":"23:59:00",
        "weekdays": ["Monday", "Tuesday", "Wednesday"],
        "from": {
          "Monday": ["09:00", "11:00", "14:00"],
          "Tuesday": ["09:30", "11:30", "14:30"],
          "Wednesday": ["10:00", "12:00", "15:00"]
        },
        "to": {
          "Monday": ["10:00", "12:00", "15:00"],
          "Tuesday": ["10:30", "12:30", "15:30"],
          "Wednesday": ["11:00", "13:00", "16:00"]
        }
        // if (createServiceModel.offerPercentage != null)
        //   "offerPercentage": "${createServiceModel.offerPercentage}%",
        // if (createServiceModel.offerAmount != null)
        //   "offerUpto_amount": createServiceModel.offerAmount,
        // if (createServiceModel.couponAmount != null)
        //   "coupon_amount": createServiceModel.couponAmount
      });

      final servicesController = gtx.Get.find<ServicesController>();

      List<String> tempWeekList = [];

      List<String> sundayFrom = [];
      List<String> mondayFrom = [];
      List<String> tuesDayFrom = [];
      List<String> wednesdayFrom = [];
      List<String> thuesdayFrom = [];
      List<String> fridayFrom = [];
      List<String> saturdayFrom = [];

      List<String> sundayTo = [];
      List<String> mondayTo = [];
      List<String> tuesDayTo = [];
      List<String> wednesdayTo = [];
      List<String> thuesdayTo = [];
      List<String> fridayTo = [];
      List<String> saturdayTo = [];

      if (servicesController.sunTimeSlot.isNotEmpty) {
        tempWeekList.add("Sunday");
        servicesController.sunTimeSlot.forEach((element) {
          sundayFrom.add(element.tempFromTime);
          sundayTo.add(element.tempToTime);
        });
      } else if (servicesController.monTimeSlot.isNotEmpty) {
        tempWeekList.add("Monday");
        servicesController.monTimeSlot.forEach((element) {
          mondayFrom.add(element.tempFromTime);
          mondayTo.add(element.tempToTime);
        });
      } else if (servicesController.tueTimeSlot.isNotEmpty) {
        tempWeekList.add("Tuesday");
        servicesController.tueTimeSlot.forEach((element) {
          tuesDayFrom.add(element.tempFromTime);
          tuesDayTo.add(element.tempToTime);
        });
      } else if (servicesController.wedTimeSlot.isNotEmpty) {
        tempWeekList.add("Wednesday");
        servicesController.wedTimeSlot.forEach((element) {
          wednesdayFrom.add(element.tempFromTime);
          wednesdayTo.add(element.tempToTime);
        });
      } else if (servicesController.thuTimeSlot.isNotEmpty) {
        tempWeekList.add("Tursday");
        servicesController.tueTimeSlot.forEach((element) {
          thuesdayFrom.add(element.tempFromTime);
          thuesdayTo.add(element.tempToTime);
        });
      } else if (servicesController.friTimeSlot.isNotEmpty) {
        tempWeekList.add("Friday");
        servicesController.friTimeSlot.forEach((element) {
          fridayFrom.add(element.tempFromTime);
          fridayTo.add(element.tempToTime);
        });
      } else if (servicesController.satTimeSlot.isNotEmpty) {
        tempWeekList.add("Saturday");
        servicesController.satTimeSlot.forEach((element) {
          saturdayFrom.add(element.tempFromTime);
          saturdayTo.add(element.tempToTime);
        });
      }

      var data = {
        // for (int i = 0; i < createServiceModel.image.length; i++)
        // "image[$i]": await MultipartFile.fromFile(
        //     createServiceModel.image[i].path,
        //     filename: createServiceModel.image[i].path.split("/").last),
        //     if(createServiceModel.image.isNotEmpty)
        // "image": await MultipartFile.fromFile(
        //   createServiceModel.image.first.path,
        //   filename: createServiceModel.image.first.path.split("/").last),
        "title": createServiceModel.title,
        "category": createServiceModel.category.toString(),
        "sale_amount": createServiceModel.saleAmount,
        "actual_amount": createServiceModel.actualAmount,
        // "share": createServiceModel.share,
        // "bvc_amount": createServiceModel.bvcAmount,
        //"booking": createServiceModel.booking,
        "amenties": ameneity.toString(),
        "unit": createServiceModel.unit,
        "quantity": createServiceModel.quantity,
        "editor-value": createServiceModel.description,
        "isOffer": createServiceModel.isOfferAvailable,
        "isCoupon": createServiceModel.isCouponsAvailable,
        "cgst": createServiceModel.cgst,
        "sgst": createServiceModel.sgst,
        "start_time": createServiceModel.startTime,
        "end_time": createServiceModel.endTime,
        // "weekdays[0]":"Monday",
        // "from.Monday[0]":"00:00:00",
        // "to.Monday[0]":"23:59:00",
        "is_recomended": createServiceModel.available,
        "weekdays": tempWeekList,
        "from": {
          if (sundayFrom.isNotEmpty) "Sunday": sundayFrom,
          if (mondayFrom.isNotEmpty) "Monday": mondayFrom,
          if (tuesDayFrom.isNotEmpty) "Tuesday": tuesDayFrom,
          if (wednesdayFrom.isNotEmpty) "Wednesday": wednesdayFrom,
          if (tuesDayFrom.isNotEmpty) "Tursday": tuesDayFrom,
          if (fridayFrom.isNotEmpty) "Friday": fridayFrom,
          if (saturdayFrom.isNotEmpty) "Saturday": saturdayFrom
        },
        "to": {
          if (sundayTo.isNotEmpty) "Sunday": sundayTo,
          if (mondayTo.isNotEmpty) "Monday": mondayTo,
          if (tuesDayTo.isNotEmpty) "Tuesday": tuesDayTo,
          if (wednesdayTo.isNotEmpty) "Wednesday": wednesdayTo,
          if (thuesdayTo.isNotEmpty) "Tursday": thuesdayTo,
          if (fridayTo.isNotEmpty) "Friday": fridayTo,
          if (saturdayTo.isNotEmpty) "Saturday": saturdayTo
        }
        // if (createServiceModel.offerPercentage != null)
        //   "offerPercentage": "${createServiceModel.offerPercentage}%",
        // if (createServiceModel.offerAmount != null)
        //   "offerUpto_amount": createServiceModel.offerAmount,
        // if (createServiceModel.couponAmount != null)
        //   "coupon_amount": createServiceModel.couponAmount
      };

      print(formData.fields);

      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(addServicesURL,
          options: Options(
              headers: {'Authorization': 'Bearer $authtoken'},
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: data);
      print("::::::::<Add services URL>::::::::status code::::::::::[change1]");
      print(response.statusCode);
      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }

  dynamic returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        print("here.>>>>>>>>>>>>");
        return responseJson;
      case 400:
      // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      // throw UnauthorisedException(response.body.toString());
      case 404:
      // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      // throw FetchDataException(
      //     'Error occured while communication with server' +
      //         ' with status code : ${response.statusCode}');
    }
  }
}
