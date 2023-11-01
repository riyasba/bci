import 'package:bci/controllers/hotel_booking_controller.dart';
import 'package:bci/models/hotel_booking_models/search_city_list_model.dart';
import 'package:bci/models/hotel_booking_models/search_hotel_list_model.dart';
import 'package:bci/screens/members/hottel/wigets/search.dart';
import 'package:bci/widgets/hotel_widgets/hotel_filter_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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
  final hotelController = Get.find<HotelBookingController>();
  final destinationcontrolr = TextEditingController();
  var searchTextEditingController = TextEditingController();

  List<SearchHotelData> _searchResult = [];

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    hotelBookingController.searchHotelData.forEach((searchData) {
      if (searchData.hotelName.contains(text) ||
          searchData.hotelAddress.contains(text)) {
        _searchResult.add(searchData);
      }
    });

    setState(() {});
  }

  _getFilteredList() {
    print("searching .........${searchTextEditingController.text}");
    hotelBookingController.searchHotelData = hotelBookingController
        .searchHotelData
        .where((value) => value.hotelName
            .toLowerCase()
            .contains(searchTextEditingController.text.toLowerCase()))
        .toList();

    if (searchTextEditingController.text.isEmpty) {
      hotelBookingController.searchHotelData =
          hotelBookingController.tempSearchHotelData;
    }

    hotelBookingController.update();
  }

  @override
  void initState() {
    super.initState();
    searchTextEditingController.addListener(_getFilteredList);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8FD),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(280),
          child: Column(children: [
            Stack(children: [
              Container(
                height: size.height * 0.35,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                      height: size.height * 0.34,
                      width: size.width,
                      child: Image.asset(
                        'assets/icons/hotelbanner.png',
                        height: size.height * 0.34,
                        width: size.width,
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: kOrange,
                                    borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                    child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: kwhite,
                                  size: 16,
                                ))),
                            kwidth10,
                            Text(
                              'Find your hotel',
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700,
                                  color: kwhite),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            filterHotelBooking(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.filter_alt,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ))),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: size.height * 0.06,
                      width: size.width * 0.2,
                      child: TextFormField(
                        controller: searchTextEditingController,
                        decoration: InputDecoration(
                            hintText: "Search for hotels",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      )),
                ),
              ),
            ]),
          ])),
      body: GetBuilder<HotelBookingController>(builder: (_) {
        return ListView.builder(
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
                                width: 180,
                                child: Text(
                                  hotelBookingController
                                      .searchHotelData[index].hotelName,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Text(
                                  hotelBookingController
                                      .searchHotelData[index].hotelAddress,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
                                      fontSize: 12),
                                ),
                              )),
                        )),
                  ),
                  //
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
