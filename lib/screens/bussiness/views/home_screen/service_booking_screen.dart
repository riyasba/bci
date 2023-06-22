import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constands/constands.dart';

class ServiceBookingScreen extends StatefulWidget {
  const ServiceBookingScreen({super.key});

  @override
  State<ServiceBookingScreen> createState() => _ServiceBookingScreenState();
}

class _ServiceBookingScreenState extends State<ServiceBookingScreen> {
  List serviceimages = [
    'assets/images/salonservice.png',
    'assets/images/tripservice.png',
    'assets/images/flightservice.png',
    'assets/images/stayroom.png',
    'assets/images/jewellreyservice.png'
  ];
  List title = [
    'Salon Services',
    'Trip Services  ',
    'Flight Services  ',
    'Stay Room           ',
    'Jewellry            ',
  ];
  List description = [
    'More cutting and beauty makeups and \nmore services expecting our salon',
    'I am travel and help full u branches \nsupport just kind of supports,\ntrip support',
    'Flight book for travel more business \nclass tickets booking we \nwill support and guide you       ',
    'Reference site about Lorem Ipsum \ngiving information as origin as well \nas a random Lipsum generator',
    '  Reference site about Lorem Ipsum \ngiving information as origin as well \nas a random Lipsum generator'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 158,
              color: kblue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: kwhite,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      'Service Booking Request',
                      style: TextStyle(
                          fontSize: 23,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset('assets/images/helps.png'),
                  )
                ],
              ),
            ),
          )),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    'Service Request',
                    style: TextStyle(
                        fontSize: 23,
                        color: kblue,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: serviceimages.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ksizedbox30,
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: kwhite,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: const Offset(0.0, 0.75),
                                    blurRadius: 5,
                                    color: kgrey)
                              ]),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 8, bottom: 8),
                                child: Container(
                                  height: 200,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: kwhite, shape: BoxShape.circle),
                                  child: Image.asset(
                                    serviceimages[index],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 80,top: 10),
                                    child: Text(
                                      title[index].toString(),
                                      style: TextStyle(
                                          fontSize: 19.5,
                                          color: kblue,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 5,left: 5
                                      ),
                                      child: Text(description[index].toString(),
                                      style: TextStyle(
                                        fontSize: 12.5,
                                        color: kblue
                                      ),),
                                    )
                                ],
                              ),
                          
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                })
          ],
        ),
      ]),
    );
  }
}
