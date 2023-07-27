import 'package:bci/models/bus_booking_models/search_bus_model.dart';
import 'package:bci/screens/members/bus/buscommenappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constands/constands.dart';

class BusContactDetails extends StatelessWidget {
  Bus busData;
  String boardingId;
  String dropingId;
  String searchkey;
  List<String> seatIds;

  BusContactDetails(
      {super.key,
      required this.boardingId,
      required this.busData,
      required this.dropingId,
      required this.searchkey,
      required this.seatIds});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: const PreferredSize(
          preferredSize: const Size.fromHeight(220), child: ComenAppbar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ksizedbox20,
              const Text('Contact Details').text.xl.semiBold.make(),
              ksizedbox10,
              const Text('EMAIL ID').text.bold.gray500.make(),
              ksizedbox10,
              const TextField(
                decoration:
                    InputDecoration.collapsed(hintText: "Enter your email"),
              ),
              ksizedbox10,
              Divider(color: kgrey, height: 0.5),
              ksizedbox20,
              const Text('PHONE').text.bold.gray500.make(),
              ksizedbox10,
              const TextField(
                decoration:
                    InputDecoration.collapsed(hintText: "Enter your phone"),
              ),
              ksizedbox10,
              Divider(color: kgrey, height: 0.5),
              ksizedbox20,
              for (int i = 0; i < seatIds.length; i++)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Passenger Details').text.xl.semiBold.make(),
                        Text('Seat No : ${seatIds[i]}').text.semiBold.make(),
                      ],
                    ),
                    ksizedbox10,
                    const Text('NAME').text.bold.gray500.make(),
                    ksizedbox10,
                    const TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: "Enter your name"),
                    ),
                    ksizedbox10,
                    Divider(color: kgrey, height: 0.5),
                    ksizedbox20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('GENDER').text.gray500.semiBold.make(),
                        Text('Male').text.semiBold.gray500.make(),
                        Text('Female').text.semiBold.gray500.make(),
                      ],
                    ),
                    ksizedbox10,
                    const Text('AGE').text.bold.gray500.make(),
                    ksizedbox10,
                    const TextField(
                      decoration:
                          InputDecoration.collapsed(hintText: "Enter your age"),
                    ),
                    ksizedbox10,
                    Divider(color: kgrey, height: 0.5),
                    ksizedbox10,
                    ksizedbox20,
                  ],
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                child: const Center(child: Text('Cancel')),
                //   width: double.infinity,
                height: 55,
                color: kgrey,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              child: Container(
                child: Center(child: Text('Continue Booking')),
                //      width: double.infinity,
                height: 55,
                color: korange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
