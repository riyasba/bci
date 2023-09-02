import 'package:bci/constands/constands.dart';
import 'package:bci/screens/bussiness/views/business/notification_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EnterAmountForWithdrawalScreen extends StatefulWidget {
  const EnterAmountForWithdrawalScreen({super.key});

  @override
  State<EnterAmountForWithdrawalScreen> createState() =>
      _EnterAmountForWithdrawalScreenState();
}

class _EnterAmountForWithdrawalScreenState
    extends State<EnterAmountForWithdrawalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 158,
              color: kblue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Payout',
                      style: TextStyle(
                          fontSize: 23,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                        onTap: () {
                          Get.to(() => const NotificationScreen());
                        },
                        child:
                            Image.asset('assets/images/notificationimage.png')),
                  )
                ],
              ),
            ),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SvgPicture.asset("assets/images/payment_vec_image.svg"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: TextField(
              // controller: nameController,
              decoration: InputDecoration(
                  hintText: 'Enter your amount',
                  hintStyle: TextStyle(fontSize: 18, color: kblue),
                  border: const OutlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
