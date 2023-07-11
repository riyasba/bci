import 'package:bci/controllers/holiday_package_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../constands/app_fonts.dart';
import '../../../../constands/constands.dart';

class HotelDetails extends StatefulWidget {
  String packageid;
  HotelDetails({super.key,required this.packageid});

  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {

  final holidayPackageController = Get.find<HolidayPackageController>();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holidayPackageController.packageDetails(packageid: widget.packageid);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            ksizedbox40,
            Text(
              'Hotel Details',
              style: TextStyle(
                  fontSize: 18.sp, color: kblue, fontWeight: FontWeight.w500),
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
        HtmlContentViewer(
                        htmlContent: holidayPackageController.getPackageDetailsData.first.description,
                        initialContentHeight:
                            MediaQuery.of(context).size.height,
                        initialContentWidth: MediaQuery.of(context).size.width,
                      ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     const Text('VILLAS MON PLAISIR or similar')
        //         .text
        //         .semiBold
        //         .orange300
        //         .make(),
        //     const Row(
        //       children: [
        //         Icon(
        //           Icons.star,
        //           color: Colors.orangeAccent,
        //         ),
        //         Icon(
        //           Icons.star,
        //           color: Colors.orangeAccent,
        //         ),
        //         Icon(
        //           Icons.star,
        //           color: Colors.orangeAccent,
        //         ),
        //         Icon(
        //           Icons.star,
        //           color: Colors.orangeAccent,
        //         )
        //       ],
        //     )
        //   ],
        // ),
        // ksizedbox20,
        // Row(
        //   children: [
        //     Text('Property Location: ', style: headingholi),
        //   ],
        // ),
        // ksizedbox10,
        // Text(
        //   '''When you stay at Villas Mon Plaisir in Pointe Aux Piments, you'll be on the beach, a 5-minute drive from Turtle Bay and 7 minutes from Trou aux Biches Beach. This beach hotel is 7.1 mi (11.4 km) from Grand Bay Beach and 8.9 mi (14.3 km) from Pereybere Beach. ''',
        //   style: discription1,
        // ),
        // ksizedbox20,
        // Row(
        //   children: [
        //     Text('Rooms: ', style: headingholi),
        //   ],
        // ),
        // ksizedbox10,
        // Text(
        //   '''Make yourself at home in one of the 48 air-conditioned rooms featuring refrigerators and plasma televisions. Rooms have private balconies. Complimentary wireless Internet access keeps you connected, and satellite programming is available for your entertainment. Private bathrooms with showers feature complimentary toiletries and hair dryers. ''',
        //   style: discription1,
        // ),
        // ksizedbox20,
        // Row(
        //   children: [
        //     Text('Amenities:  ', style: headingholi),
        //   ],
        // ),
        // ksizedbox10,
        // Text(
        //   '''Pamper yourself with a visit to the spa, which offers massages, body treatments, and facials. Additional features at this hotel include complimentary wireless Internet access, tour/ticket assistance, and barbecue grills. ''',
        //   style: discription1,
        // ),
        // ksizedbox20,
        // Row(
        //   children: [
        //     Text('Dining:  ', style: headingholi),
        //   ],
        // ),
        // ksizedbox10,
        // Text(
        //   '''Grab a bite at one of the hotel's 2 restaurants, or stay in and take advantage of the room service (during limited hours). Quench your thirst with your favorite drink at the bar/lounge.''',
        //   style: discription1,
        // ),
        // ksizedbox20,
        // Row(
        //   children: [
        //     Text('Business, Other Amenities: ', style: headingholi),
        //   ],
        // ),
        // ksizedbox10,
        // Text(
        //   '''Featured amenities include complimentary newspapers in the lobby, dry cleaning/laundry services, and a 24-hour front desk. A roundtrip airport shuttle is provided for a surcharge (available 24 hours), and free self parking is available onsite.''',
        //   style: discription1,
        // ),
        ksizedbox20,
      ],
    ));
  }
}
