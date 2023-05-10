import 'package:bci/constands/constands.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../bussiness/views/home_screen/contact_admin.dart';
import 'add_to_wallet.dart';

class Otc_payment extends StatelessWidget {
  const Otc_payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
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
                        'OTC Payment',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(ContactAdmin());
                        },
                        child: Image.asset(
                            'assets/images/3669173_help_ic_icon.png'))
                  ],
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: ListView(physics: BouncingScrollPhysics(),
          children: [
            Image.asset('assets/images/Group 5843.png'),
            ksizedbox30,
            Row(
              children: [
                Text(
                  'OTC PAYMENTS',
                  style: TextStyle(fontSize: 28.sp),
                ),
              ],
            ),
            ksizedbox20,
            Text(
              "Lorem Ipsum is simply dummy text of the printing and \ntypesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
              style: TextStyle(fontSize: 16.sp),
            ),ksizedbox30,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  // controller: _controller,
          
                  decoration: InputDecoration(
                      hintText: 'Enter Coupon',
                      hintStyle: TextStyle(fontSize: 17.sp, color: kgrey),
                      fillColor: kwhite,
                      focusColor: kwhite,
                      isDense: true,
                      filled: true,
                      border: OutlineInputBorder(borderSide: BorderSide(color: kblue),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      suffixIcon:
                          Image.asset('assets/images/Icon awesome-copy.png')),
                ),
          ),ksizedbox10,    Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  // controller: _controller,
          
                  decoration: InputDecoration(
                      hintText: 'Enter Coupon',
                      hintStyle: TextStyle(fontSize: 17.sp, color: kgrey),
                      fillColor: kwhite,
                      focusColor: kwhite,
                      isDense: true,
                      filled: true,
                      border: OutlineInputBorder(borderSide: BorderSide(color: kblue),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      suffixIcon:
                          Image.asset('assets/images/Icon awesome-copy.png')),
                ),
          ),ksizedbox40,InkWell(
                onTap: () {
                      Get.to(Add_walet_screen());
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
                      'Proceed To Payment',
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),ksizedbox40],
        ),
      ),
    );
  }
}
