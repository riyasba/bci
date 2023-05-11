import 'package:bci/screens/members/holiday/sucssesful.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constands/constands.dart';
import '../hottel/wigets/dropdown_smal.dart';

class Holiday_booking extends StatelessWidget {
  const Holiday_booking({super.key});

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
          'Details',
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.w800, color: kblue),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
              width: double.infinity,
              child: Image.asset(
                'assets/images/riyas.png',
                fit: BoxFit.fill,
              )),
          ksizedbox30,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Details',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: kblue,
                    decoration: TextDecoration.underline),
              ),
              Text(
                'Tour List',
                style: TextStyle(color: kgrey),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  'Select Date'
                  //   "${selectedDate.toLocal()}".split(' ')[0],
                  ,
                  style: TextStyle(fontSize: 12, color: kblue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: InkWell(
                  onTap: () {
//_selectDate(context);
                  },
                  child: Image.asset('assets/images/availabilitycircle3.png'),
                ),
              )
            ],
          ),
          ksizedbox30,
          Row(
            children: [
              kwidth10,
              Text(
                'About',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Istanbul is a major city in Turkey that straddles Europe and Asia across the Bosphorus Strait. Its Old City reflects cultural influences of the many empires that once ruled here. In the Sultanahmet district, the open-air, Roman-era Hippodrome was for centuries the site of chariot races, and Egyptian obelisks also remain.',
              style: TextStyle(
                color: Color(0xFFA2A9C2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Person',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF003366)),
                ),
              ],
            ),
          ),
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Row(
              children: [
                Text(
                  "Adult",
                  style: TextStyle(color: kblue),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 60,
                  height: 30,
                  child: Dropdown_Small(
                     options: ['01 ','02'],
                     label: '0',
                  ),
                ),SizedBox(width: 30,),
                Text('Children')    , SizedBox(
                  width: 5,
                ),
                Container(
                  width: 60,
                  height: 30,
                  child: Dropdown_Small(
                     options: ['01 ','02'],
                     label: '0',
                  ),
                ), ],
            ),
         ),
          ksizedbox30,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    '₹288',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                    ),
                  ),
                  Text(
                    '/person',
                    style: TextStyle(color: kgrey),
                  )
                ],
              ),
              InkWell(onTap: (){Get.to(Sucessful_screen());},
                child: Container(
                  width: 150,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      4,
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
                    'Book Now',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          ksizedbox40,
        ],
      ),
    );
  }
}
