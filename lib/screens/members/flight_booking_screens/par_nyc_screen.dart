import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/models/flight_booking_models/flight_search_data_model.dart';
import 'package:bci/screens/members/flight_booking_screens/flight_details_screen.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constands/app_fonts.dart';

class ParNycSCreen extends StatefulWidget {
  FlightSearchDataModel flightSearchDataModel;
  ParNycSCreen({super.key, required this.flightSearchDataModel});

  @override
  State<ParNycSCreen> createState() => _ParNycSCreenState();
}

class _ParNycSCreenState extends State<ParNycSCreen> {
  final flightsController = Get.find<FlightsController>();

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kblue,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                height: _mediaQuery.height > 700 ? 210 : 250.h,
                width: MediaQuery.of(context).size.width,
                child: ListView(children: [
                  Column(
                    children: [
                      Row(children: [
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                                'assets/images/parflaightback.png')),
                        Text(
                          '${widget.flightSearchDataModel.fromIata} - ${widget.flightSearchDataModel.toIata}',
                          style: TextStyle(color: kwhite, fontSize: 20),
                        )
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 15),
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                  'assets/images/parflaightcalendar.png'),
                            ),
                          ),
                          if (widget
                                  .flightSearchDataModel.isOneWayOrRoundTrip ==
                              1)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, right: 60),
                              child: Image.asset(
                                  'assets/images/parflaightcalendar.png'),
                            ),
                        ],
                      ),
                      ksizedbox10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Text(
                                  formatDate(
                                    widget.flightSearchDataModel.depatureDate,
                                    [
                                      '',
                                      DD,
                                      '',
                                    ],
                                  ),
                                  style: TextStyle(color: kwhite, fontSize: 14),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 20),
                                child: Text(
                                    formatDate(
                                        widget
                                            .flightSearchDataModel.depatureDate,
                                        [dd, MM, yyyy]),
                                    style:
                                        TextStyle(color: kwhite, fontSize: 14)),
                              )
                            ],
                          ),
                          if (widget
                                  .flightSearchDataModel.isOneWayOrRoundTrip ==
                              1)
                            Image.asset(
                              'assets/images/pardoubleflaight.png',
                              color: kwhite,
                              fit: BoxFit.fitWidth,
                              width: 35,
                              height: 50,
                            ),
                          if (widget
                                  .flightSearchDataModel.isOneWayOrRoundTrip ==
                              1)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  formatDate(
                                    widget.flightSearchDataModel.returnDate,
                                    [
                                      '',
                                      DD,
                                      '',
                                    ],
                                  ),
                                  style: TextStyle(color: kwhite, fontSize: 14),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, right: 10),
                                  child: Text(
                                      formatDate(
                                          widget
                                              .flightSearchDataModel.returnDate,
                                          [dd, MM, yyyy]),
                                      style: TextStyle(
                                          color: kwhite, fontSize: 14)),
                                )
                              ],
                            ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/parflaightperson.png',
                              color: kwhite,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 20, top: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.flightSearchDataModel.adultsCount} Adult',
                              style: TextStyle(color: kwhite),
                            ),
                            Text(
                              widget.flightSearchDataModel.cabinClass == 0
                                  ? 'Economy'
                                  : widget.flightSearchDataModel.cabinClass == 1
                                      ? "Business"
                                      : widget.flightSearchDataModel
                                                  .cabinClass ==
                                              2
                                          ? "First Class"
                                          : "",
                              style: TextStyle(color: kwhite),
                            )
                          ],
                        ),
                      ),
                      ksizedbox30
                    ],
                  ),
                ]),
              ),
              ksizedbox20,
              for (int i = 0; i < flightsController.flightList.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(FlightDetailsScreen(
                            flight: flightsController.flightList[i],
                            flightSearchDataModel: widget.flightSearchDataModel,
                          ));
                        },
                        child: Container(
                          height: 240,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              height: 210,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: kwhite,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        offset: const Offset(0.0, 0.75),
                                        blurRadius: 5,
                                        color: kgrey),
                                  ],
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 20),
                        child: Row(
                          children: [
                            Text(
                              flightsController
                                  .flightList[i].segments.first.airlineName,
                              style: TextStyle(fontSize: 18, color: kblue),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 120, left: 20),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/parflaight.png',
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: korange.withOpacity(0.8),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  Text(
                                    " -------------------------- ",
                                    style: primaryFont.copyWith(
                                        letterSpacing: 4,
                                        color: Colors.grey.withOpacity(0.5)),
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: kblue),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          left: 0,
                          right: 0,
                          top: 95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Duration : ${flightsController.flightList[i].segments.last.duration}',
                                style:
                                    const TextStyle(color: Color(0xff8C8AAF)),
                              ),
                            ],
                          )),
                      Positioned(
                          left: 0,
                          right: 0,
                          top: 110,
                          child: Center(
                            child: flightsController
                                        .flightList[i].segments.length ==
                                    1
                                ? const Text('Non stop',
                                    style: TextStyle(color: Color(0xff8C8AAF)))
                                : Text(
                                    '${flightsController.flightList[i].segments.length - 1} stop, via ${flightsController.flightList[i].segments.first.destinationCity} ',
                                    style: const TextStyle(
                                        color: Color(0xff8C8AAF))),
                          )),
                      Positioned(
                          left: 62,
                          top: 155,
                          child: Text(flightsController
                              .flightList[i].segments.first.departureDateTime
                              .split(" ")
                              .last)),
                      Positioned(
                          right: 50,
                          top: 155,
                          child: Text(flightsController
                              .flightList[i].segments.last.arrivalDateTime
                              .split(" ")
                              .last)),
                      Positioned(
                        bottom: 160,
                        right: 2,
                        child: Column(children: [
                          Image.asset('assets/images/parflaightclipath.png'),
                        ]),
                      ),
                      Positioned(
                          top: 15,
                          right: 10,
                          child: Text(
                            '₹ ${flightsController.flightList[i].fares.first.fareDetails.first.totalAmount}',
                            style: TextStyle(color: kwhite, fontSize: 14),
                          )),
                      Positioned(
                        bottom: -10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kblue,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.expand_less,
                                color: kwhite,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ]),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 1.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
