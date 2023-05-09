import 'package:bci/constands/constands.dart';
import 'package:bci/screens/members/flight_booking_screens/economy_bordingpass_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../../constands/app_fonts.dart';

class PlaneEconomyDetailsScreen extends StatefulWidget {
  const PlaneEconomyDetailsScreen({super.key});

  @override
  State<PlaneEconomyDetailsScreen> createState() =>
      _PlaneEconomyDetailsScreenState();
}

class _PlaneEconomyDetailsScreenState extends State<PlaneEconomyDetailsScreen> {
  List whiteseats = [
    'assets/images/flaightseats.png',
    'assets/images/flaightseats.png',
    'assets/images/flaightseats.png',
    'assets/images/flaightseats.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
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
                        'Plane Details',
                        style: TextStyle(fontSize: 20, color: kwhite),
                      )
                    ],
                  ),
                ),
                ksizedbox30,
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: kwhite, borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffE9585D),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * 0.4,
                                      45)),
                              onPressed: () {
                                Get.to(EconomyBoardingScreen());
                              },
                              child: Text(
                                'Economy',
                                style: TextStyle(fontSize: 17),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 75),
                          child: InkWell(
                            onTap: () {
                              Get.to(EconomyBoardingScreen());
                            },
                            child: Text(
                              'Business',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ksizedbox30,
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Row(
                    children: [
                      Text(
                        'Economy  ',
                        style: TextStyle(
                            fontSize: 22,
                            color: kwhite,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          '72 Seats Available',
                          style: TextStyle(fontSize: 21.5, color: kwhite),
                        ),
                      )
                    ],
                  ),
                ),
                ksizedbox20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/images/flaightseats.png'),
                    Image.asset('assets/images/flaightseats.png'),
                    Image.asset('assets/images/flaightseats.png'),
                    Image.asset('assets/images/flaightseats.png'),
                    Text(
                      'A',
                      style: TextStyle(fontSize: 16, color: kyellow),
                    ),
                    Image.asset('assets/images/flaightseats.png'),
                    Image.asset('assets/images/flaightseats.png'),
                    Image.asset('assets/images/flaightyellowseats.png'),
                    Image.asset('assets/images/flaightseats.png')
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Text(
                        'B',
                        style: TextStyle(fontSize: 16, color: kyellow),
                      ),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightyellowseats.png')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Text(
                        'C',
                        style: TextStyle(fontSize: 16, color: kyellow),
                      ),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightyellowseats.png'),
                      Image.asset('assets/images/flaightyellowseats.png')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightyellowseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Text(
                        'D',
                        style: TextStyle(fontSize: 16, color: kyellow),
                      ),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightyellowseats.png'),
                      Image.asset('assets/images/flaightyellowseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightyellowseats.png'),
                      Text(
                        'E',
                        style: TextStyle(fontSize: 16, color: kyellow),
                      ),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/flaightyellowseats.png'),
                      Image.asset('assets/images/flaightyellowseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Text(
                        'F',
                        style: TextStyle(fontSize: 16, color: kyellow),
                      ),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'Exit',
                          style: TextStyle(fontSize: 14, color: kwhite),
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          'Exit',
                          style: TextStyle(fontSize: 14, color: kwhite),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Text(
                        'G',
                        style: TextStyle(fontSize: 16, color: kyellow),
                      ),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightyellowseats.png'),
                      Image.asset('assets/images/flaightyellowseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Text(
                        'H',
                        style: TextStyle(fontSize: 16, color: kyellow),
                      ),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightyellowseats.png'),
                      Image.asset('assets/images/flaightyellowseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Text(
                        'I',
                        style: TextStyle(fontSize: 16, color: kyellow),
                      ),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightyellowseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Text(
                        'J',
                        style: TextStyle(fontSize: 16, color: kyellow),
                      ),
                      Image.asset('assets/images/flaightyellowseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Text(
                        'K',
                        style: TextStyle(fontSize: 16, color: kyellow),
                      ),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                      Image.asset('assets/images/flaightyellowseats.png'),
                      Image.asset('assets/images/flaightseats.png'),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
