import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/hotel_booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

filterHotelBooking(BuildContext context) {
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
                                final profileCn =
                                    Get.find<HotelBookingController>();

                                profileCn.filteringIndex(0);
                              },
                              child: Text(
                                "Price Low - High",
                                style: primaryFont.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                final profileCn =
                                    Get.find<HotelBookingController>();

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
                                      color: Get.find<HotelBookingController>()
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
                                final profileCn =
                                    Get.find<HotelBookingController>();

                                profileCn.filteringIndex(1);
                              },
                              child: Text("Price High - Low",
                                  style: primaryFont.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ),
                            InkWell(
                              onTap: () {
                                final profileCn =
                                    Get.find<HotelBookingController>();

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
                                      color: Get.find<HotelBookingController>()
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
                          if (Get.find<HotelBookingController>()
                                  .filteringIndex
                                  .value ==
                              0) {
//low to high
                            Get.find<HotelBookingController>()
                                .filterHotelDataLowToHigh();
                          } else {
//high to low
                            Get.find<HotelBookingController>()
                                .filterHotelDataHightoLow();
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
