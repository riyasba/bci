import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/models/flight_booking_models/air_reprint_model.dart';
import 'package:flutter/material.dart';
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
            )
          ],
        ),
      ),
    );
  }
}
