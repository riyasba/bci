import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/holiday_package_controller.dart';
import 'package:bci/screens/members/holiday/booking.dart';
import 'package:bci/screens/members/holiday/widgets/widgets.dart';
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

   final searchController = TextEditingController();
   

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holidayPackageController.getPackageCategory();
    holidayPackageController.getPackage();
    searchController.addListener(searchUsers);
  }

  searchUsers() {
    if (searchController.text.trim().isNotEmpty) {
       holidayPackageController.searchPackageList(name: searchController.text);
    } else {
      holidayPackageController.getPackage();
      holidayPackageController.update();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HolidayPackageController>(
      builder: (_) {
        return DefaultTabController(
          length: holidayPackageController.packageCategoryData.length,
          child: Scaffold(
            backgroundColor: const Color(0xFFF9F8FD),
            appBar: PreferredSize(
              preferredSize:const Size.fromHeight(250) ,
              child: Column(
                children: [
                  AppBar(
                    backgroundColor:const Color(0xFFF9F8FD),
                    elevation: 0,
                    leading: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset('assets/images/Icon awesome-arrow-right.png')),
                    title: Text(
                      'Plan your trip with us.',
                      style: TextStyle(
                          fontSize: 27, fontWeight: FontWeight.w800, color: kblue),
                    ),
                  ),
                  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 55,
                    child: TextFormField(
                         controller: searchController,
                        decoration: InputDecoration(
                      hintText: 'Search',
                      fillColor:const Color(0xFFFFFFFF),
                      focusColor: Colors.grey[200],
                      isDense: true,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.5, color: Colors.grey.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(19.0),
                      ),
                      prefixIcon:const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    )),
                  ),
                ),   ksizedbox30,
                Row(
                  children: [
                    kwidth10,
                    Text(
                      'Categories',
                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),ksizedbox10,Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBar(
                          automaticIndicatorColorAdjustment: true,
                          //  isScrollable: true,
                          labelColor: Colors.black,
                          unselectedLabelColor: kgrey,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: kwhite),
                          onTap: (value) {
                            setState(() {
                               index = value;
                            });
                          },
                          tabs: [
                            for(int i = 0; i<holidayPackageController.packageCategoryData.length; i++)
                            Tab(
                              text: holidayPackageController.packageCategoryData[i].name,
                            ),
                          ]
                          ),
                          ),
                          ],
              ),
            ),
            body: TabBarView(children: [ holiday_listview(), holiday_listview(), holiday_listview(),
              
              
              
            ]),
          ),
        );
      }
    );
  }

  ListView holiday_listview() {
    return ListView(
        physics: BouncingScrollPhysics(),
        children: [
      
         
          ksizedbox20,
        
          Row(
            children: [
              kwidth10,
              Text(
                'Populars',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
              ),
              kwidth10,
            ],
          ),
          ksizedbox20,
          // InkWell(onTap: (){
          //   Get.to( HolidayScreen());
          //   },
          //   child:
          // ),
          Container(
            height: 260,
            child:holidayPackageController.packageListData.isEmpty ? const Center(child: Text("No Data Found"),) : ListView.builder(
              itemCount: holidayPackageController.packageListData.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Get.to(HolidayScreen(packageId: holidayPackageController.packageListData[index].id.toString(),));
                    },
                    child: Container(
                      height: 250.h,
                      width: 165.w,
                      decoration:
                      BoxDecoration(color: kwhite, borderRadius: BorderRadius.circular(19)),
                                child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(19),
                        child: Image.network(holidayPackageController.packageListData[index].images.first,
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
                        holidayPackageController.packageListData[index].title,
                        maxLines: 2,
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                                ],
                              ),
                      ),
                      Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                    Image.asset('assets/images/location-svgrepo-com (1).png'),kwidth5,
                                Text(
                      'Jordan',
                      style: TextStyle(fontSize: 13.sp, color: kgrey),
                    ),  ],
                              ),
                      )
                    ],
                                ),
                                
                              ),
                  ),
                );
              }
              ),
          ),
          ksizedbox30,
          Row(
            children: [
              kwidth10,
              Text(
                'Recommended',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          ksizedbox30,
          Container(height: 70,
            child: ListView(physics: BouncingScrollPhysics(),
              shrinkWrap: true,scrollDirection: Axis.horizontal,
              children: [
               kwidth10, holiday_widget2(),kwidth10,
                holiday_widget2(),kwidth10, holiday_widget2(),kwidth10,
                holiday_widget2(),
              ],
            ),
          )
        ],
      );
  }

  Container holiday_widget2() {
    return Container(
              decoration: BoxDecoration(
                  color: kwhite, borderRadius: BorderRadius.circular(25)),
              width: 200.w,
              height: 69.h,
              child: Row(
                children: [kwidth5,
                  Image.asset('assets/images/pexels-senuscape-1658967.png'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Grindelwald',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                           
                            Image.asset(
                                'assets/images/location-svgrepo-com (1).png'),kwidth5, Text(
                              'Jordan',
                              style: TextStyle(fontSize: 13.sp, color: kgrey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
  }
}
