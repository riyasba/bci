import 'package:bci/constands/constands.dart';
import 'package:bci/screens/members/bus/bus_payment_screen.dart';
import 'package:bci/screens/members/bus/ticket_details_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusSeatsScreen extends StatefulWidget {
  const BusSeatsScreen({super.key});

  @override
  State<BusSeatsScreen> createState() => _BusSeatsScreenState();
}

class _BusSeatsScreenState extends State<BusSeatsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
       appBar: PreferredSize(
          preferredSize: const Size.fromHeight(220),
          child: Stack(
            children: [
              Container(
                child: ClipPath(
                  clipper: SinCosineWaveClipper(),
                  child: Container(
                    height: 200,
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
                        Text('K.P.N Travels (voice A/C Semi Sleeper)',
                               style: TextStyle(
                                color: kwhite,
                                fontSize: 15
                               ),),
                              
                      ],
                    )
                  ),
                ),
              ),
               Positioned(
                                top: 139,
                                left: 0,
                                right: 0,
                                 child: Padding(
                                   padding: const EdgeInsets.only(left: 50,right: 50),
                                   child: Container(
                                    height: 50,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      color: kwhite,
                                      boxShadow: [
                                        BoxShadow(
                                          color: kgrey,
                                          blurRadius: 2
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(3)
                                    ),
                                    child: Center(
                                      child: Text('Bus Seats',
                               style: TextStyle(
                                color: kOrange,
                                fontSize: 20
                               ),),
                                    ),
                                   ),
                                 ),
                               ),
            ],
          )
          ),
          body:const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Padding(
                  padding: EdgeInsets.only(left: 50,right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image(image: AssetImage("assets/icons/Group 13.png")),
                          ksizedbox10,
                          Image(image: AssetImage("assets/icons/Group 13.png"),color:Colors.amber,),
                          ksizedbox10,
                          Image(image: AssetImage("assets/icons/Group 13.png")),
                          ksizedbox10,
                          Image(image: AssetImage("assets/icons/Group 13.png")),
                          ksizedbox10,
                          Image(image: AssetImage("assets/icons/Group 13.png")),
                          ksizedbox10,
                          Image(image: AssetImage("assets/icons/Group 13.png")),
                        ],
                      ),
                       Column(
                         children: [
                           Image(image: AssetImage("assets/icons/Group 20.png")),
                           ksizedbox10,
                           Image(image: AssetImage("assets/icons/Group 20.png")),
                           ksizedbox10,
                           Image(image: AssetImage("assets/icons/Group 20.png")),
                           ksizedbox10,
                           Image(image: AssetImage("assets/icons/Group 20.png")),
                           ksizedbox10,
                           Image(image: AssetImage("assets/icons/Group 20.png")),
                           ksizedbox10,
                           Image(image: AssetImage("assets/icons/Group 18.png")),
                           ksizedbox10,
                           Image(image: AssetImage("assets/icons/Group 20.png")),
                           ksizedbox10,
                           Image(image: AssetImage("assets/icons/Group 20.png")),
                           ksizedbox10,
                           Image(image: AssetImage("assets/icons/Group 20.png")),
                         ],
                       ),
                    ],
                  ),
                ),
                
            ],
          ),
          bottomNavigationBar: Container(
            height: 50,
            width: size.width,
            color: kwhite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                        Text('Seat No  :  ',
                           style: TextStyle(
                            color: kgrey,
                            fontSize: 15
                           ),),
                           Text('  07,08',
                           style: TextStyle(
                            color: kgrey,
                            fontSize: 15
                           ),),
                    ],
                  ),
                ),
                Row(
                  children: [
                      Text('₹1300',
                         style: TextStyle(
                          color: kblue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                         ),),
                         kwidth10,
                         kwidth10,
                         InkWell(
                          onTap: (){
                            Get.to(BusPaymentScreen());
                          },
                           child: Container(
                            height: 50,
                            width: 100,
                             decoration: BoxDecoration(
                              gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                                colors: [
                                     kyellow,
                                     kOrange
                                        ],
                                     ),
                                 ),
                            child: Center(
                              child: Text('PAY',
                           style: TextStyle(
                            color: kwhite,
                            fontSize: 15
                           ),),
                            ),
                           ),
                         ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}