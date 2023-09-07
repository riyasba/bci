
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import '../constands/app_fonts.dart';
import '../models/vendor_banner_model.dart';
import '../services/network/vendor_banner_api_service.dart';

class VendorBannerController extends GetxController{

  VendorBannerApiService vendorbannerapiservice = VendorBannerApiService();
  
  List<Post> postlist =[];
  getvendorbanner()async{
    postlist.clear();
   dio.Response<dynamic>response = await vendorbannerapiservice.vendorBanner();
   if(response.statusCode==200){
    BannerModel bannerModel = BannerModel.fromJson(response.data);
    postlist = bannerModel.posts; 
   }
update();
  }
} 