import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

import '../generate_otp/generate_otp.dart';
import '../verified_screen/verified_screen.dart';

class OtpVerificationView extends StatefulWidget {
  String phoneNumber;
  String otp;
  OtpVerificationView({super.key, this.phoneNumber = "", this.otp = ""});

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  String otpString = "";

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ksizedbox30,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/Group 5816.png'),
          ),
          Text(
            'OTP Verification',
            style: TextStyle(
                fontSize: 22, color: kblue, fontWeight: FontWeight.w700),
          ),
          ksizedbox10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Enter the OTP sent to ${widget.phoneNumber}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        //   decoration: TextDecoration.underline,
                        color: kblue),
                  ),
                  Text(
                    'OTP is ${widget.otp}',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        //   decoration: TextDecoration.underline,
                        color: kblue),
                  ),
                ],
              ),
            ],
          ),
          ksizedbox40,
          SingleChildScrollView(
            child: OtpTextField(
              numberOfFields: 4,
              borderColor: Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                setState(() {
                  otpString = verificationCode;
                });

                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return AlertDialog(
                //         title: Text("Verification Code"),
                //         content: Text('Code entered is $verificationCode'),
                //       );
                //     });
              },
            ),
          ),
          ksizedbox10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't Recive OTP ",
                style: TextStyle(
                  fontSize: 19.sp,
                  color: Colors.black,
                ),
              ),
              Text(
                "Resent",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    color: kOrange),
              ),
            ],
          ),
          ksizedbox10,
          // ksizedbox30,
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
                      authController.loginUsers(
                          mobile: widget.phoneNumber, otp: widget.otp);
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
