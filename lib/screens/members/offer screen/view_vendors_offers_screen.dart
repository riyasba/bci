import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/models/search_service_list_model.dart';
import 'package:bci/screens/bussiness/views/business/notification_screen.dart';
import 'package:bci/screens/members/members_search_screen/member_service_details_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VendorViewOffers extends StatefulWidget {
  String vendorId;
   VendorViewOffers({super.key,required this.vendorId});

  @override
  State<VendorViewOffers> createState() => _VendorViewOffersState();
}

class _VendorViewOffersState extends State<VendorViewOffers> {
  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.vendorServiceList(widget.vendorId);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.h),
          child: Column(
            children: [
              ClipPath(
                clipper: SinCosineWaveClipper(),
                child: Container(
                  height: 150.h,
                  color: kblue,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 5, right: 5, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                    'assets/images/chevron-left (2).png'))),
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Text(
                            'Services',
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: kwhite),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.to(NotificationScreen());
                            },
                            icon: Icon(
                              Icons.notifications,
                              color: kwhite,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
      body: GetBuilder<HomeController>(builder: (_) {
        return homeController.vendorServiceListData.isEmpty
            ? const Center(
                child: Text("No Data Found"),
              )
            : GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeController.vendorServiceListData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        SearchServiceListData searchServiceListData =
                            SearchServiceListData(
                                actualAmount: homeController
                                    .vendorServiceListData[index].actualAmount,
                                bvcAmount: homeController
                                    .vendorServiceListData[index].bvcAmount,
                                categoryId: homeController
                                    .vendorServiceListData[index].categoryId,
                                createdAt: homeController
                                    .vendorServiceListData[index].createdAt,
                                description: homeController
                                    .vendorServiceListData[index].description,
                                id: homeController.vendorServiceListData[index].id,
                                image:
                                    homeController.vendorServiceListData[index].image,
                                // isBooking: homeController
                                //     .vendorServiceListData[index].isBooking,
                                saleAmount: homeController
                                    .vendorServiceListData[index].saleAmount,
                                status: homeController
                                    .vendorServiceListData[index].status,
                                title:
                                    homeController.vendorServiceListData[index].title,
                                updatedAt: homeController
                                    .vendorServiceListData[index].updatedAt,
                                amenties: homeController
                                    .vendorServiceListData[index].amenties,
                                vendorId: homeController
                                    .vendorServiceListData[index].vendorId,
                                isCoupon: "",
                                isOffer: "",
                                isRecomended: "",
                                quantity: homeController
                                    .vendorServiceListData[index].quantity,
                                unit: "",
                                couponAmount: "",
                                offerPercentage: "",
                                offerUptoAmount: "",
                                shareOption: "");
                        Get.to(
                          ServiceDetailsScreen(
                            searchServicelist: searchServiceListData,
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: kgrey, blurRadius: 0.5),
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                homeController.vendorServiceListData[index].image,
                                height: 125,
                                width: size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ksizedbox10,
                            Text(
                              homeController.vendorServiceListData[index].title,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: kblue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}