import 'package:bci/constands/constands.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../controllers/hotel_booking_controller.dart';
import 'search_hotel_screen.dart';

class Final_booking extends StatefulWidget {
  final String userIp;
  final String resultIndex;
  final String hotelCode;
  final String searchToken;
  Final_booking({
    super.key,
    required this.userIp,
    required this.resultIndex,
    required this.hotelCode,
    required this.searchToken,
  });

  @override
  State<Final_booking> createState() => _Final_bookingState();
}

class _Final_bookingState extends State<Final_booking> {
  CarouselController sliderController = CarouselController();
  final hotelController = Get.find<HotelBookingController>();
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    hotelController.hotelInfo(
        userIp: widget.userIp,
        resultIndex: widget.resultIndex,
        hotelCode: widget.hotelCode,
        searchToken: widget.searchToken);
    hotelController.getHotelRoomApiServices(
        userIp: widget.userIp,
        resultIndex: widget.resultIndex,
        hotelCode: widget.hotelCode,
        searchToken: widget.searchToken);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kblue,
        title: Text(
          'Hotel Booking',
          style: TextStyle(color: kwhite),
        ),
      ),
      body: GetBuilder<HotelBookingController>(builder: (_) {
        return ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              width: size.width * 0.9,
              child: hotelController.hotelInfoData.isEmpty
                  ? Container()
                  : Column(
                      children: [
                        // Image.asset('assets/images/NoPath - Copy (13).png'),
                        Stack(
                          children: [
                            CarouselSlider(
                              carouselController: sliderController,
                              items: [
                                for (int i = 0;
                                    i < hotelController.hotelInfoData.length;
                                    i++)
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(hotelController
                                            .hotelInfoData.first.images[i]),
                                      ),
                                    ),
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
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedSmoothIndicator(
                                    activeIndex: activeIndex,
                                    count: hotelController.hotelInfoData.length,
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
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      hotelController.hotelInfoData.isEmpty
                          ? Text('')
                          : Text(
                              hotelController.hotelInfoData.first.hotelName,
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w700),
                            ),
                      Row(
                        children: [
                          // hotelController.hotelInfoData.isEmpty
                          //     ? Text('')
                          //     : Text(hotelController
                          //         .hotelInfoData.first.countryName),
                          // kwidth5,
                          hotelController.hotelInfoData.isEmpty
                              ? Text('')
                              : Container(
                                  width: size.width * 0.8,
                                  child: Text(
                                    hotelController.hotelInfoData.first.address,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                )
                        ],
                      ),
                      ksizedbox30,
                      hotelController.hotelInfoData.isEmpty
                          ? Text('')
                          : Container(
                              width: size.width * 0.9,
                              child: ReadMoreText(
                                hotelController.hotelInfoData.first.description,
                                trimLines: 2,
                                colorClickableText: Colors.orange,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'show more',
                                trimExpandedText: ' show less',
                                lessStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                moreStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                      ksizedbox30,
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                            color: kblue, fontWeight: FontWeight.w700),
                      ),
                      ksizedbox10,
                      hotelController.hotelRoomsData.isEmpty
                          ? Text('')
                          : Text(
                              hotelController.hotelRoomsData.first
                                  .hotelRoomsDetails.first.price.roomPrice
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, color: kgrey),
                            ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Reviews',
                        style: TextStyle(
                            color: kblue, fontWeight: FontWeight.w700),
                      ),
                      ksizedbox10,
                      hotelController.hotelInfoData.isEmpty
                          ? Text('')
                          : Text(
                              hotelController.hotelInfoData.first.starRating
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, color: kgrey),
                            ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Availability',
                        style: TextStyle(
                            color: kblue, fontWeight: FontWeight.w700),
                      ),
                      ksizedbox10,
                      hotelController.hotelRoomsData.isEmpty
                          ? Text('')
                          : Text(
                              hotelController.hotelRoomsData.first
                                  .hotelRoomsDetails.first.availabilityType,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, color: kgrey),
                            ),
                    ],
                  )
                ],
              ),
            ),
            ksizedbox30,
            Row(
              children: [
                Text(
                  '     Amenities',
                  style: TextStyle(
                      fontSize: 21, fontWeight: FontWeight.w700, color: kblue),
                ),
              ],
            ),
            ksizedbox10,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: hotelController.hotelRoomsData.isEmpty
                  ? Text('')
                  : Container(
                      height: 50,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: hotelController.hotelRoomsData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(hotelController.hotelRoomsData.first
                                .hotelRoomsDetails[index].amenity.first
                                .toString()),
                          );
                        },
                      ),
                    ),
            ),
            //   child: ListView(
            //     physics: BouncingScrollPhysics(),
            //     shrinkWrap: true, scrollDirection: Axis.horizontal,
            //     //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Image.asset(
            //         'assets/images/Group 5816(1).png',
            //       ),
            //       Image.asset(
            //         'assets/images/aa.png',
            //       ),
            //       Image.asset(
            //         'assets/images/Group 5817(1).png',
            //       ),
            //       Image.asset(
            //         'assets/images/Group 5819(1).png',
            //       ),
            //       Image.asset('assets/images/Group 5820.png'),
            //       Image.asset('assets/images/Group 5821.png')
            //     ],
            //   ),
            // ),

            ksizedbox30,
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Image.asset('assets/images/Group 5822(1).png'),
                  SizedBox(
                    height: 58,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kblue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Get.to(SerchHotelScreen());
                        // Get.to(BusinessGenerate_otp
                        // ());
                      },
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ksizedbox20
          ],
        );
      }),
    );
  }
}
