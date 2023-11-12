import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/auth_controllers.dart';

couponFilter(BuildContext context) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(15), topStart: Radius.circular(15))),
      context: context,
      builder: (context) {
        return Container(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                final profileCn = Get.find<AuthController>();

                                profileCn.filteringIndex(0);
                              },
                              child: Text(
                                "Latest Coupons",
                                style: primaryFont.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                final profileCn = Get.find<AuthController>();

                                profileCn.filteringIndex(0);
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.black)),
                                alignment: Alignment.center,
                                child: Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Get.find<AuthController>()
                                                  .filteringIndex
                                                  .value ==
                                              0
                                          ? kblue
                                          : Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                final profileCn = Get.find<AuthController>();

                                profileCn.filteringIndex(1);
                              },
                              child: Text("Old Coupons",
                                  style: primaryFont.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ),
                            InkWell(
                              onTap: () {
                                final profileCn = Get.find<AuthController>();

                                profileCn.filteringIndex(1);
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.black)),
                                alignment: Alignment.center,
                                child: Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Get.find<AuthController>()
                                                  .filteringIndex
                                                  .value ==
                                              1
                                          ? kblue
                                          : Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {
                          if (Get.find<AuthController>().filteringIndex.value ==
                              0) {
//low to high
                            Get.find<AuthController>().addedCouponList =
                                Get.find<AuthController>().tempaddedCouponList;
                          } else {
//high to low
                            Get.find<AuthController>().addedCouponList =
                                Get.find<AuthController>()
                                    .tempaddedCouponList
                                    .reversed
                                    .toList();
                          }
                          Get.find<AuthController>().update();
                          Get.back();
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: korange,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          child: Text(
                            "Filter",
                            style: primaryFont.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
      });
}
