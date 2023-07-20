import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/models/flight_booking_models/flight_search_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlightFilterScreen extends StatefulWidget {
  FlightSearchDataModel flightSearchModel;
  FlightFilterScreen({super.key, required this.flightSearchModel});

  @override
  State<FlightFilterScreen> createState() => _FlightFilterScreenState();
}

class _FlightFilterScreenState extends State<FlightFilterScreen> {
  final flightController = Get.find<FlightsController>();

  bool isNonStopFlight = false;
  bool isOneStopConnectingFlights = false;
  bool isAllFlight = false;

  @override
  void initState() {
    super.initState();
  }

  resetFilters() async {
    setState(() {
      flightController.isAirIndia(false);
      flightController.isAirAsia(false);
      flightController.isGoFirst(false);
      flightController.isSpiceJet(false);

      isNonStopFlight = false;
      isOneStopConnectingFlights = false;
      isAllFlight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Filter",
          style: primaryFont.copyWith(color: kblue),
        ),
        iconTheme: IconThemeData(color: kblue),
      ),
      body: Obx(
        () => ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Airlines",
                style: primaryFont.copyWith(
                    color: kblue, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.all(kblue),
                  value: flightController.isAirIndia.value,
                  onChanged: (bool? value) {
                    setState(() {
                      flightController.isAirIndia(value!);
                      flightController.indiGo(!value);
                      flightController.isAirAsia(!value);
                      flightController.isGoFirst(!value);
                      flightController.isSpiceJet(!value);
                    });
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Air india",
                  style: primaryFont.copyWith(
                      color: kblue, fontWeight: FontWeight.w400, fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.all(kblue),
                  value: flightController.indiGo.value,
                  onChanged: (bool? value) {
                    setState(() {
                      flightController.isAirIndia(!value!);
                      flightController.indiGo(value);
                      flightController.isAirAsia(!value);
                      flightController.isGoFirst(!value);
                      flightController.isSpiceJet(!value);
                    });
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "IndiGo",
                  style: primaryFont.copyWith(
                      color: kblue, fontWeight: FontWeight.w400, fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.all(kblue),
                  value: flightController.isAirAsia.value,
                  onChanged: (bool? value) {
                    setState(() {
                      flightController.isAirIndia(!value!);
                      flightController.indiGo(!value);
                      flightController.isAirAsia(value);
                      flightController.isGoFirst(!value);
                      flightController.isSpiceJet(!value);
                    });
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Air Asia",
                  style: primaryFont.copyWith(
                      color: kblue, fontWeight: FontWeight.w400, fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.all(kblue),
                  value: flightController.isGoFirst.value,
                  onChanged: (bool? value) {
                    setState(() {
                      flightController.isAirIndia(!value!);
                      flightController.indiGo(!value);
                      flightController.isAirAsia(!value);
                      flightController.isGoFirst(value);
                      flightController.isSpiceJet(!value);
                    });
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Go First",
                  style: primaryFont.copyWith(
                      color: kblue, fontWeight: FontWeight.w400, fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.all(kblue),
                  value: flightController.isSpiceJet.value,
                  onChanged: (bool? value) {
                    setState(() {
                      flightController.isAirIndia(!value!);
                      flightController.indiGo(!value);
                      flightController.isAirAsia(!value);
                      flightController.isGoFirst(!value);
                      flightController.isSpiceJet(value);
                    });
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "SpiceJet",
                  style: primaryFont.copyWith(
                      color: kblue, fontWeight: FontWeight.w400, fontSize: 16),
                )
              ],
            ),
            // const SizedBox(
            //   height: 15,
            // ),
            // const Divider(
            //   thickness: 1.5,
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 15),
            //   child: Text(
            //     "Flight Stops",
            //     style: primaryFont.copyWith(
            //         color: kblue, fontSize: 16, fontWeight: FontWeight.w600),
            //   ),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            // Row(
            //   children: [
            //     Checkbox(
            //       checkColor: Colors.white,
            //       shape: CircleBorder(),
            //       fillColor: MaterialStateProperty.all(kblue),
            //       value: isNonStopFlight,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           isNonStopFlight = value!;
            //         });
            //       },
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     Text(
            //       "Non Stop Flights",
            //       style: primaryFont.copyWith(
            //           color: kblue, fontWeight: FontWeight.w400, fontSize: 16),
            //     )
            //   ],
            // ),
            // Row(
            //   children: [
            //     Checkbox(
            //       checkColor: Colors.white,
            //       shape: CircleBorder(),
            //       fillColor: MaterialStateProperty.all(kblue),
            //       value: isOneStopConnectingFlights,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           isOneStopConnectingFlights = value!;
            //         });
            //       },
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     Text(
            //       "1 Stop Connecting flights",
            //       style: primaryFont.copyWith(
            //           color: kblue, fontWeight: FontWeight.w400, fontSize: 16),
            //     )
            //   ],
            // ),
            // Row(
            //   children: [
            //     Checkbox(
            //       checkColor: Colors.white,
            //       shape: CircleBorder(),
            //       fillColor: MaterialStateProperty.all(kblue),
            //       value: isAllFlight,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           isAllFlight = value!;
            //         });
            //       },
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     Text(
            //       "All flights",
            //       style: primaryFont.copyWith(
            //           color: kblue, fontWeight: FontWeight.w400, fontSize: 16),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: InkWell(
                  onTap: () {
                    resetFilters();
                    String airlineCode = "";

                    flightController.airSearch(
                        flightSearchModel: widget.flightSearchModel,
                        airlineCode: airlineCode);

                    Get.back();
                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    alignment: Alignment.center,
                    child: Text(
                      "Reset",
                      style: primaryFont.copyWith(
                          color: kblue,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: InkWell(
                    onTap: () async {
                      String airlineCode = "";
                      if (flightController.isAirAsia.isTrue) {
                        airlineCode = "I5";
                      } else if (flightController.isAirIndia.isTrue) {
                        airlineCode = "AI";
                      } else if (flightController.isSpiceJet.isTrue) {
                        airlineCode = "SG";
                      } else if (flightController.isGoFirst.isTrue) {
                        airlineCode = "GOW";
                      } else if (flightController.indiGo.isTrue) {
                        airlineCode = "6E";
                      }

                      flightController.airSearch(
                          flightSearchModel: widget.flightSearchModel,
                          airlineCode: airlineCode);

                      Get.back();
                    },
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kblue),
                      alignment: Alignment.center,
                      child: Text(
                        "Done",
                        style: primaryFont.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                  //  : Container(
                  //         height: 55,
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             color: kblue),
                  //         alignment: Alignment.center,
                  //         child: const CircularProgressIndicator(
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
