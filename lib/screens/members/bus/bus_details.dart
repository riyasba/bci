import 'package:bci/controllers/bus_controllers.dart';
import 'package:bci/screens/members/bus/bus_seats_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constands/constands.dart';


class BusDetailsScreen extends StatefulWidget {
  String fromCityName;
  String toCityName;
  String tdate;
  BusDetailsScreen({super.key,required this.fromCityName, required this.toCityName, required this.tdate});

  @override
  State<BusDetailsScreen> createState() => _BusDetailsScreenState();
}

class _BusDetailsScreenState extends State<BusDetailsScreen> {

  final busController = Get.find<BusController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    busController.searchBus(
      fromCityId: busController.fromcityId.value.toString(), 
      toCityId: busController.tocityId.value.toString(), 
      travelDate: formatDate(busController.travelDatess, [mm, "/", dd, "/", yyyy]));
  }

  List image=[
    'assets/icons/bus1.png', 
     'assets/icons/bus2.png',
     'assets/icons/bus3.png',
     'assets/icons/bus4.png',
     

  ];
  List title=[
    'Parveen Travels',
    'K.P.N Travels',
    'SRS Travels',
    'Shri Baghyalakshmi Travels',
    'YBM Travels'
  ];
  List discription=[
    'Non A/C Semi Sleeper (2+2)',
    'Volvo A/C Multi Axle \nSemi Sleeper',
    'Non A/C Seater/Sleeper (2+1)',
    'Non A/C Sleeper (2+1)',
    'A/C Sleeper (2+1)'
  ];
  List distance=[
    '19:15 → 06:15',
    '20:15 → 07:30',
    '20:11 → 06:30',
    '19:15 → 06:15',
   
  ];
  List amount=[
    '₹640',
    '₹644',
    '₹630',
    '₹770',
    
    
  ];
  List seats=[
    '34 Seats',
    '36 Seats',
    '43 Seats',
    '19 Seats',
   
  ];
  @override
  Widget build(BuildContext context) {
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
                      title:  Text('${widget.fromCityName} - ${widget.toCityName}',
                         style: TextStyle(
                          color: kwhite,
                          fontSize: 20
                         ),),
                         centerTitle: true,
                  ),
                ],
              )
            ),
          )
          ),
          body: GetBuilder<BusController>(
            builder: (_) {
              return ListView.builder(
               shrinkWrap: true,
               itemCount: busController.busData.length,
               itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                  child: InkWell(
                   onTap: (){
                     Get.to(BusSeatsScreen(
                      boardingid: busController.busData[index].boardingDetails.first.boardingId,
                      droppingid: busController.busData[index].droppingDetails.first.droppingId,
                      buskey: busController.busData[index].busKey,));
                   },
                    child: Container(
                     height: 105,
                     width: MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(
                       color: kwhite,
                       boxShadow: <BoxShadow>[
                         BoxShadow(
                           offset:const Offset(0.0, 0.75),
                           blurRadius: 2,
                           color: kgrey
                         )
                       ],
                       borderRadius: BorderRadius.circular(10)
                     ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0,left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                   width: 200,
                                    child: Text(busController.busData[index].boardingDetails.first.boardingLandmark,
                                    maxLines: 2,
                                     ),
                                  ),
                                  //ksizedbox10,
                                  Container(
                                   width: 200,
                                    child: Text(busController.busData[index].busType,
                                      maxLines: 2,
                                    style:const TextStyle(
                                      color: Color(0xffAEAEAE)
                                    ),),
                                  ),
                                  //ksizedbox10,
                                  Row(
                                    children: [
                                      Text(busController.busData[index].departureTime,
                                       style:const TextStyle(
                                        color: Color(0xffAEAEAE)
                                      ),),
                                      kwidth10,
                                      const Icon(Icons.arrow_forward,size: 15,),
                                      kwidth10,
                                      Text(busController.busData[index].droppingDetails.first.droppingTime,
                                       style:const TextStyle(
                                        color: Color(0xffAEAEAE)
                                      ),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                 Text("₹ ${busController.busData[index].fareMasters.first.totalAmount.toString()}",
                                  style: TextStyle(
                                    color: kOrange,
                                    fontWeight: FontWeight.w500
                                  ),),
                                  const SizedBox(height: 5,),
                                  Text("${busController.busData[index].availableSeats.toString()} Seats",
                                   style:const TextStyle(
                                          color: Color(0xffAEAEAE)
                                        ),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
            }
          ),
    );
  }
}