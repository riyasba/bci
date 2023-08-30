import 'package:bci/screens/members/members%20widgets/bottumbavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constands/constands.dart';
//import '../../../constands/constands.dart';
import '../Hotel_members.dart';
//import 'holiday_home.dart';

class Sucessful_screen_hotel extends StatelessWidget {
  const Sucessful_screen_hotel({super.key});

  getBack() {
    Get.offAll(()=> MemberBottomNavBar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F8FD),
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/images/Icon awesome-arrow-right.png')),
        title: Text(
          'Booking Completed',
          style: TextStyle(
              fontSize: 27.sp, fontWeight: FontWeight.w800, color: kblue),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/accept-icon.png'),
            Text(
              'Booking Successful',
              style: TextStyle(
                  color: kblue, fontSize: 28.sp, fontWeight: FontWeight.w700),
            ),
            ksizedbox10,
            Text(
              'Thank you! Your booking is complete',
              style: TextStyle(
                  fontSize: 22.sp, fontWeight: FontWeight.w600, color: kblue),
            ),
            ksizedbox40,
            ksizedbox40,
            InkWell(
              onTap: () {
                Get.offAll(MemberBottomNavBar());
              },
              child: Container(
                width: 150,
                height: 45,
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
                child: const Text(
                  'Done',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
