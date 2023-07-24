import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';

class FlightLoadingPage extends StatefulWidget {
  const FlightLoadingPage({super.key});

  @override
  State<FlightLoadingPage> createState() => _FlightLoadingPageState();
}

class _FlightLoadingPageState extends State<FlightLoadingPage> {
  getBack() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: WillPopScope(
        onWillPop: () {
          return getBack();
        },
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.grey.withOpacity(0.5),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Please Wait ...",
                  style: primaryFont.copyWith(color: Colors.black38),
                ),
                const SizedBox(
                  height: 20,
                ),
                CircularProgressIndicator(
                  color: kblue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
