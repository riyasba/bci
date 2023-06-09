import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/screens/bussiness/views/generations/verified_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

class BusinessOtpvarification extends StatefulWidget {
  String phoneNumber;
  String otp;
  BusinessOtpvarification(
      {super.key, required this.otp, required this.phoneNumber});

  @override
  State<BusinessOtpvarification> createState() =>
      _BusinessOtpvarificationState();
}

class _BusinessOtpvarificationState extends State<BusinessOtpvarification> {
  String otpString = "";

  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ksizedbox30,
          Image.asset('assets/images/Group 5816.png'),
          Text(
            'OTP Verification',
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          ksizedbox10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Enter the OTP sent to ${widget.phoneNumber}',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              Text(
                'Otp is ${widget.otp}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          ksizedbox20,
          SingleChildScrollView(
            child: OtpTextField(
              numberOfFields: 4,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                setState(() {
                  otpString = verificationCode;
                });
              }, // end onSubmit
            ),
          ),
          ksizedbox30,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't Recive OTP ",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.black,
                ),
              ),
              Text(
                "Resent",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.red,
                ),
              ),
              ksizedbox20,
            ],
          ),
          ksizedbox30,
          // InkWell(
          //   onTap: () {
          //     Get.to(BusinessverifiedScreen());
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 20, right: 20),
          //     child: Container(
          //       width: double.infinity.h,
          //       height: 50.h,
          //       alignment: Alignment.center,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(
          //           4,
          //         ),
          //         border: Border.all(color: const Color(0xffFFBF7E)),
          //         boxShadow: const [
          //           BoxShadow(
          //             color: Color(0xFFFF5C29),
          //             blurRadius: 3.0,
          //           )
          //         ],
          //         gradient: const LinearGradient(
          //           begin: Alignment.centerLeft,
          //           end: Alignment.centerRight,
          //           colors: [
          //             Color(0xFFFF5C29),
          //             Color(0xFFFFCD38),
          //           ],
          //         ),
          //       ),
          //       child: Text(
          //         'Verify',
          //         style: TextStyle(
          //             fontSize: 22.sp,
          //             color: Colors.white,
          //             fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //   ),
          // ),

          Obx(
            () => authController.isLoading.isTrue
                ? Padding(
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
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      authController.loginUsersbusiness(
                          mobile: widget.phoneNumber, otp: otpString);
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
                          'Verify',
                          style: TextStyle(
                              fontSize: 22.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
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
