import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constands/constands.dart';

class SlotRegisterationScreen extends StatefulWidget {
  const SlotRegisterationScreen({super.key});

  @override
  State<SlotRegisterationScreen> createState() =>
      _SlotRegisterationScreenState();
}

class _SlotRegisterationScreenState extends State<SlotRegisterationScreen> {
  var couponController = TextEditingController();
  var referalController = TextEditingController();
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
                      'Slot Registration',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: Column(
        children: [
          ksizedbox30,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.3, 46),
                      backgroundColor: kblue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {},
                  child: Text(
                    '₹1990.00 / 730',
                    style: TextStyle(fontSize: 22),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 40),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Customers',
                      style: TextStyle(fontSize: 25, color: Color(0xff372929)),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and \ntypesetting industry. Lorem Ipsum has been the \nindustry"s standard dummy text ever since the 1500s,\nwhen an unknown printer took a galley of type and \nscrambled it to make a type specimen book. It has \nsurvived not only five centuries, but also the leap into \nelectronic typesetting, remaining essentially unchanged',
                    style: TextStyle(
                        color: Color(
                          0xff372929,
                        ),
                        fontSize: 14.5),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 22, right: 20),
            child: Container(
              decoration: BoxDecoration(
               border: Border.all(
                color: kblue
               ),
               borderRadius: BorderRadius.circular(5)
              ),
              child: TextField(
                controller: couponController,
                decoration: InputDecoration(
                    suffixIcon: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(90, 56),
                            backgroundColor: korange),
                        onPressed: () {},
                        child: Text(
                          'Apply',
                          style: TextStyle(fontSize: 16),
                        )),
                    hintText: 'Enter Coupon',
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kblue
                      ),
                      borderRadius: BorderRadius.circular(5)
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 22, right: 20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: kblue
                ),
                borderRadius: BorderRadius.circular(5)
              ),
              child: TextField(
                controller: referalController,
                decoration: InputDecoration(
                  
                    suffixIcon: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(90, 56),
                            backgroundColor: korange),
                        onPressed: () {},
                        child: Text(
                          'Apply',
                          style: TextStyle(fontSize: 16),
                        )),
                    hintText: 'Enter Referral Code',
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kblue
                      ),
                      borderRadius: BorderRadius.circular(5)
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 70),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 48,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [kOrange, kyellow]),
                    ),
                child: Center(
                    child: Text(
                  'Proceed To Payment',
                  style: TextStyle(
                      fontSize: 19, color: kwhite, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
