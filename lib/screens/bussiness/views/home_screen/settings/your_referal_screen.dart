import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constands/constands.dart';

class YourReferalScreen extends StatefulWidget {
  const YourReferalScreen({super.key});

  @override
  State<YourReferalScreen> createState() => _YourReferalScreenState();
}

class _YourReferalScreenState extends State<YourReferalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 158,
              color: kblue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
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
                    padding: const EdgeInsets.only(right: 85),
                    child: Text(
                      'Your Referral',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30,top: 20),
                child: Row(
                  children: [
                    Text('No Referrals Found',
                    style: TextStyle(
                      fontSize: 22.5,
                      color: kblue,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
              ksizedbox30,
              Stack(children:[ Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset('assets/images/referralimage.png'),
              ),
               Padding(
                 padding: const EdgeInsets.only(top: 290),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('No Refer',style: TextStyle(fontSize: 20),),
                   ],
                 ),
               )
              ]),
      
             
            ],
          ),
    );
  }
}
