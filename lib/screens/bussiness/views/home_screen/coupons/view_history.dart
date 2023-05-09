import 'package:bci/constands/constands.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CouponViewHistory extends StatefulWidget {
  const CouponViewHistory({super.key});

  @override
  State<CouponViewHistory> createState() => _CouponViewHistoryState();
}

class _CouponViewHistoryState extends State<CouponViewHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
            preferredSize: Size.fromHeight(250),
            child: ClipPath(
              clipper: SinCosineWaveClipper(),
              child: Container(
                height: 180,
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
                      padding: const EdgeInsets.only(right: 22),
                      child: Text(
                        'View History',
                        style: TextStyle(
                            fontSize: 23,
                           // fontWeight: FontWeight.bold,
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
      body: Column(
        children: [
             Padding(
               padding: const EdgeInsets.only(left: 23,right: 15,top: 15),
               child: Image(image: AssetImage('assets/images/view_historyimage.png')),
             ),
              Padding(
               padding: const EdgeInsets.only(left: 23,right: 15,top: 25),
               child: Image(image: AssetImage('assets/images/view_historyimage2.png')),
             ),
              Padding(
               padding: const EdgeInsets.only(left: 23,right: 15,top: 25),
               child: Image(image: AssetImage('assets/images/view_historyimage3.png')),
             )
        ],
      ),
    );
  }
}
