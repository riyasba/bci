import 'package:calender_picker/calender_picker.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constands/constands.dart';

class BusinessBookingScreen extends StatefulWidget {
  const BusinessBookingScreen({super.key});

  @override
  State<BusinessBookingScreen> createState() => _BusinessBookingScreenState();
}

class _BusinessBookingScreenState extends State<BusinessBookingScreen> {
  DateTime _dateTime = DateTime.now();
  List bookingimage = [
    'assets/images/bookingcar.png',
    'assets/images/bookingflight.png',
    'assets/images/bookingroom.png'
  ];
  List bookingtitle = [
    'Car Service Book',
    'Flight Booki Services',
    'Hotel Room Book Service',
  ];
  List bookingdescription = [
    'Want to get your Car Serviced \nOr Repaired? Book Now. \nPitstop offers Car Care Services at \nyour doorstep in Bangalore through \nour network of branded and multi \nbrand car service garages.',
    'A new pricing model would charge \npassengers according to the travel \nhabits revealed in their online search \nhistory.',
    'Discover luxury hotel \naccommodation at Aman \nTokyo, situated near the Imperial \nPalace Gardens in Tokyo, Japan. \nChoose from rooms and suites \nwith a view.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(280),
          child: Stack(children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: kOrange,
            ),
            ClipPath(
              clipper: SinCosineWaveClipper(),
              child: Container(
                height: 158,
                color: kblue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        'Bookings',
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                    ),
                    Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset('assets/images/helps.png'),
                  )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 150,
              child: Container(
              
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: Text(formatDate(_dateTime, [M,',',yyyy,  ],),style: TextStyle(color: kwhite,fontSize: 18) ,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: CalenderPicker(
                        DateTime.now(),
                        initialSelectedDate: DateTime.now(),
                        selectionColor: kOrange,
                        selectedTextColor: kblue,
                        onDateChange: (date) {
                          setState(() {
                            _dateTime = date;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ])),
      body: Column(
        children: [
          ListView.builder(
              itemCount: bookingimage.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              height: 180,
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 5, right: 10, bottom: 10),
                                child: Image.asset(
                                  bookingimage[index],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bookingtitle[index].toString(),
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,color: kblue),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      bookingdescription[index].toString(),
                                      style:
                                          TextStyle(fontSize: 12, color: kblue),

                                    ),
                                  ),
                                  
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                     
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
