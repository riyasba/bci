import 'package:bci/screens/bussiness/views/home_screen/offers/last_offers.dart';
import 'package:bci/screens/members/settings_views/support_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constands/constands.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: kwhite,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      'Offers',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                 InkWell(
                    onTap: () {
                      Get.to(SupportScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                          height: 30,
                          width: 30,
                          child: Image.asset('assets/images/helps.png')),
                    ),
                  )
                ],
              ),
            ),
          )),
      body: ListView(children: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: Text(
                    'Offer Title',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: kblue),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: kwhite, borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      hintText: 'Your Offer title',
                      hintStyle: TextStyle(fontSize: 16, color: kblue),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
            ),
            ksizedbox20,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration:const BoxDecoration(color: Color(0xffD2CDCD)),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Image.asset('assets/images/avaiimageupload.png'),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Upload Offer Banner',
                            style: TextStyle(fontSize: 18, color: kblue),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ksizedbox10,
             Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('Description'),
                ],
              ),
            ),
            descriptiontextFiled(
                '   Something type else', descriptionController),
            ksizedbox30,
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kblue,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.9, 50)),
                onPressed: () {},
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 21, color: kwhite),
                )),
            ksizedbox20,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kyellow,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.8, 50)),
                  onPressed: () {
                    Get.to(const LastOffers());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Last Offers',
                        style: TextStyle(fontSize: 21, color: kwhite),
                      ),
                      const Icon(Icons.arrow_forward)
                    ],
                  )),
            )
          ],
        ),
      ]),
    );
  }

  Widget descriptiontextFiled(String hinttext, dynamic controller) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 12),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[
              BoxShadow(offset:const Offset(0.0, 0.75), blurRadius: 5, color: kgrey)
            ],
            color: kwhite,
            border: Border.all(color: kgrey)),
        child: TextField(
          maxLines: 7,
          controller: controller,
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              hintText: hinttext,
              hintStyle: TextStyle(fontSize: 16, color: kblue),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: kgrey))),
        ),
      ),
    );
  }
}
