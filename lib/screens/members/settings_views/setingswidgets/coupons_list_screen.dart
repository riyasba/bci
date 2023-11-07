import 'package:bci/constands/app_fonts.dart';

import 'package:bci/controllers/profile_controller.dart';

import 'package:clipboard/clipboard.dart';

import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:custom_clippers/custom_clippers.dart';

import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import 'dart:math' as math;
import '../../../../constands/constands.dart';

class CouponsListScreen extends StatefulWidget {
  String category;
  CouponsListScreen({super.key, required this.category});

  @override
  State<CouponsListScreen> createState() => _CouponsState();
}

class _CouponsState extends State<CouponsListScreen> {
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileController.getCouponsByCategory(widget.category);
    });
  }

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
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: kwhite,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'Coupons',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: kwhite),
                      ),
                    ),
                    Container()
                    // InkWell(
                    //     onTap: () {
                    //       Get.to(const ContactAdmin());
                    //     },
                    //     child: Image.asset(
                    //         'assets/images/3669173_help_ic_icon.png'))
                  ],
                ),
              ),
            ),
          )),
      body: GetBuilder<ProfileController>(builder: (_) {
        return Container(
          // height: size.height * 0.55,
          child: profileController.couponsData.isEmpty
              ? Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/couponnotavailaimage.png',
                          height: 180,
                          fit: BoxFit.fitHeight,
                        ),
                        ksizedbox20,
                        Text(
                          'No Coupon Available',
                          style: TextStyle(
                              color: kblue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),
                        )
                      ]),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: profileController.couponsData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: kgrey.withOpacity(0.6),
                                ),
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              profileController.couponsData[index].image ==
                                      "null"
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/icons/coupon.jpg",
                                        height: 120,
                                        width: size.width,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        image: NetworkImage(profileController
                                            .couponsData[index].image),
                                        height: 120,
                                        width: size.width,
                                        fit: BoxFit.fill,
                                      )),
                              const SizedBox(
                                height: 7,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  profileController.couponsData[index].name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  profileController
                                      .couponsData[index].description,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: kgrey),
                                ),
                              ),
                              // Text(
                              //   profileController.couponsData[index].,
                              //   style: TextStyle(
                              //       fontSize: 20,
                              //       fontWeight: FontWeight.bold,
                              //       color: kblue),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kyellow,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Coupon Code: ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: kblue),
                                            ),
                                            Text(
                                              profileController
                                                  .couponsData[index]
                                                  .couponcode,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: kwhite),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            FlutterClipboard.copy(
                                                    profileController
                                                        .couponsData[index]
                                                        .couponcode)
                                                .then(
                                              (value) => Fluttertoast.showToast(
                                                  msg: "Copy to clipboard",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.white,
                                                  textColor: Colors.black,
                                                  fontSize: 16.0),
                                              //print("code copied")
                                            );
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: kwhite,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: const Center(
                                              child: Text("Copy"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
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
