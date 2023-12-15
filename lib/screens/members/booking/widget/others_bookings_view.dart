import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/get_booking_list_model.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class OthersBookingsView extends StatefulWidget {
  const OthersBookingsView({super.key});

  @override
  State<OthersBookingsView> createState() => _OthersBookingsViewState();
}

class _OthersBookingsViewState extends State<OthersBookingsView> {
  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getBooking();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: homeController.bookingListData.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Image.asset(
                          'assets/images/othersbookingnotavailableimage.png'),
                    ),
                    ksizedbox20,
                    Text(
                      'No Bookings',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: kblue),
                    )
                  ],
                ),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeController.bookingListData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        dialogBuilder(
                            context, homeController.bookingListData[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          //  height: 125,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      child: Image.network(
                                        homeController
                                            .bookingListData[index].image,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                              kwidth10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ksizedbox10,
                                  Text(
                                    homeController
                                        .bookingListData[index].service
                                        .toString(),
                                    style: const TextStyle(fontSize: 21),
                                  ),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      '₹${homeController.bookingListData[index].purchasePrice}',
                                      maxLines: 4,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      homeController
                                          .bookingListData[index].description,
                                      maxLines: 4,
                                      style: TextStyle(color: kblue),
                                    ),
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
      );
    });
  }

  Future<void> dialogBuilder(
      BuildContext context, BookingListData bookingData) {
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
                    Container(
                      height: 50,
                      width: 60,
                      child: Image.network(
                        bookingData.image,
                        height: 50,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookingData.service,
                          style: TextStyle(
                              fontSize: 16,
                              color: kblue,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // Text(
                        //   'Date : ${formatDate(DateTime.now(), [
                        //         dd,
                        //         "/",
                        //         mm,
                        //         "/",
                        //         yyyy
                        //       ])}',
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
                      'Description',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 100,
                      child: Text(
                        bookingData.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
                      'quantity',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingData.quantity,
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
                      'Date',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                   bookingData.bookingdate != ""? Text(
                      formatDate(DateTime.parse(bookingData.bookingdate),
                                   [dd ,'-',mm,'-',yyyy]),
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ): Text(""),
                  ],
                ),
               
                 const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time Slot',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingData.timeSlot,
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


                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Adult',
                //       style: TextStyle(
                //           fontSize: 16,
                //           color: kblue,
                //           fontWeight: FontWeight.bold),
                //     ),
                //     Text(
                //       '10',
                //       style: TextStyle(
                //           fontSize: 15,
                //           color: kgrey,
                //           fontWeight: FontWeight.w500),
                //     ),
                //   ],
                // ),
                // const Divider(
                //   thickness: 1,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingData.status,
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
                      "₹ ${bookingData.purchasePrice}",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                if (bookingData.status == "completed")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text("Cancel Booking",
                                      style:
                                          boldTextStyle(color: Colors.black)),
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
                                        Get.back();
                                        print(bookingData.id);
                                        Get.find<ProfileController>()
                                            .cancelRefundApi(
                                          userId: Get.find<ProfileController>()
                                              .profileData
                                              .first
                                              .id
                                              .toString(),
                                          amount: bookingData.purchasePrice,
                                          type: "booking",
                                          bookingId: bookingData.id.toString(),
                                        );
                                      },
                                    ),
                                    TextButton(
                                      child: Text("No",
                                          style:
                                              primaryTextStyle(color: kblue)),
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
                      const Text(
                        "",
                        style: TextStyle(
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
}
