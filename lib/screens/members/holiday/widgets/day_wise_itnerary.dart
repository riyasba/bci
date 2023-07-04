import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayWiseItinerary extends StatefulWidget {
  const DayWiseItinerary({super.key});

  @override
  State<DayWiseItinerary> createState() => _DayWiseItineraryState();
}

class _DayWiseItineraryState extends State<DayWiseItinerary> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return   Column(
        children: [
          Row(
             children: [
               Text('Day Wise Itineary',
                       style: TextStyle(
                         fontSize: 18.sp, 
                         color: kblue,
                       fontWeight: FontWeight.w500),
                     ),
                     kwidth10,
                     Expanded(
                       child: Container(
                         width: size.width,
                         child:const Divider(
                           thickness: 0.5,
                           color: Colors.black,
                         ),
                       ),
                     ),
             ],
           ),
           ksizedbox20,
           Row(
             children: [
               Expanded(
                       child: Container(
                         width: size.width,
                         child:const Divider(
                           thickness: 1,
                           color: Colors.orange,
                         ),
                       ),
                     ),
                      Text('Day 01',
                       style: TextStyle(
                         fontSize: 18.sp, 
                         color: korange,
                       fontWeight: FontWeight.w500),
                     ),
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.only(right: 35),
                         child: Container(
                           width: size.width,
                           child:const Divider(
                             thickness: 1,
                             color: Colors.orange,
                           ),
                         ),
                       ),
                     ),
             ],
           ),
            ksizedbox10,
                  Text('''There is more to Mauritius than just an island. It has a fascinating colonial past, a distinctive biodiversity, and really lovely weather. Blessed with a variety of beautiful beaches, a breathtaking coastline, and a thriving coral reef system. When you arrive in Mauritius, a member of our staff will greet you and take you to your accommodation. Check-in, unwind,''',
                     textAlign: TextAlign.start,
                       style: TextStyle(
                         fontSize: 15.sp, 
                         color: Colors.black,
                         height: 1.5,
                       fontWeight: FontWeight.w400),
           ),
           //2
           ksizedbox20,
           Row(
             children: [
               Expanded(
                       child: Container(
                         width: size.width,
                         child:const Divider(
                           thickness: 1,
                           color: Colors.orange,
                         ),
                       ),
                     ),
                      Text('Day 02',
                       style: TextStyle(
                         fontSize: 18.sp, 
                         color: korange,
                       fontWeight: FontWeight.w500),
                     ),
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.only(right: 35),
                         child: Container(
                           width: size.width,
                           child:const Divider(
                             thickness: 1,
                             color: Colors.orange,
                           ),
                         ),
                       ),
                     ),
             ],
           ),
            ksizedbox10,
                  Text('''Go on a full-day tour of Mauritius' South Island after breakfast. See the model ship factory at Curepipe and the crater of Trou Aux Cerfs. Go to Grand Bassin, where there is a Shiva temple and a sacred lake for Hindus in Mauritius. For a unique experience, travel via Plaine Champagne & Black River Gorges and stop at the 23-colored Nature Park. Return to the''',
                     textAlign: TextAlign.start,
                       style: TextStyle(
                         fontSize: 15.sp, 
                         color: Colors.black,
                         height: 1.5,
                       fontWeight: FontWeight.w400),
           ),
           //3
           ksizedbox20,
           Row(
             children: [
               Expanded(
                       child: Container(
                         width: size.width,
                         child:const Divider(
                           thickness: 1,
                           color: Colors.orange,
                         ),
                       ),
                     ),
                      Text('Day 03',
                       style: TextStyle(
                         fontSize: 18.sp, 
                         color: korange,
                       fontWeight: FontWeight.w500),
                     ),
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.only(right: 35),
                         child: Container(
                           width: size.width,
                           child:const Divider(
                             thickness: 1,
                             color: Colors.orange,
                           ),
                         ),
                       ),
                     ),
             ],
           ),
            ksizedbox10,
                  Text('''Ile Aux Cerfs is perhaps one of Mauritius' most picturesque locations. It is an emerald-colored lagoon on the east coast of this lovely island. Begin your excursion to the area's sandy beaches, stunning lagoon, and large range of tourist-friendly beach activities after a full breakfast at the hotel. Nothing compares to a swim in the ocean's clear waters.''',
                     textAlign: TextAlign.start,
                       style: TextStyle(
                         fontSize: 15.sp, 
                         color: Colors.black,
                         height: 1.5,
                       fontWeight: FontWeight.w400),
           ),
           //4
           ksizedbox20,
           Row(
             children: [
               Expanded(
                       child: Container(
                         width: size.width,
                         child:const Divider(
                           thickness: 1,
                           color: Colors.orange,
                         ),
                       ),
                     ),
                      Text('Day 04',
                       style: TextStyle(
                         fontSize: 18.sp, 
                         color: korange,
                       fontWeight: FontWeight.w500),
                     ),
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.only(right: 35),
                         child: Container(
                           width: size.width,
                           child:const Divider(
                             thickness: 1,
                             color: Colors.orange,
                           ),
                         ),
                       ),
                     ),
             ],
           ),
            ksizedbox10,
                  Text('''Go to a full-day tour of North Island after a leisurely breakfast. Port Louis, the charming capital of Mauritius, is situated on the north island. The Chap de Mars Racetrack, the secondoldest racetrack in the world, is located there. Driving to Port Louis, we stop at Marie Reine de Paix and then see the city's citadel and surrounding area. After seeing the Champ de Mars''',
                     textAlign: TextAlign.start,
                       style: TextStyle(
                         fontSize: 15.sp, 
                         color: Colors.black,
                         height: 1.5,
                       fontWeight: FontWeight.w400),
           ),
           //5
           ksizedbox20,
           Row(
             children: [
               Expanded(
                       child: Container(
                         width: size.width,
                         child:const Divider(
                           thickness: 1,
                           color: Colors.orange,
                         ),
                       ),
                     ),
                      Text('Day 05',
                       style: TextStyle(
                         fontSize: 18.sp, 
                         color: korange,
                       fontWeight: FontWeight.w500),
                     ),
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.only(right: 35),
                         child: Container(
                           width: size.width,
                           child:const Divider(
                             thickness: 1,
                             color: Colors.orange,
                           ),
                         ),
                       ),
                     ),
             ],
           ),
            ksizedbox10,
                  Text('''After a filling breakfast today, head to the Casela Bird Park (optional tour, additional supplement applicable). Experience the sizable outdoor entertainment park with came''',
                     textAlign: TextAlign.start,
                       style: TextStyle(
                         fontSize: 15.sp, 
                         color: Colors.black,
                         height: 1.5,
                       fontWeight: FontWeight.w400),
           ),
           //6
           ksizedbox20,
           Row(
             children: [
               Expanded(
                       child: Container(
                         width: size.width,
                         child:const Divider(
                           thickness: 1,
                           color: Colors.orange,
                         ),
                       ),
                     ),
                      Text('Day 06',
                       style: TextStyle(
                         fontSize: 18.sp, 
                         color: korange,
                       fontWeight: FontWeight.w500),
                     ),
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.only(right: 35),
                         child: Container(
                           width: size.width,
                           child:const Divider(
                             thickness: 1,
                             color: Colors.orange,
                           ),
                         ),
                       ),
                     ),
             ],
           ),
            ksizedbox10,
                  Text('''After a filling breakfast, you have the day to yourself today. You have the option of relaxing back at the hotel or touring the magnificent island. We recommend to choose the Sunset Catamaran Cruise (optional tour, additional supplement applicable). A catamaran is a vessel that has two identically sized hulls that are supported by a platform''',
                     textAlign: TextAlign.start,
                       style: TextStyle(
                         fontSize: 15.sp, 
                         color: Colors.black,
                         height: 1.5,
                       fontWeight: FontWeight.w400),
           ),
           //7
           ksizedbox20,
           Row(
             children: [
               Expanded(
                       child: Container(
                         width: size.width,
                         child:const Divider(
                           thickness: 1,
                           color: Colors.orange,
                         ),
                       ),
                     ),
                      Text('Day 07',
                       style: TextStyle(
                         fontSize: 18.sp, 
                         color: korange,
                       fontWeight: FontWeight.w500),
                     ),
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.only(right: 35),
                         child: Container(
                           width: size.width,
                           child:const Divider(
                             thickness: 1,
                             color: Colors.orange,
                           ),
                         ),
                       ),
                     ),
             ],
           ),
            ksizedbox10,
                  Text('''TWake up in the morning, have a scrumptious breakfast and pack your bags for your departure. Complete the check-out formalities and get ready to leave to the Mauritius airport to catch a suitable flight back home. Reach your desired destination and end the trip ''',
                     textAlign: TextAlign.start,
                       style: TextStyle(
                         fontSize: 15.sp, 
                         color: Colors.black,
                         height: 1.5,
                       fontWeight: FontWeight.w400),
           ),
        ],
      
    );
  }
}