import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/models/flight_booking_models/flight_search_data_model.dart';
import 'package:bci/screens/members/flight_booking_screens/par_nyc_screen.dart';
import 'package:bci/screens/members/flight_booking_screens/widgets/flight_booking_widgets/flight_dates_choosers.dart';
import 'package:bci/screens/members/flight_booking_screens/widgets/flight_booking_widgets/flight_destination_chooser.dart';
import 'package:bci/screens/members/flight_booking_screens/widgets/flight_booking_widgets/flight_landing_screen_header.dart';
import 'package:bci/screens/members/flight_booking_screens/widgets/flight_booking_widgets/flight_one_way_date_chooser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlightBookingLandingScreen extends StatefulWidget {
  const FlightBookingLandingScreen({super.key});

  @override
  State<FlightBookingLandingScreen> createState() =>
      _FlightBookingLandingScreenState();
}

class _FlightBookingLandingScreenState
    extends State<FlightBookingLandingScreen> {
  final flightBookingController = Get.find<FlightsController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            FlightBookingHeader(),
            ksizedbox20,
            FlightDestinationChooser(),
            ksizedbox20,
            const Divider(
              thickness: 1,
            ),
            ksizedbox10,
            flightBookingController.wayIndex.value == 1
                ? FlightDateRange()
                : FlightOneWayDateRange(),
            ksizedbox20,
            const Divider(
              thickness: 1,
            ),
            ksizedbox10,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Cabin Class",
                style: primaryFont.copyWith(
                    color: kblue, fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
            ),
            ksizedbox20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    flightBookingController.cabinClassIndex(0);
                  },
                  child: Column(
                    children: [
                      Text(
                        'Economy',
                        style: TextStyle(fontSize: 15, color: kgrey),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:
                                flightBookingController.cabinClassIndex.value ==
                                        0
                                    ? korange
                                    : kwhite),
                        height: 5,
                        width: 30,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    flightBookingController.cabinClassIndex(1);
                  },
                  child: Column(
                    children: [
                      Text(
                        'Business',
                        style: TextStyle(fontSize: 15, color: kgrey),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:
                                flightBookingController.cabinClassIndex.value ==
                                        1
                                    ? korange
                                    : kwhite),
                        height: 5,
                        width: 30,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    flightBookingController.cabinClassIndex(2);
                  },
                  child: Column(
                    children: [
                      Text(
                        'First Class',
                        style: TextStyle(fontSize: 15, color: kgrey),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:
                                flightBookingController.cabinClassIndex.value ==
                                        2
                                    ? korange
                                    : kwhite),
                        height: 5,
                        width: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
            ksizedbox20,
            const Divider(
              thickness: 1,
            ),
            ksizedbox10,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Passengers",
                style: primaryFont.copyWith(
                    color: kblue, fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
            ),
            ksizedbox20,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    '1 Adult',
                    style: TextStyle(fontSize: 15, color: kgrey),
                  ),
                ),
                Image.asset('assets/images/Group 447.png'),
              ],
            ),
            ksizedbox20,
            Divider(
              thickness: 1,
            ),
            ksizedbox10,
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 42, right: 41),
                child: flightBookingController.isLoading.isTrue
                    ? Container(
                        width: double.infinity,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFFFF5C29),
                              Color(0xFFFFCD38),
                            ],
                          ),
                        ),
                        child: const CupertinoActivityIndicator(
                          color: Colors.white,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          FlightSearchDataModel flightSearchDataModel =
                              FlightSearchDataModel(
                                  adultsCount: 1,
                                  cabinClass: flightBookingController
                                      .cabinClassIndex.value,
                                  childCount: 0,
                                  depatureDate:
                                      flightBookingController.depatureDate,
                                  fromIata:
                                      flightBookingController.origin.value,
                                  isOneWayOrRoundTrip:
                                      flightBookingController.wayIndex.value,
                                  returnDate:
                                      flightBookingController.returnDate,
                                  toIata: flightBookingController
                                      .destination.value);

                          flightBookingController.airSearch(
                              flightSearchModel: flightSearchDataModel);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFFFF5C29),
                                Color(0xFFFFCD38),
                              ],
                            ),
                          ),
                          child: const Text(
                            'Search Flights',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
              ),
            ),
            ksizedbox40
          ],
        ),
      ),
    );
  }
}
