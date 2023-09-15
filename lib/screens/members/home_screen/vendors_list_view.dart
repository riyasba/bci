import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/models/search_service_list_model.dart';
import 'package:bci/screens/bussiness/views/business/notification_screen.dart';
import 'package:bci/screens/members/home_screen/vedor_detail_screen.dart';
import 'package:bci/screens/members/members_search_screen/member_service_details_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/profile_controller.dart';

class VendorsListView extends StatefulWidget {
  const VendorsListView({super.key});

  @override
  State<VendorsListView> createState() => _VendorsListViewState();
}

class _VendorsListViewState extends State<VendorsListView> {
  final homeController = Get.find<HomeController>();
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    homeController.getVendorsList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(150),
          child: Column(
            children: [
              ClipPath(
                clipper: SinCosineWaveClipper(),
                child: Container(
                  height: 150,
                  color: kblue,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 5, right: 5, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Text(
                            'Services',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: kwhite),
                          ),
                        ),
                        Container(width: 20,)
                        // IconButton(
                        //     onPressed: () {
                        //       Get.to(NotificationScreen());
                        //     },
                        //     icon: Icon(
                        //       Icons.notifications,
                        //       color: kwhite,
                        //     ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
      body: GetBuilder<HomeController>(builder: (_) {
        return homeController.vendorList.isEmpty
            ? const Center(
                child: Text("No Data Found"),
              )
            : GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeController.vendorList.length,
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
                        Get.to(
                          VendorDetailScreen(
                            vendorListModelData:
                                homeController.vendorList[index],
                            userid:
                                homeController.vendorList[index].id.toString(),
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
                              child: homeController
                                          .vendorList[index].profilePicture !=
                                      null
                                  ? Image.network(
                                      homeController
                                          .vendorList[index].profilePicture!,
                                      height: 125.h,
                                      width: size.width,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      "assets/icons/no-photo.png",
                                      height: 125.h,
                                      width: size.width,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            ksizedbox10,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                height: 35,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    homeController.vendorList[index].name,
                                    style: TextStyle(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.bold,
                                        color: kblue),
                                  ),
                                ),
                              ),
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
