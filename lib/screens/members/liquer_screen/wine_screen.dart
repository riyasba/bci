import 'package:bci/screens/members/liquer_screen/widget/popular_Wine.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constands/constands.dart';
import '../../bussiness/views/business/notification_screen.dart';
import 'add_cart_screen.dart';

class wine_screen extends StatelessWidget {
  const wine_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
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
                        child:
                            Image.asset('assets/images/chevron-left (2).png')),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'Wine',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Popular Wine',
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          InkWell(onTap: (){Get.to(Add_cart());},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Wine_widget(
                  wineimg: 'assets/images/Layer 3442.png',
                ),
                Wine_widget(
                  wineimg:
                      'assets/images/59_Barefoot-Cellars-California-Chardonnay-750ml.png',
                )
              ],
            ),
          ),
          ksizedbox30,
          InkWell(onTap: (){Get.to(Add_cart());},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Wine_widget(
                  wineimg: 'assets/images/Layer 3442.png',
                ),
                Wine_widget(
                  wineimg:
                      'assets/images/59_Barefoot-Cellars-California-Chardonnay-750ml.png',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
