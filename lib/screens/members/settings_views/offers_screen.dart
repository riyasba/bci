import 'package:bci/constands/constands.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                        'Offers',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Padding(
              padding: EdgeInsets.only(top: 20,left: 20),
              child: Text("Member Offer",
              style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff003366)),),
            ),
            Padding(
              padding:const EdgeInsets.all(20.0),
              child: Container(
                height: 140,
                width: size.width,
                decoration: BoxDecoration(
                  color:const Color(0xff594A99),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:const [
                      Text("Best Deals\nof Today",
                             style: TextStyle(fontSize: 20,
                             fontWeight: FontWeight.w500,
                             height: 1.4,
                             color: Color(0xffFAE7E3)),),
                             Image(image: AssetImage("assets/images/Rectangle 484.png"),height: 117,width: 170,)
                           ],
                        ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}