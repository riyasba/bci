import 'package:bci/authentications/generate_otp/generate_otp.dart';
import 'package:bci/authentications/otp_verification/otp_verification.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/screens/members/sign_up_view/residential_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MemberSignUpScreen extends StatefulWidget {
  const MemberSignUpScreen({super.key});

  @override
  State<MemberSignUpScreen> createState() => _MemberSignUpScreenState();
}

class _MemberSignUpScreenState extends State<MemberSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF9F8FD),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              "Sign Up Now",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.w600, color: kblue),
            ),
            ksizedbox10,
            Text(
              "Please fill the details and create account",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w400, color: kblue),
            ),
            ksizedbox30,
            const Image(
                height: 200, image: AssetImage("assets/images/Group 6011.png")),
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 40,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: const Color(0xff707070)),
                    color: Colors.white),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    //controller: usernamecontroller,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "User Name",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 40,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: const Color(0xff707070)),
                    color: Colors.white),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    //controller: usernamecontroller,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "Date of birth",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 40,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: const Color(0xff707070)),
                    color: Colors.white),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    //controller: usernamecontroller,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 40,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: const Color(0xff707070)),
                    color: Colors.white),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    //controller: usernamecontroller,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "Mobile Number",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 40,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: const Color(0xff707070)),
                    color: Colors.white),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    //controller: usernamecontroller,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "Occupation",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 40,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: const Color(0xff707070)),
                    color: Colors.white),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    //controller: usernamecontroller,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "Father Name",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 40,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: const Color(0xff707070)),
                    color: Colors.white),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    //controller: usernamecontroller,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "Mother Name",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 40,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: const Color(0xff707070)),
                    color: Colors.white),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    //controller: usernamecontroller,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "Married",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
            ),
            ksizedbox40,
            InkWell(
              onTap: () {
                Get.to(const ResidentialAddressScreen());
              },
              child: Container(
                height: 50.h,
                width: size.width.w,
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
                    "Create Account",
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            ksizedbox10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have account? ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: kblue),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const MemberLoginScreen());
                  },
                  child: Text(
                    'Log In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
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
