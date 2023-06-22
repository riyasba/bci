import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../constands/constands.dart';
import '../../bussiness/views/business/notification_screen.dart';

class Coupens_members extends StatelessWidget {
  const Coupens_members({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(250),
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
                    InkWell(onTap: Get.back,
                      child: Image.asset('assets/images/chevron-left (2).png')),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'All Coupons',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                 IconButton(
                      onPressed: () {
                        Get.to(NotificationScreen());
                      },
                      icon: Icon(
                        Icons.notifications,
                        color: kwhite,
                      ))
                  ],
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  'Dress Coupones',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ],
            ),ksizedbox30,
            Image.asset('assets/images/Group 5789.png'),ksizedbox30,
            Image.asset('assets/images/Group 5790.png'),ksizedbox30,
            Image.asset('assets/images/Group 5791.png'),ksizedbox30,
            Image.asset('assets/images/Group 5792.png')
          ],
        ),
      ),
    );
  }
}
