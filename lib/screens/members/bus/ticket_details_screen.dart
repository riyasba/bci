import 'package:bci/constands/constands.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusTicketDetails extends StatefulWidget {
  const BusTicketDetails({super.key});

  @override
  State<BusTicketDetails> createState() => _BusTicketDetailsState();
}

class _BusTicketDetailsState extends State<BusTicketDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(220),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 140,
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
                      title:  Text('Ticket Details',
                         style: TextStyle(
                          color: kwhite,
                          fontSize: 20
                         ),),
                         centerTitle: true,
                         actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.share,color: kwhite,),
                          )
                         ],
                  ),
                ],
              )
            ),
          )
          ),
          body: Padding(
            padding:const EdgeInsets.only(left: 25,right: 25,top: 0,bottom: 10),
            child: Column(
              children: [
               const Row(
                  children: [
                    Text('Confirmed,',
                         style: TextStyle(
                          color: Color(0xff575757),
                          fontSize: 14
                         ),),
                         Text(' Wed, 20 September, 2017',
                         style: TextStyle(
                          color: Color(0xffBABABA),
                          fontSize: 12
                         ),),
                  ],
                ),
                ksizedbox10,
               const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text('From',
                         style: TextStyle(
                          color: Color(0xffBABABA),
                          fontSize: 12
                         ),),
                         Text('To',
                         style: TextStyle(
                          color: Color(0xffBABABA),
                          fontSize: 12
                         ),),
                  ],
                ),
                ksizedbox10,
               const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Chennai',
                         style: TextStyle(
                          color: Color(0xff575757),
                          fontSize: 14
                         ),),
                         Icon(Icons.arrow_forward),
                          Text('Bangalore',
                         style: TextStyle(
                          color: Color(0xff575757),
                          fontSize: 14
                         ),),
                  ],
                ),
                ksizedbox10,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('BOARDING POINT',
                         style: TextStyle(
                          color: Color(0xffBABABA),
                          fontSize: 12
                         ),),
                         Text('BOARDING TIME',
                         style: TextStyle(
                          color: Color(0xffBABABA),
                          fontSize: 12
                         ),),
                          ],
                        ),
                        //SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                         Text('Koyambedu Office',
                         style: TextStyle(
                          color: Color(0xff575757),
                          fontSize: 14
                         ),),
                          Text('23.30',
                         style: TextStyle(
                          color: Color(0xff575757),
                          fontSize: 14
                         ),),
                          ],
                        ),
                        Divider(thickness: 1.5,),
                        Text('Koyambedu Office',
                         style: TextStyle(
                          color: Color(0xff575757),
                          fontSize: 14
                         ),),
                         //ksizedbox10,
                           Text('BOARDING POINT',
                         style: TextStyle(
                          color: Color(0xffBABABA),
                          fontSize: 12
                         ),),
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
                          Text('07',
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
                          Text('08',
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
                  height: 280,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                          Text('BOARDING POINT ADDRESS',
                         style: TextStyle(
                          color: Color(0xffBABABA),
                          fontSize: 12
                         ),),
                         Text('K.P.N Travels\nKoyembedu Bus stand,\nChennai\n9678347678',
                         style: TextStyle(
                          color: Color(0xff575757),
                          fontSize: 14
                         ),),
                          Text('DROPING POINT ADDRESS',
                         style: TextStyle(
                          color: Color(0xffBABABA),
                          fontSize: 12
                         ),),
                         Text('K.P.N Travels\nElectronic city Audi\nBangalore\n8765789353',
                         style: TextStyle(
                          color: Color(0xff575757),
                          fontSize: 14
                         ),),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('TOTAL FARE',
                         style: TextStyle(
                          color: Color(0xffBABABA),
                          fontSize: 12
                         ),),
                         Text('₹1288',
                         style: TextStyle(
                          color: Color(0xff585858),
                          fontSize: 18
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
    );
  }
}