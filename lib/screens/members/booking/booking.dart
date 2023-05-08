import 'package:bci/screens/members/booking/widget/booking_hotels_containers.dart';
import 'package:bci/screens/members/booking/widget/holiday_containers.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../constands/constands.dart';
import '../../../views/business/notification_screen.dart';
import '../../../views/home_screen/contact_admin.dart';

class Members_booking extends StatefulWidget {
  const Members_booking({super.key});

  @override
  State<Members_booking> createState() => _Members_bookingState();
}

class _Members_bookingState extends State<Members_booking> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: kwhite,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: Column(
              children: [
                ClipPath(
                  clipper: SinCosineWaveClipper(),
                  child: Container(
                    height: 150,
                    color: kblue,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              'Bookings',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kwhite),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Get.to(ContactAdmin());
                              },
                              child: Image.asset(
                                  'assets/images/3669173_help_ic_icon.png'))
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                      automaticIndicatorColorAdjustment: true,
                      //  isScrollable: true,
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
                      tabs: [
                        Tab(
                          text: "Flight",
                        ),
                        Tab(
                          text: "Hotel",
                        ),
                        Tab(
                          text: "Holidays",
                        )
                      ]),
                ),
              ],
            )),
        body: TabBarView(children: [
          bookings_containers(),
          Holiays_containors(),
          Holiays_containors()
        ]),
      ),
    );
  }
}
