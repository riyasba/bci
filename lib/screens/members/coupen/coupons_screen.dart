import 'package:bci/constands/app_fonts.dart';

import 'package:bci/controllers/profile_controller.dart';

import 'package:clipboard/clipboard.dart';

import 'package:coupon_uikit/coupon_uikit.dart';

import 'package:custom_clippers/custom_clippers.dart';

import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import 'dart:math' as math;

import '../../../constands/constands.dart';

import '../../bussiness/views/business/notification_screen.dart';

class CoupensMembers extends StatefulWidget {
  const CoupensMembers({super.key});

  @override
  State<CoupensMembers> createState() => _CoupensMembersState();
}

class _CoupensMembersState extends State<CoupensMembers> {

  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    
    super.initState();
    profileController.getCoupons();
  }

  List colors = [
    Color.fromARGB(255, 176, 75, 201),
    Color.fromARGB(255, 172, 218, 65),
    const Color(0xffF8AC61),
    const Color(0xff8DC6FF),
    const Color(0xffEDD076),
    const Color(0xff90E79C),
    const Color(0xff00D8E0),
    Color.fromARGB(255, 143, 48, 206),
    Color.fromARGB(255, 0, 224, 149),
    const Color(0xffD9908A),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
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
                     InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                                'assets/images/chevron-left (2).png'))),
                    const Text(
                      'All Coupons',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.to(const NotificationScreen());
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
            ksizedbox10,
            GetBuilder<ProfileController>(builder: (_) {
              return Container(
                height: size.height * 0.75,
                child: profileController.couponsData.isEmpty
                    ? const Center(
                        child: Text("No Coupons Available"),
                      )
                    : ListView.builder(
                        itemCount: profileController.couponsData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(15),
                            child: CouponCard(
                              shadow: Shadow(),
                              height: 150,
                              backgroundColor: Colors.white,
                              curveAxis: Axis.vertical,
                              firstChild: Container(
                                decoration: BoxDecoration(
                                    color: Color((math.Random().nextDouble() *
                                                0xFFFFFF)
                                            .toInt())
                                        .withOpacity(1.0)),
                                child: Image.network(
                                  profileController
                                      .couponsData[index].image,fit: BoxFit.cover,
                                ),
                              ),
                              secondChild: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Coupon Code :",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    profileController
                                        .couponsData[index].couponcode,
                                    style: primaryFont.copyWith(
                                        fontSize: 14,
                                        color: Color(
                                                (math.Random().nextDouble() *
                                                        0xFFFFFF)
                                                    .toInt())
                                            .withOpacity(1.0),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      FlutterClipboard.copy(profileController
                                              .couponsData[index].couponcode)
                                          .then(
                                        (value) => Fluttertoast.showToast(
                                            msg: "Copy to clipboard",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.white,
                                            textColor: Colors.black,
                                            fontSize: 16.0),
                                        //print("code copied")
                                      );
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Copy",
                                            style: primaryFont.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(
                                            Icons.copy,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                          
                        },
                      ),
              );
            }),
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

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = Color.fromARGB(255, 233, 230, 230)
      ..strokeWidth = size.width;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
