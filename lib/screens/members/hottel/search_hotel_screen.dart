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
      start: DateTime.now(),
      end: DateTime.now().add(Duration(days: 1)));

  final hotelController = Get.find<HotelBookingController>();
  final Destinationcontrolr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final start = daterange.start;
    final end = daterange.end;
    final diffrence = daterange.duration;
    return Scaffold(
      backgroundColor: Color(0xFFF9F8FD),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Search Your Hotel',
              style: TextStyle(
                  fontSize: 25, color: kblue, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                //  color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              height: size.height * 0.06,
              width: size.width * 0.2,
              child: TypeAheadField<SearchCityListModel>(
                getImmediateSuggestions: true,
                textFieldConfiguration: TextFieldConfiguration(
                  onChanged: (value) async {
                    if (value.length > 1) {
                      await Future.delayed(const Duration(milliseconds: 200));
                      Get.find<HotelBookingController>()
                          .hotelCityList(searchCity: value.trim());
                    }
                  },
                  controller: Destinationcontrolr,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Destination'),
                ),
                suggestionsCallback: (String pattern) async {
                  return hotelController.getHotelCityList
                      .where((item) => item.destination
                          .toLowerCase()
                          .startsWith(pattern.toLowerCase()))
                      .toList();
                },
                itemBuilder: (context, SearchCityListModel citymodel) {
                  return ListTile(
                    title: Text(citymodel.destination),
                  );
                },
                itemSeparatorBuilder: (context, index) {
                  return Divider();
                },
                onSuggestionSelected: (SearchCityListModel citymodel) {
                  print("destination selected");
                  Destinationcontrolr.text = citymodel.destination;
                  //    hotelController.toCity(citymodel.cityName);
                  hotelController.hotelSearchKey(citymodel.cityid);
                  hotelController.hotelSearchKeyCode(citymodel.countrycode);
                  print(citymodel.cityid);
                  print(citymodel.country);
                  print(citymodel.countrycode);
                  print(citymodel.destination);
                },
              ),
            ),
          ),

          ksizedbox30, //  Image.asset('assets/images/Group 5823(1).png',
          //     height: 500, fit: BoxFit.cover),
          GestureDetector(
            onTap: pickDateRange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ], 
                      color: kwhite, borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          DateFormat('dd/MM/yyyy').format(start),
                          style: TextStyle(color: kblue, fontSize: 14.sp),
                        ),
                      Icon(
                          Icons.calendar_month_outlined,
                          color: kblue,
                        )  ],
                    ),
                  ),
                ),
                Image.asset('assets/images/Repeat Grid 3.png'),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ], color: kwhite, borderRadius: BorderRadius.circular(16)),
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
                  // Column(
                  //   children: [
                  //     Text(
                  //       'Child',
                  //       style: TextStyle(
                  //           fontSize: 20.sp,
                  //           color: kblue,
                  //           fontWeight: FontWeight.w500),
                  //     ),
                  //     ksizedbox10,
                  //     Container(
                  //       height: 25,
                  //       width: 75,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(),
                  //       ),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           InkWell(
                  //             onTap: () {
                  //               hotelController.child--;
                  //             },
                  //             child: const Icon(
                  //               Icons.remove,
                  //               size: 20,
                  //             ),
                  //           ),
                  //           Container(
                  //             height: 25,
                  //             width: 25,
                  //             color: Colors.orange,
                  //             child: Center(
                  //               child: Text(
                  //                 hotelController.child.value.toString(),
                  //                 style: const TextStyle(color: Colors.white),
                  //               ),
                  //             ),
                  //           ),
                  //           InkWell(
                  //               onTap: () {
                  //                 hotelController.child++;
                  //               },
                  //               child: const Icon(
                  //                 Icons.add,
                  //                 size: 20,
                  //               )),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
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

          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Row(
          //     children: [
          //       Text(
          //         'Rooms',
          //         style: TextStyle(
          //             fontSize: 25, color: kblue, fontWeight: FontWeight.w500),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   width: 100,
          //   child: Dropdown_hotel(
          //     options: ['AC', 'Non AC'],
          //     label: 'Room Choose Ac or Non Ac',
          //   ),
          // ),
          ksizedbox40,
          ksizedbox40,
          Obx(
            () => InkWell(
              onTap: () {
                hotelController.searchHotel(
                  child: hotelController.child.value,
                  adult: hotelController.adult.value,
                  checkindate: DateFormat('dd/MM/yyyy').format(start),
                  checkoutdate: DateFormat('dd/MM/yyyy').format(end),
                  destination: hotelController.hotelSearchKey.value,
                  //  childage: hotelController.roomno.value,
                  roomsno: hotelController.roomno.string,
                  countryCode: hotelController.hotelSearchKeyCode.value
                );
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
                        child: Text(
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
      appBar: AppBar(
        backgroundColor: Color(0xFFF9F8FD),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            'assets/images/Icon awesome-arrow-right.png',
          ),
        ),
        // title: Text(
        //   'Hotel Booking',
        //   style: TextStyle(
        //       fontSize: 27, fontWeight: FontWeight.w500, color: kblue),
        // ),
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
