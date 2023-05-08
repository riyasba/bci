import 'package:bci/screens/members/offer%20screen/widgets/offer_containers.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constands/constands.dart';
import '../../../views/business/notification_screen.dart';
import '../../../views/home_screen/contact_admin.dart';

class offer_screen2 extends StatelessWidget {
  const offer_screen2({super.key});

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
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Card(child: offer_widgets());
            }),
      ),
    );
  }
}
