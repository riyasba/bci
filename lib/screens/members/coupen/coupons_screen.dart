import 'dart:math';

import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:clipboard/clipboard.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          preferredSize: const Size.fromHeight(210),
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
                        onTap: Get.back,
                        child:
                            Image.asset('assets/images/chevron-left (2).png')),
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
            Row(
              children: const [
                Text(
                  '',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ],
            ),
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
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: ClipPath(
                              clipper: TicketPassClipper(),
                              child: Container(
                                  height: 90,
                                  decoration: BoxDecoration(
                                      color: colors[Random().nextInt(9)],
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 5),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                width: size.width * 0.52,
                                                child: Text(
                                                  profileController
                                                      .couponsData[index].name
                                                      .toString(),
                                                  maxLines: 2,
                                                  style: primaryFont.copyWith(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                       if(profileController
                                                      .couponsData[index].isRedeemed == "1")     Container(
                                              height: 30,
                                              width: 85,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(255, 75, 133, 76),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Redeemed",
                                                style: primaryFont.copyWith(
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CustomPaint(
                                          size: const Size(1, double.infinity),
                                          painter: DashedLineVerticalPainter()),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Coupon Code :",
                                              style: primaryFont.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                               profileController
                                                  .couponsData[index]
                                                  .couponcode,
                                              style: primaryFont.copyWith(
                                                  fontSize: 14,
                                                  color: Color.fromARGB(255, 235, 145, 10),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            InkWell(
                                              onTap: (){
                                                FlutterClipboard.copy(
                                                        profileController
                                                            .couponsData[index]
                                                            .couponcode)
                                                    .then(
                                                  (value) =>
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "Copy to clipboard",
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          gravity: ToastGravity
                                                              .CENTER,
                                                          timeInSecForIosWeb: 1,
                                                          backgroundColor:
                                                              Colors.white,
                                                          textColor:
                                                              Colors.black,
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
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Icon(
                                                      Icons.copy,
                                                      color: Colors.white,
                                                      size: 15,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
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
