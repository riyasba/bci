import 'package:bci/constands/constands.dart';
import 'package:bci/screens/members/holiday/booking.dart';
import 'package:bci/screens/members/holiday/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Holiday_Home extends StatelessWidget {
  const Holiday_Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F8FD),
      appBar: AppBar(
        backgroundColor: Color(0xFFF9F8FD),
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/images/Icon awesome-arrow-right.png')),
        title: Text(
          'Plan your trip with us.',
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.w800, color: kblue),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 55,
              child: TextFormField(
                  // controller: _controller,
                  decoration: InputDecoration(
                hintText: 'Search',
                fillColor: Color(0xFFFFFFFF),
                focusColor: Colors.grey[200],
                isDense: true,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5, color: Colors.grey.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(19.0),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              )),
            ),
          ),
          ksizedbox30,
          Row(
            children: [
              kwidth10,
              Text(
                'Categories',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          ksizedbox20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/mountains.png'),
                      Text('Mountains')
                    ],
                  ),
                ),
                height: 38,
                width: 110,
                decoration: BoxDecoration(
                    color: kwhite, borderRadius: BorderRadius.circular(14)),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/beach.png'),
                      Text('Beaches')
                    ],
                  ),
                ),
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    color: kwhite, borderRadius: BorderRadius.circular(14)),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/history-svgrepo-com (3).png'),
                      Text('Historicals')
                    ],
                  ),
                ),
                height: 38,
                width: 100,
                decoration: BoxDecoration(
                    color: kwhite, borderRadius: BorderRadius.circular(14)),
              ),
            ],
          ),
          ksizedbox40,
          Row(
            children: [
              kwidth10,
              Text(
                'Populars',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              kwidth10,
            ],
          ),
          ksizedbox40,
          InkWell(onTap: (){Get.to(Holiday_booking());},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Holiday_containors(),
                Holiday_containors(),
              ],
            ),
          ),
          ksizedbox30,
          Row(
            children: [
              kwidth10,
              Text(
                'Recommended',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          ksizedbox30,
          Container(height: 70,
            child: ListView(physics: BouncingScrollPhysics(),
              shrinkWrap: true,scrollDirection: Axis.horizontal,
              children: [
                holiday_widget2(),kwidth10,
                holiday_widget2(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container holiday_widget2() {
    return Container(
              decoration: BoxDecoration(
                  color: kwhite, borderRadius: BorderRadius.circular(25)),
              width: 200,
              height: 69,
              child: Row(
                children: [
                  Image.asset('assets/images/pexels-senuscape-1658967.png'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Grindelwald',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              'Jordan',
                              style: TextStyle(fontSize: 13, color: kgrey),
                            ),
                            Image.asset(
                                'assets/images/location-svgrepo-com (1).png'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
  }
}
