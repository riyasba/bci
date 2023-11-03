import 'package:bci/controllers/hotel_booking_controller.dart';
import 'package:bci/models/hotel_booking_models/hotel_booking_list_model.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../constands/constands.dart';
import '../../../../models/hotel_booking_models/hotel_detials_model.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key});

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  final hotelBookingController = Get.find<HotelBookingController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hotelBookingController.hotelBookingList();
  }

  void launchGoogleMaps(String latitude, String longitude) async {
    final url =
        // 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

        "google.navigation:q=$latitude,$longitude&mode=d";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch Google Maps';
    }
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HotelBookingController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: hotelBookingController.bookingList.isEmpty
            ?  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Image.asset('assets/images/hotelbookingnotavailableimage.png'),
                    ),
                    ksizedbox20,
                    Text('No Bookings',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: kblue
                    ),)
                  ],
                ),
              )
            : Stack(
                children: [
                  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: hotelBookingController.bookingList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });
                              Result result = await hotelBookingController
                                  .getHotelDetails(hotelBookingController
                                      .bookingList[index].bookingId,hotelBookingController
                                      .bookingList[index].searchKey);
                              setState(() {
                                isLoading = false;
                              });
                              dialogBuilder(
                                  context,
                                  hotelBookingController.bookingList[index],
                                  result);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 125,
                                width: size.width,
                                decoration: BoxDecoration(
                                  color: kwhite,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: hotelBookingController
                                                      .bookingList[index]
                                                      .hotelImage ==
                                                  "null"
                                              ? Image.asset(
                                                  "assets/icons/no-photo.png",
                                                  height: 100,
                                                  width: 100,
                                                  fit: BoxFit.cover,
                                                )
                                              : Container(
                                                 height: 100,
                                                  width: 100,
                                                child: Image.network(
                                                    hotelBookingController
                                                        .bookingList[index]
                                                        .hotelImage,
                                                    height: 100,
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                              )),
                                    ),
                                    kwidth10,
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ksizedbox10,
                                        Container(
                                          width: 200,
                                          child: Text(
                                            hotelBookingController
                                                .bookingList[index].hotelName
                                                .toString(),
                                            maxLines: 2,
                                            style:
                                                const TextStyle(fontSize: 21),
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          child: Text(
                                            hotelBookingController
                                                .bookingList[index].place,
                                            maxLines: 4,
                                            style: TextStyle(color: kblue),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Booking Date :",
                                              maxLines: 4,
                                              style: TextStyle(color: kblue),
                                            ),
                                            Text(
                                              hotelBookingController
                                                  .bookingList[index]
                                                  .bookingDate,
                                              maxLines: 4,
                                              style: TextStyle(color: kgrey),
                                            ),
                                          ],
                                        ),
                                        ksizedbox10
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                if(isLoading)  Container(
                    height: size.height,
                    width: size.width,
                    decoration:
                        const BoxDecoration(color: Color.fromARGB(22, 0, 0, 0)),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: kOrange,
                    )),
                  )
                ],
              ),
      );
    });
  }

  Future<void> dialogBuilder(
      BuildContext context, BookingList bookingData, Result result) {
    return showDialog<void>(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          title: Container(
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
                    bookingData.hotelImage == "null"
                        ? Image.asset(
                            "assets/icons/no-photo.png",
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            bookingData.hotelImage,
                            height: 50,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookingData.hotelName,
                          style: TextStyle(
                              fontSize: 16,
                              color: kblue,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // Text(
                        //    'Date : ${formatDate(enquiryDatas.packageDetails.createdAt,
                        //            [dd ,'-',mm,'-',yyyy])}',
                        //   style: TextStyle(
                        //       fontSize: 12,
                        //       color: kblue,
                        //       fontWeight: FontWeight.w500),
                        // ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Booking Date',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingData.bookingDate,
                      style: TextStyle(
                          fontSize: 15,
                          color: kgrey,
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
                      'Booking Id',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingData.bookingId,
                      style: TextStyle(
                          fontSize: 15,
                          color: kgrey,
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
                      'Address',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 150,
                      child: Text(
                        result.addressLine1,
                        style: TextStyle(
                            fontSize: 15,
                            color: kgrey,
                            fontWeight: FontWeight.w500),
                      ),
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
                      'Location',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        launchGoogleMaps(result.latitude, result.longitude);
                      },
                      child: Container(
                        height: 50,
                        width: 70,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.directions,
                          color: Colors.blue,
                          size: 26,
                        ),
                      ),
                    )
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Contact',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 120,
                      child: Text(
                        result.addressLine2,
                        style: TextStyle(
                            fontSize: 15,
                            color: kgrey,
                            fontWeight: FontWeight.w500),
                      ),
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
                      'Booking Status',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingData.hotelBookingStatus,
                      style: TextStyle(
                          fontSize: 15,
                          color: kgrey,
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
                      'No Of Days',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingData.noOfDays,
                      style: TextStyle(
                          fontSize: 15,
                          color: kgrey,
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
                      'No Of Peoples',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingData.noOfPeople,
                      style: TextStyle(
                          fontSize: 15,
                          color: kgrey,
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
                    const Text(
                      'Price',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹ ${bookingData.price}",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
    AlertDialog mAlertItem2 = AlertDialog(
    backgroundColor: Colors.white,
    title: Text("Cancel Booking", style: boldTextStyle(color: Colors.black)),
    content: Text(
      "Are you sure you want to Cancel?",
      style: secondaryTextStyle(color: Colors.black),
    ),
    actions: [
      TextButton(
        child: Text(
          "Yes",
          style: primaryTextStyle(color: kblue),
        ),
        onPressed: () {
          Get.back();
          //Get.find<AuthController>().logout();
        },
      ),
      TextButton(
        child: Text("No", style: primaryTextStyle(color: kblue)),
        onPressed: () {
          Get.back();
        },
      ),
    ],
  );
}
