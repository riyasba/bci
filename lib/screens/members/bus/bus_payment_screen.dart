import 'package:bci/constands/constands.dart';
import 'package:bci/screens/members/bus/ticket_details_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusPaymentScreen extends StatefulWidget {
  const BusPaymentScreen({super.key});

  @override
  State<BusPaymentScreen> createState() => _BusPaymentScreenState();
}

class _BusPaymentScreenState extends State<BusPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(220),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 180,
              color: kblue,
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: kblue,
                    elevation: 0,
                    leading: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios,color: kwhite,)),
                      title:  Text('Chennai - Bangalore',
                         style: TextStyle(
                          color: kwhite,
                          fontSize: 20
                         ),),
                         centerTitle: true,
                  ),
                  Text('K.P.N Travels ( volvo A/C Semi Sleeper)',
                         style: TextStyle(
                          color: kwhite,
                          fontSize: 15
                         ),),
                ],
              )
            ),
          ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Container(
                    height: 225,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: kwhite,
                      boxShadow: [
                        BoxShadow(
                          color: kgrey,
                          blurRadius: 1
                        ),
                      ]
                    ),
                    child:const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Text('K.P.N Travels',
                           style: TextStyle(
                            color: Color(0xff575757),
                            fontSize: 14
                           ),),
                           Text('(volvo a/c Multipleaxle semi sleeper)',
                           style: TextStyle(
                            color: Color(0xffBABABA),
                            fontSize: 12
                           ),),
                          //SizedBox(height: 5,),
                          
                          Divider(thickness: 1.5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text('BOARDING POINT',
                           style: TextStyle(
                            color: Color(0xffBABABA),
                            fontSize: 12
                           ),),
                            Text('DESTINATION',
                           style: TextStyle(
                            color: Color(0xffBABABA),
                            fontSize: 12
                           ),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Koyambedu Office',
                               style: TextStyle(
                                color: Color(0xff575757),
                                fontSize: 14
                               ),),
                                Text('Electronic city',
                               style: TextStyle(
                                color: Color(0xff575757),
                                fontSize: 14
                               ),),
                            ],
                          ),
                           //ksizedbox10,
                            
                           Divider(thickness: 1.5,),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Passenger',
                           style: TextStyle(
                            color: Color(0xffBABABA),
                            fontSize: 14
                           ),),
                           Text('Seat No',
                           style: TextStyle(
                            color: Color(0xffBABABA),
                            fontSize: 14
                           ),),
                            ],
                          ),
                          //ksizedbox10,
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           Text('Praveen',
                           style: TextStyle(
                            color: Color(0xff575757),
                            fontSize: 15
                           ),),
                            Text('S-07',
                           style: TextStyle(
                            color: Color(0xff575757),
                            fontSize: 15
                           ),),
                            ],
                          ),
                          //ksizedbox10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           Text('Raj',
                           style: TextStyle(
                            color: Color(0xff575757),
                            fontSize: 15
                           ),),
                            Text('S-08',
                           style: TextStyle(
                            color: Color(0xff575757),
                            fontSize: 15
                           ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ksizedbox20,
                  Container(
                    height: 165,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: kwhite,
                      boxShadow: [
                        BoxShadow(
                          color: kgrey,
                          blurRadius: 1
                        ),
                      ]
                    ),
                    child:const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text('ONWARD FARE',
                               style: TextStyle(
                                color: Color(0xff575757),
                                fontSize: 14
                               ),),
                                Text('AMOUNT',
                               style: TextStyle(
                                color: Color(0xff575757),
                                fontSize: 14
                               ),),
                             ],
                           ),
                          
                          
                          Divider(thickness: 1.5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text('Bus Fare',
                           style: TextStyle(
                            color: Color(0xffBABABA),
                            fontSize: 14
                           ),),
                            Text('₹1288',
                           style: TextStyle(
                            color: Color(0xffBABABA),
                            fontSize: 14
                           ),),
                            ],
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text('Inclusive Tax',
                           style: TextStyle(
                            color: Color(0xffBABABA),
                            fontSize: 14
                           ),),
                            Text('₹0',
                           style: TextStyle(
                            color: Color(0xffBABABA),
                            fontSize: 14
                           ),),
                            ],
                          ),
                          
                          Divider(thickness: 1.5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           Text('Total Fare',
                           style: TextStyle(
                            color: Color(0xff575757),
                            fontSize: 14
                           ),),
                            Text('₹1288',
                           style: TextStyle(
                            color: Color(0xff575757),
                            fontSize: 16
                           ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 55,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 55,
                            width: size.width,
                            color: kwhite,
                            child:const Center(
                              child:Text('Cancel',
                               style: TextStyle(
                                color: Color(0xff575757),
                                fontSize: 16
                               ),) ,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                            _dialogBuilder(context);
                          },
                            child: Container(
                              height: 55,
                              width: size.width,
                              color: korange,
                              child: Center(
                                child:Text('PAY ₹ 1288',
                                 style: TextStyle(
                                  color: kwhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                 ),) ,
                              ),
                            ),
                          ),
                        ),
                      ],
              ),
            ),
          ),
    );
  }
  _dialogBuilder(BuildContext context,) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 300,
            width: 300,
            color: kwhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               const Image(image: AssetImage("assets/icons/tick.png")),
               const Text('Booking Completed!',
                  style: TextStyle(
                  color: Color(0xff575757),
                  fontSize: 18
                ),) ,
                const Text('Transaction Id : T5627dy768',
                  style: TextStyle(
                  color: Color(0xff575757),
                  fontSize: 18
                ),) ,
               const Text('Thank You!',
                  style: TextStyle(
                  color: Color(0xff575757),
                  fontSize: 18
                ),),
                InkWell(
                  onTap: (){
                    Get.to(const BusTicketDetails());
                  },
                  child: Container(
                                height: 55,
                                width: 180,
                                decoration: BoxDecoration(
                                  color: korange,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(
                                  child:Text('View Ticket',
                                   style: TextStyle(
                                    color: kwhite,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400
                                   ),) ,
                                ),
                              ),
                ),
              ],
            ),
          ),
        );
      },
    );
      }
}