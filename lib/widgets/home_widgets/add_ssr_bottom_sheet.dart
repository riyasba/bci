import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/screens/members/flight_booking_screens/flight_loading_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

addSsrDetails(BuildContext context, int index, var size) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(15), topStart: Radius.circular(15))),
      context: context,
      builder: (context) {
        return GetBuilder<FlightsController>(builder: (flightsController) {
          return Container(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0;
                                i < flightsController.ssrDetailsList.length;
                                i++)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 60,
                                    width: size.width,
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            final profileCn =
                                                Get.find<ProfileController>();

                                            profileCn.isWalletOrNot(0);
                                          },
                                          child: Text(
                                            flightsController
                                                .ssrDetailsList[i].ssrTypeName,
                                            style: primaryFont.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            final profileCn =
                                                Get.find<ProfileController>();

                                            profileCn.isWalletOrNot(0);
                                          },
                                          child: Text(
                                          "₹${flightsController
                                                .ssrDetailsList[i].totalAmount}",
                                            style: primaryFont.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      final profileCn =
                                          Get.find<ProfileController>();

                                      profileCn.isWalletOrNot(0);
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border:
                                              Border.all(color: Colors.black)),
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
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
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {
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
      });
}
