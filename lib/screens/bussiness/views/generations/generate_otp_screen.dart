import 'package:bci/constands/constands.dart';
import 'package:bci/screens/bussiness/views/sign_up_views/business_sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'otp_verification_screen.dart';



class BusinessLoginScreen extends StatelessWidget {
  const BusinessLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'assets/images/a.png',
              ),
            ),
            const SizedBox(height: 50,),
             Text(
              'Enter Your Phone Number',
              style: TextStyle(fontSize: 22,
              color: kblue,
               fontWeight: FontWeight.w700),
            ),
            ksizedbox20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'We will send you an ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18,color: kblue),
                ),
                Text(
                  'One Time Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kblue),
                ),
              ],
            ),
            Text(
              'on this mobile number',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18,color: kblue),
            ),
            ksizedbox40,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Image.asset('assets/images/Image 8.png'),
                    suffixIcon: Image.asset('assets/images/Path 471.png'),
                    hintText: 'Enter your username',
                    labelText: '+91 9633749714',
                    border:const OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            ksizedbox20,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(onTap: (){
                Get.to(const BusinessOtpvarification());},
                child: Container(
                  width: size.width,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4,),
                    border: Border.all(color:const Color(0xffFFBF7E)),
                    boxShadow:const [
                      BoxShadow(
                        color:Color(0xFFFF5C29),
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
                  child:const Text(
                    'Genarate OTP',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            ksizedbox10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont't have an account? ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18,color: kblue),
                ),
                InkWell(
                  onTap: (){
                    Get.to(const BusinessSignUpScreen());
                  },
                  child: Text(
                    'Sign up',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    color: kOrange),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
