import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constands/constands.dart';
import 'bus_details.dart';

class BusScreen extends StatefulWidget {
  const BusScreen({super.key});

  @override
  State<BusScreen> createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 140,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 22, left: 15, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                       InkWell(
                            onTap: (){
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.arrow_back_ios,color: kwhite,),
                      )),
                         Text('Bus Ticket Booking',
                         style: TextStyle(
                          color: kwhite,
                          fontSize: 20
                         ),),
                         Container()
                    
                  ],
                ),
              ),
            ),
          )
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 30),
                child: Row(
                  children: [
                    Text('Journey Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                    ),)
                  ],
                ),
              ),
              ksizedbox10,
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                child: Column(
                  children: [
                    Container(
                      height: 108,
                      decoration: BoxDecoration(
                        color: kwhite,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0.0, 0.75),
                            color: kgrey,
                            blurRadius: 1
                          )
                        ]
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 3),
                            child: Row(
                              children: [
                                Text('From',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xffBABABA)
                                ),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 7,
                                      width: 7,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kOrange
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text('Enter Boarding',
                                      style: TextStyle(
                                        color: Color(0xff575757)
                                      ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Row(
                                                            children:[
                                                             Image.asset('assets/icons/busarrow.png')
                                                        ]),
                                )
                              ],
                            ),
                          ),
       
                          Padding(
                            padding: const EdgeInsets.only(top: 12,left: 10),
                            child: Row(
                              children: [
                                Text('To',
                                style: TextStyle(
                                  fontSize: 12
                                ),)
                              ],
                            ),
                          ),
                             Padding(
                            padding: const EdgeInsets.only(left: 10,top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 7,
                                      width: 7,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kwhite,
                                        border: Border.all(color: kgrey)
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text('Enter Destination',
                                      style: TextStyle(
                                        color: Color(0xff575757)
                                      ),
                                      ),
                                    )
                                  ],
                                ),
                              
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                      
                  ],
                ),
              ),
              ksizedbox20,
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  height: 54,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: kwhite,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0.0, 0.75),
                        blurRadius: 1,
                        color: kgrey
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 10,top: 5),
                         child: Row(
                          children: [
                            Text('Date',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffBABABA)
                            ),)
                          ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 5,left: 10,right: 10),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Row(
                              children: [
                                Image.asset('assets/icons/busdate.png',
                                height: 20,
                                fit:BoxFit.fitHeight ,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text('20'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text('September'),
                                )
                              ],
                             ),
                             Row(
                              children: [
                                Text('Monday')
                              ],
                             )
                           ],
                         ),
                       )
                    ],
                  ),
                ),
              ),
              ksizedbox40,
              ksizedbox10,
              InkWell(
                onTap: (){
                  Get.to(BusDetailsScreen());
                },
                child: Container(
                  height: 44,
                  width: 250,
                  decoration: BoxDecoration(
                   color: kOrange,
                   boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: Offset(0.0, 0.75),
                      blurRadius: 5,
                      color: kyellow
                    )
                   ],
                   borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(
                    child: Text('SEARCH BUS',
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 12
                  ),)),
                ),
              )
            ],
          ),
    );
  }
}