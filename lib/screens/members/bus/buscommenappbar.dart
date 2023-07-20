import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../constands/constands.dart';

class ComenAppbar extends StatelessWidget {
  const ComenAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SinCosineWaveClipper(),
      child: Container(
        height: 140,
        color: kblue,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 22, left: 15, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: kwhite,
                    ),
                  )),
              Text(
                'Bus Ticket Booking',
                style: TextStyle(color: kwhite, fontSize: 20),
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}