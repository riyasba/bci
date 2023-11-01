import 'package:bci/models/hotel_booking_models/store_temp_search_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../../../constands/constands.dart';
import '../../../controllers/hotel_booking_controller.dart';
import '../../../models/hotel_booking_models/search_city_list_model.dart';

class SerchHotelScreen extends StatefulWidget {
  const SerchHotelScreen({
    super.key,
  });

  @override
  State<SerchHotelScreen> createState() => _SerchHotelScreenState();
}

class _SerchHotelScreenState extends State<SerchHotelScreen> {
  DateTimeRange daterange = DateTimeRange(
      start: DateTime.now(), end: DateTime.now().add(Duration(days: 1)));

  final hotelController = Get.find<HotelBookingController>();
  final destinationcontrolr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final start = daterange.start;
    final end = daterange.end;
    final diffrence = daterange.duration;
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
                  child: GetBuilder<HotelBookingController>(builder: (_) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: size.height * 0.06,
                      width: size.width * 0.2,
                      child: TypeAheadField<SearchCityListModel>(
                        getImmediateSuggestions: true,
                        textFieldConfiguration: TextFieldConfiguration(
                          onChanged: (value) async {
                            if (value.length > 1) {
                              await Future.delayed(
                                  const Duration(milliseconds: 200));
                              Get.find<HotelBookingController>()
                                  .hotelCityList(searchCity: value.trim());
                            }
                          },
                          controller: destinationcontrolr,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              hintText: 'Search for hotels'),
                        ),
                        suggestionsCallback: (String pattern) async {
                          return hotelController.getHotelCityList
                              .where((item) => item.destination
                                  .toLowerCase()
                                  .startsWith(pattern.toLowerCase()))
                              .toList();
                        },
                        itemBuilder: (context, SearchCityListModel citymodel) {
                          return  ListTile(
                                  title: Text(citymodel.destination),
                                );
                        },
                        itemSeparatorBuilder: (context, index) {
                          return Divider();
                        },
                        onSuggestionSelected: (SearchCityListModel citymodel) {
                          print("destination selected");
                          destinationcontrolr.text = citymodel.destination;
                          //    hotelController.toCity(citymodel.cityName);
                          hotelController.hotelSearchKey(citymodel.cityid);
                          hotelController
                              .hotelSearchKeyCode(citymodel.countrycode);
                          print(citymodel.cityid);
                          print(citymodel.country);
                          print(citymodel.countrycode);
                          print(citymodel.destination);
                        },
                      ),
                    );
                  }),
                ),
              ),
            ]),
          ])),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ksizedbox10,
          GestureDetector(
            onTap: pickDateRange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      border: Border.all(color: kblue),
                      color: kwhite,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          DateFormat('dd/MM/yyyy').format(start),
                          style: TextStyle(color: kblue, fontSize: 14.sp),
                        ),
                        Icon(
                          Icons.calendar_month_outlined,
                          color: kblue,
                        )
                      ],
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: kblue,
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(color: kblue),
                          color: kwhite,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              DateFormat('dd/MM/yyyy').format(end),
                              style: TextStyle(color: kblue, fontSize: 14.sp),
                            ),
                            Icon(
                              Icons.calendar_month_outlined,
                              color: kblue,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'You Selected ${diffrence.inDays} Day ',
              style: TextStyle(
                  color: kblue, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Guest',
                  style: TextStyle(
                      fontSize: 25, color: kblue, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(
              () => Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Adult',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                      ksizedbox10,
                      Container(
                        height: 25,
                        width: 75,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  hotelController.adult--;
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 20,
                                )),
                            Container(
                              height: 25,
                              width: 25,
                              color: Colors.orange,
                              child: Center(
                                child: Text(
                                  hotelController.adult.value.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  hotelController.adult++;
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 20,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  kwidth10,
                  kwidth10,
                  Column(
                    children: [
                      Text(
                        'Room',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                      ksizedbox10,
                      Container(
                        height: 25,
                        width: 75,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  hotelController.roomno--;
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 20,
                                )),
                            Container(
                              height: 25,
                              width: 25,
                              color: Colors.orange,
                              child: Center(
                                child: Text(
                                  hotelController.roomno.value.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                hotelController.roomno++;
                              },
                              child: const Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ksizedbox40,
          Obx(
            () => InkWell(
              onTap: () {
                hotelController.tempBookingModel = TempBookingModel(
                    bookingDate: DateFormat('dd/MM/yyyy').format(start),
                    noOfDays: diffrence.inDays.toString(),
                    noOfPeople: hotelController.adult.value.toString(),
                    place: destinationcontrolr.text);
                hotelController.searchHotel(
                    child: hotelController.child.value,
                    adult: hotelController.adult.value,
                    checkindate: DateFormat('dd/MM/yyyy').format(start),
                    checkoutdate: DateFormat('dd/MM/yyyy').format(end),
                    destination: hotelController.hotelSearchKey.value,
                    //  childage: hotelController.roomno.value,
                    roomsno: hotelController.roomno.string,
                    countryCode: hotelController.hotelSearchKeyCode.value);
                //Get.to(Sucessful_screen_hotel());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: hotelController.isLoading.isTrue
                    ? Container(
                        width: double.infinity,
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            24,
                          ),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFFFF5C29),
                              Color(0xFFFFCD38),
                            ],
                          ),
                        ),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            24,
                          ),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFFFF5C29),
                              Color(0xFFFFCD38),
                            ],
                          ),
                        ),
                        child: const Text(
                          'Search',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
              ),
            ),
          ),
          ksizedbox40
        ],
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDateRange: daterange,
    );

    if (newDateRange == null) return;

    setState(() => daterange = newDateRange);
  }
}
