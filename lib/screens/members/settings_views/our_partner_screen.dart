import 'package:bci/constands/constands.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class OurPartnerScreen extends StatefulWidget {
  const OurPartnerScreen({super.key});

  @override
  State<OurPartnerScreen> createState() => _OurPartnerScreenState();
}

class _OurPartnerScreenState extends State<OurPartnerScreen> {
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
                     InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child:const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Our Partner',
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
               Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:const [
                    Image(image: AssetImage("assets/images/NoPath - Copy (3).png"),height: 170,width: 180,),
                    Image(image: AssetImage("assets/images/NoPath - Copy (4).png"),height: 170,width: 180,),
                  ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 15),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:const [
                    Image(image: AssetImage("assets/images/NoPath - Copy (5).png"),height: 170,width: 180,),
                    Image(image: AssetImage("assets/images/NoPath - Copy (6).png"),height: 170,width: 180,),
                  ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 15),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:const [
                    Image(image: AssetImage("assets/images/NoPath - Copy (51).png"),height: 170,width: 180,),
                    Image(image: AssetImage("assets/images/chanel.png"),height: 170,width: 180,),
                  ],
                 ),
               ),
           ],
      ),
    );
  }
}