import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'datepicking_screen.dart';

class Final_booking extends StatelessWidget {
  const Final_booking({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
            Image.asset('assets/images/Mask Group 1.png'),
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: Positioned(
                  child: Image.asset('assets/images/Group 5814.png'))),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Platinum Grand',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        Text('Chennai, India'),
                        kwidth5,
                        Text(
                          'Show in map',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    ksizedbox30,
                    Text(
                      'This upscale, contemporary hotel is 2 km from \nHazrat Shahjalal International Airport and 11 km from\nJatiyo Sangsad Bhaban, the Bangladesh \nParliament complex.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    ksizedbox30,
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(color: Colors.grey),
                    ),
                    ksizedbox10,
                    Text(
                      '₹180',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Reviews',
                      style: TextStyle(color: Colors.grey),
                    ),
                    ksizedbox10,
                    Text(
                      '4.5*',
                      style: TextStyle(color: kblue),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Recently booked',
                      style: TextStyle(color: Colors.grey),
                    ),
                    ksizedbox10,
                    Text(
                      '- - - - - -',
                      style: TextStyle(color: kblue),
                    ),
                  ],
                )
              ],
            ),
          ),
          ksizedbox30,
          Row(
            children: [
              Text(
                '     Amnities',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          ksizedbox20,
          Container(
            height: 80,
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true, scrollDirection: Axis.horizontal,
              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/Group 5816(1).png',
                ),
                Image.asset(
                  'assets/images/aa.png',
                ),
                Image.asset(
                  'assets/images/Group 5817(1).png',
                ),
                Image.asset(
                  'assets/images/Group 5819(1).png',
                ),
                Image.asset('assets/images/Group 5820.png'),
                Image.asset('assets/images/Group 5821.png')
              ],
            ),
          ),
          ksizedbox30,
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/Group 5822(1).png'),
                SizedBox(
                  height: 58,
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kblue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                       Get.to(Datepicker_screen_hotel());
                        // Get.to(BusinessGenerate_otp
                        // ());
                      },
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
