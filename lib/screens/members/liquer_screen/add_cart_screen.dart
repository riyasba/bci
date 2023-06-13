import 'package:bci/screens/members/liquer_screen/widget/add_buttton.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constands/constands.dart';
import '../../bussiness/views/business/notification_screen.dart';
import 'cart_screen.dart';

class Add_cart extends StatefulWidget {
  const Add_cart({super.key});

  @override
  State<Add_cart> createState() => _Add_cartState();
}

class _Add_cartState extends State<Add_cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/Clip.png',
                fit: BoxFit.cover,
              )),
          Positioned(
              right: 1,
              top: -100,
              child: Image.asset(
                'assets/images/23456.png',
                height: 500,
              )),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CHARDONNAY',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
                ksizedbox10,
                Text(
                  'Barefoot Wine',
                  style: TextStyle(fontSize: 16),
                ),
                ksizedbox40,
                Text('Tastes like...'),
                ksizedbox20,
                Text(
                  'Apple, Rich, Vanilla',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                ksizedbox40,
                Text(
                  'White Wine',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                ksizedbox40,
                Text('Size'), ksizedbox30,
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 130,
                      decoration: BoxDecoration(
                          color: kwhite,
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Text(
                          '2L',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    AddSubtractScreen(),
                  ],
                ), // AddSubtractScreen(),
                ksizedbox20,
                // Container(
                //   child: Center(
                //       child: Text(
                //     '1.5 L',
                //     style: TextStyle(fontSize: 16),
                //   )),
                //   height: 35,
                //   width: 150,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(7), color: kgrey),
                // ),
                //  ksizedbox30,
                // Container(
                //   child: Center(
                //       child: Text(
                //     '+        02      _',
                //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                //   )),
                //   height: 35,
                //   width: 150,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(7), color: kgrey),
                // ),
                // ksizedbox40,
                Text(
                  'About',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                ksizedbox10,
                Text(
                  'Packing big, bold flavor with a smooth finish, Barefoot Chardonnay brings tempting flavors to every bottle, with notes of crisp, green apples and sweet peaches. Accented with hints of honey and vanilla, our medium-bodied Chardonnay pairs perfectly with fresh fruit, pasta, chicken, and salmon.',
                  style: TextStyle(fontSize: 11, color: kgrey),
                ),
                ksizedbox20,
                Text(
                  'Delivery Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                ksizedbox10,
                Text(
                  'Direct selling for delivery service our order club and Bar.',
                  style: TextStyle(fontSize: 11, color: kgrey),
                ),
                ksizedbox40,
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(CartScreen());
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          kwidth5,
                          Text(
                            'Total - ₹ 16.80',
                            style: TextStyle(color: kwhite, fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Center(
                                  child: Text(
                                'Add To Cart',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              )),
                              height: 65,
                              width: 160,
                              decoration: BoxDecoration(
                                  color: kwhite,
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        ],
                      ),
                      height: 70,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: kyellow),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      // backgroundColor: kwhite,
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
                      child: Image.asset('assets/images/chevron-left (2).png')),
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
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
