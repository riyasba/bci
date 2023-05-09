import 'package:bci/constands/constands.dart';
import 'package:bci/screens/members/flight_booking_screens/flaight_orderdetails.dart';
import 'package:bci/screens/members/flight_booking_screens/plane_economy_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constands/app_fonts.dart';

class EconomyBoardingScreen extends StatefulWidget {
  const EconomyBoardingScreen({super.key});

  @override
  State<EconomyBoardingScreen> createState() => _EconomyBoardingScreenState();
}

class _EconomyBoardingScreenState extends State<EconomyBoardingScreen> {
  var numberController = TextEditingController();
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
                ksizedbox30,
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
                        'Boarding Pass',
                        style: TextStyle(fontSize: 20, color: kwhite),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
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
                                    blurRadius: 10,
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
                                          fontSize: 20.5, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 120, top: 20),
                                    child: Text(
                                      'To',
                                      style: TextStyle(
                                          color: kblue, fontSize: 20.5),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 27, top: 20),
                                    child: Text(
                                      'JFK',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 148, top: 20),
                                    child: Text(
                                      'BTJ',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 27, top: 20),
                                    child: Text(
                                      'John F. Kennedy \nAirport',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 60, top: 20),
                                    child: Text(
                                      'Abbotsford National \nAirport',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 27, top: 20),
                                    child: Text(
                                      'Terminal\n\n 54',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 115, top: 20),
                                    child: Text(
                                      'Gate \n\n12',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 27, top: 30),
                                    child: Text(
                                      'Seat \n\n24H',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 140, top: 30),
                                    child: Text(
                                      'Boarding \n\n14:54',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 27, top: 30),
                                    child: Text(
                                      'Date \n\n30.10.2019',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 100, top: 30),
                                    child: Text(
                                      'Flight \n\nTK 2411',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 10,
                              color: kwhite)
                        ]),
                    child: Center(
                        child: Image.asset(
                      'assets/images/flaightboarding.png',
                      fit: BoxFit.fitHeight,
                      height: 180,
                    )),
                  ),
                ),
                ksizedbox20,
                InkWell(
                  onTap: () {
                    Get.to(FlaightOrderDetailsScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [kyellow, korange]),
                        borderRadius: BorderRadius.circular(20)),
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Center(
                      child: Text(
                        'Confirmation',
                        style: TextStyle(color: kwhite, fontSize: 17),
                      ),
                    ),
                  ),
                ),
                ksizedbox20,
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
