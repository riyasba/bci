import 'package:bci/screens/members/members%20widgets/member_bottumbavigation.dart';
import 'package:bci/screens/members/settings_views/setingswidgets/My_account.dart';
import 'package:bci/screens/members/wallet/Wallet_members.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../constands/constands.dart';
//import 'holiday_home.dart';

class BookingCancelled extends StatelessWidget {
  const BookingCancelled({super.key});

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
          'Booking Status',
          style: TextStyle(
              fontSize: 27.sp, fontWeight: FontWeight.w800, color: kblue),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.red,
                size: 200,
              ),
            ),
            Text(
              'Booking cancelled',
              style: TextStyle(
                  color: kblue, fontSize: 28.sp, fontWeight: FontWeight.w700),
            ),
            ksizedbox10,
            Text(
              'Your amount will get refunded',
              style: TextStyle(
                  fontSize: 22.sp, fontWeight: FontWeight.w600, color: kblue),
            ),
            ksizedbox40,
            ksizedbox40,
            InkWell(
              onTap: () {
                Get.offAll(
                  () => MemberBottomNavBar(),
                );
              },
              child: Container(
                width: 150.w,
                height: 45.h,
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
                  'Cancel',
                  style: TextStyle(
                      fontSize: 17.sp,
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