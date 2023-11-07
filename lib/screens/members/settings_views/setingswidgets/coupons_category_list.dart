import 'package:bci/constands/app_fonts.dart';

import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/screens/members/settings_views/setingswidgets/coupons_list_screen.dart';

import 'package:clipboard/clipboard.dart';

import 'package:coupon_uikit/coupon_uikit.dart';

import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import 'dart:math' as math;
import '../../../../constands/constands.dart';

class CategoryCouponsListScreen extends StatefulWidget {
  const CategoryCouponsListScreen({super.key});

  @override
  State<CategoryCouponsListScreen> createState() => _CouponsState();
}

class _CouponsState extends State<CategoryCouponsListScreen> {
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
          child: profileController.categorycouponsData.isEmpty
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
                  itemCount: profileController.categorycouponsData.length,
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
                              profileController
                                          .categorycouponsData[index].image ==
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
                                            .categorycouponsData[index].image),
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
                                  profileController
                                      .categorycouponsData[index].name,
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
                                      .categorycouponsData[index].description,
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
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => CouponsListScreen(
                                          category: profileController
                                              .categorycouponsData[index].name,
                                        ));
                                  },
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: kyellow,
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "View Coupons",
                                        style: primaryFont.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
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
