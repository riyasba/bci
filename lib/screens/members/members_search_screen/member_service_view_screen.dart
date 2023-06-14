import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/models/search_service_list_model.dart';
import 'package:bci/screens/bussiness/views/business/notification_screen.dart';
import 'package:bci/screens/members/liquer_screen/cart_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MemberSearchViewScreen extends StatefulWidget {
 SearchServiceListData searchServicelist;
 MemberSearchViewScreen({super.key,required this.searchServicelist});

  @override
  State<MemberSearchViewScreen> createState() => _MemberSearchViewScreenState();
}

class _MemberSearchViewScreenState extends State<MemberSearchViewScreen> {
  
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(widget.searchServicelist.title,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: kblue),
                                ),
                                ksizedbox10,
                                Container(
                                height: 100,
                                width: 150,
                                child: Image.network(widget.searchServicelist.image),
                              ),
                              ksizedbox20,
                                Text("About",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: kblue),
                                ),
                                ksizedbox10,
                                Text(widget.searchServicelist.description,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      color: kgrey),
                                ),
                                ksizedbox20,
                                Text("₹ ${widget.searchServicelist.actualAmount}",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: kOrange),
                                ),
                                 ksizedbox40,
                   
                  ],
                ),
                 Padding(
                   padding: const EdgeInsets.only(bottom: 20),
                   child: Center(
                     child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: 335,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: kyellow),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: InkWell(
                                onTap: (){
                                  homeController.addBooking(
                                    serviceid: widget.searchServicelist.id.toString(), 
                                    qty: "1", 
                                    offerOrCoupon: "", 
                                    couponcode: "", 
                                    amount: widget.searchServicelist.actualAmount);
                                },
                                 child: Container(
                                        height: 65,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: kwhite,
                                            borderRadius: BorderRadius.circular(16)),
                                        child:const Center(
                                            child: Text(
                                          "Book Now",
                                          style: TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.w700),
                                        )),
                                      ),
                               ),
                             ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: (){
                                    homeController.addToCart(serviceid: widget.searchServicelist.id.toString());
                                  },
                                  child: Container(
                                    height: 65,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: kwhite,
                                        borderRadius: BorderRadius.circular(16)),
                                    child: Center(
                                        child: Text(
                                      "Add To Cart",
                                      style:const TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.w700),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                                   ),
                   ),
                 ),
              ],
            ),
          ),
    );
  }
}