import 'package:bci/controllers/services_controller.dart';
import 'package:bci/screens/bussiness/views/business/business_home_screen.dart';
import 'package:calender_picker/calender_picker.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                              serviceController.bookingListData[index].quantity,
                              serviceController.bookingListData[index].user.name,
                              );
                        },
                        child: Container(
                          height: 140.h,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Container(
                                height: 180.h,
                                width: 150.w,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 5, right: 10, bottom: 10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(serviceController.bookingListData[index].image,fit: BoxFit.cover,)),
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
                                        width: 210.w,
                                        child: Text(
                                          serviceController.bookingListData[index].description,
                                          maxLines: 5,
                                          style:
                                              TextStyle(fontSize: 12, color: kgrey),
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

  Future<void> dialogBuilder(BuildContext context,String img, String tit, String des, String amt, String qty, String cusName,) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context, ) {
        return AlertDialog(
         content: SizedBox(
          height: 500,
    width: 1000,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                       Row(
                         children: [
                          GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back_ios,color: kblue,size: 15,)),
                          const SizedBox(width: 10,),
                           Text(
                            'Booking Details',
                            style: TextStyle(fontSize: 18, color: kblue,fontWeight: FontWeight.bold),
                      ),
                         ],
                       ),
                        ksizedbox10,                      
                        Row(
                         children: [
                          Image.network(img,height: 100,width: 100, fit: BoxFit.cover,),
                          const SizedBox(width: 10,),
                          
                         ],
                       ),
                       ksizedbox10,
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Product Name',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                           Container(
                               width: 90,
                             child: Text(
                              tit,
                              style: TextStyle(fontSize: 15, color: kgrey,fontWeight: FontWeight.w500),
                                                 ),
                           ),
                         ],
                       ),
                       Divider(thickness: 1,),
                      //  Row(
                      //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //    children: [
                      //    Text(
                      //       'Date',
                      //       style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      // ),
                      //      Container(
                      //          width: 90,
                      //        child: Text(
                      //         date,
                      //         style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),
                      //                            ),
                      //      ),
                      //    ],
                      //  ),
                      
                      //  Divider(thickness: 1,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Customer Name',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                           Container(
                               width: 90,
                             child: Text(
                              cusName,
                              style: TextStyle(fontSize: 15, color: kgrey,fontWeight: FontWeight.w500),
                                                 ),
                           ),
                         ],
                       ),
                       const Divider(thickness: 1,),
                      //  Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Container(
                      //       width: 150,
                      //       child: Text('Status',
                      //         style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //     Container(
                      //       width: 90,
                      //       child: Text(sts,
                      //         style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),),
                      //     )
                      //   ],
                      //  ),
                      //  Divider(thickness: 1,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Quantity',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                           Container(
                               width: 90,
                             child: Text(
                              qty,
                              style: TextStyle(fontSize: 15, color: kgrey,fontWeight: FontWeight.w500),
                                                 ),
                           ),
                         ],
                       ),
                       const Divider(thickness: 1,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         const Text(
                            'Price',
                            style: TextStyle(fontSize: 16, color: Colors.green,fontWeight: FontWeight.bold),
                      ),
                           Container(
                               width: 90,
                             child: Text(
                              "₹ ${amt}",
                              style:const TextStyle(fontSize: 15, color: Colors.green,fontWeight: FontWeight.w500),
                                                 ),
                           ),
                         ],
                       ),
              ],
            ),
           
          ),
            insetPadding: const EdgeInsets.all(10),
        );
      },
    );
  }
}
