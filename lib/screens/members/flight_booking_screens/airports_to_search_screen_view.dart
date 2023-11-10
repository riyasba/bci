import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/screens/members/flight_booking_screens/widgets/flight_booking_widgets/flight_search_widgets.dart';
import 'package:flutter/material.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/screens/members/flight_booking_screens/plane_details_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../../constands/app_fonts.dart';
import '../hottel/wigets/search.dart';

class AirportSearchScreenChoose2 extends StatefulWidget {
  const AirportSearchScreenChoose2({super.key});

  @override
  State<AirportSearchScreenChoose2> createState() =>
      _flightScreenChoose2State();
}

class _flightScreenChoose2State extends State<AirportSearchScreenChoose2> {
  final flightsController = Get.find<FlightsController>();

  @override
  void initState() {
    super.initState();
    setDefault();
  }

  setDefault() async {
    WidgetsBinding.instance.addPostFrameCallback((timings) {
      flightsController.searchlistsearchList.clear();
      flightsController.airPortFound(false);
      flightsController.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Container(
        color: kblue,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: ListView(children: [
              Column(children: [
                ksizedbox20,
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child:
                              Image.asset('assets/images/parflaightback.png')),
                      Text(
                        'To',
                        style: TextStyle(fontSize: 20, color: kwhite),
                      )
                    ],
                  ),
                ),
                ksizedbox10,
                FlightSearchWidgets2(),
                ksizedbox10,
                Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Stack(children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            height: _mediaQuery.height > 700 ? 600 : 540.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: const Offset(0.0, 0.75),
                                      blurRadius: 5,
                                      color: kwhite),
                                ],
                                borderRadius: BorderRadius.circular(5)),
                            child: GetBuilder<FlightsController>(builder: (_) {
                              return flightsController
                                          .searchlistsearchList.isEmpty &&
                                      flightsController.airPortFound.isTrue
                                  ? const Center(
                                      child: Text("No airports found"),
                                    )
                                  : flightsController
                                          .searchlistsearchList.isEmpty
                                      ? const Center(
                                          child: Text("Search City, Airports"),
                                        )
                                      : Column(children: [
                                          // Padding(
                                          //   padding:
                                          //       const EdgeInsets.only(top: 15, left: 20),
                                          //   child: Row(
                                          //     children: [
                                          //       Text(
                                          //         'Recently Searched',
                                          //         style:
                                          //             TextStyle(fontSize: 21, color: kblue),
                                          //       )
                                          //     ],
                                          //   ),
                                          // ),
                                          ksizedbox10,
                                          for (int i = 0;
                                              i <
                                                  flightsController
                                                      .searchlistsearchList
                                                      .length;
                                              i++)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: InkWell(
                                                onTap: () {
                                                  flightsController.destination(
                                                      flightsController
                                                          .searchlistsearchList[
                                                              i]
                                                          .airportcode);
                                                  flightsController
                                                      .destinationFullName(
                                                          flightsController
                                                              .searchlistsearchList[
                                                                  i]
                                                              .city);

                                                  flightsController
                                                      .destinationCountry(
                                                          flightsController
                                                              .searchlistsearchList[
                                                                  i]
                                                              .countrycode);

                                                  Get.back();
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    minimumSize:
                                                                        const Size(
                                                                            30,
                                                                            25),
                                                                    backgroundColor:
                                                                        kblue),
                                                            onPressed: () {},
                                                            child: Text(
                                                              flightsController
                                                                  .searchlistsearchList[
                                                                      i]
                                                                  .airportcode,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                      child: Text(
                                                        flightsController
                                                            .searchlistsearchList[
                                                                i]
                                                            .city,
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                        child: Text(
                                                            flightsController
                                                                .searchlistsearchList[
                                                                    i]
                                                                .status,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    15.sp)))
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ]);
                            }),
                          ))
                    ]))
              ])
            ]))));
  }
}
