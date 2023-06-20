import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return GetBuilder<HomeController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: homeController.bookingListData.isEmpty
            ? const Center(
                child: Text("No bookings found"),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeController.bookingListData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      height: 127,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  homeController.bookingListData[index].image,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          kwidth10,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ksizedbox10,
                              Text(
                                homeController.bookingListData[index].service
                                    .toString(),
                                style: const TextStyle(fontSize: 21),
                              ),
                              Container(
                                width: 250,
                                child: Text(
                                  '${homeController.bookingListData[index].description}',
                                  maxLines: 3,
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
                  );
                }),
      );
    });
  }
}
