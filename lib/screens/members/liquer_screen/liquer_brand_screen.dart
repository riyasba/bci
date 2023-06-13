import 'package:bci/screens/members/liquer_screen/widget/like.dart';
import 'package:bci/screens/members/liquer_screen/widget/popular_Wine.dart';
import 'package:bci/screens/members/liquer_screen/wine_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constands/constands.dart';
import 'dart:math' as math;

import '../../bussiness/views/business/notification_screen.dart';
import 'cart_screen.dart';

class liqor_brands extends StatelessWidget {
  const liqor_brands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(295),
          child: Column(
            children: [
              ClipPath(
                clipper: SinCosineWaveClipper(),
                child: Container(
                  height: 140,
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
                            'Liquors',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: kwhite),
                          ),
                        ),
                      IconButton(onPressed: (){Get.to(NotificationScreen());}, icon:   Icon(
                    Icons.notifications,
                    color: kwhite,
                  ))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'hello Raja Choose Your',
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Liquor Brands',
                      style:
                          TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
                    ),
                    InkWell(onTap: (){Get.to(CartScreen());},
                      child: Image.asset('assets/images/Cart.png'))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 44.h,
                  child: TextField(
                    // controller: _controller,

                    decoration: InputDecoration(disabledBorder: OutlineInputBorder(),
                      fillColor: Colors.grey[200],
                      focusColor: Colors.grey[200],
                      isDense: true,
                      filled: true,labelText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23.0),
                      ),
                      prefixIcon: Image.asset('assets/images/622669.png'),
                    ),
                  ),
                ),
              ),
            ],
          )),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap: (){Get.to( wine_screen());},
                    child: Container(
                      height: 150,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                  color: kblue,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 15,
                              child: Image.asset(
                                'assets/images/Vector Smart Object.png',
                                height: 130,
                              )),
                          Positioned(
                            bottom: 15,
                            right: 5,
                            child: Transform.rotate(
                              angle: -math.pi / 2.0,
                              child: Text(
                                "Beer",
                                style: TextStyle(color: Color(0xFFD1D1D1)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(onTap: () {
                    Get.to( wine_screen());
                  },
                    child: Container(
                      height: 150,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                  color: kblue,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 15,
                              child: Image.asset(
                                'assets/images/Vector Smart Object-1.png',
                                height: 130,
                              )),
                          Positioned(
                            bottom: 15,
                            right: 5,
                            child: Transform.rotate(
                              angle: -math.pi / 2.0,
                              child: Text(
                                "Wine",
                                style: TextStyle(color: kwhite),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(onTap: (){Get.to( wine_screen());},
                    child: Container(
                      height: 150,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                  color: Color(0xFFD1D1D1),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 15,
                              child: Image.asset(
                                'assets/images/Vector Smart Object-2.png',
                                height: 130,
                              )),
                          Positioned(
                            bottom: 19,
                            right: 5,
                            child: Transform.rotate(
                              angle: -math.pi / 2.0,
                              child: Text(
                                "whiskey",
                                style: TextStyle(color: kwhite),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ksizedbox40,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Wine',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    InkWell(onTap: (){Get.to( wine_screen());},
                      child: Text(
                        'See ALL',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
              ksizedbox40,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap: (){Get.to( wine_screen());},
                    child: Wine_widget(
                      wineimg: 'assets/images/Layer 3442.png',
                    ),
                  ),
                  InkWell(onTap: (){Get.to(Get.to( wine_screen()));},
                    child: Wine_widget(
                      wineimg: 'assets/images/59_Barefoot-Cellars-California-Chardonnay-750ml.png',
                    ),
                  )
                ],
              ),
              ksizedbox40
            ],
          ),
        ],
      ),
    );
  }
}
