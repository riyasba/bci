import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/screens/members/flight_booking_screens/flight_booking_landing_screen.dart';
import 'package:bci/screens/members/home_screen/others_service_screen.dart';
import 'package:bci/screens/members/home_screen/vendors_list_view.dart';
import 'package:bci/screens/members/offer%20screen/offer_screen_list_view.dart';
import 'package:bci/screens/members/settings_views/aditional_coupons.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:isgpayui_plugin/isgpayui_plugin.dart';
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
    _dateController.text = formatDate(selectedDate, [MM, '-', dd]);

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
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

  String? _setTime, _setDate;

  String? _hour, _minute, _time;

  String? dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = formatDate(selectedDate, [MM, '-', dd]);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour! + ' : ' + _minute!;
        _timeController.text = _time!;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                                        InkWell(
                                          onTap: () {
                                            if (homeController
                                                    .sliderData[i].product ==
                                                "Hotel") {
                                              Get.to(
                                                  SerchHotelScreen()); // startPlugin();
                                            } else if (homeController
                                                    .sliderData[i].product ==
                                                "Liquors") {
                                              Get.to(LiquorScreen());
                                            } else if (homeController
                                                    .sliderData[i].product ==
                                                "Bus") {
                                              Get.to(BusScreen());
                                            } else if (homeController
                                                    .sliderData[i].product ==
                                                "Flight") {
                                              Get.to(
                                                  FlightBookingLandingScreen());
                                            }
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Image.network(homeController
                                                .sliderData[i].image),
                                          ),
                                        )
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
                        Get.to(const MemberCouponScreen());
                      },
                      child: Image.asset('assets/icons/homecoupon.jpg')),
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
                        //

                        //
                        InkWell(
                          onTap: () {
                            Get.to(const SerchHotelScreen());
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
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10, right: 10),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       //
                  //       Row(
                  //         children: [
                  //           InkWell(
                  //             onTap: () {
                  //               // Get.to(const OthersServiceScreen());
                  //               Get.to(() => VendorsListView());
                  //             },
                  //             child: Column(
                  //               children: [
                  //                 Container(
                  //                   height: 58,
                  //                   width: 58,
                  //                   decoration: BoxDecoration(
                  //                       borderRadius: BorderRadius.circular(5),
                  //                       color: kblue),
                  //                   child: Image.asset(
                  //                       "assets/icons/icons (2).png"),
                  //                 ),
                  //                 const SizedBox(
                  //                   height: 7,
                  //                 ),
                  //                 const Text(
                  //                   'BCI Direct\nPartners',
                  //                   style:
                  //                       TextStyle(fontWeight: FontWeight.w700),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       //
                  //       //  InkWell(
                  //       //   onTap: () {
                  //       //     Get.to(const LiquorScreen());
                  //       //   },
                  //       //   child: Column(
                  //       //     children: [
                  //       //       Container(
                  //       //         height: 58,
                  //       //         width: 58,
                  //       //         decoration: BoxDecoration(
                  //       //             borderRadius: BorderRadius.circular(5),
                  //       //             color: kblue),
                  //       //         child:
                  //       //             Image.asset("assets/icons/icons (3).png"),
                  //       //       ),
                  //       //       const SizedBox(
                  //       //         height: 7,
                  //       //       ),
                  //       //       const Text(
                  //       //         'Liquors',
                  //       //         style: TextStyle(fontWeight: FontWeight.w700),
                  //       //       )
                  //       //     ],
                  //       //   ),
                  //       // ),
                  //       Container(
                  //         height: 58,
                  //         width: 58,
                  //       ),
                  //       Container(
                  //         height: 58,
                  //         width: 58,
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const VendorsListView());
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: kblue,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/projectlogo.png",
                                      height: 25,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "BCI Associate",
                                      style: primaryFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              profileController.downloadBroucher();
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: kOrange,
                                  borderRadius: BorderRadius.circular(5)),
                              alignment: Alignment.center,
                              child: Image.asset("assets/icons/pdf_img.png"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ksizedbox20,
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  //   child: InkWell(
                  //     onTap: () {

                  //     },
                  //     child: Container(
                  //       height: 45,
                  //       width: size.width,
                  //       decoration: BoxDecoration(
                  //           gradient:
                  //               LinearGradient(colors: [kOrange, kyellow]),
                  //           boxShadow: [
                  //             BoxShadow(
                  //                 blurRadius: 2,
                  //                 color: Colors.grey.withOpacity(0.5))
                  //           ],
                  //           borderRadius: BorderRadius.circular(30)),
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(left: 25, right: 25),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Image.asset(
                  //               "assets/images/pdf.png",
                  //               height: 25,
                  //             ),
                  //             const SizedBox(
                  //               width: 20,
                  //             ),
                  //             const Text(
                  //               "Download Brochure",
                  //               style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontWeight: FontWeight.w500,
                  //                   fontSize: 18),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Image.network(
                                  homeController.sliderList[i].image),
                            ),
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
                                  Get.to(const OfferScreenListView());
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
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount:
                                  homeController.todayOfferListData.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 140,
                                    width: size.width * 0.45,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 2,
                                              color:
                                                  Colors.grey.withOpacity(0.5))
                                        ]),
                                    child: InkWell(
                                        onTap: () {
                                          Get.to(const OfferScreenListView());
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            homeController
                                                .todayOfferListData[index]
                                                .image,
                                            fit: BoxFit.fill,
                                          ),
                                        )),
                                  ),
                                );
                              }),
                        );
                      }),
                    )
                ],
              ),
      ),
    );
  }
}
