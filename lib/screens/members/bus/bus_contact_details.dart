import 'package:bci/controllers/bus_controllers.dart';
import 'package:bci/models/bus_booking_models/pax_list_model.dart';
import 'package:bci/models/bus_booking_models/search_bus_model.dart';
import 'package:bci/screens/members/bus/buscommenappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constands/constands.dart';

class BusContactDetails extends StatefulWidget {
  Bus busData;
  String boardingId;
  String dropingId;
  String searchkey;
  List<String> seatIds;
  String amount;

  BusContactDetails(
      {super.key,
      required this.boardingId,
      required this.busData,
      required this.dropingId,
      required this.searchkey,
      required this.amount,
      required this.seatIds});

  @override
  State<BusContactDetails> createState() => _BusContactDetailsState();
}

class _BusContactDetailsState extends State<BusContactDetails> {
  final busController = Get.find<BusController>();

  var phoneNumberController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(220), child: ComenAppbar()),
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
               TextField(
                controller: nameController,
                decoration:
                    InputDecoration.collapsed(hintText: "Enter your email"),
              ),
              ksizedbox10,
              Divider(color: kgrey, height: 0.5),
              ksizedbox20,
              const Text('PHONE').text.bold.gray500.make(),
              ksizedbox10,
               TextField(
                controller: phoneNumberController,
                decoration:
                    InputDecoration.collapsed(hintText: "Enter your phone"),
              ),
              ksizedbox10,
              Divider(color: kgrey, height: 0.5),
              ksizedbox20,
              for (int i = 0; i < widget.seatIds.length; i++)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Passenger Details').text.xl.semiBold.make(),
                        Text('Seat No : ${widget.seatIds[i]}')
                            .text
                            .semiBold
                            .make(),
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
                child: Center(child: Text('Cancel',style: TextStyle(color: Colors.white))),
                //   width: double.infinity,
                height: 55,
                color: kgrey,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                busController.tempBookBusTicket(
                    boardingId: widget.boardingId,
                    droppingId: widget.dropingId,
                    busData: widget.busData,
                    searcKey: widget.searchkey,
                    mobileNumber: phoneNumberController.text,
                    customerEmail: "test@email.com",
                    paxDetailslist: [
                      PaxDetailslist(
                          age: 20,
                          gender: 0,
                          isLadies: false,
                          paxName: nameController.text,
                          seatNumber: widget.seatIds.first),
                    ],
                    amount: widget.amount,
                    customerName: nameController.text,
                    seatMapKey: busController.seatMapKey.value);
              },
              child: Container(
                child: Center(child: Text('Continue Booking',style: TextStyle(color: Colors.white),)),
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
