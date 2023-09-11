//import 'package:bci/authentications/onbording/introduction_screen.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/screens/bussiness/views/generations/generate_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../authentications/onbording/onbording_screen.dart';
import '../busines_widget/bottumnavigation.dart';

//import '../../widgets/bottumbavigation.dart';

class WaitingForApprovalScreen extends StatelessWidget {
  const WaitingForApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'assets/images/waiting_for_aproval.gif',
            height: 200,
            fit: BoxFit.fill,
          )),
           ksizedbox30,
          ksizedbox30,
           Text(
            "Waiting for approval",
            style: TextStyle(
                fontSize: 26, color: kblue, fontWeight: FontWeight.w700),
          ),
          ksizedbox20,
           const Text(
            "You've successfully registered an account,",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
          const Text(
            "now wait for admin approval!",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
          ksizedbox40,
          ksizedbox40,
          InkWell(
            onTap: () {
              Get.to(() => const BusinessLoginScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Container(
                width: double.infinity.h,
                height: 50.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
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
                child: Text(
                  'Wait...',
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
