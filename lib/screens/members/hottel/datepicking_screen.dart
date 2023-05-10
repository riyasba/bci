import 'package:bci/screens/members/hottel/wigets/dropdown.dart';
import 'package:bci/screens/members/hottel/wigets/sucsessful.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../constands/constands.dart';

class Datepicker_screen_hotel extends StatefulWidget {
  const Datepicker_screen_hotel({super.key});

  @override
  State<Datepicker_screen_hotel> createState() => _Datepicker_screen_hotelState();
}

class _Datepicker_screen_hotelState extends State<Datepicker_screen_hotel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F8FD),
      body: ListView(physics: BouncingScrollPhysics(), children: [TableCalendar(
  firstDay: DateTime.utc(2010, 10, 16),
  lastDay: DateTime.utc(2030, 3, 14),
  focusedDay: DateTime.now(),
),
   ksizedbox30,   //  Image.asset('assets/images/Group 5823(1).png',
       //     height: 500, fit: BoxFit.cover),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Tuesday\n06 Nov 2023',
              style: TextStyle(color: kblue, fontSize: 16),
            ),
            Image.asset('assets/images/Repeat Grid 3.png'),
            Text(
              'Tuesday\n06 Nov 2023',
              style: TextStyle(color: kblue, fontSize: 16),
            ),
          ],
        ),
        ksizedbox20,
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text( 
                'Guest',
                style: TextStyle(
                    fontSize: 25, color: kblue, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                "Adult  3   children's  2",
                style: TextStyle(color: kblue),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                'Rooms',
                style: TextStyle(
                    fontSize: 25, color: kblue, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Dropdown_hotel(
          options: ['option1 ','otion2'],
          label: 'Room Choose Ac or Non Ac',
        ),
        ksizedbox40,
        ksizedbox20,
        InkWell(
          onTap: () {
            Get.to(Sucessful_screen_hotel());
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
              width: double.infinity,
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  24,
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
              child: Text(
                'Play',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
     ksizedbox40 ]),
      appBar: AppBar(
        backgroundColor: Color(0xFFF9F8FD),
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              'assets/images/Icon awesome-arrow-right.png',
            )),
        title: Text(
          'Hotel Booking',
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.w500, color: kblue),
        ),
      ),
    );
  }
}
