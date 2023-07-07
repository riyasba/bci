import 'package:bci/controllers/flights_controller.dart';
import 'package:flutter/material.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/screens/members/flight_booking_screens/plane_details_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../../constands/app_fonts.dart';
import '../hottel/wigets/search.dart';

class flightScreenChoose extends StatefulWidget {
  const flightScreenChoose({super.key});

  @override
  State<flightScreenChoose> createState() => _flightScreenChooseState();
}

class _flightScreenChooseState extends State<flightScreenChoose> {
  final flightsController = Get.find<FlightsController>();

  @override
  void initState() {
    super.initState();
    setDefault();
  }

  setDefault() async {
    WidgetsBinding.instance.addPostFrameCallback((timings) {
      flightsController.airports.clear();
      flightsController.airPortFound(false);
      flightsController.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQurey = MediaQuery.of(context).size;
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
                        'From',
                        style: TextStyle(fontSize: 20, color: kwhite),
                      )
                    ],
                  ),
                ),
                ksizedbox10,
                search2(),
                ksizedbox10,
                Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Stack(children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            height: _mediaQurey.height > 700 ? 600 : 540.h,
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
                              return flightsController.airports.isEmpty &&
                                      flightsController.airPortFound.isTrue
                                  ? const Center(
                                      child: Text("No airports found"),
                                    )
                                  : flightsController.airports.isEmpty
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
                                                      .airports.length;
                                              i++)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: InkWell(
                                                onTap: () {
                                                  flightsController.origin(
                                                      flightsController
                                                          .airports[i].iata);
                                                  flightsController.originFullName(
                                                      flightsController
                                                          .airports[i].name);

                                                    

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
                                                                  .airports[i]
                                                                  .iata,
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
                                                            .airports[i].name,
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
                                                                .airports[i]
                                                                .dst,
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
