import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdditionalInfoWidget extends StatefulWidget {
  const AdditionalInfoWidget({super.key});

  @override
  State<AdditionalInfoWidget> createState() => _AdditionalInfoWidgetState();
}

class _AdditionalInfoWidgetState extends State<AdditionalInfoWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                Row(
                  children: [
                    Text('Additional info',
                            style: TextStyle(
                              fontSize: 20.sp, 
                              color: kblue,
                            fontWeight: FontWeight.w500),
                          ),
                          kwidth10,
                          Expanded(
                            child: Container(
                              width: size.width,
                              child: Divider(
                                thickness: 1,
                                color: kblue,
                              ),
                            ),
                          ),
                  ],
                ),
                ksizedbox20,
                Text('Travel Validity',
                            style: TextStyle(
                              fontSize: 17.sp, 
                              color: kblue,
                            fontWeight: FontWeight.w500),
                  ),
                 //  ksizedbox10,
              Text('''The deal is valid for travel till Friday, 30 Sep 2023.''',
                          textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15.sp, 
                              color: Colors.black,
                              height: 1.5,
                            fontWeight: FontWeight.w400),
                ),
                ksizedbox10,
                Text('High Season',
                            style: TextStyle(
                              fontSize: 17.sp, 
                              color: kblue,
                            fontWeight: FontWeight.w500),
                  ),
                 //  ksizedbox10,
              Text('''Prices can fluctuate during peak season dates.''',
                          textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15.sp, 
                              color: Colors.black,
                              height: 1.5,
                            fontWeight: FontWeight.w400),
                ),
                 ksizedbox10,
                Text('Guaranteed Dates',
                            style: TextStyle(
                              fontSize: 17.sp, 
                              color: kblue,
                            fontWeight: FontWeight.w500),
                  ),
                 //  ksizedbox10,
              Text('''Your selected travel dates are guaranteed. In the unlikely event of seats sold out, we guarantee +/- 1/2 days from your preferred dates.''',
                          textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15.sp, 
                              color: Colors.black,
                              height: 1.5,
                            fontWeight: FontWeight.w400),
                ),
                 ksizedbox10,
                Text('Easy Cancellation',
                            style: TextStyle(
                              fontSize: 17.sp, 
                              color: kblue,
                            fontWeight: FontWeight.w500),
                  ),
                 //  ksizedbox10,
              Text('''*31 days or more prior to departure date, Initial Booking Amount and additional amount of visa fee will be forfeited (in case visa has been applied).*Between 30–16 days : 75% of total tour cost will be charged as penalty. *Less than 15 days: 100% of total tour cost will be charges as penalty.''',
                          textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15.sp, 
                              color: Colors.black,
                              height: 1.5,
                            fontWeight: FontWeight.w400),
                ),
                 ksizedbox10,
                Text('Visa Easy',
                            style: TextStyle(
                              fontSize: 17.sp, 
                              color: kblue,
                            fontWeight: FontWeight.w500),
                  ),
                 //  ksizedbox10,
              Text('''Visa assistance will be provided by our visa specialists.''',
                          textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15.sp, 
                              color: Colors.black,
                              height: 1.5,
                            fontWeight: FontWeight.w400),
                ),
                 ksizedbox10,
                Text('Booking Policy',
                            style: TextStyle(
                              fontSize: 17.sp, 
                              color: kblue,
                            fontWeight: FontWeight.w500),
                  ),
                 //  ksizedbox10,
              Text('''Initial Booking Amount - INR 30,000 per person or cancellation charges whichever is higher (non-refundable and non-transferable)30 days prior to the departure date - 50% of the remaining tour cost.15 days prior to the departure date - 100% of the tour cost required.''',
                          textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15.sp, 
                              color: Colors.black,
                              height: 1.5,
                            fontWeight: FontWeight.w400),
                ),
                ksizedbox20,
        ],
      
    );
  }
}