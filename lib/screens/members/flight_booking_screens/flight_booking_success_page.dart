import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/models/flight_booking_models/air_reprint_model.dart';
import 'package:bci/screens/members/members%20widgets/bottumbavigation.dart';
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
                "Flight Booking Confirmed",
                style: primaryFont.copyWith(
                    color: kblue, fontWeight: FontWeight.bold, fontSize: 22),
              ),
              // Text(
              //     "Flight Pnr ${widget.airReprintModel.airPnrDetails.first.airlinePnr}"),
              // Text(
              //     "Flight ticket status: ${widget.airReprintModel.airPnrDetails.first.ticketStatusDesc}"),
              // Text(
              //     "Flight ticket status Id: ${widget.airReprintModel.airPnrDetails.first.ticketStatusId}"),
              // Text(
              //     "Flight ticket date: ${widget.airReprintModel.airPnrDetails.first.ticketingDate}"),
              // Text(
              //     "Flight ticket airline last pnr: ${widget.airReprintModel.airPnrDetails.last.airlinePnr}"),
              // Text(
              //     "Flight ticket status id (last): ${widget.airReprintModel.airPnrDetails.last.ticketStatusId}"),
              // Text(
              //     "Flight ticket status(last): ${widget.airReprintModel.airPnrDetails.last.ticketStatusDesc}"),
              // Text(widget.airReprintModel.airPnrDetails.first.airlineName ??
              //     "-N/A"),
              // Text(widget.airReprintModel.airPnrDetails.first.failureRemark ??
              //     "-N/A"),
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
                          "Back to home",
                          style: primaryFont.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
