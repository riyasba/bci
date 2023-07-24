import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../constands/constands.dart';

class FlightDeparetureSCreen extends StatefulWidget {
  const FlightDeparetureSCreen({super.key});

  @override
  State<FlightDeparetureSCreen> createState() => _FlightDeparetureSCreenState();
}

class _FlightDeparetureSCreenState extends State<FlightDeparetureSCreen> {
  // DateTime selectedDate = DateTime.now();

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(2100),
  //   );
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  // }

  final flightsController = Get.find<FlightsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: GetBuilder<FlightsController>(builder: (_) {
      return ListView(children: [
        Stack(children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: kblue,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Image.asset(
                                  'assets/images/parflaightback.png')),
                          Text(
                            'Departure',
                            style: TextStyle(fontSize: 20, color: kwhite),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            "Apply",
                            style: primaryFont.copyWith(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 15),
                      child: GestureDetector(
                        onTap: () {
                          // _selectDate(context);
                        },
                        child:
                            Image.asset('assets/images/parflaightcalendar.png'),
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          formatDate(
                            flightsController.depatureDate,
                            [
                              '',
                              DD,
                              '',
                            ],
                          ),
                          style: TextStyle(color: kwhite, fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                            formatDate(flightsController.depatureDate,
                                [dd, " ", MM, " ", yyyy]),
                            style: TextStyle(color: kwhite, fontSize: 14)),
                      )
                    ],
                  ),
                ]),
              ],
            ),
          ),
          ksizedbox10,
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 175),
              child: Container(
                height: 700.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: Offset(0.0, 0.75),
                          blurRadius: 5,
                          color: kgrey)
                    ],
                    color: kwhite),
                child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: SfDateRangePicker(
                      minDate: DateTime.now(),
                      initialSelectedDate: flightsController.depatureDate,
                      todayHighlightColor: kOrange,
                      selectionColor: kOrange,
                      endRangeSelectionColor: kOrange,
                      startRangeSelectionColor: kOrange,
                      headerStyle: DateRangePickerHeaderStyle(
                        textStyle: TextStyle(color: kOrange),
                      ),
                      selectionMode: DateRangePickerSelectionMode.single,
                      view: DateRangePickerView.month,
                      monthFormat: 'MMM',
                      monthCellStyle: DateRangePickerMonthCellStyle(
                          selectionColor: kOrange),
                      onSelectionChanged: (date) {
                        setState(() {
                          flightsController.depatureDate = date.value;
                          Get.find<FlightsController>().depatureDate =
                              flightsController.depatureDate;
                          Get.find<FlightsController>()
                              .isDepatureDateSelected(true);
                        });

                        flightsController.update();
                      },

                      // headerStyle: DateRangePickerHeaderStyle(
                      //   textStyle: TextStyle(
                      //     fontSize: 16
                      //   )
                      // ),

                      navigationDirection:
                          DateRangePickerNavigationDirection.vertical,
                      enableMultiView: true,
                    )),
              ))
        ])
      ]);
    })));
  }
}
