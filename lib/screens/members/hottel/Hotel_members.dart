import 'package:bci/controllers/hotel_booking_controller.dart';
import 'package:bci/screens/members/hottel/wigets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import '../../../constands/constands.dart';
import '../../../controllers/home_page_controller.dart';
import 'final_booking.dart';

class HotelListScreen extends StatefulWidget {
  HotelListScreen({
    super.key,
  });

  @override
  State<HotelListScreen> createState() => _HotelListScreenState();
}

class _HotelListScreenState extends State<HotelListScreen> {
  final hotelBookingController = Get.find<HotelBookingController>();
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhite,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/images/Group 5814.png')),
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(50.0),
        //   child: Stack(
        //     children: [
        //       // Image.asset(homeController.bannerData.first.image),
        //       // Positioned(top: -5, child: search())
        //     ],
        //   ),
        // ),
      ),
      backgroundColor: kwhite,
      body: ListView.builder(
        itemCount: hotelBookingController.searchHotelData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 130,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          child: Image.network(
                            hotelBookingController
                                .searchHotelData[index].hotelPicture,
                            width: 100,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                hotelBookingController
                                    .searchHotelData[index].hotelName,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              width: 200,
                              child: Text(
                                hotelBookingController
                                    .searchHotelData[index].hotelAddress,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Text(
                              '₹ ${hotelBookingController.searchHotelData[index].price.publishedPrice}',
                              style: TextStyle(color: kblue),
                            ),
                            ksizedbox10,
                          ],
                        ),
                      ),
                    ],
                  ),
                  height: 135,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5, color: Colors.grey.withOpacity(0.5)),
                    ],
                  ),
                ),

                Positioned(
                  right: 5,
                  top: 0,
                  bottom: 0,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();
                          var searchtocken = prefs.getString("searchtoken");
                          Get.to(HotelInfobooking(
                            hotelCode: hotelBookingController
                                .searchHotelData[index].hotelCode,
                            resultIndex: hotelBookingController
                                .searchHotelData[index].resultIndex
                                .toString(),
                            searchToken: searchtocken ?? "",
                            userIp: '122.160.83.78',

                            // hotelBookingController.blockroomdata[index].hotelRoomsDetails.toString(),
                          ));
                          hotelBookingController.update();
                          // print(
                          //     'hotel code${hotelBookingController.searchHotelData[index].hotelCode}');
                          // print(
                          //     'result index${hotelBookingController.searchHotelData[index].resultIndex}');
                          // print(
                          //     'search tocken${searchtocken}');
                          // print(
                          //     'hotel code${hotelBookingController.searchHotelData[index].hotelCode}');
                        },
                        child: Container(
                            height: 100,
                            width: 51,
                            decoration: BoxDecoration(
                                color: kblue,
                                borderRadius: BorderRadius.circular(16)),
                            alignment: Alignment.center,
                            child: Transform.rotate(
                              angle: -math.pi / 2.0,
                              child: const Text(
                                "Booking",
                                style: TextStyle(
                                    color: Color(0xFFD1D1D1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                            )),
                      )),
                ),
                //
              ],
            ),
          );
        },
      ),
    );
  }
}
