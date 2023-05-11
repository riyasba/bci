//import 'package:bci/authentications/onbording/introduction_screen.dart';
//import 'package:bci/authentications/onbording/onbording1.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/screens/members/home_screen/Members_home_screen.dart';
import 'package:bci/screens/bussiness/views/busines_widget/bottumnavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../screens/members/members widgets/bottumbavigation.dart';
import '../onbording/onbording11.dart';
//import '../onbording/onbording_screen.dart';
//import '../../widgets/bottumbavigation.dart';

class verified_Screen extends StatelessWidget {
  const verified_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ksizedbox30,
          Center(child: Image.asset('assets/images/Group 5817.png')),
          Text(
            "Welcome :)",
            style: TextStyle(
                fontSize: 22.sp,
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
          ksizedbox30,
          Text(
            "Your account has been verified",
            style: TextStyle(
              fontSize: 19.sp,
              color: Colors.black,
            ),
          ),
          Text(
            "Successfully",
            style: TextStyle(
              fontSize: 19.sp,
              color: Colors.black,
            ),
          ),
          ksizedbox40,
          ksizedbox40,
          InkWell(
            onTap: () {
              Get.to(Onbording());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xffFFBF7E)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFFF5C29),
                      blurRadius: 3.0,
                    )
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFFF5C29),
                      Color(0xFFFFCD38),
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    "Done",
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
