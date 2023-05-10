import 'package:bci/authentications/generate_otp/generate_otp.dart';
import 'package:bci/authentications/otp_verification/otp_verification.dart';
import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfficeAddressScreen extends StatefulWidget {
  const OfficeAddressScreen({super.key});

  @override
  State<OfficeAddressScreen> createState() => _OfficeAddressScreenState();
}

class _OfficeAddressScreenState extends State<OfficeAddressScreen> {

  bool isCheked = false;

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
                    "Office Address",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: kblue),
                  ),
                  ksizedbox10,
                   Text(
                    "Please fill the details address",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: kblue),
                  ),
                  ksizedbox30,
                  const Image(
                    height: 200,
                    image: AssetImage("assets/images/Group -1.png")),
                    ksizedbox30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                                 Checkbox(
                                          activeColor: kblue,
                                          value: isCheked,
                                         // onChanged: _handleRemeberme,
                                          onChanged: (value) {
                                            setState(() {
                                              isCheked = !isCheked;
                                            });
                                          }
                                          ),
                                          Text(
                    "Same as residential address",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: kblue),
                                    ),
                      ],
                    ),
                    Padding(
                           padding: const EdgeInsets.only(top: 10),
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
                              hintText: "Door No",
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
                              hintText: "Building name",
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
                              hintText: "Address",
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
                              hintText: "City",
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
                              hintText: "State",
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
                          Color.fromARGB(255, 255, 123, 34),
                        ],
                      ),
                                ),
                                child:const Center(
                                  child: Text("Next",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w500),),
                                ),
                               ),
               ),
                              ksizedbox10,
            
            ],
          ),
        ),
    );
  }
}