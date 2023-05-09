import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constands/constands.dart';
import '../../bussiness/views/business/notification_screen.dart';
import '../../bussiness/views/home_screen/contact_admin.dart';
import '../members widgets/gridciew.dart';
import 'offer_screen.dart';

class offer_screen extends StatelessWidget {
  const offer_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(250 ),
            child: ClipPath(
              clipper: SinCosineWaveClipper(),
              child: Container(
                height: 150,
                color: kblue,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: Get.back,
                          child: Image.asset(
                              'assets/images/chevron-left (2).png')),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          'Offers',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                   InkWell(onTap: (){Get.to(ContactAdmin());},
                    child: Image.asset('assets/images/3669173_help_ic_icon.png'))
                    ],
                  ),
                ),
              ),
            )),
        body: ListView(physics: BouncingScrollPhysics(),
          children: [
            InkWell(onTap: (){Get.to(offer_screen2());},
              child: MyGridView(title: 'Today offers', image: [
              
                'assets/images/NoPath - Copy (32).png',
                'assets/images/NoPath - Copy (33).png',
                'assets/images/NoPath - Copy (34).png',
                'assets/images/NoPath - Copy (35).png'
              ]),
            ),
           MyGridView(title: 'Yesterday Offers', image: [
            
              'assets/images/NoPath - Copy (32).png',
              'assets/images/NoPath - Copy (33).png',
              'assets/images/NoPath - Copy (34).png',
              'assets/images/NoPath - Copy (35).png'
            ]), ],
        ));
  }
}
