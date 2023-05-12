import 'package:bci/constands/constands.dart';
import 'package:bci/screens/members/flight_booking_screens/plane_details_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../../constands/app_fonts.dart';

class FlightDetailsScreen extends StatefulWidget {
  const FlightDetailsScreen({super.key});

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  var numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kblue,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView(
            children:[ Column(
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
                                          offset: Offset(0.0, 0.75),
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
                                            'JFK',
                                            style: TextStyle(
                                                fontSize: 15, color: kblue),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 108, top: 20),
                                          child: Text(
                                            'BTJ',
                                            style: TextStyle(
                                                color: kblue, fontSize: 15),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(
                                              left: 28, top: 19.h),
                                          child: Text(
                                            'John F. Kennedy \nAirport',
                                            style: TextStyle(
                                                fontSize: 15, color: kblue),
                                          ),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(
                                              left: 22, top: 5.h),
                                          child: Text(
                                            'Abbotsford National \nAirport',
                                            style: TextStyle(
                                                color: kblue, fontSize: 15),
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
                                    Divider(),
                                    ksizedbox30,
                                    Stack(
                                      children: [
                                        Column(children: [
                                          Image.asset(
                                            'assets/images/parflaightdown1.png',
                                            color: kblue,
                                          ),
                                          SizedBox(
                                            height: 65,
                                          ),
                                          Image.asset(
                                            'assets/images/parflaightdown3.png',
                                            color: kblue,
                                          ),
                                          SizedBox(
                                            height: 65,
                                          ),
                                          Image.asset(
                                            'assets/images/parflaightdown.png',
                                            color: kblue,
                                          ),
                                        ]),
                                        Padding(
                                          padding:  EdgeInsets.only(
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
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 18),
                                                child: Text(
                                                  '24 October',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xff8C8AAf)),
                                                ),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(
                                                    right: 35, top: 5.h),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.schedule,
                                                      size: 13,
                                                    ),
                                                    Text(
                                                      '19:00',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff8C8AAf)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              ksizedbox40,
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                         EdgeInsets.only(
                                                            left: 27, top: 30.h),
                                                    child: Text(
                                                      'Duration: 2h 55min',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff8C8AAf)),
                                                    ),
                                                  ),
                                                  Text('Non Stop',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff8C8AAf)))
                                                ],
                                              ),
                                              ksizedbox40,
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                         EdgeInsets.only(
                                                            right: 18, top: 50.h),
                                                    child: Text(
                                                      '31 October',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff8C8AAf)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 40),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.schedule,
                                                          size: 13,
                                                        ),
                                                        Text('21:55',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xff8C8AAf))),
                                                      ],
                                                    ),
                                                  )
                                                ],
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
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                          top: Radius.circular(26.0),
                        )),
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              height: 340.h,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  ksizedbox40,
                                  Text(
                                    'Flights Details',
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  ksizedbox20,
                                  Text(
                                    'Enter your mobile phone number',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  ksizedbox40,
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 25),
                                    child: TextField(
                                      controller: numberController,
                                      decoration: InputDecoration(
                                          prefixIcon: Image.asset(
                                              'assets/images/flaightindiaimage.png'),
                                          suffixIcon: Image.asset(
                                              'assets/images/flaightcorrectimage.png'),
                                          hintText: '(+91) 9876543210',
                                          helperStyle:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ),
                                  ksizedbox40,
                                  InkWell(
                                    onTap: () {
                                      Get.to(PlaneDetailsScreen());
                                    },
                                    child: Container(
                                      height: 45,
                                      width:
                                          MediaQuery.of(context).size.width * 0.7,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            kyellow,
                                            kOrange,
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                        child: Text(
                                          'Send ',
                                          style: TextStyle(
                                              color: kwhite, fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
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
                        'Send Me',
                        style: TextStyle(color: kwhite, fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
            ]
          ),
        ),
      ),
    );
  }
}
