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
    getPackageList();
    searchController.addListener(searchUsers);
    holidayPackageController.recomended();
    holidayPackageController.update();
  }

  getPackageList() async {
   await holidayPackageController.getPackageCategory();
    holidayPackageController.getPackage(categoryId: holidayPackageController.packageCategoryData.first.id.toString());
    holidayPackageController.searchInt(holidayPackageController.packageCategoryData.first.id);
  }

  searchUsers() async {
    if (searchController.text.trim().isNotEmpty) {
      await holidayPackageController.searchPackageList(
        name: searchController.text,
        categoryid: holidayPackageController.searchInt.value.toString());
    } else {
      holidayPackageController.getPackage(categoryId: holidayPackageController.packageCategoryData.first.id.toString());
      holidayPackageController.update();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HolidayPackageController>(
      builder: (_) {
        return Scaffold(
             backgroundColor: const Color(0xFFF9F8FD),
            appBar: PreferredSize(
              preferredSize:const Size.fromHeight(130) ,
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
                          fontSize: 25, fontWeight: FontWeight.w600, color: kblue),
                    ),
                  ),
                  Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 7,bottom: 7),
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
                ),
                ]
            )
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                        'Categories',
                        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                      ),
                      ksizedbox20,
                      Container(
                        height: 40,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: holidayPackageController.packageCategoryData.length,
                          itemBuilder: (context,index) {
                            return InkWell(
                              onTap: (){
                                holidayPackageController.catIndex(index);
                                holidayPackageController.getPackage(
                                categoryId: holidayPackageController.packageCategoryData[index].id.toString());
                                holidayPackageController.searchInt(holidayPackageController.getPackageDetailsData[index].id);
                                holidayPackageController.update();
                                print("----------------->>>>--------------->>${holidayPackageController.getPackageDetailsData[index].id}");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 2,right: 2),
                                child: Container(
                                  height: 35,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color:holidayPackageController.catIndex.value == index ? Colors.grey : Colors.white),
                                  ),
                                  child: Center(
                                    child: Text(holidayPackageController.packageCategoryData[index].name,
                                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),     
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        ),
                      ),
                      ksizedbox20,
                      Text(
                        'Populars',
                        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                       ),
                       ksizedbox20,
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
                     holidayPackageController.packageListData.isEmpty ? Container() : ClipRRect(
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
                    //             Text(
                    //   holidayPackageController.packageListData[index].location,
                    //   style: TextStyle(fontSize: 13.sp, color: kgrey),
                    // ),  
                     ],
                              ),
                      ),
                    ],
                                ),
                                
                              ),
                  ),
                );
              }
              ),
          ),
              ksizedbox20,
              Text(
                'Recommended',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
              ),
              ksizedbox20,
                Container(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: holidayPackageController.recomendedListData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Get.to(HolidayScreen(packageId: holidayPackageController.recomendedListData[index].id.toString(),));
                          },
                          child: Container(
                          height: 80,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: Image.network(holidayPackageController.recomendedListData[index].images!.first,
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
                                holidayPackageController.recomendedListData[index].title,
                                maxLines: 2,
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                              ),
                               ),
                               Row(
                                children: [
                                Image.asset('assets/images/location-svgrepo-com (1).png'),kwidth5,
                                // Text(
                                // holidayPackageController.recomendedListData[index].location,
                                // style: TextStyle(fontSize: 13.sp, color: kgrey),
                                // ),  
                                ],
                              ),
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
            );
         });
        }
      }

  
  