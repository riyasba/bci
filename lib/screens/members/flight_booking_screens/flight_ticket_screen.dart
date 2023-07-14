// import 'package:bci/constands/constands.dart';
// import 'package:flutter/material.dart';

// class FlightTicketScreen extends StatefulWidget {
//   const FlightTicketScreen({super.key});

//   @override
//   State<FlightTicketScreen> createState() => _FlightTicketScreenState();
// }

// class _FlightTicketScreenState extends State<FlightTicketScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding:const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//              const Center(
//                 child:Text("Plane Ticket Purchase",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold
//                 ),)),
//                 ksizedbox10,
//                const Divider(thickness: 1.2,),
//                const Text("Booking Date",
//                 style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.bold
//                 ),),
//                const SizedBox(height: 5,),
//                const Text("Saturday, December 3,2022",
//                 style: TextStyle(
//                 fontSize: 11,
//                 color: Colors.grey,
//                 ),),
//                 ksizedbox10,
//                const Text("Guest Name",
//                 style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.bold
//                 ),),
//                const SizedBox(height: 5,),
//                const Text("Miss Stephane Celine Linden",
//                 style: TextStyle(
//                 fontSize: 11,
//                 color: Colors.grey,
//                 ),),
//                const Divider(thickness: 1.2,),
//                  ksizedbox10,
//                const Text("Flight Details",
//                 style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold
//                 ),),
//                const SizedBox(height: 5,),
//                const Text("Route",
//                 style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey,
//                 ),),
//                const Divider(thickness: 1.2,),
//                 //from
//                const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("From",
//                             style: TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold
//                           ),),
//                           SizedBox(height: 4,),
//                         Text("New York",
//                             style: TextStyle(
//                             fontSize: 10,
//                             color: Colors.grey,
//                           ),),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Airline",
//                             style: TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold
//                           ),),
//                           SizedBox(height: 4,),
//                         Text("ACME Airlines",
//                             style: TextStyle(
//                             fontSize: 10,
//                             color: Colors.grey,
//                           ),),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Departure Date",
//                             style: TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold
//                           ),),
//                           SizedBox(height: 4,),
//                         Text("Tuesday,\nDecember 20,\n2022 06:30",
//                             style: TextStyle(
//                             fontSize: 10,
//                             color: Colors.grey,
//                           ),),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Arrival Date",
//                             style: TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold
//                           ),),
//                           SizedBox(height: 4,),
//                         Text("Tuesday,\nDecember 6,\n2022 23:30",
//                             style: TextStyle(
//                             fontSize: 10,
//                             color: Colors.grey,
//                           ),),
//                       ],
//                     ),
//                   ],
//                 ),
//                 //to
//                 ksizedbox10,
//                const Padding(
//                   padding: EdgeInsets.only(left: 30,right: 30),
//                   child: Divider(thickness: 1.2,),
//                 ),
//                 ksizedbox10,
//                const  Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("To",
//                             style: TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold
//                           ),),
//                           SizedBox(height: 4,),
//                         Text("London",
//                             style: TextStyle(
//                             fontSize: 10,
//                             color: Colors.grey,
//                           ),),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Flight Number",
//                             style: TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold
//                           ),),
//                           SizedBox(height: 4,),
//                         Text("AA7755",
//                             style: TextStyle(
//                             fontSize: 10,
//                             color: Colors.grey,
//                           ),),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Departure Terminal",
//                             style: TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold
//                           ),),
//                           SizedBox(height: 4,),
//                         Text("Terminal 1",
//                             style: TextStyle(
//                             fontSize: 10,
//                             color: Colors.grey,
//                           ),),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Arrival Terminal",
//                             style: TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold
//                           ),),
//                           SizedBox(height: 4,),
//                         Text("Terminal 5",
//                             style: TextStyle(
//                             fontSize: 10,
//                             color: Colors.grey,
//                           ),),
//                       ],
//                     ),
//                   ],
//                 ),
//                 ksizedbox10,
//                const Padding(
//                   padding: EdgeInsets.only(left: 30,right: 30),
//                   child: Divider(thickness: 1.2,),
//                 ),
//                 ksizedbox10,
//                 //class
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                        const Text("Seat Class",
//                             style: TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold
//                           ),),
//                         const  SizedBox(height: 4,),
//                         Container(
//                           height: 20,
//                           width: 80,
//                           decoration: BoxDecoration(
//                             color:const Color.fromARGB(255, 216, 229, 247),
//                             borderRadius: BorderRadius.circular(3),
//                           ),
//                           child:const Center(
//                             child: Text("Business Class",style: TextStyle(fontSize: 10),),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                        const Text("Extra Baggage Allowance",
//                             style: TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold
//                           ),),
//                           const  SizedBox(height: 4,),
//                         Container(
//                           height: 20,
//                           width: 20,
//                           decoration: BoxDecoration(
//                             color:const Color.fromARGB(255, 216, 229, 247),
//                             borderRadius: BorderRadius.circular(3),
//                           ),
//                           child:const Center(
//                             child: Text("8",style: TextStyle(fontSize: 10),),
//                           ),
//                         ),
//                       ],
//                     ),
//                    const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Seat Number",
//                             style: TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold
//                           ),),
//                             SizedBox(height: 4,),
//                         Text("3-A",
//                             style: TextStyle(
//                             fontSize: 10,
//                             color: Colors.grey,
//                           ),),
//                       ],
//                     ),
//                   ],
//                 ),
//                 ksizedbox10,
//                 const Divider(thickness: 1.2,),
//                 ksizedbox10,
//                 //fare breakdown
//                  const Text("Fare  Breakdown",
//                 style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold
//                 ),),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 0,top: 10),
//                   child: Row(
//                     children: [
//                        Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Base Fare",
//                               style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.bold
//                             ),),
//                               SizedBox(height: 10,),
//                           Text("Passenger Service Charge",
//                               style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.bold
//                             ),),
//                               SizedBox(height: 10,),
//                           Text("Surcharge",
//                               style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.bold
//                             ),),
//                               SizedBox(height: 10,),
//                           Text("Fuel/Insurance Surcharge",
//                               style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.bold
//                             ),),
//                               SizedBox(height: 10,),
//                           Text("Ticketing Service Charge",
//                               style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.bold
//                             ),),
//                         ],
//                       ),
//                       //
//                       kwidth10,
//                       kwidth10,
//                       kwidth10,
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(":     ₹ 100.00",
//                               style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey,
//                             ),),
//                               SizedBox(height: 10,),
//                           Text(":     ₹ 0.00",
//                               style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey,
//                             ),),
//                               SizedBox(height: 10,),
//                           Text(":     ₹ 80.00",
//                               style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey,
//                             ),),
//                               SizedBox(height: 10,),
//                           Text(":     ₹ 30.00",
//                               style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey,
//                             ),),
//                               SizedBox(height: 10,),
//                           Text(":     ₹ 5.00",
//                               style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey,
//                             ),),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 0,right: 50,top: 5,bottom: 10),
//                   child: Divider(thickness: 1.2,),
//                 ),
//                const Row(
//                  children: [
//                    Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                            Text("Total Amount",
//                              style: TextStyle(
//                              fontSize: 11,
//                              fontWeight: FontWeight.bold
//                            ),),
//                      ],
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(left: 93),
//                      child: Column(
//                        children: [
//                          Text(":     ₹ 215.00",
//                                style: TextStyle(
//                                fontSize: 11,
//                                fontWeight: FontWeight.bold,
//                                color: Colors.grey,
//                              ),),
//                        ],
//                      ),
//                    ),
//                  ],
//                ),
//                  const Padding(
//                   padding: EdgeInsets.only(left: 0,right: 50,top: 10,bottom: 10),
//                   child: Divider(thickness: 1.2,),
//                 ),
//                 //last
//                 const Text("Important Information",
//                 style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w500
//                 ),),
//                 ksizedbox10,
//                 const Text("The Indian rupee is the official currency in the Republic of India. The rupee is subdivided into 100 paise. The issuance of the currency is controlled by the Reserve Bank of India.",
//                 style: TextStyle(
//                 fontSize: 11,
//                 color: Colors.grey,
//                 ),),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }