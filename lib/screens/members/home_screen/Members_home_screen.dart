import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/screens/members/flight_booking_screens/flight_booking_landing_screen.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constands/constands.dart';
import '../../bussiness/views/business/notification_screen.dart';
import '../coupen/coupons_screen.dart';
import '../holiday/holiday_home.dart';
import '../hottel/Hotel_members.dart';
import '../liquer_screen/liquer_screen.dart';
import '../offer screen/offer_screen_grid.dart';
import '../settings_views/upgrade_screen.dart';

class Home_screen1 extends StatefulWidget {
  const Home_screen1({super.key});

  @override
  State<Home_screen1> createState() => _Home_screen1State();
}

class _Home_screen1State extends State<Home_screen1> {
  CarouselController sliderController = CarouselController();
  final profileController = Get.find<ProfileController>();
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    profileController.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/images/projectlogo.png'),
                  GetBuilder<ProfileController>(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: profileController.profileData.isEmpty
                          ? Container()
                          : Text(
                              'Hello, ${profileController.profileData.first.name}',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                    );
                  }),
                  IconButton(
                      onPressed: () {
                        Get.to(const NotificationScreen());
                      },
                      icon: Icon(
                        Icons.notifications,
                        color: kwhite,
                      ))
                ],
              ),
            ),
          )),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // CarouselSlider(
          //     carouselController: sliderController,
          //     items: [
          //       Container(
          //         decoration: BoxDecoration(
          //             image: DecorationImage(
          //                 image:
          //                     AssetImage('assets/images/Scroll Group 11.png'))),
          //       ),
          //       Container(
          //         decoration: BoxDecoration(
          //             image: DecorationImage(
          //                 image: AssetImage('assets/images/Group 5767.png'))),
          //       ),
          //       Container(
          //         decoration: BoxDecoration(
          //             image: DecorationImage(
          //                 image: AssetImage('assets/images/Group 5807.png'))),
          //       ),
          //     ],
          //     options: CarouselOptions(
          //       height: 170,
          //       onPageChanged: (index, reason) {
          //         setState(() {
          //           activeIndex = index;
          //         });
          //       },
          //       aspectRatio: 16 / 9,
          //       viewportFraction: 1,
          //       initialPage: 0,
          //       enableInfiniteScroll: true,
          //       reverse: false,
          //       autoPlay: true,
          //       autoPlayInterval: Duration(seconds: 3),
          //       autoPlayAnimationDuration: Duration(milliseconds: 800),
          //       autoPlayCurve: Curves.fastOutSlowIn,
          //       enlargeCenterPage: true,
          //       enlargeFactor: 0.3,
          //       scrollDirection: Axis.horizontal,
          //     )),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     AnimatedSmoothIndicator(
          //       activeIndex: activeIndex,
          //       count: 3,
          //       effect: ScaleEffect(
          //           dotHeight: 9.0,
          //           dotWidth: 9.0,
          //           dotColor: kgrey,
          //           activeDotColor: kblue),
          //     ),
          //   ],
          // ),
          Row(
            children: [
              kwidth10,
              Text(
                'Subscribe Pakages',
                style: TextStyle(
                    color: knavblue, fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          InkWell(
              onTap: () {
                Get.to(UpgradeScreen());
              },
              child: Image.asset('assets/images/Group 5826.png')),
          Row(
            children: [
              kwidth10,
              Text(
                'Coupons',
                style: TextStyle(
                    color: knavblue, fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          ksizedbox20,
          InkWell(
              onTap: () {
                Get.to(Coupens_members());
              },
              child: Image.asset('assets/images/Group 5755.png')),
          ksizedbox20,
          Row(
            children: [
              kwidth10,
              Text(
                'Add Booking',
                style: TextStyle(
                    color: knavblue, fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          ksizedbox20,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => const FlightBookingLandingScreen());
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/Group 5778.png'),
                    const Text(
                      'Flight',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(Hotel());
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/Group 5827.png'),
                    Text(
                      'Hotel',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(liquer_screen());
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/Group 5828.png'),
                    Text(
                      'Liquer',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(Holiday_Home());
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/Group 5829.png'),
                    Text(
                      'Holiday\nPackage',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ],
          ),
          ksizedbox30,
          CarouselSlider(
              carouselController: sliderController,
              items: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/Scroll Group 10.png'))),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Group 5781.png'))),
                ),
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
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: 2,
                effect: ScaleEffect(
                    dotHeight: 9.0,
                    dotWidth: 9.0,
                    dotColor: kgrey,
                    activeDotColor: Colors.yellow),
              ),
            ],
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today Offer',
                  style: TextStyle(
                      color: knavblue,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: () {
                    Get.to(offer_screen());
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(color: korange),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 106,
                      width: 144,
                      child: InkWell(
                          onTap: () {
                            Get.to(offer_screen());
                          },
                          child: Image.asset('assets/images/aaaa.png')),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
