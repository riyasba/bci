import 'package:bci/controllers/flights_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
//import 'package:simpa/constands/constands.dart';
//import 'package:simpa/constands/constands.dart';

//import '../constands/constands.dart';

class FlightSearchWidgets extends StatelessWidget {
  const FlightSearchWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xFFEFEEEE),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(blurRadius: 5, color: Colors.grey.withOpacity(0.5)),
            ]),
        // decoration: BoxDecoration(
        //     color: Color(0xFFEFEEEE),
        //     borderRadius: BorderRadius.circular(15),
        //     boxShadow: [
        //       BoxShadow(
        //           color: Color.fromARGB(255, 216, 216, 216).withOpacity(0.5),
        //           spreadRadius: 1,
        //           blurRadius: 5,
        //           offset: Offset(0, 5))
        //     ]),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                  decoration:
                      InputDecoration.collapsed(hintText: "Search for hotels")),
            ),
          ],
        ),
      ),
    );
  }
}

class FlightSearchWidgets2 extends StatelessWidget {
  const FlightSearchWidgets2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xFFEFEEEE),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(blurRadius: 5, color: Colors.grey.withOpacity(0.5)),
            ]),
        // decoration: BoxDecoration(
        //     color: Color(0xFFEFEEEE),
        //     borderRadius: BorderRadius.circular(15),
        //     boxShadow: [
        //       BoxShadow(
        //           color: Color.fromARGB(255, 216, 216, 216).withOpacity(0.5),
        //           spreadRadius: 1,
        //           blurRadius: 5,
        //           offset: Offset(0, 5))
        //     ]),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                  onChanged: (value) async {
                    if (value.length > 1) {
                      await Future.delayed(const Duration(milliseconds: 200));
                      Get.find<FlightsController>()
                          .flighsearch(city: value);
                    }
                  },
                  decoration: const InputDecoration.collapsed(
                      hintText: "City, Country, Airports")),
            ),
          ],
        ),
      ),
    );
  }
}
