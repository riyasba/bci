import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/holiday_package_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'holidaybookings.dart';

class HolidayHome extends StatefulWidget {
  const HolidayHome({super.key});

  @override
  State<HolidayHome> createState() => _HolidayHomeState();
}

class _HolidayHomeState extends State<HolidayHome> {
  int index = 0;

  final holidayPackageController = Get.find<HolidayPackageController>();
//final homeCondroller=Get.find<>();
  final searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPackageList();
    searchController.addListener(searchUsers);
    holidayPackageController.recomended();
  }

  getPackageList() async {
    await holidayPackageController.getPackageCategory();
    holidayPackageController.getPackage(
        categoryId:
            holidayPackageController.packageCategoryData.first.id.toString());
    holidayPackageController
        .searchInt(holidayPackageController.packageCategoryData.first.id);
  }

  searchUsers() async {
    if (searchController.text.trim().isNotEmpty) {
      await holidayPackageController.searchPackageList(
          name: searchController.text,
          categoryid: holidayPackageController.searchInt.value.toString());
    } else {
      holidayPackageController.getPackage(
          categoryId:
              holidayPackageController.packageCategoryData.first.id.toString());
      holidayPackageController.update();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HolidayPackageController>(builder: (_) {
      return Scaffold(
        backgroundColor: const Color(0xFFF9F8FD),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(280),
            child: Column(children: [
              Stack(
                children:[ 
                Container(
                  height: size.height*0.39,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Container(
                      height: size.height*0.34,
                      width: size.width,
                      child: Image.asset('assets/images/Group 6977 (4).png',
                      height: size.height*0.34,
                      width: size.width,
                      fit: BoxFit.fill,)),
                  ),
                ),
                  InkWell(
            onTap: () {
              Get.back();
            },
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: kOrange,
                        borderRadius: BorderRadius.circular(7)
                      ),
                      child: Center(
                        child: Icon(Icons.arrow_back_ios_new,color: kwhite,size: 16,))),
                        kwidth10,
                        Text(
                  'Plan your trip with us.',
                  style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700,color: kwhite),
                ),
                  ],
                ),
              ))),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                 padding: const EdgeInsets.only(top: 10,left: 10,right: 10,),
                 child: Container(
                   height: 50,
                   width: size.width,
                   child: TextFormField(
                       controller: searchController,
                       decoration: InputDecoration(
                         hintText: 'Search',
                         fillColor: const Color(0xFFFFFFFF),
                         focusColor: Colors.grey[200],
                         isDense: true,
                         filled: true,
                         border: OutlineInputBorder(
                           borderSide: BorderSide(
                               width: 0.5,
                               color: Colors.grey.withOpacity(0.2)),
                           borderRadius: BorderRadius.circular(10.0),
                         ),
                         prefixIcon: const Icon(
                           Icons.search,
                           color: Colors.grey,
                         ),
                       )),
                 ),
                           ),
              ),
              ]),
             
              // AppBar(
              //   backgroundColor:const Color(0xFFF9F8FD),
              //   elevation: 0,
              //   leading: InkWell(
              //       onTap: () {
              //         Get.back();
              //       },
              //       child: Image.asset('assets/images/Icon awesome-arrow-right.png')),
              //   title: Text(
              //     'Plan your trip with us.',
              //     style: TextStyle(
              //         fontSize: 25, fontWeight: FontWeight.w600, color: kblue),
              //   ),
              // ),
            ])),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                ),
                ksizedbox10,
                Container(
                  height: 40,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          holidayPackageController.packageCategoryData.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            holidayPackageController.catIndex(index);
                            holidayPackageController.getPackage(
                                categoryId: holidayPackageController
                                    .packageCategoryData[index].id
                                    .toString());
                            holidayPackageController.searchInt(
                                holidayPackageController
                                    .getPackageDetailsData[index].id);
                            holidayPackageController.update();
                            print(
                                "----------------->>>>--------------->>${holidayPackageController.getPackageDetailsData[index].id}");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 4, right: 4, top: 2, bottom: 2),
                            child: Container(
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.grey.withOpacity(0.6))
                                ],
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color:
                                        holidayPackageController.catIndex.value ==
                                                index
                                            ? kblue
                                            : Colors.white),
                              ),
                              child: Center(
                                child: Text(
                                  holidayPackageController
                                      .packageCategoryData[index].name,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                ksizedbox10,
                Text(
                  'Populars',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                ),
                ksizedbox10,
                Container(
                  height: 230,
                  child: holidayPackageController.packageListData.isEmpty
                      ? const Center(
                          child: Text("No Data Found"),
                        )
                      : ListView.builder(
                          itemCount:
                              holidayPackageController.packageListData.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Get.to(HolidayScreen(
                                    packageId: holidayPackageController
                                        .packageListData[index].id
                                        .toString(),
                                  ));
                                },
                                child: Container(
                                  height: 230.h,
                                  width: 165.w,
                                  decoration: BoxDecoration(
                                      color: kwhite,
                                      borderRadius: BorderRadius.circular(19)),
                                  child: Column(
                                    children: [
                                      holidayPackageController
                                              .packageListData[index]
                                              .images
                                              .isEmpty
                                          ? Container(
                                              height: 150,
                                            )
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(19),
                                              child: Image.network(
                                                holidayPackageController
                                                    .packageListData[index]
                                                    .images
                                                    .first,
                                                height: 150,
                                                width: 165,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 100,
                                              child: Text(
                                                holidayPackageController
                                                    .packageListData[index].title,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.all(8.0),
                                      //   child: Row(
                                      //     children: [
                                      //       Image.asset(
                                      //           'assets/images/location-svgrepo-com (1).png'),
                                      //       kwidth5,
                                      //       //             Text(
                                      //       //   holidayPackageController.packageListData[index].location,
                                      //       //   style: TextStyle(fontSize: 13.sp, color: kgrey),
                                      //       // ),
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                ),
                ksizedbox10,
                Text(
                  'Recommended',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                ),
                ksizedbox10,
                Container(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: holidayPackageController.recomendedListData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(HolidayScreen(
                              packageId: holidayPackageController
                                  .recomendedListData[index].id
                                  .toString(),
                            ));
                          },
                          child: Container(
                            height: 80,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                holidayPackageController
                                        .recomendedListData[index].images!.isEmpty
                                    ? Container(
                                        width: 75,
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(7),
                                        child: Image.network(
                                          holidayPackageController
                                              .recomendedListData[index]
                                              .images!
                                              .first,
                                          height: 70,
                                          width: 75,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100,
                                        child: Text(
                                          holidayPackageController
                                              .recomendedListData[index].title,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      // Row(
                                      //   children: [
                                      //     Image.asset(
                                      //         'assets/images/location-svgrepo-com (1).png'),
                                      //     kwidth5,
                                      //     // Text(
                                      //     // holidayPackageController.recomendedListData[index].location,
                                      //     // style: TextStyle(fontSize: 13.sp, color: kgrey),
                                      //     // ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
