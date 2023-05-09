import 'package:bci/constands/constands.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourReferralScreen extends StatefulWidget {
  const YourReferralScreen({super.key});

  @override
  State<YourReferralScreen> createState() => _YourReferralScreenState();
}

class _YourReferralScreenState extends State<YourReferralScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F8FD),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
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
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Image(image: AssetImage("assets/images/pngwing.com (30).png")),
          Text(
            'Referral Code',
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w700, color: kblue),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // controller: _controller,

              decoration: InputDecoration(
                  hintText: 'ABCD',
                  hintStyle: TextStyle(fontSize: 28, color: kblue),
                  fillColor: kwhite,
                  focusColor: kwhite,
                  isDense: true,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  suffixIcon:
                      Image.asset('assets/images/Icon awesome-copy.png')),
            ),
          ),
          ksizedbox10,
          Text(
            'Referral Count :  0 0 0 0',
            style: TextStyle(fontSize: 32, color: kblue),
          ),ksizedbox30,
          Padding(
            padding: const EdgeInsets.only(left: 42, right: 41),
            child: InkWell(
              onTap: () {
                //     Get.to();
              },
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFFF5C29),
                      Color(0xFFFFCD38),
                    ],
                  ),
                ),
                child: Text(
                  'Invite',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
       ksizedbox40 ],
      ),
    );
  }
}
