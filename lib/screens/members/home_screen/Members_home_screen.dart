import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/screens/members/flight_booking_screens/flight_booking_landing_screen.dart';
import 'package:bci/screens/members/home_screen/others_service_screen.dart';
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
import '../bus/bus_screen.dart';
import '../coupen/coupons_screen.dart';
import '../holiday/holiday_home.dart';
import '../hottel/Hotel_members.dart';
import '../hottel/search_hotel_screen.dart';
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
  final homeController = Get.find<HomeController>();
  final flightController = Get.find<FlightsController>();
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    getDatas();
  }

  getDatas() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileController.getProfile();
      homeController.getSlider();
      homeController.todayOffers();
      homeController.sliderProduct();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: PreferredSize(
        
          preferredSize: const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 140,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 22, left: 15, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/projectlogo.png'),
                    GetBuilder<ProfileController>(
                      builder: (_) {
                        return profileController.profileData.isEmpty
                            ? Container()
                            : Text(
                                'Hello, ${profileController.profileData.first.name}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              );
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(
                          const NotificationScreen(),
                        );
                      },
                      icon: Icon(
                        Icons.notifications,
                        color: kwhite,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
      body: Obx(
        () => profileController.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(
                  color: kblue,
                ),
              )
            : ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Obx(
                    () => Column(
                      children: [
                        profileController.isSubscribed.isTrue
                            ? Column(
                                children: [
                                  CarouselSlider(
                                    carouselController: sliderController,
                                    items: [
                                      for (int i = 0;
                                          i < homeController.sliderData.length;
                                          i++)
                                        Image.network(
                                            homeController.sliderData[i].image)
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
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AnimatedSmoothIndicator(
                                        activeIndex: activeIndex,
                                        count: homeController.sliderData.length,
                                        effect: ScaleEffect(
                                            dotHeight: 9.0,
                                            dotWidth: 9.0,
                                            dotColor: kgrey,
                                            activeDotColor: kblue),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Row(
                                    children: [
                                      kwidth10,
                                      Text(
                                        'Subscribe Packages',
                                        style: TextStyle(
                                            color: knavblue,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Get.to(const UpgradeScreen());
                                      },
                                      child: Image.asset(
                                          'assets/images/Group 5826.png')),
                                ],
                              ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      kwidth10,
                      Text(
                        'Coupons',
                        style: TextStyle(
                            color: knavblue,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  ksizedbox20,
                  InkWell(
                      onTap: () {
                        Get.to(const CoupensMembers());
                      },
                      child: Image.asset('assets/images/Group 5755.png')),
                  ksizedbox20,
                  Row(
                    children: [
                      kwidth10,
                      InkWell(
                        onTap: () {
                          // flightController.downloadFlightTicketInvoice();
                        },
                        child: Text(
                          'Add Booking',
                          style: TextStyle(
                              color: knavblue,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(
                                    () => const FlightBookingLandingScreen());
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 58,
                                    width: 58,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: kblue),
                                    child: Image.asset(
                                        "assets/icons/icons (1).png"),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  const Text(
                                    'Flight',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        //
                        InkWell(
                          onTap: () {
                            Get.to(SerchHotelScreen());
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 58,
                                width: 58,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: kblue),
                                child:
                                    Image.asset("assets/icons/icons (4).png"),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              const Text(
                                'Hotels',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        //
                        InkWell(
                          onTap: () {
                            Get.to(const LiquorScreen());
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 58,
                                width: 58,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: kblue),
                                child:
                                    Image.asset("assets/icons/icons (3).png"),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              const Text(
                                'Liquors',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        //
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(const HolidayHome());
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 58,
                                    width: 58,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: kblue),
                                    child: Image.asset(
                                        "assets/icons/icons (5).png"),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  const Text(
                                    'Holiday\nPackage',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(const OthersServiceScreen());
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 58,
                                    width: 58,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: kblue),
                                    child: Image.asset(
                                        "assets/icons/icons (2).png"),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  const Text(
                                    'BCI Direct\nPartners',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        //
                        InkWell(
                          onTap: () {
                            Get.to(const BusScreen());
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 58,
                                width: 58,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: kblue),
                                child: Image.asset("assets/icons/buslogo.png"),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              const Text(
                                'Bus',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 58,
                          width: 58,
                        ),
                        Container(
                          height: 58,
                          width: 58,
                        ),
                      ],
                    ),
                  ),

                  // ksizedbox20,
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     InkWell(
                  //       onTap: () {
                  //         Get.to(() => const FlightBookingLandingScreen());
                  //       },
                  //       child: Column(
                  //         children: [
                  //           Image.asset('assets/images/Group 5778.png'),
                  //           const Text(
                  //             'Flight',
                  //             style: TextStyle(fontWeight: FontWeight.w700),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         Get.to(Hotel());
                  //       },
                  //       child: Column(
                  //         children: [
                  //           Image.asset('assets/images/Group 5827.png'),
                  //           Text(
                  //             'Hotel',
                  //             style: TextStyle(fontWeight: FontWeight.w700),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         Get.to(const liquer_screen());
                  //       },
                  //       child: Column(
                  //         children: [
                  //           Image.asset('assets/images/Group 5828.png'),
                  //           const Text(
                  //             'Liquors',
                  //             style: TextStyle(fontWeight: FontWeight.w700),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         Get.to(const Holiday_Home());
                  //       },
                  //       child: Column(
                  //         children: [
                  //           Image.asset('assets/images/Group 5829.png'),
                  //           const Text(
                  //             'Holiday\nPackage',
                  //             style: TextStyle(fontWeight: FontWeight.w700),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         Get.to(const OthersServiceScreen());
                  //       },
                  //       child: Column(
                  //         children: [
                  //           const SizedBox(
                  //             height: 6,
                  //           ),
                  //           Container(
                  //               height: 58,
                  //               width: 55,
                  //               decoration: BoxDecoration(
                  //                   color: kblue,
                  //                   borderRadius: BorderRadius.circular(3)),
                  //               child: const Icon(
                  //                 Icons.open_with,
                  //                 color: Colors.white,
                  //               )),
                  //           ksizedbox10,
                  //           const Text(
                  //             'Others',
                  //             style: TextStyle(fontWeight: FontWeight.w700),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //     kwidth10
                  //   ],
                  // ),
                  ksizedbox30,
                  // if (homeController.sliderList.isNotEmpty)
                  CarouselSlider(
                      carouselController: sliderController,
                      items: [
                        for (int i = 0;
                            i < homeController.sliderList.length;
                            i++)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            // child: Container(
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10),
                            //     color: Colors.red,
                            //       image: DecorationImage(
                            //     image: NetworkImage(
                            //         homeController.sliderList[i].image),
                            //   )),
                            // ),
                            child: Image.network(
                                homeController.sliderList[i].image),
                          ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       image: DecorationImage(
                        //           image: AssetImage('assets/images/Group 5781.png'))),
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
                        autoPlayInterval: const Duration(seconds: 4),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      )),
                  if (homeController.sliderList.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedSmoothIndicator(
                            activeIndex: activeIndex,
                            count: homeController.sliderList.length,
                            effect: ScaleEffect(
                                dotHeight: 9.0,
                                dotWidth: 9.0,
                                dotColor: kgrey,
                                activeDotColor: Colors.yellow),
                          ),
                        ],
                      ),
                    ),
                  ksizedbox10,
                  homeController.todayOfferListData.isEmpty
                      ? Container(
                          height: 20,
                        )
                      : Padding(
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
                                  Get.to(const TodayOfferScreen());
                                },
                                child: Text(
                                  'See All',
                                  style: TextStyle(color: korange),
                                ),
                              )
                            ],
                          ),
                        ),
                  if (homeController.todayOfferListData.isNotEmpty)
                    Container(
                      height: 150,
                      child: GetBuilder<HomeController>(builder: (_) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: homeController.todayOfferListData.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: InkWell(
                                      onTap: () {
                                        Get.to(const TodayOfferScreen());
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(homeController
                                            .todayOfferListData[index].image),
                                      )),
                                ),
                              );
                            });
                      }),
                    )
                ],
              ),
      ),
    );
  }
}
