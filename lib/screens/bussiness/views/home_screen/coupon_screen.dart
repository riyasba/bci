import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/screens/bussiness/views/home_screen/coupons/view_history.dart';
import 'package:clipboard/clipboard.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../constands/constands.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  var couponController = TextEditingController();

  final authController = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.redeemptionCoupon();
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 158,
              color: kblue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: kwhite,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      'Coupon Redemption',
                      style: TextStyle(
                          fontSize: 23,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset('assets/images/helps.png'),
                  )
                ],
              ),
            ),
          )),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: Text(
                  'VIEW HISTORY',
                  style: TextStyle(
                      fontSize: 23, color: kblue, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          ksizedbox20,
          GetBuilder<AuthController>(builder: (_) {
            return Container(
              height: _mediaQuery.height * 0.70,
              child: authController.couponRedeemptionData.isEmpty
                  ? Center(
                      child: Image.asset("assets/images/Voucher.png"),
                    )
                  : ListView.builder(
                      itemCount: authController.couponRedeemptionData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: CouponCard(
                            shadow: const Shadow(),
                            height: 150,
                            backgroundColor: Colors.white,
                            curveAxis: Axis.vertical,
                            firstChild: Container(
                              decoration: const BoxDecoration(
                                  // color: Color((math.Random().nextDouble() *
                                  //             0xFFFFFF)
                                  //         .toInt())
                                  //  .withOpacity(1.0)
                                  ),
                              child:
                                  authController.couponRedeemptionData.isEmpty
                                      ? Container()
                                      : Image.network(
                                          authController
                                              .couponRedeemptionData[index]
                                              .image,
                                          fit: BoxFit.cover,
                                        ),
                            ),
                            secondChild: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Coupon Code :",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  authController
                                      .couponRedeemptionData[index].couponcode,
                                  style: primaryFont.copyWith(
                                      fontSize: 14,
                                      // color: Color(
                                      //         (math.Random().nextDouble() *
                                      //                 0xFFFFFF)
                                      //             .toInt())
                                      //     .withOpacity(1.0),
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  height: 25,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Redeemed",
                                        style: primaryFont.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
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
        ],
      ),
    );
  }
}
