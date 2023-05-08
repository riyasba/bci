import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlightBookingHeader extends StatefulWidget {
  const FlightBookingHeader({super.key});

  @override
  State<FlightBookingHeader> createState() => _FlightBookingHeaderState();
}

class _FlightBookingHeaderState extends State<FlightBookingHeader> {
  final flightBookingController = Get.find<FlightsController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.35,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "assets/images/flight_booking/above-aeroplane-aircraft-engine-91217.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              )),
        ),
        Positioned(
            left: 5,
            top: 3,
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Image.asset('assets/images/Back.png'))),
        Positioned(
          bottom: 2,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 7, right: 7),
            child: Obx(
              () => Container(
                height: 55,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 2, right: 2, top: 2, bottom: 2),
                      child: InkWell(
                        onTap: () {
                          flightBookingController.wayIndex(0);
                        },
                        child: Container(
                          height: 55,
                          width: size.width * 0.45,
                          decoration: BoxDecoration(
                              color: flightBookingController.wayIndex.value == 0
                                  ? kOrange
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/flight_booking/Group.png",
                                  height: 20,
                                  color:
                                      flightBookingController.wayIndex.value ==
                                              0
                                          ? kwhite
                                          : kblue,
                                ),
                                Text(
                                  "One Way",
                                  style: primaryFont.copyWith(
                                    fontSize: 14,
                                    color: flightBookingController
                                                .wayIndex.value ==
                                            0
                                        ? kwhite
                                        : kblue,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 2, right: 2, top: 2, bottom: 2),
                      child: InkWell(
                        onTap: () {
                          flightBookingController.wayIndex(1);
                        },
                        child: Container(
                          height: 55,
                          width: size.width * 0.45,
                          decoration: BoxDecoration(
                              color: flightBookingController.wayIndex.value == 1
                                  ? kOrange
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/flight_booking/Swap.png",
                                  height: 20,
                                  color:
                                      flightBookingController.wayIndex.value ==
                                              1
                                          ? kwhite
                                          : kblue,
                                ),
                                Text(
                                  "Round Trip",
                                  style: primaryFont.copyWith(
                                    fontSize: 14,
                                    color: flightBookingController
                                                .wayIndex.value ==
                                            1
                                        ? kwhite
                                        : kblue,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 120,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fly to Your",
                style: primaryFont.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w200),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "Dreams".toUpperCase(),
                style: primaryFont.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}
