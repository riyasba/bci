import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/screens/members/flight_booking_screens/flight_loading_page.dart';
import 'package:bci/screens/members/manual_payment_options/phone_pe_service_booking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

paymentBottomSheet(BuildContext context, double amount, String servicesId) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(15), topStart: Radius.circular(15))),
      context: context,
      builder: (context) {
        return Container(
            height: 350,
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
                                final profileCn = Get.find<ProfileController>();

                                profileCn.isWalletOrNot(0);
                              },
                              child: Text(
                                "Payment from UPI/CARD/Online Bank",
                                style: primaryFont.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                final profileCn = Get.find<ProfileController>();

                                profileCn.isWalletOrNot(0);
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
                                      color: Get.find<ProfileController>()
                                                  .isWalletOrNot
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
                                final profileCn = Get.find<ProfileController>();

                                profileCn.isWalletOrNot(1);
                              },
                              child: Text("Payment from Wallet",
                                  style: primaryFont.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ),
                            InkWell(
                              onTap: () {
                                final profileCn = Get.find<ProfileController>();

                                profileCn.isWalletOrNot(1);
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
                                      color: Get.find<ProfileController>()
                                                  .isWalletOrNot
                                                  .value ==
                                              1
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
                                final profileCn = Get.find<ProfileController>();

                                profileCn.isWalletOrNot(2);
                              },
                              child: Text("Payment from BCI Credit",
                                  style: primaryFont.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ),
                            InkWell(
                              onTap: () {
                                final profileCn = Get.find<ProfileController>();

                                profileCn.isWalletOrNot(2);
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
                                      color: Get.find<ProfileController>()
                                                  .isWalletOrNot
                                                  .value ==
                                              2
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
                          if (Get.find<ProfileController>()
                                  .isWalletOrNot
                                  .value ==
                              0) {
                            Get.find<ProfileController>()
                                .initiatePayment(amount: amount);
                          } else if (Get.find<ProfileController>()
                                  .isWalletOrNot
                                  .value ==
                              1) {
                            Get.find<ProfileController>().payFromWallet(
                                amount: amount.toStringAsFixed(2));
                          } else if (Get.find<ProfileController>()
                                  .isWalletOrNot
                                  .value ==
                              2) {
                            Get.find<ProfileController>().useCredit(
                                creditAmount: amount.toStringAsFixed(2),
                                creditFor: "booking",
                                creditForId: servicesId);
                          }
                          Get.back();
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: korange,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          child: Text(
                            "Pay now",
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
