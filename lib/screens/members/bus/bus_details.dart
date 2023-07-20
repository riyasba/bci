import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constands/constands.dart';


class BusDetailsScreen extends StatefulWidget {
  const BusDetailsScreen({super.key});

  @override
  State<BusDetailsScreen> createState() => _BusDetailsScreenState();
}

class _BusDetailsScreenState extends State<BusDetailsScreen> {
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
                         Text('Chennai - Bangalore',
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
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: (){},
                         icon: Icon(Icons.arrow_back_ios,
                         color: kgrey,)),
                         Text('20-JUL-2023'),
                           IconButton(onPressed: (){},
                         icon: Icon(Icons.arrow_forward_ios,
                         color: kgrey,)),
                      ],
                    ),
                   ListView.builder(
                    shrinkWrap: true,
                    itemCount: image.length,
                    itemBuilder: (context,index){
                     return Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                       child: Container(
                        height: 105,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: kwhite,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 2,
                              color: kgrey
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)

                        ),
                         child: Column(
                      
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [

                                      Image.asset(image[index]),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(title[index],
                                          ),
                                            Text(discription[index],
                                            style: TextStyle(
                                              color: Color(0xffAEAEAE)
                                            ),),
                                            Text(distance[index],
                                             style: TextStyle(
                                              color: Color(0xffAEAEAE)
                                            ),)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(amount[index],
                                      style: TextStyle(
                                        color: kOrange
                                      ),),
                                      Text(seats[index],
                                       style: TextStyle(
                                              color: Color(0xffAEAEAE)
                                            ),)
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                         ),
                       ),
                     );
                   })
                  ],
                ),
              ],
            ),
          ),
    );
  }
}