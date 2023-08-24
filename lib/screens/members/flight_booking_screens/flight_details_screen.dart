import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/flight_booking_models/air_search_model.dart';
import 'package:bci/models/flight_booking_models/flight_search_data_model.dart';
import 'package:bci/screens/members/flight_booking_screens/air_seat_map_screen_view.dart';
import 'package:bci/screens/members/flight_booking_screens/plane_details_scree.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../../constands/app_fonts.dart';

class FlightDetailsScreen extends StatefulWidget {
  Flight flight;
  FlightSearchDataModel flightSearchDataModel;
  String searchKey;
  FlightDetailsScreen(
      {super.key,
      required this.flight,
      required this.flightSearchDataModel,
      required this.searchKey});

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  var numberController = TextEditingController();
  final flightController = Get.find<FlightsController>();
  final profileController = Get.find<ProfileController>();


  @override
  Widget build(BuildContext context) {
    return Container(
      color: kblue,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView(children: [
            Column(
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
                          child:
                              Image.asset('assets/images/parflaightback.png')),
                      Text(
                        'Flight Details',
                        style: TextStyle(fontSize: 20, color: kwhite),
                      )
                    ],
                  ),
                ),
                ksizedbox30,
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Stack(
                    children: [
                      InkWell(
                        child: Container(
                          height: 650.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(),
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
                                          color: kwhite),
                                    ],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, top: 19),
                                          child: Text(
                                            'From',
                                            style: TextStyle(
                                                fontSize: 20, color: kblue),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 85, top: 20),
                                          child: Text(
                                            'To',
                                            style: TextStyle(
                                                color: kblue, fontSize: 19),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, top: 19),
                                          child: Text(
                                            widget
                                                .flightSearchDataModel.fromIata,
                                            style: TextStyle(
                                                fontSize: 15, color: kblue),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 105, top: 20),
                                          child: Text(
                                            widget.flightSearchDataModel.toIata,
                                            style: TextStyle(
                                                color: kblue, fontSize: 15),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 28, top: 19.h),
                                          child: Container(
                                            width: 120,
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              widget.flightSearchDataModel
                                                  .fromName,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 13, color: kblue),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 22, top: 19.h),
                                          child: Container(
                                            width: 120,
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              widget
                                                  .flightSearchDataModel.toName,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: kblue, fontSize: 13),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    ksizedbox10,
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.error,
                                            color: kblue,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                    ksizedbox30,
                                    Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Column(children: [
                                            Image.asset(
                                              'assets/images/parflaightdown1.png',
                                              color: kblue,
                                            ),
                                            const SizedBox(
                                              height: 65,
                                            ),
                                            Image.asset(
                                              'assets/images/parflaightdown3.png',
                                              color: kblue,
                                            ),
                                            const SizedBox(
                                              height: 65,
                                            ),
                                            Image.asset(
                                              'assets/images/parflaightdown.png',
                                              color: kblue,
                                            ),
                                          ]),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 95, top: 120.h),
                                          child: Container(
                                            child: Transform.rotate(
                                              angle: -math.pi / 2.0,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                        color: kOrange,
                                                        shape: BoxShape.circle),
                                                  ),
                                                  Text(
                                                    '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ',
                                                    style:
                                                        TextStyle(color: kgrey),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                        color: kOrange,
                                                        shape: BoxShape.circle),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 120,
                                          top: 20.h,
                                          child: Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 18),
                                                    child: Text(
                                                      widget
                                                          .flight
                                                          .segments
                                                          .first
                                                          .departureDateTime
                                                          .split(" ")
                                                          .first,
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xff8C8AAf)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 35, top: 5.h),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.schedule,
                                                          size: 13,
                                                        ),
                                                        Text(
                                                          widget
                                                              .flight
                                                              .segments
                                                              .first
                                                              .departureDateTime
                                                              .split(" ")
                                                              .last,
                                                          style: const TextStyle(
                                                              fontSize: 14,
                                                              color: Color(
                                                                  0xff8C8AAf)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              ksizedbox40,
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 30.h),
                                                    child: Text(
                                                      'Duration: ${widget.flight.segments.first.duration}',
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xff8C8AAf)),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: widget
                                                                .flight
                                                                .segments
                                                                .length ==
                                                            1
                                                        ? const Text('Non stop',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff8C8AAF)))
                                                        : Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child: Container(
                                                              width: 200,
                                                              child: FittedBox(
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                                child: Text(
                                                                    '${widget.flight.segments.length - 1} stop, via ${widget.flight.segments.first.destinationCity} ',
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            11,
                                                                        color: Color(
                                                                            0xff8C8AAF))),
                                                              ),
                                                            ),
                                                          ),
                                                  )
                                                ],
                                              ),
                                              ksizedbox40,
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 50, left: 30),
                                                child: Container(
                                                  width: 120,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        widget
                                                            .flight
                                                            .segments
                                                            .first
                                                            .arrivalDateTime
                                                            .split(" ")
                                                            .first,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xff8C8AAf)),
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.schedule,
                                                            size: 13,
                                                          ),
                                                          Text(
                                                              widget
                                                                  .flight
                                                                  .segments
                                                                  .first
                                                                  .arrivalDateTime
                                                                  .split(" ")
                                                                  .last,
                                                              style: const TextStyle(
                                                                  fontSize: 14,
                                                                  color: Color(
                                                                      0xff8C8AAf))),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -5,
                        right: -1,
                        child: Column(children: [
                          Image.asset('assets/images/parflaightclipath.png'),
                        ]),
                      ),
                      Positioned(
                          top: 15,
                          right: 15,
                          child: Image.asset(
                            'assets/images/flaightswap.png',
                            color: kwhite,
                          )),
                    ],
                  ),
                ),
                ksizedbox10,
                Obx(
                  () => flightController.isLoading.isTrue
                      ? Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                kyellow,
                                kOrange,
                              ]),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () async {
                             try {
  String flightKey =
     await flightController.getFlightRepricing(
         flightSearchModel:
             widget.flightSearchDataModel,
         flight: widget.flight,
         searchKey: widget.searchKey,
         mobileNumber: profileController
             .profileData.first.mobile);
              bool isSeatMapvailable = await flightController
                                  .getSeatMapApiServises(
                                      searchKey: widget.searchKey,
                                      flightKey: flightKey,
                                      paxDetails: [
                                    {
                                      "Pax_Id": 1,
                                      "Pax_type": 0,
                                      "Title": "Mr",
                                      "First_Name": "Testing",
                                      "Last_Name": "Sample",
                                      "Gender": 0,
                                      "Age": null,
                                      "DOB": null,
                                      "Passport_Number": null,
                                      "Passport_Issuing_Country": null,
                                      "Passport_Expiry": null,
                                      "Nationality": null,
                                      "FrequentFlyerDetails": null
                                    }
                                  ]);

                              if (isSeatMapvailable) {
                                Get.to(() => AirSeatMapScreenView(
                                  flight: widget.flight,
                                  flightSearchDataModel: widget.flightSearchDataModel,
                                      flightKey: widget.flight.flightKey,
                                      paxDetails: const [
                                        {
                                          "Pax_Id": 1,
                                          "Pax_type": 0,
                                          "Title": "Mr",
                                          "First_Name": "Testing",
                                          "Last_Name": "Sample",
                                          "Gender": 0,
                                          "Age": null,
                                          "DOB": null,
                                          "Passport_Number": null,
                                          "Passport_Issuing_Country": null,
                                          "Passport_Expiry": null,
                                          "Nationality": null,
                                          "FrequentFlyerDetails": null
                                        }
                                      ],
                                      searchKey: widget.searchKey,
                                    ));
                              } else {
                                Get.to(PlaneDetailsScreen(
                                  flight: widget.flight,
                                  flightSearchDataModel:
                                      widget.flightSearchDataModel,
                                  seachKey: widget.searchKey,
                                ));
                              }
} on Exception catch (e) {
  // TODO
  Get.to(PlaneDetailsScreen(
                                flight: widget.flight,
                                flightSearchDataModel:
                                    widget.flightSearchDataModel,
                                seachKey: widget.searchKey,
                              ));
}
                           
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
                                'Next',
                                style: TextStyle(color: kwhite, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                ),
                ksizedbox10,
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
