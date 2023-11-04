import 'package:bci/controllers/bus_controllers.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/controllers/hotel_booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:bci/constands/constands.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../hottel/wigets/search.dart';

class HotelCityNameSearchView extends StatefulWidget {
  const HotelCityNameSearchView({super.key});

  @override
  State<HotelCityNameSearchView> createState() => _ToBusCitySearchScreenState();
}

class _ToBusCitySearchScreenState extends State<HotelCityNameSearchView> {
  final hotelController = Get.find<HotelBookingController>();

  @override
  void initState() {
    super.initState();
    setDefault();
  }

  setDefault() async {
    WidgetsBinding.instance.addPostFrameCallback((timings) {
      hotelController.getHotelCityList.clear();
      hotelController.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQurey = MediaQuery.of(context).size;
    return Container(
        color: kblue,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: ListView(children: [
              Column(children: [
                ksizedbox20,
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child:
                              Image.asset('assets/images/parflaightback.png')),
                      Text(
                        'Places',
                        style: TextStyle(fontSize: 20, color: kwhite),
                      )
                    ],
                  ),
                ),
                ksizedbox10,
                //search2(),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xFFEFEEEE),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.grey.withOpacity(0.5)),
                        ]),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                              onChanged: (value) async {
                                if (value.length > 1) {
                                  await Future.delayed(
                                      const Duration(milliseconds: 200));
                                  Get.find<HotelBookingController>()
                                      .hotelCityList(searchCity: value);
                                }
                              },
                              decoration: const InputDecoration.collapsed(
                                  hintText: "Search city")),
                        ),
                      ],
                    ),
                  ),
                ),
                ksizedbox10,
                Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Stack(children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            height: _mediaQurey.height > 700 ? 600 : 540.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: const Offset(0.0, 0.75),
                                      blurRadius: 5,
                                      color: kwhite),
                                ],
                                borderRadius: BorderRadius.circular(5)),
                            child: GetBuilder<HotelBookingController>(
                                builder: (_) {
                              return hotelController.getHotelCityList.isEmpty
                                  ? const Center(
                                      child: Text("No data found"),
                                    )
                                  : ListView(children: [
                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.only(top: 15, left: 20),
                                      //   child: Row(
                                      //     children: [
                                      //       Text(
                                      //         'Recently Searched',
                                      //         style:
                                      //             TextStyle(fontSize: 21, color: kblue),
                                      //       )
                                      //     ],
                                      //   ),
                                      // ),
                                      ksizedbox10,
                                      for (int i = 0;
                                          i <
                                              hotelController
                                                  .getHotelCityList.length;
                                          i++)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: InkWell(
                                            onTap: () {
                                              hotelController.hotelSearchKey(
                                                  hotelController
                                                      .getHotelCityList[i]
                                                      .cityid);
                                              hotelController
                                                  .hotelSearchKeyCode(
                                                      hotelController
                                                          .getHotelCityList[i]
                                                          .countrycode);
hotelController.destinationcontrolr.text =  hotelController
                                                      .getHotelCityList[i].destination;
                                                    hotelController.update()  ;
                                              Get.back();
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // Container(
                                                //   width:
                                                //       MediaQuery.of(context)
                                                //               .size
                                                //               .width *
                                                //           0.2,
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment
                                                //             .spaceBetween,
                                                //     children: [
                                                //       ElevatedButton(
                                                //         style: ElevatedButton
                                                //             .styleFrom(
                                                //                 minimumSize:
                                                //                     const Size(
                                                //                         30,
                                                //                         25),
                                                //                 backgroundColor:
                                                //                     kblue),
                                                //         onPressed: () {},
                                                //         child: Text(
                                                //           hotelController.getBusCityList[i].cityName,
                                                //         ),
                                                //       ),
                                                //     ],
                                                //   ),
                                                // ),
                                                Container(
                                                  height: 40,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5,
                                                  child: Text(
                                                    hotelController
                                                        .getHotelCityList[i]
                                                        .destination,
                                                    // flightsController
                                                    //     .airports[i].name,
                                                    style: TextStyle(
                                                        fontSize: 15.sp),
                                                  ),
                                                ),
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                    child: Text("",
                                                        // flightsController
                                                        //     .airports[i]
                                                        //     .dst,
                                                        style: TextStyle(
                                                            fontSize: 15.sp)))
                                              ],
                                            ),
                                          ),
                                        ),
                                    ]);
                            }),
                          ))
                    ]))
              ])
            ]))));
  }
}
