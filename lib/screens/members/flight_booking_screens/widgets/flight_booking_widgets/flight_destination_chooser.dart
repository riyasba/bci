import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/screens/members/flight_booking_screens/flaight_screen_choose.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../flaight_screen_choose2.dart';

class FlightDestinationChooser extends StatefulWidget {
  const FlightDestinationChooser({super.key});

  @override
  State<FlightDestinationChooser> createState() =>
      _FlightDestinationChooserState();
}

class _FlightDestinationChooserState extends State<FlightDestinationChooser> {
  final flightController = Get.find<FlightsController>();

  @override
  void initState() {
    super.initState();
    flightController.origin("Choose");
    flightController.destination("Choose");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From",
                  style: primaryFont.copyWith(
                      color: kblue, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                ksizedbox20,
                InkWell(
                  onTap: () {
                    Get.to(const flightScreenChoose(),
                        transition: Transition.cupertino,
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 800));
                  },
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                        color: kblue, borderRadius: BorderRadius.circular(7)),
                    alignment: Alignment.center,
                    child: Text(
                      flightController.origin.value,
                      style: primaryFont.copyWith(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Image.asset("assets/images/flight_booking/Group 443.png"),
                ksizedbox10,
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: korange.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Text(
                      " ------------- ",
                      style: primaryFont.copyWith(
                          letterSpacing: 4,
                          color: Colors.grey.withOpacity(0.5)),
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          border: Border.all(color: kblue),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "To",
                  style: primaryFont.copyWith(
                      color: kblue, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                ksizedbox20,
                InkWell(
                  onTap: () {
                    Get.to(const flightScreenChoose2(),
                        transition: Transition.cupertino,
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 800));
                  },
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                        color: kblue, borderRadius: BorderRadius.circular(7)),
                    alignment: Alignment.center,
                    child: Text(
                      flightController.destination.value,
                      style: primaryFont.copyWith(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
