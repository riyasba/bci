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
      decoration:const BoxDecoration(
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
                onTap: () {
                  Get.to(const MemberLoginScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
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
                        "Members Login",
                        style: TextStyle(shadows: [
                        Shadow(
                        blurRadius: 5.0,
                         color: Color(0xff0000007A),
                         offset: Offset(3.0, 3.0),
                          ),
        ],
                            fontSize: 22.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
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
              InkWell(
                onTap: () {
                  Get.to(const BusinessLoginScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    height: 50.h,
                    width: double.infinity.w,
                    decoration: BoxDecoration(
                      color: kblue,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.white),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 3.0,
                        )
                      ],
                     
                    ),
                    child: Center(
                      child: Text(
                        "Bussiness login",
                        style: TextStyle(shadows: [
                        Shadow(
                        blurRadius: 5.0,
                         color: Color(0xff707070),
                         offset: Offset(3.0, 3.0),
                          ),
        ],
                            fontSize: 22.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 50.h,
              //   width: double.infinity,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 20, right: 20),
              //     child: ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor:const Color.fromARGB(0, 246, 246, 246),
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(4.0),
              //           ),
              //         ),
              //         onPressed: () {
              //           Get.to(const BusinessLoginScreen());
              //         },
              //         child: Text(
              //           'Bussiness login',
              //           style: TextStyle(
              //               fontSize: 22.sp,
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold),
              //         )),
              //   ),
              // ),
              ksizedbox30,
              ksizedbox30,
              ksizedbox30
            ],
          ),
          backgroundColor: Colors.transparent),
    );
  }
}
