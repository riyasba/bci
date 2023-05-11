import 'package:bci/authentications/generate_otp/generate_otp.dart';
import 'package:bci/authentications/otp_verification/otp_verification.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/screens/bussiness/views/generations/generate_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessSignUpScreen extends StatefulWidget {
  const BusinessSignUpScreen({super.key});

  @override
  State<BusinessSignUpScreen> createState() => _BusinessSignUpScreenState();
}

class _BusinessSignUpScreenState extends State<BusinessSignUpScreen> {
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
                    style: TextStyle(fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: kblue),
                  ),
                  ksizedbox10,
                   Text(
                    "Please fill the details and create account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: kblue),
                  ),
                  ksizedbox30,
                  const Image(
                    height: 200,
                    image: AssetImage("assets/images/Group 6011.png")),
                    ksizedbox30,
                    Padding(
                           padding: const EdgeInsets.only(top: 15),
                           child: Container(
                             height: 40,
                             width: size.width,
                             decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(2),
                             border: Border.all(color:const Color(0xff707070)),
                             color:Colors.white),
                             child: Padding(
                               padding: const EdgeInsets.only(left: 15,right: 15),
                               child: Row(
                                children: [
                                Text("Merchant Category Name",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kblue,
                                 fontWeight: FontWeight.w400,
                                ),),
                                const Icon(Icons.keyboard_arrow_down),
                               ],),
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
                             border: Border.all(color:const Color(0xff707070)),
                             color:Colors.white),
                             alignment: Alignment.center,
                             child: Padding(
                              padding:const EdgeInsets.only(left: 15, right: 10),
                              child: TextField(
                              //controller: usernamecontroller,
                              decoration: InputDecoration(
                              isCollapsed: true,
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "Sub Category",
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
                             border: Border.all(color:const Color(0xff707070)),
                             color:Colors.white),
                             alignment: Alignment.center,
                             child: Padding(
                              padding:const EdgeInsets.only(left: 15, right: 10),
                              child: TextField(
                              //controller: usernamecontroller,
                              decoration: InputDecoration(
                              isCollapsed: true,
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "Merchant Display Name",
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
                             border: Border.all(color:const Color(0xff707070)),
                             color:Colors.white),
                             alignment: Alignment.center,
                             child: Padding(
                              padding:const EdgeInsets.only(left: 15, right: 10),
                              child: TextField(
                              //controller: usernamecontroller,
                              decoration: InputDecoration(
                              isCollapsed: true,
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "Email ID",
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
                             border: Border.all(color:const Color(0xff707070)),
                             color:Colors.white),
                             alignment: Alignment.center,
                             child: Padding(
                              padding:const EdgeInsets.only(left: 15, right: 10),
                              child: TextField(
                              //controller: usernamecontroller,
                              decoration: InputDecoration(
                              isCollapsed: true,
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "Phone Number",
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
                             border: Border.all(color:const Color(0xff707070)),
                             color:Colors.white),
                             alignment: Alignment.center,
                             child: Padding(
                              padding:const EdgeInsets.only(left: 15, right: 10),
                              child: TextField(
                              //controller: usernamecontroller,
                              decoration: InputDecoration(
                              isCollapsed: true,
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "Alternate Phone Number",
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
                             border: Border.all(color:const Color(0xff707070)),
                             color:Colors.white),
                             alignment: Alignment.center,
                             child: Padding(
                              padding:const EdgeInsets.only(left: 15, right: 10),
                              child: TextField(
                              //controller: usernamecontroller,
                              decoration: InputDecoration(
                              isCollapsed: true,
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "Bussiness Address",
                               hintStyle: TextStyle(
                               color: kblue,
                               fontWeight: FontWeight.w400,
                             )),
                          ),
                       ),
                  ),
               ),
               const SizedBox(height: 15,),
               Row(
                children: [
                  Container(
                    height: 17,
                    width: 17,
                    decoration: BoxDecoration(
                      color: kblue,
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  const SizedBox(width: 7,),
                  Text(
                    "Yes",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: kblue),
                  ),
                  const SizedBox(width: 15,),
                  Container(
                    height: 17,
                    width: 17,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: kblue),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  const SizedBox(width: 7,),
                  Text(
                    "No",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: kblue),
                  ),
                ],
               ),
               Padding(
                           padding: const EdgeInsets.only(top: 15),
                           child: Container(
                             height: 40,
                             width: size.width,
                             decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(2),
                             border: Border.all(color:const Color(0xff707070)),
                             color:Colors.white),
                             alignment: Alignment.center,
                             child: Padding(
                              padding:const EdgeInsets.only(left: 15, right: 10),
                              child: TextField(
                              //controller: usernamecontroller,
                              decoration: InputDecoration(
                              isCollapsed: true,
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "GST No",
                               hintStyle: TextStyle(
                               color: kblue,
                               fontWeight: FontWeight.w400,
                             )),
                          ),
                       ),
                  ),
               ),
               const SizedBox(height: 15,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 130,
                        width: 150,
                        decoration: BoxDecoration(
                          color:const Color.fromARGB(255, 215, 215, 213),
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child:const  Center(
                          child: Icon(Icons.cloud_upload,color: Colors.grey,size: 45,),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                    "Aadhaar Card",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: kblue),
                  ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 130,
                        width: 150,
                        decoration: BoxDecoration(
                          color:const Color.fromARGB(255, 215, 215, 213),
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child:const  Center(
                          child: Icon(Icons.cloud_upload,color: Colors.grey,size: 45,),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                    "Pan Card",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: kblue),
                  ),
                    ],
                  ),
                ],
               ),
               ksizedbox40,
               InkWell(
                onTap: (){
                  Get.to(const otp_varification());
                },
                 child: Container(
                                height: 50,
                                width: size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
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
                                child:const Center(
                                  child: Text("Create Account",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w500),),
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
                  style: TextStyle(fontSize: 18,color: kblue),
                ),
                InkWell(
                  onTap: (){
                    Get.to(const BusinessLoginScreen());
                  },
                  child: Text(
                    'Log In',
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