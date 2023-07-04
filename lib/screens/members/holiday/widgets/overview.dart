import 'package:bci/constands/constands.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverviewWidget extends StatefulWidget {
  const OverviewWidget({super.key});

  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ksizedbox20,
          Row(
            children: [
              Text(
                'Package Overview',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: kblue,
                    fontWeight: FontWeight.w500),
              ),
              kwidth10,
              Expanded(
                child: Container(
                  width: size.width,
                  child: const Divider(
                    thickness: 0.5,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          ksizedbox10,
          Text(
            '''Mauritius is a paradise in the Indian Ocean, which is distinctively stunning and indulged all through the years in sunshine. It offers the visitors wide options for fun activities. Enjoy a memorable vacation in this epitome of tropical beauty where clean and azure waters create a charming view for the visitors. Grab this incredible tour package to explore the wonderful place of Mauritius.''',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                height: 1.5,
                fontWeight: FontWeight.w400),
          ),
          ksizedbox20,
          Row(
            children: [
              Text(
                'Flight Detail',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: kblue,
                    fontWeight: FontWeight.w500),
              ),
              kwidth10,
              Expanded(
                child: Container(
                  width: size.width,
                  child: const Divider(
                    thickness: 0.5,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Container(
              height: 120,
              width: size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: size.width,
                    color: Colors.orange,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Sector',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Airline',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Departure Time',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Arrival Time',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'DEL-MRU',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: kblue,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'MK745',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: kblue,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '08:00',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: kblue,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '14:00',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: kblue,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Container(
                    height: 30,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'DEL-MRU',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: kblue,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'MK745',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: kblue,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '08:00',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: kblue,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '14:00',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: kblue,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ksizedbox20,
          Row(
            children: [
              Text(
                'Inclusions',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: kblue,
                    fontWeight: FontWeight.w500),
              ),
              kwidth10,
              Expanded(
                child: Container(
                  width: size.width,
                  child: const Divider(
                    thickness: 0.5,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          ksizedbox10,
          Text(
            '◈ Accommodation with breakfast for 06 Nights\n    in Mauritius at Villas Mon Plaisir or similar',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Daily Breakfast & Dinner.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ North Island Tour.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ South Island Tour.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Ile Aux Cerfs Tour and Undersea Walk.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Return airport transfers.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ All Transfers and Tours on a sharing basis.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Limited Time Offer : Complimentary 02 Lunches.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Return economy airfare on Air Mauritius (Ex-Del).',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          ksizedbox20,
          Row(
            children: [
              Text(
                'Exclusions',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: kblue,
                    fontWeight: FontWeight.w500),
              ),
              kwidth10,
              Expanded(
                child: Container(
                  width: size.width,
                  child: const Divider(
                    thickness: 0.5,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          ksizedbox10,
          Text(
            '◈ VISA fees is not included in the cost of the package.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Tipping.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ 5% GST and 5% TCS.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Insurance.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Any other expenses which are not mentioned at the included section.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Extra PCR Tests as per the airline requirement on departure.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Entrances to the sightseeing points not included unless specifically mentioned in the Itinerary.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Early check in or late checkout charges.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Camera or Video permits.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Expenses of a personal nature.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Any Increase in the fuel surcharge or any kind of taxes levied by the respective.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ government or statutory bodies.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Any Increase in the rate of exchange leading to an increase in all land arrangements which may come in to effect prior to departure. ',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ Cost of extension of the validity or deviation from the route of the tour. Porterage, laundry, wines & alcoholic beverages, mineral water (unless specified)',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '◈ telephone charges, shopping, all items of personal nature and also food and drinks not forming the part of the group menus.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
        ],
      );
  }
}
