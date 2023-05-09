import 'package:bci/constands/constands.dart';
import 'package:bci/screens/bussiness/views/generations/verified_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';



class BusinessOtpvarification extends StatelessWidget {
  const BusinessOtpvarification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [ksizedbox30,
          Image.asset('assets/images/Group 5816.png'),
          Text(
            'OTP Verification',
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          ),ksizedbox10, Text(
            'Enter the OTP sent to +91 9633749714',
            style: TextStyle(
                fontSize: 22, color: Colors.black, ),
          ),ksizedbox20,   SingleChildScrollView(
            child: OtpTextField(
                      numberOfFields: 5,
                      borderColor: Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Verification Code"),
                                content:
                                    Text('Code entered is $verificationCode'),
                              );
                            });
                      }, // end onSubmit
                    ),
          ),ksizedbox30,Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
            "Don't Recive OTP ",
            style: TextStyle(
                fontSize: 19, color: Colors.black, ),
          ),     Text(
            "Resent",
            style: TextStyle(
                fontSize: 19, color: Colors.red, ),
          ),
                  ksizedbox20 ,  ],
                  ),ksizedbox30,
     InkWell(onTap: (){Get.to(BusinessverifiedScreen());},
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right:20 ),
                child: Container(
                  width: double.infinity,
                  height: 65,
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
                    'Verify',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),],
      ),
    );
  }
}
