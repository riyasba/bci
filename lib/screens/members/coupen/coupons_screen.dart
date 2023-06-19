import 'dart:math';

import 'package:bci/controllers/profile_controller.dart';
import 'package:clipboard/clipboard.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../constands/constands.dart';
import '../../bussiness/views/business/notification_screen.dart';

class Coupens_members extends StatefulWidget {
  const Coupens_members({super.key});

  @override
  State<Coupens_members> createState() => _Coupens_membersState();
}

class _Coupens_membersState extends State<Coupens_members> {

  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.getCoupons();
    profileController.update();
  }

  List colors = [const Color(0xffFCE2E2),const Color(0xffE4E4E4),const Color(0xffF8AC61),const Color(0xff8DC6FF),
   const Color(0xffEDD076), const Color(0xff90E79C), const Color(0xff00D8E0), const Color(0xff396DB4), const Color(0xffD9908A),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(onTap: Get.back,
                      child: Image.asset('assets/images/chevron-left (2).png')),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'All Coupons',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                 IconButton(
                      onPressed: () {
                        Get.to(NotificationScreen());
                      },
                      icon: Icon(
                        Icons.notifications,
                        color: kwhite,
                      ))
                  ],
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
             Row(
              children:const [
                Text(
                  'Dress Coupones',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            ksizedbox10,
            GetBuilder<ProfileController>(
              builder: (_) {
                return Container(
                  height: size.height * 0.75,
                  child: ListView.builder(
                    itemCount: profileController.couponsData.length,
                    itemBuilder: (context, index) {
                      return  Padding(
                        padding:const  EdgeInsets.only(top: 5,bottom: 5),
                        child: ClipPath(
                        clipper: TicketPassClipper(),
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            color: colors[Random().nextInt(9)],
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(profileController.couponsData[index].name.toString(),
                                    style:const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                    ),
                                    ),
                                    Row(
                                      children: [
                                      const  Text("Coupons Code:",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  Text(profileController.couponsData[index].couponcode,
                                    style: TextStyle(
                                      color: korange,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                    ),
                                    ),
                                    const SizedBox(width: 5,),
                                    InkWell(
                                      onTap: (){
                                        FlutterClipboard.copy(profileController.couponsData[index].couponcode).then((value) => 
                                        Fluttertoast.showToast(
                                         msg: "Copy to clipboard",
                                         toastLength: Toast.LENGTH_SHORT,
                                         gravity: ToastGravity.CENTER,
                                         timeInSecForIosWeb: 1,
                                         backgroundColor: Colors.white,
                                         textColor: Colors.black,
                                         fontSize: 16.0
                                          ),
                                        //print("code copied")
                                        );
                                      },
                                      child: const Icon(Icons.copy,size: 15,))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                                      ),
                      );
                    },
                  ),
                );
              }
            ),
            //Image.asset('assets/images/Group 5789.png'),ksizedbox30,
            //Image.asset('assets/images/Group 5790.png'),ksizedbox30,
            //Image.asset('assets/images/Group 5791.png'),ksizedbox30,
            //Image.asset('assets/images/Group 5792.png')
          ],
        ),
      ),
    );
  }
}
