import 'package:bci/constands/constands.dart';
import 'package:bci/models/get_plans_model.dart';
import 'package:bci/screens/members/otcpayment/successful.dart';
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
  PlansData plansData;
  Otc_payment({super.key, required this.plansData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
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
                        'Payment',
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
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Image.network(
              plansData.cardImg,
              height: 200,
            ),
            ksizedbox30,
            Row(
              children: [
                Text(
                  plansData.title,
                  style: TextStyle(fontSize: 28.sp),
                ),
              ],
            ),
            ksizedbox20,
            Text(
              plansData.planDescription,
              style: TextStyle(fontSize: 16.sp),
            ),
            ksizedbox30,
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
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kblue),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    suffixIcon:
                        Image.asset('assets/images/Icon awesome-copy.png')),
              ),
            ),
            ksizedbox10,
            ksizedbox40,
            InkWell(
              onTap: () {
                Get.to(Sucessful_screen_otc());
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
            ),
            ksizedbox40
          ],
        ),
      ),
    );
  }
}
