import 'package:bci/controllers/flights_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../../../constands/constands.dart';

class FlightWidget extends StatefulWidget {
  const FlightWidget({super.key});

  @override
  State<FlightWidget> createState() => _FlightWidgetState();
}

class _FlightWidgetState extends State<FlightWidget> {

  final flightController = Get.find<FlightsController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flightController.getFlightBookingHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FlightsController>(
        builder: (_) {
          return ListView.builder(
            itemCount: flightController.flightBookingHistoyrList.length,
            itemBuilder: (context, index) {
              return flightController.flightBookingHistoyrList.isEmpty ? const Center(child: Text("No Data Found"),) : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                                  color: kwhite,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        offset:const Offset(0.0, 0.75),
                                        blurRadius: 5,
                                        color: kgrey),
                                  ],
                                  borderRadius: BorderRadius.circular(5)),
                               child:  Padding(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'From',
                                          style:
                                              TextStyle(fontSize: 20, color: kblue),
                                        ),
                                        Text(
                                          flightController.flightBookingHistoyrList[index].fromCityname,
                                          style:
                                              TextStyle(color: kgrey, fontSize: 15),
                                        ),
                                        Text(
                                          'John F. Kennedy \nAirport',
                                          style:
                                              TextStyle(color: kgrey, fontSize: 15),
                                        )
                                      ],
                                    ),
                                    Image.asset('assets/images/Group 291.png'),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'To',
                                          style:
                                              TextStyle(fontSize: 20, color: kblue),
                                        ),
                                         Text(
                                          flightController.flightBookingHistoyrList[index].toCityname,
                                          style:
                                              TextStyle(color: kgrey, fontSize: 15),
                                        ),
                                        Text(
                                          'Abbotsford National \nAirport',
                                          style:
                                              TextStyle(color: kgrey, fontSize: 15),
                                        )
                                      ],
                                    ),
                                   ]),
                               ),
              ),
            );
            },
             
          );
        }
      ),
    );
  }
}
