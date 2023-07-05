import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../flaight_depareture.dart';
import '../../flaight_returnscreen.dart';

class FlightOneWayDateRange extends StatefulWidget {
  const FlightOneWayDateRange({super.key});

  @override
  State<FlightOneWayDateRange> createState() =>
      _FlightDestinationChooserState();
}

class _FlightDestinationChooserState extends State<FlightOneWayDateRange> {
  final flightsController = Get.find<FlightsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GetBuilder<FlightsController>(builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Departure",
                  style: primaryFont.copyWith(
                      color: kblue, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                ksizedbox20,
                InkWell(
                  onTap: () {
                    Get.to(FlightDeparetureSCreen());
                  },
                  child: flightsController.isDepatureDateSelected.isTrue
                      ? Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(7)),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              formatDate(flightsController.depatureDate,
                                  [dd, "-", mm, "-", yyyy]),
                              style: primaryFont.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(7)),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.date_range,
                            color: kwhite,
                          ),
                        ),
                )
              ],
            );
          }),
          // Column(
          //   children: [
          //     Image.asset("assets/images/flight_booking/Group 443.png"),
          //     ksizedbox10,
          //     Row(
          //       children: [
          //         Container(
          //           height: 10,
          //           width: 10,
          //           decoration: BoxDecoration(
          //               color: korange.withOpacity(0.8),
          //               borderRadius: BorderRadius.circular(10)),
          //         ),
          //         Text(
          //           " ------------- ",
          //           style: primaryFont.copyWith(
          //               letterSpacing: 4, color: Colors.grey.withOpacity(0.5)),
          //         ),
          //         Container(
          //           height: 10,
          //           width: 10,
          //           decoration: BoxDecoration(
          //               border: Border.all(color: kblue),
          //               borderRadius: BorderRadius.circular(10)),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       "Return",
          //       style: primaryFont.copyWith(
          //           color: kblue, fontSize: 16, fontWeight: FontWeight.w500),
          //     ),
          //     ksizedbox20,
          //     InkWell(
          //       onTap: () {
          //         Get.to(const FlaightReturnScreen());
          //       },
          //       child: Container(
          //         height: 30,
          //         width: 90,
          //         decoration: BoxDecoration(
          //             color: kblue, borderRadius: BorderRadius.circular(7)),
          //         alignment: Alignment.center,
          //         child: Text(
          //           "Choose",
          //           style: primaryFont.copyWith(color: Colors.white),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
