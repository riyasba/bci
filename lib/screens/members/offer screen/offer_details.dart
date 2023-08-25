import 'package:bci/models/get_today_offers_list_model.dart';
import 'package:bci/screens/members/offer%20screen/widgets/offer_containers.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../constands/constands.dart';
import '../../bussiness/views/business/notification_screen.dart';
import '../../bussiness/views/home_screen/contact_admin.dart';

class OffersDetail extends StatelessWidget {
   OffersListModel todayOfferListData;
   OffersDetail({super.key,required this.todayOfferListData});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: Get.back,
                        child:
                            Image.asset('assets/images/chevron-left (2).png')),
                      const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Offers',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                                 InkWell(onTap: (){Get.to(const ContactAdmin());},
                    child: Image.asset('assets/images/3669173_help_ic_icon.png'))
                  ],
                ),
              ),
            ),
          )),
      body: ListView(
        children: [
          Image.network(
            todayOfferListData.image,
            height: 350,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                ksizedbox10,
                Text(
                  todayOfferListData.title,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                      color: kgrey),
                ),
                ksizedbox10,
                Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                ksizedbox10,
               
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: kgrey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        todayOfferListData.description,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: kgrey),
                      ),
                    ],
                  ),
              ])
      )],
      ),
    );
  }
}
