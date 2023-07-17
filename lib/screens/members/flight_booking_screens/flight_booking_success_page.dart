import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/models/flight_booking_models/air_reprint_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FlightBookingSuccessPage extends StatefulWidget {
  AirReprintModel airReprintModel;
  String refNo;
  FlightBookingSuccessPage(
      {super.key, required this.airReprintModel, required this.refNo});

  @override
  State<FlightBookingSuccessPage> createState() =>
      _FlightBookingSuccessPageState();
}

class _FlightBookingSuccessPageState extends State<FlightBookingSuccessPage> {
  final flightController = Get.find<FlightsController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/icons/96081-successful-animation.json",
                height: 200, width: 200, fit: BoxFit.fill),
            Text(
              "Flight Booking Confirmed",
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
                    flightController
                        .downloadFlightTicketInvoice(widget.airReprintModel);
                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        "Download",
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
    );
  }
}
