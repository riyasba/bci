import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/models/category_model.dart';
import 'package:bci/screens/members/members_search_screen/member_service_view_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constands/constands.dart';
import '../../bussiness/views/business/notification_screen.dart';
import '../../bussiness/views/home_screen/contact_admin.dart';
import '../members widgets/bropdown.dart';
import '../members widgets/gridciew.dart';

class MembersSearchScreen extends StatefulWidget {
  MembersSearchScreen({super.key, required this.title, required this.items});
  final String title;
  final List<String> items;

  @override
  State<MembersSearchScreen> createState() => _MembersSearchScreenState();
}

class _MembersSearchScreenState extends State<MembersSearchScreen> {
  //final List<String> options = ['Catogory', 'Hotel', 'Club''Resort''Saloon''Parour''Service Apartment''Textile''SPA'];
  
  final homeController = Get.find<HomeController>();

  final searchController = TextEditingController();

  var merchantCategory;
  final authController = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.getCategoryList();
    searchController.addListener(searchUsers);
  }

   searchUsers() {
    if (searchController.text.trim().isNotEmpty) {
      homeController.searchServiceList(searchKey: searchController.text);
    } else {
      homeController.searchServiceListData.clear();
      homeController.update();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(250.h),
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
                            'Search',
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
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                   controller: searchController,
                  decoration: InputDecoration(disabledBorder: OutlineInputBorder(),
                      hintText: 'Search',
                      fillColor: kwhite,
                      focusColor: kwhite,
                      isDense: true,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      suffixIcon: Image.asset('assets/images/XMLID_223_.png')),
                ),
              ),
              // MyDropdown(
              //   label: 'Result',
              //   options: [],
              // ),
              GetBuilder<AuthController>(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: kgrey,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                            color: const Color.fromARGB(255, 5, 5, 5)
                                .withOpacity(0.8))),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: DropdownButton<CategoryList>(
                        value: merchantCategory,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        elevation: 1,
                        itemHeight: 55,
                        isDense: true,
                        dropdownColor: Colors.white,
                        style: const TextStyle(color: Colors.black54),
                        hint:const Text(
                          "Merchant Category Name",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        onChanged: (CategoryList? value) {
                          setState(() {
                            merchantCategory = value!;
                          });
                          homeController.filter(category: value!.id.toString());
                        },
                        items: authController.categoryList
                            .map<DropdownMenuItem<CategoryList>>(
                                (CategoryList value) {
                          return DropdownMenuItem<CategoryList>(
                            value: value,
                            child: Text(value.title),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                );
              }),
            ],
          )),
      //  backgroundColor: kwhite,
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(250),
      //     child: Column(
      //       children: [
      //         ClipPath(
      //           clipper: SinCosineWaveClipper(),
      //           child: Container(
      //             height: 150,
      //             color: kblue,
      //             child: Padding(
      //               padding: const EdgeInsets.all(12.0),
      //               child: Column(
      //                 children: [
      //                   ksizedbox20,
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Text(
      //                         'Search',
      //                         style: TextStyle(fontSize: 22, color: kwhite),
      //                       ),
      //                       InkWell(
      //                           onTap: () {
      //                             Get.to(ContactAdmin());
      //                           },
      //                           child: Image.asset(
      //                               'assets/images/3669173_help_ic_icon.png'))
      //                     ],
      //                   ),
      //                   ksizedbox20,
      //                   TextField(
      //                     // controller: _controller,

      //                     decoration: InputDecoration(
      //                         hintText: 'Search',
      //                         fillColor: kwhite,
      //                         focusColor: kwhite,
      //                         isDense: true,
      //                         filled: true,
      //                         border: OutlineInputBorder(
      //                           borderRadius: BorderRadius.circular(4.0),
      //                         ),
      //                         suffixIcon:
      //                             Image.asset('assets/images/XMLID_223_.png')),
      //                   ),
      //                   ksizedbox30,
      //                   MyDropdown(
      //                     label: 'Result',
      //                     options: [],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     )),
      body: GetBuilder<HomeController>(builder: (_) {
        return homeController.searchServiceListData.isEmpty && searchController.text.isNotEmpty
            ?  Center(
                child: Column(
                  children: [
                    const Image(image: AssetImage("assets/icons/search.png")),
                    Text('No result found',
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: kblue),
                          ),
                          const SizedBox(height: 5,),
                          Text('''we can't find any item matching\nyour search''',
                          textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.sp,
                                height: 1.5,
                                color: kblue),
                          ),
                  ],
                ),
              )
            : GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeController.searchServiceListData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                          Get.to(MemberSearchViewScreen(searchServicelist: homeController.searchServiceListData[index],));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            child: Image.network(homeController.searchServiceListData[index].image),
                          ),
                          Text(homeController.searchServiceListData[index].title,
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: kblue
                                    ),
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
