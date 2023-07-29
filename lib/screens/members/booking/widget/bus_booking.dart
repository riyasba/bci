import 'package:bci/controllers/bus_controllers.dart';
import 'package:bci/controllers/holiday_package_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../../constands/constands.dart';

class BusContainers extends StatefulWidget {
  const BusContainers({super.key});

  @override
  State<BusContainers> createState() => _BusContainersState();
}

class _BusContainersState extends State<BusContainers> {

  final busController = Get.find<BusController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    busController.getBusBookingHistory();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HolidayPackageController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: busController.bookingHistoryList.isEmpty
            ? const Center(
                child: Text("No bookings found"),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: busController.bookingHistoryList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: (){
                        // dialogBuilder(context, 
                        // homeController.bookingListData[index].image, 
                        // homeController.bookingListData[index].service, 
                        // homeController.bookingListData[index].description, 
                        // homeController.bookingListData[index].purchasePrice, 
                        // homeController.bookingListData[index].quantity
                        // );
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
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: ClipRRect(
                              //       borderRadius: BorderRadius.circular(5),
                              //       child: Image.network(
                              //         holidayPackageController.enquiryData[index].packageDetails.image.first,
                              //         height: 100,
                              //         width: 100,
                              //         fit: BoxFit.cover,
                              //       )),
                              // ),
                              kwidth10,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ksizedbox10,
                                  Text(
                                    busController.bookingHistoryList[index].busName
                                        .toString(),
                                    style: const TextStyle(fontSize: 21),
                                  ),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      '${busController.bookingHistoryList[index].fromCityname}',
                                      maxLines: 4,
                                      style: TextStyle(color: kblue),
                                    ),
                                  ),
                                  // Text(
                                  //   'Check in : 03:44PM Check Out 03:43 PM',
                                  //   style: TextStyle(color: kblue),
                                  // ),
                                  // Text(
                                  //   'Total Person : 5 Members',
                                  //   style: TextStyle(color: kblue),
                                  // ),
                                  // Text(
                                  //   'Ac Rooms',
                                  //   style: TextStyle(color: kblue),
                                  // ),
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
}