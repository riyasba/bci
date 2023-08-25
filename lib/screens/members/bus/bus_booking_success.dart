import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/bus_controllers.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/models/bus_booking_models/bus_requery_model.dart';
import 'package:bci/screens/members/members%20widgets/bottumbavigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BusBookingSuccessPage extends StatefulWidget {
  BusRequeryModel busRequeryModel;
  BusBookingSuccessPage({super.key, required this.busRequeryModel});

  @override
  State<BusBookingSuccessPage> createState() =>
      _FlightBookingSuccessPageState();
}

class _FlightBookingSuccessPageState extends State<BusBookingSuccessPage> {
  final flightController = Get.find<FlightsController>();

  getback() {
    Get.offAll(
      () => MemberBottomNavBar(),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          return getback();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/icons/96081-successful-animation.json",
                  height: 200, width: 200, fit: BoxFit.fill),
              Text(
                "Bus Booking Confirmed",
                style: primaryFont.copyWith(
                    color: kblue, fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.find<BusController>()
                          .createPDF( widget.busRequeryModel);
                    },
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Text(
                          "Download",
                          style: primaryFont.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
               const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      getback();
                    },
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: kblue,
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Text(
                          "Back to Home",
                          style: primaryFont.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
