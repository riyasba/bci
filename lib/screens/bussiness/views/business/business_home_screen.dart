import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/screens/members/offer%20screen/offer_screen_grid.dart';
import 'package:bci/screens/bussiness/views/busines_widget/bottumnavigation.dart';
import 'package:bci/screens/bussiness/views/home_screen/services_view_screens/availability_scree.dart';
import 'package:bci/screens/bussiness/views/home_screen/bookings_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/offers_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/service_booking_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/my_account_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../home_screen/contact_admin.dart';
import '../home_screen/coupon_screen.dart';
import 'notification_screen.dart';

class BusinessHomeScreen extends StatefulWidget {
  BusinessHomeScreen({super.key});

  @override
  State<BusinessHomeScreen> createState() => _BusinessHomeScreenState();
}

class _BusinessHomeScreenState extends State<BusinessHomeScreen> {
  CarouselController sliderController = CarouselController();
  int activeIndex = 0;

  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    profileController.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
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
                                  fontSize: 23,
                                  //fontWeight: FontWeight.bold,
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
      body: ListView(physics: BouncingScrollPhysics(), children: [
        Column(
          children: [
            CarouselSlider(
                carouselController: sliderController,
                items: [
                  Container(
                    decoration:const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/sliderimage1.png'))),
                  ),
                  Container(
                    decoration:const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/sliderimage2.png'))),
                  ),
                  Container(
                    decoration:const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/sliderimage3.png'))),
                  )
                ],
                options: CarouselOptions(
                  height: 180,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
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
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: 3,
              effect: ScaleEffect(
                  dotHeight: 9.0,
                  dotWidth: 9.0,
                  dotColor: kgrey,
                  activeDotColor: kOrange),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 158, top: 25),
              child: Text(
                'Available Service',
                style: TextStyle(
                    fontSize: 23, color: kblue, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //
                InkWell(
                  onTap: () {
                    Get.to(const AvailabilityScreen());
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset('assets/images/availability.png'),
                        const Text('Availability\n')
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.offAll(HomeBottomnavigationBar(
                      index: 2,
                    ));
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset('assets/images/wallet.png'),
                        const Text(
                          'Wallet\n',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const ContactAdmin());
                  },
                  child: Container(
                      child: Column(
                    children: [
                      Image.asset('assets/images/contactadmin.png'),
                      const Text(
                        'Contact\n Admin',
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.offAll(HomeBottomnavigationBar(
                      index: 3,
                    ));
                    //Get.to(const BusinessBookingScreen());
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset('assets/images/booking.png'),
                        const Text(
                          'Bookings\n\n',
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const OffersScreen());
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset('assets/images/offers.png'),
                        const Text(
                          'Offers\n\n',
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const ServiceBookingScreen());
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset('assets/images/servicebooking.png'),
                        const Text(
                          'Service\nBookings\nRequest',
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
             const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(const CouponScreen());
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset('assets/images/cupenimage.png'),
                        const Text(
                          'Coupon\nRedemention',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const AvailabilityScreen());
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset('assets/images/availability.png'),
                        const Text('Availability\n')
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const MyAccountScreen());
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset('assets/images/jhon.png'),
                        const Text('Jhon\n')
                      ],
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: () {},
                //   child: Container(
                //     child: Column(
                //       children: [
                //         Container(
                //           width: 80.w,
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ]),
    );
  }
}
