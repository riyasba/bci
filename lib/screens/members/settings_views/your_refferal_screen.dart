import 'package:bci/constands/constands.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

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
              height: 150.h,
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
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Invite',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffF9F8FD)),
                      ),
                    ),
                    Image.asset('assets/images/helps.png')
                  ],
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Image(
              image: AssetImage(
                "assets/images/pngwing.com (30).png",
              ),
              height: 300,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Referral Code',
                  style: TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w700, color: kblue),
                ),
              ),
            ),
            Container(height: 50,
              child: TextField(
                // controller: _controller,
            
                decoration: InputDecoration(
                    hintText: 'ABCD',
                    hintStyle: TextStyle(
                        fontSize: 28, color: kblue, fontWeight: FontWeight.w700),
                    fillColor: kwhite,
                    focusColor: kwhite,
                    isDense: true,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kblue),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    suffixIcon:
                        Image.asset('assets/images/Icon awesome-copy.png')),
              ),
            ),
            ksizedbox30,
            Row(
              children: [
                Text(
                  'Referral Count :  ',
                  style: TextStyle(
                      fontSize: 26.sp,
                      color: kblue,
                      fontWeight: FontWeight.w600),
                ),
                Referal_containors(),kwidth10,  Referal_containors() ,kwidth10, Referal_containors()
              ],
            ),
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: InkWell(
                onTap: () {
                  Share.share('hello');
                },
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: const Color(0xffFFBF7E)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFFF5C29),
                        blurRadius: 3.0,
                      )
                    ],
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFFF5C29),
                        Color(0xFFFFCD38),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Invite",
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            ksizedbox40
          ],
        ),
      ),
    );
  }
}

class Referal_containors extends StatelessWidget {
  const Referal_containors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        '0',
        style: TextStyle(
            color: kwhite,
            fontSize: 18,
            fontWeight: FontWeight.w600),
      )),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: korange),
    );
  }
}
