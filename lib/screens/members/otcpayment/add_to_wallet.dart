import 'package:bci/screens/bussiness/views/home_screen/contact_admin.dart';
import 'package:bci/screens/members/otcpayment/member_sub_successful.dart';
import 'package:bci/screens/members/settings_views/upgrade_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import '../../../constands/constands.dart';

class AddWaletScreen extends StatelessWidget {
  const AddWaletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(250),
          child: ClipPath(
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
                        child:
                            Image.asset('assets/images/chevron-left (2).png')),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'Add to Wallet',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(const ContactAdmin());
                        },
                        child: Image.asset(
                            'assets/images/3669173_help_ic_icon.png'))
                  ],
                ),
              ),
            ),
          )),
      body: ListView(
        physics:const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Group 5844.png',
                alignment: Alignment.center,
              ),
            ],
          ),
          ksizedbox30,
          Text(
            'Add To Wallet Amounts or Default Amount Choose Payment Methods...',
            textAlign: TextAlign.center,
            style: TextStyle(color: kblue, fontSize: 22.sp),
          ),
          ksizedbox30,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Center(
                child: Text(
                  '₹1990.00',
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w800,
                      color: kwhite),
                ),
              ),
              height: 50.h,
              width: 220.w,
              decoration: BoxDecoration(
                  color: kblue, borderRadius: BorderRadius.circular(4)),
            ),
          ),
          ksizedbox40,
          Row(
            children: [
              Text(
                'Others Amounts',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          ksizedbox30,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: kblue)),
                child:Center(
                  child: Text(
                    '+2000',
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500,
                        color: kblue),
                  ),
                ),
                height: 50.h,
                width: 120.w,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(color: kblue)),
                child: Center(
                  child: Text(
                    '+2000',
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500,
                        color: kblue),
                  ),
                ),
                height: 50.h,
                width: 120.w,
              ),
            ],
          ),
          ksizedbox30,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: kblue)),
                child: Center(
                  child: Text(
                    '+2000',
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500,
                        color: kblue),
                  ),
                ),
                height: 50.h,
                width: 120.w,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(color: kblue)),
                child: Center(
                  child: Text(
                    '+2000',
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500,
                        color: kblue),
                  ),
                ),
                height: 50.h,
                width: 120.w,
              ),
            ],
          ),
          ksizedbox40,
          InkWell(
            onTap: () {
              Get.to(const SucessfulScreenOtc());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 50.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFFF5C29),
                      Color(0xFFFFCD38),
                    ],
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                      fontSize: 28.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          ksizedbox10,
          InkWell(
            onTap: () {
              {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 180, bottom: 120),
                        child: Dialog(
                          child: Container(
                            height: 200.h,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Cancel Transaction',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Are you sure you want to Cancel transaction',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: kgrey,
                                  ),
                                ),
                               const SizedBox(
                                  height: 5,
                                ),
                                ksizedbox20,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: Size(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                40),
                                            backgroundColor: kOrange),
                                            
                                        onPressed: () {Get.back();

                                          showModalBottomSheet(
                                              shape:const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                top: Radius.circular(26.0),
                                              )),
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: Container(
                                                    height: 300.h,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Column(
                                                      children: [
                                                        Image.asset(
                                                            'assets/images/cancel.png'),
                                                        ksizedbox20,
                                                        const Text(
                                                          'Payment has been Declined',
                                                          style: TextStyle(
                                                              fontSize: 25),
                                                        ),
                                                        ksizedbox10,
                                                        InkWell(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: Container(
                                                            height: 45.h,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.5,
                                                            decoration: BoxDecoration(
                                                                color: kblue,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            child: Center(
                                                              child: Text(
                                                                'Try Again',
                                                                style: TextStyle(
                                                                    color:
                                                                        kwhite,
                                                                    fontSize:
                                                                        25.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(fontSize: 23.sp),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: Size(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                40),
                                            backgroundColor: kOrange),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'No',
                                          style: TextStyle(fontSize: 23.sp),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 50.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFE4E4E4),
                      Color(0xFFE4E4E4),
                    ],
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 28.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          ksizedbox40
        ],
      ),
    );
  }
}
