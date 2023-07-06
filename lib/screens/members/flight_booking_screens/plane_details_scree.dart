import 'package:bci/constands/constands.dart';
import 'package:bci/models/flight_booking_models/air_search_model.dart';
import 'package:bci/models/flight_booking_models/flight_search_data_model.dart';
import 'package:bci/screens/members/flight_booking_screens/flaight_orderdetails.dart';
import 'package:bci/screens/members/flight_booking_screens/plane_economy_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../../constands/app_fonts.dart';

class PlaneDetailsScreen extends StatefulWidget {
  Flight flight;
  FlightSearchDataModel flightSearchDataModel;
  PlaneDetailsScreen(
      {super.key, required this.flight, required this.flightSearchDataModel});
  @override
  State<PlaneDetailsScreen> createState() => _PlaneDetailsScreenState();
}

class _PlaneDetailsScreenState extends State<PlaneDetailsScreen> {
  var numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      color: kblue,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              ksizedbox40,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset('assets/images/parflaightback.png')),
                    Text(
                      'Plane Details',
                      style: TextStyle(fontSize: 20, color: kwhite),
                    )
                  ],
                ),
              ),
              ksizedbox20,
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        // Get.to(PlaneEconomyDetailsScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.65,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      blurRadius: 5,
                                      color: kwhite),
                                ],
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 40),
                                  child: Row(
                                    children: [
                                      Text(
                                        widget
                                            .flight.segments.first.airlineName,
                                        style: TextStyle(
                                            fontSize: 22.5.sp,
                                            color: kblue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${widget.flight.segments.first.aircraftType} ${widget.flight.segments.first.airlineCode}',
                                        style: TextStyle(
                                            fontSize: 19.sp, color: kblue),
                                      )
                                    ],
                                  ),
                                ),
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.only(left: 20, top: 30),
                                //   child: Row(
                                //     children: [
                                //       Text(
                                //         'Customer Rating',
                                //         style: TextStyle(
                                //             fontSize: 19.sp, color: kyellow),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.only(left: 20, top: 10),
                                //   child: Row(
                                //     children: [
                                //       Icon(
                                //         Icons.star,
                                //         color: kyellow,
                                //       ),
                                //       Icon(
                                //         Icons.star,
                                //         color: kyellow,
                                //       ),
                                //       Icon(
                                //         Icons.star,
                                //         color: kyellow,
                                //       ),
                                //       Icon(
                                //         Icons.star,
                                //         color: kyellow,
                                //       ),
                                //       Icon(
                                //         Icons.star_half,
                                //         color: kyellow,
                                //       )
                                //     ],
                                //   ),
                                // ),
                                ksizedbox10,

                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 20.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Model \n${widget.flight.segments.first.flightNumber}',
                                        style: TextStyle(
                                          fontSize: 19.sp,
                                          color: kblue,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 30.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Class \n${widget.flightSearchDataModel.cabinClass == 0 ? "Economy" : widget.flightSearchDataModel.cabinClass == 1 ? "Business" : "First Class"}',
                                        style: TextStyle(
                                          fontSize: 19.sp,
                                          color: kblue,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Divider(),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 30.h),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Baggage',
                                            style: TextStyle(
                                                fontSize: 19.sp,
                                                color: kblue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Check In Baggage: ${widget.flight.fares.last.fareDetails.last.freeBaggage.checkInBaggage}',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: kblue,
                                            ),
                                          ),
                                          Text(
                                            'Hand Baggage      : ${widget.flight.fares.last.fareDetails.last.freeBaggage.handBaggage}',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: kblue,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Positioned(
                        top: 60,
                        right: -1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image.asset('assets/images/flaightimage.png'),
                        ))
                  ],
                ),
              ),
              //button
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: InkWell(
                  onTap: () {
                    Get.to(FlaightOrderDetailsScreen(
                        flight: widget.flight,
                        flightSearchDataModel: widget.flightSearchDataModel));
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          kyellow,
                          kOrange,
                        ]),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: TextStyle(color: kwhite, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        // bottomNavigationBar: Container(
        //   height: 100.h,
        //   width: MediaQuery.of(context).size.width,
        //   decoration: BoxDecoration(color: kwhite),
        //   child: Column(
        //     children: [
        //       ksizedbox10,
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           Container(
        //             height: 50,
        //             width: 50,
        //             decoration:
        //                 BoxDecoration(shape: BoxShape.circle, color: kgrey),
        //             child: Image.asset('assets/images/flaightwifi.png'),
        //           ),
        //           Container(
        //             height: 50,
        //             width: 50,
        //             decoration:
        //                 BoxDecoration(shape: BoxShape.circle, color: kgrey),
        //             child: Image.asset('assets/images/flaightbaggage.png'),
        //           ),
        //           Container(
        //             height: 50,
        //             width: 50,
        //             decoration:
        //                 BoxDecoration(shape: BoxShape.circle, color: kyellow),
        //             child: Image.asset(
        //               'assets/images/flaightmeal.png',
        //             ),
        //           )
        //         ],
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(left: 9),
        //             child: Text(
        //               'Wi-Fi',
        //               style: TextStyle(fontSize: 16, color: kblue),
        //             ),
        //           ),
        //           Text(
        //             'Baggage 10Kg',
        //             style: TextStyle(fontSize: 16, color: kblue),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.only(right: 10),
        //             child: Text(
        //               'Meal',
        //               style: TextStyle(color: kblue, fontSize: 16),
        //             ),
        //           )
        //         ],
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
