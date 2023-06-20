import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/models/search_service_list_model.dart';
import 'package:bci/screens/bussiness/views/business/notification_screen.dart';
import 'package:bci/screens/members/members_search_screen/member_service_view_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OthersServiceScreen extends StatefulWidget {
  const OthersServiceScreen({super.key});

  @override
  State<OthersServiceScreen> createState() => _OthersServiceScreenState();
}

class _OthersServiceScreenState extends State<OthersServiceScreen> {
  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.serviceList();
    homeController.update();
  }

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: Get.back,
                            child: Image.asset(
                                'assets/images/chevron-left (2).png')),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            '',
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
        return homeController.serviceListData.isEmpty
            ? const Center(
                child: Text("No Data Found"),
              )
            : GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeController.serviceListData.length,
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
                                    .serviceListData[index].actualAmount,
                                bvcAmount: homeController
                                    .serviceListData[index].bvcAmount,
                                categoryId: homeController
                                    .serviceListData[index].categoryId,
                                createdAt: homeController
                                    .serviceListData[index].createdAt,
                                description: homeController
                                    .serviceListData[index].description,
                                id: homeController.serviceListData[index].id,
                                image:
                                    homeController.serviceListData[index].image,
                                isBooking: homeController
                                    .serviceListData[index].isBooking,
                                saleAmount: homeController
                                    .serviceListData[index].saleAmount,
                                status: homeController
                                    .serviceListData[index].status,
                                title:
                                    homeController.serviceListData[index].title,
                                updatedAt: homeController
                                    .serviceListData[index].updatedAt,
                                vendorId: homeController
                                    .serviceListData[index].vendorId);
                        Get.to(MemberSearchViewScreen(
                          searchServicelist: searchServiceListData,
                        ));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            child: Image.network(
                                homeController.serviceListData[index].image),
                          ),
                          Text(
                            homeController.serviceListData[index].title,
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: kblue),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}
