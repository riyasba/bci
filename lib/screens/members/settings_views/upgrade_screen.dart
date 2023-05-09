import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../otcpayment/otc_payment.dart';

class UpgradeScreen extends StatefulWidget {
  const UpgradeScreen({super.key});

  @override
  State<UpgradeScreen> createState() => _UpgradeScreenState();
}

class _UpgradeScreenState extends State<UpgradeScreen> {

  final settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffF9F8FD),
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(onTap: (){Get.back();},
                      child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Select Membership',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffF9F8FD)),
                      ),
                    ),
                    Image.asset('assets/images/helps.png')
                  ],
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx( () =>
           ListView(physics: BouncingScrollPhysics(),
          //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const Text("All Select Membership Cards\nChoose Anything",
                                 style: TextStyle(fontSize: 17,
                                 fontWeight: FontWeight.w500,
                                 height: 1.4,
                                 color: Color(0xff003366)),),
                                 const SizedBox(height: 30,),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        settingsController.index(0);
                                        settingsController.update();
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 166,
                                        decoration: BoxDecoration(
                                          color:settingsController.index.value == 0 ? const Color(0xffFF9021) : Colors.white,
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(color:settingsController.index.value == 0 ? Colors.transparent : const Color(0xff003366)),
                                          boxShadow: [
                                            if(settingsController.index.value == 0)
                                            const BoxShadow(
                                          color: Color(0xffFF9021),
                                          offset: Offset(0, 1),
                                          blurRadius: 5.0,
                                           ),
                                           ]
                                        ),
                                        child: Center(
                                          child: Text("OTC",
                                          style: TextStyle(fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color:settingsController.index.value == 0 ? Colors.white : const Color(0xff003366)),),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        settingsController.index(1);
                                        settingsController.update();
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 166,
                                        decoration: BoxDecoration(
                                          color:settingsController.index.value == 1 ? Color(0xff0C559F) : Colors.white,
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(color:settingsController.index.value == 1 ?Colors.transparent : const Color(0xff003366)),
                                           boxShadow: [
                                            if(settingsController.index.value == 1)
                                            const BoxShadow(
                                          color: Color(0xff003366),
                                          offset: Offset(0, 1),
                                          blurRadius: 5.0,
                                           ),
                                           ]
                                        ),
                                        child: Center(
                                          child: Text("BUSINESS",
                                          style: TextStyle(fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color:settingsController.index.value == 1 ? Colors.white : const Color(0xff003366)),),
                                        ),
                                      ),
                                    ),
                                  ],
                                 ),
                                 const SizedBox(height: 25,),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        settingsController.index(2);
                                        settingsController.update();
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 166,
                                        decoration: BoxDecoration(
                                          color:settingsController.index.value == 2 ? const Color(0xff911361) : Colors.white,
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(color:settingsController.index.value == 2 ? Colors.transparent : const Color(0xff003366)),
                                          boxShadow: [
                                            if(settingsController.index.value == 2)
                                            const BoxShadow(
                                          color: Color(0xff911361),
                                          offset: Offset(0, 1),
                                          blurRadius: 5.0,
                                           ),
                                           ]
                                        ),
                                        child: Center(
                                          child: Text("DIAMOND",
                                          style: TextStyle(fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color:settingsController.index.value == 2 ? Colors.white : const Color(0xff003366)),),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        settingsController.index(3);
                                        settingsController.update();
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 166,
                                        decoration: BoxDecoration(
                                          color:settingsController.index.value == 3 ? const Color(0xffB0002D) : Colors.white,
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(color:settingsController.index.value == 3 ?Colors.transparent : const Color(0xff003366)),
                                           boxShadow: [
                                            if(settingsController.index.value == 3)
                                            const BoxShadow(
                                          color: Color(0xffB0002D),
                                          offset: Offset(0, 1),
                                          blurRadius: 5.0,
                                           ),
                                           ]
                                        ),
                                        child: Center(
                                          child: Text("PLATINUM LIFE",
                                          style: TextStyle(fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color:settingsController.index.value == 3 ? Colors.white : const Color(0xff003366)),),
                                        ),
                                      ),
                                    ),
                                  ],
                                 ),
                                 const SizedBox(height: 25,),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        settingsController.index(4);
                                        settingsController.update();
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 166,
                                        decoration: BoxDecoration(
                                          color:settingsController.index.value == 4 ? const Color(0xffD69D35) : Colors.white,
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(color:settingsController.index.value == 4 ? Colors.transparent : const Color(0xff003366)),
                                          boxShadow: [
                                            if(settingsController.index.value == 4)
                                            const BoxShadow(
                                          color: Color(0xffEDD076),
                                          offset: Offset(0, 1),
                                          blurRadius: 5.0,
                                           ),
                                           ]
                                        ),
                                        child: Center(
                                          child: Text("ELITE LIFE",
                                          style: TextStyle(fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color:settingsController.index.value == 4 ? Colors.white : const Color(0xff003366)),),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        settingsController.index(5);
                                        settingsController.update();
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 166,
                                        decoration: BoxDecoration(
                                          color:settingsController.index.value == 5 ? const Color(0xff148523) : Colors.white,
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(color:settingsController.index.value == 5 ?Colors.transparent : const Color(0xff003366)),
                                           boxShadow: [
                                            if(settingsController.index.value == 5)
                                            const BoxShadow(
                                          color: Color(0xff148523),
                                          offset: Offset(0, 1),
                                          blurRadius: 5.0,
                                           ),
                                           ]
                                        ),
                                        child: Center(
                                          child: Text("SIGNATURE LIFE",
                                          style: TextStyle(fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color:settingsController.index.value == 5 ? Colors.white : const Color(0xff003366)),),
                                        ),
                                      ),
                                    ),
                                  ],
                                 ),
                                 const SizedBox(height: 25,),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        settingsController.index(6);
                                        settingsController.update();
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 166,
                                        decoration: BoxDecoration(
                                          color:settingsController.index.value == 6 ? const Color(0xffDB5D08) : Colors.white,
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(color:settingsController.index.value == 6 ? Colors.transparent : const Color(0xff003366)),
                                          boxShadow: [
                                            if(settingsController.index.value == 6)
                                            const BoxShadow(
                                          color: Color(0xffDB5D08),
                                          offset: Offset(0, 1),
                                          blurRadius: 5.0,
                                           ),
                                           ]
                                        ),
                                        child: Center(
                                          child: Text("AMABASSADORE LIFE",
                                          style: TextStyle(fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color:settingsController.index.value == 6 ? Colors.white : const Color(0xff003366)),),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        settingsController.index(7);
                                        settingsController.update();
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 166,
                                        decoration: BoxDecoration(
                                          color:settingsController.index.value == 7 ? const Color(0xff6A2C77) : Colors.white,
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(color:settingsController.index.value == 7 ?Colors.transparent : const Color(0xff003366)),
                                           boxShadow: [
                                            if(settingsController.index.value == 7)
                                            const BoxShadow(
                                          color: Color(0xff6A2C77),
                                          offset: Offset(0, 1),
                                          blurRadius: 5.0,
                                           ),
                                           ]
                                        ),
                                        child: Center(
                                          child: Text("HAPPY NEW YEAR",
                                          style: TextStyle(fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color:settingsController.index.value == 7 ? Colors.white : const Color(0xff003366)),),
                                        ),
                                      ),
                                    ),
                                  ],
                                 ),
                                 
                                 const SizedBox(height: 40,),
                                 if(settingsController.index.value == 0)
                                 InkWell(onTap: (){Get.to(Otc_payment());},
                                  child: const Image(image: AssetImage("assets/images/Group 4995.png"),height: 234,)),
                                 if(settingsController.index.value == 1)
                                 const Image(image: AssetImage("assets/images/Group 4925.png"),height: 234,),
                                  if(settingsController.index.value == 2)
                                 const Image(image: AssetImage("assets/images/Group 4926.png"),height: 234,),
                                  if(settingsController.index.value == 3)
                                 const Image(image: AssetImage("assets/images/Group 4927.png"),height: 234,),
                                  if(settingsController.index.value == 4)
                                 const Image(image: AssetImage("assets/images/Group 4928.png"),height: 234,),
                                  if(settingsController.index.value == 5)
                                 const Image(image: AssetImage("assets/images/Group 4932.png"),height: 234,),
                                  if(settingsController.index.value == 6)
                                 const Image(image: AssetImage("assets/images/Group 4931.png"),height: 234,),
                                  if(settingsController.index.value == 7)
                                 const Image(image: AssetImage("assets/images/Group 4930.png"),height: 234,),
            ],
          ),
        ),
      ),
    );
  }
}