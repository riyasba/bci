import 'package:bci/screens/members/hottel/wigets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'dart:math' as math;
import '../../../constands/constands.dart';
import 'final_booking.dart';

class Hotel extends StatelessWidget {
  const Hotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhite,
        title: Text(
          'Hello',
          style: TextStyle(color: Colors.grey),
        ),
        actions: [],
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/images/Group 5814.png')),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Find Your hotel',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Padding(padding: const EdgeInsets.all(8.0), child: search()),
            ],
          ),
        ),
      ),
      backgroundColor: kwhite,
      body: ListView(physics: BouncingScrollPhysics(),
        children: [
          ksizedbox10,
          Row(
            children: [
              Text(
                'Popular Hotels',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          ksizedbox10,
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(color: kwhite, boxShadow: <BoxShadow>[
              BoxShadow(offset: Offset(0.0, 0.75), blurRadius: 0, color: kwhite)
            ]),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18)),
                      height: 150,
                      width: 150,
                      child: Column(
                        children: [
                          Image.asset(
                              'assets/images/apartment-bed-bedroom-1743229.png'),
                          Text(
                            'Sulthans Dine',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Chennai, India',
                            style: TextStyle(color: Colors.grey),
                          ),
                          ksizedbox10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  '₹180/night',
                                  style: TextStyle(color: kblue),
                                ),
                              ),
                              Text(
                                '4.5*',
                                style: TextStyle(color: kblue),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Hot Packages',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                          'assets/images/ialicante-mediterranean-homes-8_V45fGyWz4-unsplash.png'),
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'The Westin Dhaka',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'Chennai, India',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              '₹180/night',
                              style: TextStyle(color: kblue),
                            ),
                            ksizedbox10,
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/Group 5816(1).png',
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.fitHeight,
                                ),
                                Image.asset(
                                  'assets/images/aa.png',
                                  height: 50,
                                  width: 50,
                                ),
                                Image.asset(
                                  'assets/images/Group 5817(1).png',
                                  height: 50,
                                  width: 50,
                                ),
                                Image.asset(
                                  'assets/images/Group 5819(1).png',
                                  height: 50,
                                  width: 50,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  height: 135,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5, color: Colors.grey.withOpacity(0.5)),
                      ]),
                ),

                Positioned(
                  right: 5,
                  top: 0,
                  bottom: 0,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(onTap: (){Get.to( Final_booking());},
                        child: Container(
                            height: 100,
                            width: 51,
                            decoration: BoxDecoration(
                                color: kblue,
                                borderRadius: BorderRadius.circular(16)),
                            alignment: Alignment.center,
                            child: Transform.rotate(
                              angle: -math.pi / 2.0,
                              child: Text(
                                "Booking",
                                style: TextStyle(
                                    color: Color(0xFFD1D1D1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                            )),
                      )),
                ),
                //
              ],
            ),
          ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                          'assets/images/derick-mckinney-PhA2QbE7h6c-unsplash.png'),
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'The Westin Dhaka',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'Chennai, India',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              '₹180/night',
                              style: TextStyle(color: kblue),
                            ),
                            ksizedbox10,
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/Group 5816(1).png',
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.fitHeight,
                                ),
                                Image.asset(
                                  'assets/images/aa.png',
                                  height: 50,
                                  width: 50,
                                ),
                                Image.asset(
                                  'assets/images/Group 5817(1).png',
                                  height: 50,
                                  width: 50,
                                ),
                                Image.asset(
                                  'assets/images/Group 5819(1).png',
                                  height: 50,
                                  width: 50,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  height: 135,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5, color: Colors.grey.withOpacity(0.5)),
                      ]),
                ),

                Positioned(
                  right: 5,
                  top: 0,
                  bottom: 0,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(onTap: (){Get.to( Final_booking());},
                        child: Container(
                            height: 100,
                            width: 51,
                            decoration: BoxDecoration(
                                color: kblue,
                                borderRadius: BorderRadius.circular(16)),
                            alignment: Alignment.center,
                            child: Transform.rotate(
                              angle: -math.pi / 2.0,
                              child: Text(
                                "Booking",
                                style: TextStyle(
                                    color: Color(0xFFD1D1D1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                            )),
                      )),
                ),
                //
              ],
            ),
          )
        ],
      ),
    );
  }
}
