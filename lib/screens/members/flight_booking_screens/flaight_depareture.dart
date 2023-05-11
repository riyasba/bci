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
 
 DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: SafeArea(
            child: ListView(children: [
          Column(children: [
      
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: kblue,
              child:             Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 10),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child:
                                Image.asset('assets/images/parflaightback.png')),
                        Text(
                          'Departure',
                          style: TextStyle(fontSize: 20, color: kwhite),
                        ),
                       
                               
                    
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
                          _selectDate(context);
                        },
                        child: Image.asset(
                            'assets/images/parflaightcalendar.png'),
                      ),
                    ),
                   
                  ],
                ),
                 Row(
        
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,top: 10
                          ),
                          child: Text(
                            formatDate(
                              selectedDate,
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
                          padding:
                              const EdgeInsets.only(left: 15,top: 5),
                          child: Text(
                              formatDate(selectedDate, [dd, MM, yyyy]),
                              style:
                                  TextStyle(color: kwhite, fontSize: 14)),
                        )
                ],
              ),
              ]
              ),
                ],
              ),
            ),

         
                            
              ksizedbox10,
            Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 700.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10),
                      child: SfDateRangePicker( 
                        todayHighlightColor: kOrange,
                        selectionColor: kOrange,
                        endRangeSelectionColor: kOrange,
                        startRangeSelectionColor: kOrange,
                      
                        selectionMode: DateRangePickerSelectionMode.multiRange,
        view: DateRangePickerView.month,
          monthFormat: 'MMM',monthCellStyle: DateRangePickerMonthCellStyle(
            selectionColor: kOrange
          ),


      // headerStyle: DateRangePickerHeaderStyle(
      //   textStyle: TextStyle(
      //     fontSize: 16 
      //   )
      // ),
      
           navigationDirection: DateRangePickerNavigationDirection.vertical,
        enableMultiView: true,
       
      )),
                ))
          ]
          )
            ]
            )
        )
    );
  }
}
