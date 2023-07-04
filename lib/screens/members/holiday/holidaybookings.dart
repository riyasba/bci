import 'package:bci/screens/members/holiday/controllers/holidaycontroller.dart';
import 'package:bci/screens/members/holiday/widgets/additional_info.dart';
import 'package:bci/screens/members/holiday/widgets/day_wise_itnerary.dart';
import 'package:bci/screens/members/holiday/widgets/enquiry_now.dart';
import 'package:bci/screens/members/holiday/widgets/hoteldetails.dart';
import 'package:bci/screens/members/holiday/widgets/overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constands/constands.dart';

class HolidayScreen extends StatefulWidget {
  const HolidayScreen({super.key});

  @override
  State<HolidayScreen> createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  final holidayController = Get.find<HolidayController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF9F8FD),
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/images/Icon awesome-arrow-right.png')),
        title: Text(
          'Increadible Mauritius (Ex - Delhi)',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w700, color: kblue),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ksizedbox20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.9,
                  child: Column(
                    children: [
                      Image.asset('assets/images/NoPath - Copy (13).png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Starting From')
                                  .text
                                  .semiBold
                                  .blue900
                                  .make()
                                  .p2(),
                              Text(''' ₹ 6999''').text.bold.xl2.blue900.make()
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Per Person on twing Sharing')
                                  .text
                                  .semiBold
                                  .blue900
                                  .make()
                                  .p2(),
                              InkWell(onTap: (){Get.to(EnquiryNowWidget());},
                                child: Container(
                                  height: 40.h,
                                  width: 130.w,
                                  decoration: BoxDecoration(
                                      color: kblue,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Text('''ENQUIRY NOW''')
                                          .text
                                          .white
                                          .make()),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            ksizedbox30,
            Obx(() => SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      kwidth10,
                      InkWell(
                          onTap: () {
                            holidayController.reindex(0);
                            holidayController.update();
                          },
                          child: Obxcontainers(
                            bordercolor: holidayController.reindex.value == 0
                                ? korange
                                : kblue,
                            text: 'OVERVIEW',
                            color: holidayController.reindex.value == 0
                                ? korange
                                : Colors.white,
                            textcolor: holidayController.reindex.value == 0
                                ? kwhite
                                : kblue,
                          )),
                      kwidth10,
                      InkWell(
                          onTap: () {
                            holidayController.reindex(1);
                            holidayController.update();
                          },
                          child: Obxcontainers(
                            bordercolor: holidayController.reindex.value == 1
                                ? korange
                                : kblue,
                            text: 'HOTEL DETAILS',
                            color: holidayController.reindex.value == 1
                                ? korange
                                : Colors.white,
                            textcolor: holidayController.reindex.value == 1
                                ? kwhite
                                : kblue,
                          )),
                      kwidth10,
                      InkWell(
                          onTap: () {
                            holidayController.reindex(2);
                            holidayController.update();
                          },
                          child: Obxcontainers(
                            bordercolor: holidayController.reindex.value == 2
                                ? korange
                                : kblue,
                            text: 'DAY WISE ITINERARY',
                            color: holidayController.reindex.value == 2
                                ? korange
                                : Colors.white,
                            textcolor: holidayController.reindex.value == 2
                                ? kwhite
                                : kblue,
                          )),
                      kwidth10,
                      InkWell(
                          onTap: () {
                            holidayController.reindex(3);
                            holidayController.update();
                          },
                          child: Obxcontainers(
                            bordercolor: holidayController.reindex.value == 3
                                ? korange
                                : kblue,
                            text: 'ADDITIONAL INFO',
                            color: holidayController.reindex.value == 3
                                ? korange
                                : Colors.white,
                            textcolor: holidayController.reindex.value == 3
                                ? kwhite
                                : kblue,
                          )),
                      kwidth10
                    ],
                  ),
                )),ksizedbox30,
         Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: Column(
                    children: [
                      if (holidayController.reindex.value == 0) OverviewWidget(),
                      if (holidayController.reindex.value == 1) HotelDetails(),
                      if (holidayController.reindex.value == 2) DayWiseItinerary(),
                      if (holidayController.reindex.value == 3) AdditionalInfoWidget(),
                        
                
                    ],
                  ),
                ),
              ),
            ), 
             ],
        ),
      ),
    );
  }
}

class Obxcontainers extends StatelessWidget {
  const Obxcontainers({
    super.key,
    required this.text,
    required this.bordercolor,
    required this.color,
    required this.textcolor,
  });
  final String text;
  final Color bordercolor;
  final Color color;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 150.w,
      decoration: BoxDecoration(
          border: Border.all(
            color: bordercolor,
            width: 1.0,
          ),
          color: color,
          borderRadius: BorderRadius.circular(9)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14, color: textcolor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
