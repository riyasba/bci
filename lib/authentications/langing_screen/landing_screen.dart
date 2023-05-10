import 'package:bci/authentications/generate_otp/generate_otp.dart';
import 'package:bci/screens/bussiness/views/generations/generate_otp_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constands/constands.dart';
import '../../screens/members/members widgets/bottumbavigation.dart';
import '../../screens/bussiness/views/busines_widget/bottumnavigation.dart';
import '../../screens/bussiness/views/business/business_home_screen.dart';

class landing_screen extends StatelessWidget {
  const landing_screen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height.h,
      width: size.width.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/Login Screen Options.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
          //    Image.asset('assets/images/onbording3.png'),ksizedbox40,
              InkWell(
              
      onTap: (){Get.off(const MemberLoginScreen());},
      child: Padding(
        padding: const EdgeInsets.only(right: 20,left: 20),
        child: Container(
          width:double.infinity,
          height: 65.h,
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
      child: Text('Member Login',           style: TextStyle(
                               fontSize: 22.sp,
                               color: Colors.white,
                               fontWeight: FontWeight.bold),),
        ),
      ),
    ),
              // SizedBox(
              //   height: 65,
              //   width: double.infinity,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 20, right: 20),
              //     child: ElevatedButton(
              //         style: ElevatedButton.styleFrom(// primary: Colors.teal,
              //  // onPrimary: Colors.green,
              // //onSurface: Colors.orange,
              // //backgroundColor: Color.fromARGB(255, 177, 126, 60),
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(4.0),
              //           ),
              //         ),
              //         onPressed: () {
              //           Get.off(Generate_otp());
              //         },
              //         child: Text(
              //           'Member Login',
              //           style: TextStyle(
              //               fontSize: 22,
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold),
              //         )),
              //   ),
              // ),
              ksizedbox20,
              SizedBox(
                height: 65.h,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(0, 246, 246, 246),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      onPressed: () {
                        Get.to(BusinessLoginScreen
                        ());
                      },
                      child: Text(
                        'Bussiness login',
                        style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              ksizedbox30
            ],
          ),
          backgroundColor: Colors.transparent),
    );
  }
}
