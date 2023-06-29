import 'package:bci/controllers/services_controller.dart';
import 'package:bci/screens/bussiness/views/business/business_home_screen.dart';
import 'package:calender_picker/calender_picker.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constands/constands.dart';

class BusinessBookingScreen extends StatefulWidget {
  const BusinessBookingScreen({super.key});

  @override
  State<BusinessBookingScreen> createState() => _BusinessBookingScreenState();
}

class _BusinessBookingScreenState extends State<BusinessBookingScreen> {

  final serviceController = Get.find<ServicesController>();

  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();

   DateTime date1 = DateTime.now();
  DateTime date = DateTime.now();

  String selectdt =
      formatDate(DateTime.now().subtract(Duration(days: 1)), [
    yyyy,
    "-",
    mm,
    "-",
    dd,
  ]);

  String selectdt1 = formatDate(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      [yyyy, "-", mm, "-", dd]);

  _showDatePicker(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        builder: ((context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: kblue,
                onPrimary: Colors.white,
                onSurface: Colors.blue,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 42, 59, 158),
                ),
              ),
            ),
            child: child!,
          );
        }));

    if (picked != null) {
      setState(() {
        date1 = picked;
        selectdt = formatDate(date1.subtract(Duration(days: 1)), [
          yyyy,
          "-",
          mm,
          "-",
          dd,
        ]);
      });
      serviceController.dateFilterBooking(
          fromdate: selectdt,
          todate: selectdt1);
    }
  }

  _showDatePicker1(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        builder: ((context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: kblue,
                onPrimary: Colors.white,
                onSurface: Colors.blue,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 42, 59, 158),
                ),
              ),
            ),
            child: child!,
          );
        }));

    if (picked != null) {
      setState(() {
        date = picked;
        selectdt1 = formatDate(date.add(const Duration(days: 1)), [
          yyyy,
          "-",
          mm,
          "-",
          dd,
        ]);
      });
      serviceController.dateFilterBooking(
          fromdate: selectdt,
          todate: selectdt1);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    serviceController.getBooking();
    serviceController.update();
    serviceController.dateFilterBooking(
      fromdate: selectdt,
      todate: selectdt1
      );
  }

  DateTime _dateTime = DateTime.now();
  DateTime dateTime1 = DateTime(2100);
  List bookingimage = [
    'assets/images/bookingcar.png',
    'assets/images/bookingflight.png',
    'assets/images/bookingroom.png'
  ];
  List bookingtitle = [
    'Car Service Book',
    'Flight Booki Services',
    'Hotel Room Book Service',
  ];
  List bookingdescription = [
    'Want to get your Car Serviced \nOr Repaired? Book Now. \nPitstop offers Car Care Services at \nyour doorstep in Bangalore through \nour network of branded and multi \nbrand car service garages.',
    'A new pricing model would charge \npassengers according to the travel \nhabits revealed in their online search \nhistory.',
    'Discover luxury hotel \naccommodation at Aman \nTokyo, situated near the Imperial \nPalace Gardens in Tokyo, Japan. \nChoose from rooms and suites \nwith a view.'
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(280),
          child: Stack(children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: kOrange,
            ),
            ClipPath(
              clipper: SinCosineWaveClipper(),
              child: Container(
                height: 158,
                color: kblue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // IconButton(
                    //   onPressed: () {
                    //     Get.off(BusinessHomeScreen());
                    //   },
                    //   icon: Icon(
                    //     Icons.arrow_back_ios,
                    //     color: kwhite,
                    //   )),
                  const Padding(
                     padding:  EdgeInsets.only(left: 25),
                     child:  Text(
                       'Bookings',
                       style: TextStyle(fontSize: 23, color: Colors.white),
                     ),
                   ),
                    Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset('assets/images/helps.png'),
                  )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 150,
              child: Container(
              
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("From Date:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),),
                            const SizedBox(width: 10,),
                      InkWell(
                        onTap: (){
                          _showDatePicker(context);
                        },
                        child: Container(
                          height: 35,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(selectdt),
                              const Icon(Icons.edit_calendar)
                            ],
                          ),
                        ),
                      ),
                        ],
                      ),
                      ksizedbox10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("To Date:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),),
                             const SizedBox(width: 10,),
                       InkWell(
                        onTap: (){
                          _showDatePicker1(context);
                        },
                         child: Container(
                          height: 35,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(selectdt1),
                              const Icon(Icons.edit_calendar)
                            ],
                          ),
                                             ),
                       ),
                        ],
                      ),
                       
                      // Center(
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(),
                      //     child: Text(formatDate(_dateTime, [M,',',yyyy,  ],),style: TextStyle(color: kwhite,fontSize: 18) ,),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 5),
                      //   child: CalenderPicker(
                      //     DateTime.now().subtract(Duration(days: 50)),
                      //     initialSelectedDate: DateTime.now(),
                      //     selectionColor: kOrange,
                      //     selectedTextColor: kblue,
                      //     onDateChange: (date) {
                      //       setState(() {
                      //         _dateTime = date;
                      //         serviceController.dateFilterBooking(
                      //         fromdate: _dateTime.toString(), 
                      //          todate: DateTime(_dateTime.year,_dateTime.month,_dateTime.day +1).toString(),
                      //            );
                      //       });
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ])),
      body: GetBuilder<ServicesController>(
        builder: (_) {
          return serviceController.bookingListData.isEmpty ? 
          const Center(
            child: Text("No Data Found"),
            ) :
          ListView.builder(
              itemCount: serviceController.bookingListData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                            dialogBuilder(
                              context, 
                              serviceController.bookingListData[index].image, 
                              serviceController.bookingListData[index].service, 
                              serviceController.bookingListData[index].description, 
                              serviceController.bookingListData[index].purchasePrice,
                              serviceController.bookingListData[index].quantity
                              );
                        },
                        child: Container(
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Container(
                                height: 180,
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 5, right: 10, bottom: 10),
                                      child: Image.network(serviceController.bookingListData[index].image,fit: BoxFit.contain,),
                                  // child: Image.asset(
                                  //   bookingimage[index],
                                  //   fit: BoxFit.contain,
                                  // ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      serviceController.bookingListData[index].service,
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,color: kblue),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Container(
                                        width: 210,
                                        child: Text(
                                          serviceController.bookingListData[index].description,
                                          maxLines: 5,
                                          style:
                                              TextStyle(fontSize: 12, color: kblue),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        }
      ),
    );
  }

  Future<void> dialogBuilder(BuildContext context,String img, String tit, String date, String amt, String qty) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context, ) {
        return AlertDialog(
          title: Container(
            height: 400,
            width: 300,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                       Row(
                         children: [
                          Icon(Icons.arrow_back_ios,color: kblue,size: 15,),
                          const SizedBox(width: 10,),
                           Text(
                            'Tourist Details',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                         ],
                       ),
                       Row(
                         children: [
                          Image.network(img,height: 50,width: 60, fit: BoxFit.cover,),
                          const SizedBox(width: 10,),
                           Column(
                             children: [
                               Text(
                                tit,
                                style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                      Text( 'Date : 17/30/34',
                                style: TextStyle(fontSize: 12, color: kblue,fontWeight: FontWeight.w500),
                      ),
                             ],
                           ),
                         ],
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Place',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                           Text(
                            tit,
                            style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),
                      ),
                         ],
                       ),
                       Divider(thickness: 1,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Date',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                           Text(
                            '19/06/23',
                            style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),
                      ),
                         ],
                       ),
                       Divider(thickness: 1,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Trip',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                           Text(
                            '03.54 PM',
                            style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),
                      ),
                         ],
                       ),
                       Divider(thickness: 1,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Country',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                           Text(
                            'India',
                            style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),
                      ),
                         ],
                       ),
                       Divider(thickness: 1,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Adult',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                           Text(
                            '10',
                            style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),
                      ),
                         ],
                       ),
                       Divider(thickness: 1,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Quantity',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                           Text(
                            qty,
                            style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),
                      ),
                         ],
                       ),
                       Divider(thickness: 1,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Price',
                            style: TextStyle(fontSize: 16, color: Colors.green,fontWeight: FontWeight.bold),
                      ),
                           Text(
                            amt,
                            style: TextStyle(fontSize: 15, color: Colors.green,fontWeight: FontWeight.w500),
                      ),
                         ],
                       ),
              ],
            ),
          ),
        );
      },
    );
  }
}
