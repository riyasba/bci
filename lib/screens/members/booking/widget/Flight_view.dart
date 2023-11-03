import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/models/flight_booking_models/get_flight_booking_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:math' as math;
import '../../../../constands/constands.dart';

class FlightWidget extends StatefulWidget {
  const FlightWidget({super.key});

  @override
  State<FlightWidget> createState() => _FlightWidgetState();
}

class _FlightWidgetState extends State<FlightWidget> {
  final flightController = Get.find<FlightsController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flightController.getFlightBookingHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: GetBuilder<FlightsController>(builder: (_) {
        return flightController.flightBookingHistoyrList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/flightnotavailableimage.png'),
                    ksizedbox20,
                    Text(
                      'No Bookings',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemCount: flightController.flightBookingHistoyrList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        dialogBuilder(context,
                            flightBookedData: flightController
                                .flightBookingHistoyrList[index]);
                      },
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kwhite,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  offset: const Offset(0.0, 0.75),
                                  blurRadius: 5,
                                  color: kgrey),
                            ],
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'From',
                                      style:
                                          TextStyle(fontSize: 20, color: kblue),
                                    ),
                                    Text(
                                      flightController
                                          .flightBookingHistoyrList[index]
                                          .fromCityname,
                                      style:
                                          TextStyle(color: kgrey, fontSize: 15),
                                    ),
                                    Text(
                                      "Date: ${flightController.flightBookingHistoyrList[index].bookingDate.split(" ").first}",
                                      style:
                                          TextStyle(color: kgrey, fontSize: 15),
                                    )
                                  ],
                                ),
                                Image.asset('assets/images/Group 291.png'),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'To',
                                      style:
                                          TextStyle(fontSize: 20, color: kblue),
                                    ),
                                    Text(
                                      flightController
                                          .flightBookingHistoyrList[index]
                                          .toCityname,
                                      style:
                                          TextStyle(color: kgrey, fontSize: 15),
                                    ),
                                    Text(
                                      '',
                                      style:
                                          TextStyle(color: kgrey, fontSize: 15),
                                    )
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }

  Future<void> dialogBuilder(
    BuildContext context, {
    required FlightBookedData flightBookedData,
  }) {
    return showDialog<void>(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          title: Container(
            height: 400,
            width: 300,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: kblue,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Details',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/Group 291.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            flightBookedData.remark,
                            style: TextStyle(
                                fontSize: 16,
                                color: kblue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Date : ${flightBookedData.bookingDate.split(" ").first}',
                          style: TextStyle(
                              fontSize: 12,
                              color: kblue,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'From city',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      flightBookedData.fromCityname,
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'To City',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      flightBookedData.toCityname,
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Booking Ref.no',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      flightBookedData.bookingRefNo,
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Airline code',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      flightBookedData.airlineCode,
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Invoice number',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      flightBookedData.invoiceNumber,
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                // const Divider(
                //   thickness: 1,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Quantity',
                //       style: TextStyle(
                //           fontSize: 16,
                //           color: kblue,
                //           fontWeight: FontWeight.bold),
                //     ),
                //     Text(
                //       qty,
                //       style: TextStyle(
                //           fontSize: 15,
                //           color: kblue,
                //           fontWeight: FontWeight.w500),
                //     ),
                //   ],
                // ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        print(flightBookedData.remark);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text("Cancel Booking",
                                    style: boldTextStyle(color: Colors.black)),
                                content: Text(
                                  "Are you sure you want to Cancel?",
                                  style:
                                      secondaryTextStyle(color: Colors.black),
                                ),
                                actions: [
                                  TextButton(
                                    child: Text(
                                      "Yes",
                                      style: primaryTextStyle(color: kblue),
                                    ),
                                    onPressed: () {
                                      Get.find<FlightsController>()
                                          .airCancelTicket(
                                              refernceNo: flightBookedData
                                                  .bookingRefNo);
                                      Get.back();
                                      //Get.find<AuthController>().logout();
                                    },
                                  ),
                                  TextButton(
                                    child: Text("No",
                                        style: primaryTextStyle(color: kblue)),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('Download ')
                    // InkWell(
                    //   onTap: () {
                    //     Get.find<FlightsController>().downloadTicketHistory(
                    //         refernceNo: flightBookedData.bookingRefNo);
                    //   },
                    //   child: Container(
                    //     height: 35,
                    //     width: 100,
                    //     decoration: BoxDecoration(
                    //         color: Colors.green,
                    //         borderRadius: BorderRadius.circular(10)),
                    //     child: const Icon(Icons.download,color: Colors.white,),
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
