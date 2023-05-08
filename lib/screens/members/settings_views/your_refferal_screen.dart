import 'package:bci/constands/constands.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class YourReferralScreen extends StatefulWidget {
  const YourReferralScreen({super.key});

  @override
  State<YourReferralScreen> createState() => _YourReferralScreenState();
}

class _YourReferralScreenState extends State<YourReferralScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffF9F8FD),
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.arrow_back_ios,color: Colors.white,),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Invite',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffF9F8FD)),
                      ),
                    ),
                    Image.asset('assets/images/helps.png')
                  ],
                ),
              ),
            ),
          )),
          body: Column(
            children: [
              Image(image: AssetImage("assets/images/pngwing.com (30).png"))
            ],
          ),
    );
  }
}