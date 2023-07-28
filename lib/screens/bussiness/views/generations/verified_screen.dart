//import 'package:bci/authentications/onbording/introduction_screen.dart';
import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../authentications/onbording/onbording_screen.dart';
import '../busines_widget/bottumnavigation.dart';

//import '../../widgets/bottumbavigation.dart';

class BusinessverifiedScreen extends StatelessWidget {
  const BusinessverifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/Group 5817.png')),
          Text(
            "Welcome :)",
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          ksizedbox30,
          Text(
            "Your account has been verified",
            style: TextStyle(
              fontSize: 19,
              color: Colors.black,
            ),
          ),
          Text(
            "Successfully",
            style: TextStyle(
              fontSize: 19,
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
                  'Done',
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
