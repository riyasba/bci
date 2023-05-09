import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'otp_verification_screen.dart';



class BusinessGenerate_otp extends StatelessWidget {
  const BusinessGenerate_otp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ksizedbox30,
          Image.asset(
            'assets/images/a.png',
          ),
          Text(
            'Enter Your Phone Number',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          ksizedbox20,
          Text(
            'We will send you an One Time Password',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'on this mobile number',
            style: TextStyle(fontSize: 20),
          ),
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Image.asset('assets/images/Image 8.png'),
                suffixIcon: Image.asset('assets/images/Path 471.png'),
                hintText: 'Enter your username',
                labelText: '+91 9633749714',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: InkWell(onTap: (){Get.to(BusinessOtpvarification());},
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
                  'Genarate OTP',
                  style: TextStyle(
                      fontSize: 22,
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
