import 'package:bci/screens/members/booking/widget/Flight_view.dart';
import 'package:bci/screens/members/booking/widget/booking_hotels_containers.dart';
import 'package:bci/screens/members/booking/widget/bus_booking.dart';
import 'package:bci/screens/members/booking/widget/holiday_containers.dart';
import 'package:bci/screens/members/booking/widget/others_bookings_view.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../constands/constands.dart';

import '../../bussiness/views/home_screen/contact_admin.dart';

class MembersBooking extends StatefulWidget {
  const MembersBooking({super.key});

  @override
  State<MembersBooking> createState() => _MembersBookingState();
}

class _MembersBookingState extends State<MembersBooking> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: kwhite,
        appBar: PreferredSize(
            preferredSize:const Size.fromHeight(200),
            child: Column(
              children: [
                ClipPath(
                  clipper: SinCosineWaveClipper(),
                  child: Container(
                    height: 150,
                    color: kblue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Bookings',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: kwhite),
                          ),
                        ),
                        // InkWell(
                        //     onTap: () {
                        //       Get.to(const ContactAdmin());
                        //     },
                        //     child: Image.asset(
                        //         'assets/images/3669173_help_ic_icon.png'))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TabBar(
                      automaticIndicatorColorAdjustment: true,
                        isScrollable: true,
                      labelColor: kwhite,
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: kblue),
                      onTap: (value) {
                        setState(() {
                          index = value;
                        });
                      },
                      tabs:const [
                        Tab(
                          text: "Flight",
                        ),
                        Tab(
                          text: "Bus",
                        ),
                        Tab(
                          text: "Hotel",
                        ),
                        Tab(
                          text: "Holidays",
                        ),
                        Tab(
                          text: "Others",
                        ),
                      ]),
                ),
              ],
            )),
        body:const TabBarView(
          children: [
          FlightWidget (), 
          BusContainers(), 
          HotelBookingScreen(),
          HoliaysContainors(),
          OthersBookingsView(),
        ]),
      ),
    );
  }
}
