import 'package:bci/screens/members/settings_views/support_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../../constands/constands.dart';

class Home_screen1 extends StatelessWidget {
  const Home_screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: ClipPath(
          clipper: SinCosineWaveClipper(),
          child: Container(
            height: 180,
            color: kblue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/images/projectlogo.png'),
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    'Hello,Jhon',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(SupportScreen());
                  },
                  child: Container(
                      height: 30,
                      width: 30,
                      child: Image.asset('assets/images/helps.png')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
