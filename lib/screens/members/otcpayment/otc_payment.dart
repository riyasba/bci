import 'dart:io';

import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/get_plans_model.dart';
import 'package:bci/payment_gateway/payment_gateway_view/payment_view.dart';
import 'package:bci/screens/members/otcpayment/member_sub_successful.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../bussiness/views/home_screen/contact_admin.dart';
import 'add_to_wallet.dart';

class OtcPayment extends StatefulWidget {
  PlansData plansData;
  OtcPayment({super.key, required this.plansData});

  @override
  State<OtcPayment> createState() => _OtcPaymentState();
}

class _OtcPaymentState extends State<OtcPayment> {
  final homeController = Get.find<HomeController>();
  var redeemCouponController = TextEditingController();

  final profileController = Get.find<ProfileController>();

  static MethodChannel _channel = MethodChannel('easebuzz');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150.h,
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
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        'Payment',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(const ContactAdmin());
                        },
                        child: Image.asset(
                            'assets/images/3669173_help_ic_icon.png'))
                  ],
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 11, 15, 11),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Image.network(
              widget.plansData.cardImg,
              height: 200,
            ),
            ksizedbox30,
            Row(
              children: [
                Text(
                  widget.plansData.title,
                  style:
                      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            ksizedbox10,
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "₹${widget.plansData.saleAmount}",
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            ksizedbox20,
            Text(
              widget.plansData.planDescription,
              style: TextStyle(fontSize: 16.sp),
            ),
            ksizedbox30,
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     // controller: _controller,
            //     decoration: InputDecoration(
            //         hintText: 'Enter Coupon',
            //         hintStyle: TextStyle(fontSize: 17.sp, color: kgrey),
            //         fillColor: kwhite,
            //         focusColor: kwhite,
            //         isDense: true,
            //         filled: true,
            //         border: OutlineInputBorder(
            //           borderSide: BorderSide(color: kblue),
            //           borderRadius: BorderRadius.circular(4.0),
            //         ),
            //         // suffixIcon:
            //         //     Image.asset('assets/images/Icon awesome-copy.png'),
            //             ),
            //   ),
            // ),
            // ksizedbox10,
            ksizedbox10,
            Text(
              'Promo Code',
              style: TextStyle(
                  fontSize: 16.5, color: kblue, fontWeight: FontWeight.w500),
            ),
            ksizedbox10,
            TextField(
              controller: redeemCouponController,
              decoration: InputDecoration(
                disabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                hintText: 'Enter Your Coupon code',
                fillColor: kwhite,
                focusColor: kwhite,
                isDense: true,
                filled: true,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 20,
                    width: 130,
                    decoration: BoxDecoration(
                      color: kblue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () async {
                        String tempSaleAmount = widget.plansData.saleAmount;
                        String amount =
                            await profileController.redeemSubscriptionCoupon(
                                couponcode: redeemCouponController.text);

                        double tAmount = double.parse(amount);
                        double tempSaleAmounz = double.parse(tempSaleAmount);

                        if (tAmount < tempSaleAmounz) {
                          double totalAmountTobeAdded =
                              tempSaleAmounz - tAmount;

                          setState(() {
                            widget.plansData.saleAmount =
                                totalAmountTobeAdded.toStringAsFixed(0);
                          });
                        } else {
                          Get.rawSnackbar(
                              message:
                                  "Coupon is not applicable for this subscription",
                              backgroundColor: Colors.red);
                        }
                      },
                      child: Center(
                        child: Text(
                          'Redeem Now',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ksizedbox40,
            InkWell(
              onTap: () async {
             await   Get.find<ProfileController>().getProfile();
                print(
                    ">>>>>>>>>>>>>>>>>..............payment start..........>>>>>>>>>>${widget.plansData.id}");
                    // if(Platform.isIOS){
                                  Get.offAll(() => PaymentWebView(
                                  payOpt: "",
                                  payType: 1,
                                  planId: widget.plansData.id,
                                  totalAmount: widget.plansData.saleAmount,
                                  userId: Get.find<ProfileController>().profileData.first.id
                                      .toString(),
                                ));
                                // profileController.payForSubscribe(id: widget.plansData.id,userId: Get.find<ProfileController>().profileData.first.id);
                //                 }else{

                //                    profileController.payfoSubscription(
                //   id: widget.plansData.id,
                //   amount: double.parse(widget.plansData.saleAmount),
                // );

                //                 }
               
                // profileController.payUseingEaseBuzzSubs(
                //     id: widget.plansData.id,
                //     amount: widget.plansData.saleAmount,
                //     customerName: profileController.profileData.first.name
                //         .trim()
                //         .split(" ")
                //         .first,
                //     email: profileController.profileData.first.email,
                //     phone: profileController.profileData.first.mobile,
                //     status: "");
                print(
                    ">>>>>>>>>>>>>>>>>..............payment end..........>>>>>>>>>>");
                // {
                //  String access_key = "Access key generated by the Initiate Payment API";
                //  String pay_mode = """This will either be "test" or "production""";
                //  Object parameters =
                //   {
                //     "access_key":access_key,
                //     "pay_mode":pay_mode
                //    };
                //  final payment_response = await _channel.invokeMethod("payWithEasebuzz", parameters);
                //  }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFFF5C29),
                        Color(0xFFFFCD38),
                      ],
                    ),
                  ),
                  child: Text(
                    'Proceed To Payment',
                    style: TextStyle(
                        fontSize: 28.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            ksizedbox40
          ],
        ),
      ),
    );
  }
}
