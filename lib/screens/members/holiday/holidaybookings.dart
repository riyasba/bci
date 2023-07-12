import 'package:bci/controllers/holiday_package_controller.dart';
import 'package:bci/screens/members/holiday/controllers/holidaycontroller.dart';
import 'package:bci/screens/members/holiday/widgets/additional_info.dart';
import 'package:bci/screens/members/holiday/widgets/day_wise_itnerary.dart';
import 'package:bci/screens/members/holiday/widgets/enquiry_now.dart';
import 'package:bci/screens/members/holiday/widgets/hoteldetails.dart';
import 'package:bci/screens/members/holiday/widgets/overview.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constands/constands.dart';

class HolidayScreen extends StatefulWidget {
  String packageId;
  HolidayScreen({super.key,required this.packageId});

  @override
  State<HolidayScreen> createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  final holidayController = Get.find<HolidayController>();
  final holidayPackageController = Get.find<HolidayPackageController>();
  
  CarouselController sliderController = CarouselController();
  int activeIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holidayPackageController.packageDetails(packageid: widget.packageId);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFFF9F8FD),
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/images/Icon awesome-arrow-right.png')),
        title: Text(
          'Increadible Mauritius(Ex - Delhi)',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: kblue),
        ),
      ),
      body:SingleChildScrollView(
        child: GetBuilder<HolidayPackageController>(
          builder: (_) {
            return Column(
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
                          // Image.asset('assets/images/NoPath - Copy (13).png'),
                          Stack(
                            children: [
                              CarouselSlider(
                                            carouselController: sliderController,
                                              items: [
                                                for (int i = 0;
                                                 i < holidayPackageController.getPackageDetailsData.first.images.length;
                                                 i++)
                                                Container(
                                                  decoration:  BoxDecoration(
                                                      image: DecorationImage(fit: BoxFit.fill,
                                                          image: NetworkImage(holidayPackageController.getPackageDetailsData.first.images[i]),
                                                          )),
                                                ),
                                                // Container(
                                                //   decoration: const BoxDecoration(
                                                //       image: DecorationImage(fit: BoxFit.fill,
                                                //           image: AssetImage(
                                                //               'assets/images/munnar2.jpg'))),
                                                // ),
                                                // Container(
                                                //   decoration: const BoxDecoration(
                                                //       image: DecorationImage(fit: BoxFit.fill,
                                                //           image: AssetImage(
                                                //               'assets/images/munnar3.jpg'))),
                                                // ),
                                              ],
                                              options: CarouselOptions(
                                                height: 170,
                                                onPageChanged: (index, reason) {
                                                  setState(() {
                                                    activeIndex = index;
                                                  });
                                                },
                                                aspectRatio: 16 / 9,
                                                viewportFraction: 1,
                                                initialPage: 0,
                                                enableInfiniteScroll: true,
                                                reverse: false,
                                                autoPlay: true,
                                                autoPlayInterval:
                                                    const Duration(seconds: 3),
                                                autoPlayAnimationDuration:
                                                    const Duration(milliseconds: 800),
                                                autoPlayCurve: Curves.fastOutSlowIn,
                                                enlargeCenterPage: true,
                                                enlargeFactor: 0.3,
                                                scrollDirection: Axis.horizontal,
                                              )),
                                               Positioned(
                                                bottom: 10,
                                                left: 0,
                                                right: 0,
                                                 child: Row(
                                                   mainAxisAlignment: MainAxisAlignment.center,
                                                     children: [
                                                     AnimatedSmoothIndicator(
                                                      activeIndex: activeIndex,
                                                      count: holidayPackageController.getPackageDetailsData.length,
                                                      effect: ScaleEffect(
                                                  dotHeight: 9.0,
                                                  dotWidth: 9.0,
                                                  dotColor: kgrey,
                                                  activeDotColor: Colors.white),
                                           ),
                                     ],
                                 ),
                            ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Starting From ${widget.packageId}')
                                      .text
                                      .semiBold
                                      .blue900
                                      .make()
                                      .p2(),
                                      ksizedbox10,
                                  Text(' ₹ ${holidayPackageController.getPackageDetailsData.first.amount}').text.bold.xl2.blue900.make()
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
                                      ksizedbox10,
                                  InkWell(onTap: (){Get.to(EnquiryNowWidget(packageId: widget.packageId,));},
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
                          if (holidayController.reindex.value == 0) OverviewWidget(packageid: widget.packageId,),
                          if (holidayController.reindex.value == 1) HotelDetails(packageid: widget.packageId,),
                          if (holidayController.reindex.value == 2) DayWiseItinerary(),
                          if (holidayController.reindex.value == 3) AdditionalInfoWidget(),
                            
                    
                        ],
                      ),
                    ),
                  ),
                ), 
                 ],
            );
          }
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
