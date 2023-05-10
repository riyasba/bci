import 'package:bci/screens/bussiness/views/home_screen/contact_admin.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../../constands/constands.dart';

class my_account extends StatelessWidget {
  const my_account({super.key});

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
                        'My Account',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(ContactAdmin());
                        },
                        child: Image.asset(
                            'assets/images/3669173_help_ic_icon.png'))
                  ],
                ),
              ),
            ),
          )),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profile Settting',
                style: TextStyle(
                    color: kblue, fontSize: 24, fontWeight: FontWeight.w600),
              ),
           Image.asset('assets/images/Icon awesome-caret-down.png') ],
          ),Divider(thickness: 2,),Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Office Address',
                style: TextStyle(
                    color: kblue, fontSize: 24, fontWeight: FontWeight.w600),
              ),
          Image.asset('assets/images/Icon awesome-caret-down.png')  ],
          ),Divider(thickness: 2,),Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Residential Address',
                style: TextStyle(
                    color: kblue, fontSize: 24, fontWeight: FontWeight.w600),
              ),
          Image.asset('assets/images/Icon awesome-caret-down.png')  ],
          ),Divider(thickness: 2,),
        ],
      ),
    );
  }
}
