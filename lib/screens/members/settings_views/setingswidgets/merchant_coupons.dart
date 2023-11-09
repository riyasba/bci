import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:clipboard/clipboard.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class MerchantCoupons extends StatefulWidget {
  const MerchantCoupons({super.key});

  @override
  State<MerchantCoupons> createState() => _CouponsState();
}

class _CouponsState extends State<MerchantCoupons> {
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    profileController.merchantCoupon();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<ProfileController>(builder: (_) {
        return Container(
          //height: size.height * 0.55,
          child: profileController.merchantCouponData.isEmpty
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
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: kblue),
                      )
                    ],
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: profileController.merchantCouponData.length,
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
                                          .merchantCouponData[index].image ==
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
                                            .merchantCouponData[index].image),
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
                                  profileController.merchantCouponData[index].title,
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
                                  profileController.merchantCouponData[index].description,
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
                                                  .merchantCouponData[index]
                                                  .couponCode,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: kwhite),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: (){
                                            FlutterClipboard.copy(
                                                    profileController.merchantCouponData[index].couponCode.toString())
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
                                              color: kblue,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Copy",
                                                style: primaryFont.copyWith(
                                                    color: Colors.white),
                                              ),
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
