import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnquiryNowWidget extends StatefulWidget {
  const EnquiryNowWidget({super.key});

  @override
  State<EnquiryNowWidget> createState() => _EnquiryNowWidgetState();
}

class _EnquiryNowWidgetState extends State<EnquiryNowWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: kgrey,
                      blurRadius: 2.5
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: size.width,
                      color: korange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Want to go for a memorable holidays?',
                              style: TextStyle(
                                fontSize: 19.sp, 
                                color: Colors.white,
                              fontWeight: FontWeight.w500),
                            ),ksizedbox10,
                            Text('Provide your details to know best holidays deals',
                              style: TextStyle(
                                fontSize: 13.sp, 
                                color: Colors.white,
                              fontWeight: FontWeight.w400),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Package Name',
                                    style: TextStyle(
                                      fontSize: 20.sp, 
                                      color: kblue,
                                    fontWeight: FontWeight.w500),
                                  ),
                                  ksizedbox10,
                                  Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(),
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child:const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      //controller: usernamecontroller,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                         // hintText: "Your Name",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                ksizedbox20,
                Text('City of Departure',
                                    style: TextStyle(
                                      fontSize: 20.sp, 
                                      color: kblue,
                                    fontWeight: FontWeight.w500),
                                  ),
                                  ksizedbox10,
                                  Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(),
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child:const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      //controller: usernamecontroller,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                         // hintText: "Your Name",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                ksizedbox20,
                Text('Date of Departure',
                                    style: TextStyle(
                                      fontSize: 20.sp, 
                                      color: kblue,
                                    fontWeight: FontWeight.w500),
                                  ),
                                  ksizedbox10,
                   Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(),
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child:const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      //controller: usernamecontroller,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                         // hintText: "Your Name",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                ksizedbox20,
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Adult',
                          style: TextStyle(
                          fontSize: 20.sp, 
                          color: kblue,
                          fontWeight: FontWeight.w500),
                  ),
                  ksizedbox10,
                  Container(
                    height: 25,
                    width: 75,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.remove,size: 20,),
                        Container(
                          height: 25,
                          width: 25,
                          color: Colors.orange,
                          child:const Center(
                              child: Text("1",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        const Icon(Icons.add,size: 20,),
                      ],
                    ),
                  ),
                      ],
                    ),
                    kwidth10,
                    Column(
                      children: [
                        Text('Child',
                          style: TextStyle(
                          fontSize: 20.sp, 
                          color: kblue,
                          fontWeight: FontWeight.w500),
                  ),
                  ksizedbox10,
                  Container(
                    height: 25,
                    width: 75,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.remove,size: 20,),
                        Container(
                          height: 25,
                          width: 25,
                          color: Colors.orange,
                          child:const Center(
                              child: Text("1",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        const Icon(Icons.add,size: 20,),
                      ],
                    ),
                  ),
                      ],
                    ),
                    kwidth10,
                    Column(
                      children: [
                        Text('Infant',
                          style: TextStyle(
                          fontSize: 20.sp, 
                          color: kblue,
                          fontWeight: FontWeight.w500),
                  ),
                  ksizedbox10,
                  Container(
                    height: 25,
                    width: 75,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.remove,size: 20,),
                        Container(
                          height: 25,
                          width: 25,
                          color: Colors.orange,
                          child:const Center(
                              child: Text("2",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        const Icon(Icons.add,size: 20,),
                      ],
                    ),
                  ),
                      ],
                    ),
                  ],
                ),
                ksizedbox20,
                Text('Contact Details',
                          style: TextStyle(
                          fontSize: 20.sp, 
                          color: kblue,
                          fontWeight: FontWeight.w500),
                  ),
                  ksizedbox10,
                   Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(),
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child:const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      //controller: usernamecontroller,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Your Name",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                ksizedbox20,
                 Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(),
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child:const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      //controller: usernamecontroller,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                ksizedbox20,
                Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(),
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child:const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      //controller: usernamecontroller,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                ksizedbox30,
                Container(
                          height: 35,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: kOrange,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child:const Center(
                              child: Text("Send Query",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        ksizedbox20,
                        Row(
                          children: [
                            Icon(Icons.punch_clock_sharp,color: kOrange,),
                            Text('Duration :6 Nights & 7 Days',
                          style: TextStyle(
                          fontSize: 18.sp, 
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                  ),
                          ],
                        ),
                        ksizedbox10,
                         Row(
                          children: [
                            Icon(Icons.location_city,color: kOrange,),
                            Text('Places to Visit :06N Mauritius',
                          style: TextStyle(
                          fontSize: 18.sp, 
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                  ),
                          ],
                        ),
                        ksizedbox30,
                        Text('Packages Include',
                          style: TextStyle(
                          fontSize: 20.sp, 
                          color: kblue,
                          fontWeight: FontWeight.w500),
                         ),
                         ksizedbox10,
                         Row(
                          children: [
                            Column(
                              children: [
                                Icon(Icons.flight_outlined,color: kgrey,),
                                Text('Flights',
                          style: TextStyle(
                          fontSize: 10.sp, 
                          color: kgrey,
                          fontWeight: FontWeight.w500),
                         ),
                              ],
                            ),
                            kwidth5,
                            Column(
                              children: [
                                Icon(Icons.hotel,color: kgrey,),
                                Text('Hotels',
                          style: TextStyle(
                          fontSize: 10.sp, 
                          color: kgrey,
                          fontWeight: FontWeight.w500),
                         ),
                              ],
                            ),
                            kwidth5,
                            Column(
                              children: [
                                Icon(Icons.car_rental,color: kgrey,),
                                Text('Travel',
                          style: TextStyle(
                          fontSize: 10.sp, 
                          color: kgrey,
                          fontWeight: FontWeight.w500),
                         ),
                              ],
                            ),
                            kwidth5,
                            Column(
                              children: [
                                Icon(Icons.food_bank,color: kgrey,),
                                Text('Meals',
                          style: TextStyle(
                          fontSize: 10.sp, 
                          color: kgrey,
                          fontWeight: FontWeight.w500),
                         ),
                              ],
                            ),
                          ],
                         ),
                        ],
                      ),
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