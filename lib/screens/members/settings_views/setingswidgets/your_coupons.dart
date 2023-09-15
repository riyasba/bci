import 'package:bci/constands/app_fonts.dart';

import 'package:bci/controllers/profile_controller.dart';

import 'package:clipboard/clipboard.dart';

import 'package:coupon_uikit/coupon_uikit.dart';

import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import 'dart:math' as math;
import '../../../../constands/constands.dart';

class Coupons extends StatefulWidget {
  const Coupons({super.key});

  @override
  State<Coupons> createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    profileController.getCoupons();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<ProfileController>(builder: (_) {
        return Container(
         // height: size.height * 0.55,
          child: profileController.couponsData.isEmpty
              ?  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[ 
                    Image.asset('assets/images/couponnotavailaimage.png',
                    height: 180,
                    fit: BoxFit.fitHeight,),
                  ksizedbox20,
                  Text('No Coupon Available',
                  style: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp
                  ),)
              
                  ]),
              )
              : ListView.builder(
                shrinkWrap: true,
                  itemCount: profileController.couponsData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: CouponCard(
                        shadow:const Shadow(),
                        height: 150,
                        backgroundColor: Colors.white,
                        curveAxis: Axis.vertical,
                        firstChild: Container(
                          decoration: BoxDecoration(
                              color: Color((math.Random().nextDouble() *
                                          0xFFFFFF)
                                      .toInt())
                                  .withOpacity(1.0)),
                          child:profileController.couponsData[index].image == "null" ? 
                          Image.asset("assets/icons/coupon.jpg",fit: BoxFit.cover,) :
                           Image.network(
                            profileController.couponsData[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        secondChild: Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                profileController
                                    .couponsData[index].name ?? "Coupon Code:",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                                         ),
                              Text(
                                "Coupon code: ${profileController
                                    .couponsData[index].couponcode}",
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
                      ),
                    );
                  },
                ),
        );
      }),
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
