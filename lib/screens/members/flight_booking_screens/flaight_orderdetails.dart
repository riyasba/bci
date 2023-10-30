import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/flight_booking_models/air_search_model.dart';
import 'package:bci/models/flight_booking_models/booking_model.dart';
import 'package:bci/models/flight_booking_models/flight_search_data_model.dart';
import 'package:bci/models/flight_booking_models/passenger_model.dart';
import 'package:bci/screens/members/flight_booking_screens/flight_booking_success_page.dart';
import 'package:bci/widgets/home_widgets/add_ssr_bottom_sheet.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FlaightOrderDetailsScreen extends StatefulWidget {
  Flight flight;
  FlightSearchDataModel flightSearchDataModel;
  String searchKey;
  String flightKey;

  FlaightOrderDetailsScreen(
      {super.key,
      required this.flight,
      required this.flightSearchDataModel,
      required this.flightKey,
      required this.searchKey});

  @override
  State<FlaightOrderDetailsScreen> createState() =>
      _FlaightOrderDetailsScreenState();
}

class _FlaightOrderDetailsScreenState extends State<FlaightOrderDetailsScreen> {
  int index = 1;
  var searchController = TextEditingController();
  var numberController = TextEditingController();
  var cardnameController = TextEditingController();
  var expiredateController = TextEditingController();

  final profileController = Get.find<ProfileController>();
  final flightsController = Get.find<FlightsController>();

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var ageController = TextEditingController();

  setDefault() {
    firstNameController.clear();
    lastNameController.clear();
    ageController.clear();
    flightsController.isMaleOrFemale(2);
    flightsController.getFightSSRDetails(
        flightKey: widget.flightKey,
        searchKey: widget.searchKey,
        fairId: widget.flight.fares.first.fareId);
  }

  @override
  void initState() {
    super.initState();
    setDefault();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: ListView(children: [
        Column(children: [
          Container(
            height: 140,
            width: MediaQuery.of(context).size.width,
            color: kblue,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child:
                              Image.asset('assets/images/parflaightback.png')),
                      Text(
                        'Order Details',
                        style: TextStyle(fontSize: 20, color: kwhite),
                      )
                    ],
                  ),
                  ksizedbox30,
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          widget.flightSearchDataModel.fromIata,
                          style: TextStyle(color: kwhite),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset(
                          'assets/images/pardoubleflaight.png',
                          color: kwhite,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text(
                          widget.flightSearchDataModel.toIata,
                          style: TextStyle(color: kwhite),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
            child: Container(
              height: 330,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                    height: 210,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: kwhite,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: const Offset(0.0, 0.75),
                              blurRadius: 10,
                              color: kgrey),
                        ],
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30, top: 19),
                              child: Text(
                                'From',
                                style: TextStyle(
                                    fontSize: 20.5,
                                    color: kblue,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 120, top: 20),
                              child: Text(
                                'To',
                                style: TextStyle(
                                    color: kblue,
                                    fontSize: 20.5,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 27, top: 20),
                              child: Text(
                                widget.flightSearchDataModel.fromIata,
                                style: TextStyle(fontSize: 15, color: kblue),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 148, top: 20),
                              child: Text(
                                widget.flightSearchDataModel.toIata,
                                style: TextStyle(fontSize: 15, color: kblue),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 27, top: 20),
                              child: Container(
                                width: 115,
                                child: Text(
                                  widget.flightSearchDataModel.fromName,
                                  style: TextStyle(fontSize: 15, color: kblue),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 60, top: 20),
                              child: Container(
                                width: 150,
                                child: Text(
                                  widget.flightSearchDataModel.toName,
                                  style: TextStyle(fontSize: 15, color: kblue),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 27, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Terminal',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: kblue,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    widget.flight.segments.first
                                        .destinationTerminal,
                                    style:
                                        TextStyle(fontSize: 15, color: kblue),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 115, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gate',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: kblue,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "",
                                    style:
                                        TextStyle(fontSize: 15, color: kblue),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     Padding(
                        //       padding: const EdgeInsets.only(
                        //           left: 27, top: 30),
                        //       child: Text(
                        //         'Seat \n\n24H',
                        //         style: TextStyle(
                        //             fontSize: 15, color: kblue),
                        //       ),
                        //     ),
                        //     Padding(
                        //       padding: const EdgeInsets.only(
                        //           left: 140, top: 30),
                        //       child: Text(
                        //         'Boarding \n\n14:54',
                        //         style: TextStyle(
                        //             fontSize: 15, color: kblue),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 27, top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: kblue,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    formatDate(
                                        widget
                                            .flightSearchDataModel.depatureDate,
                                        [dd, "-", mm, "-", yyyy]),
                                    style:
                                        TextStyle(fontSize: 15, color: kblue),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 100, top: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Flight',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: kblue,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${widget.flight.segments.first.airlineCode} ${widget.flight.segments.first.flightNumber}",
                                    style:
                                        TextStyle(fontSize: 15, color: kblue),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (index == 1)
            GetBuilder<FlightsController>(builder: (_) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kwhite,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                offset: const Offset(0.0, 0.75),
                                blurRadius: 5,
                                color: kgrey)
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Contact Details",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: kblue,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  profileController.profileData.first.email,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              children: [
                                const Text(
                                  '(+91)',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  ' ${profileController.profileData.first.mobile}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ksizedbox20
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  if (flightsController.passengersDetailsList.length !=
                      flightsController.adultsCount.value)
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                _addNewAdult(context);
                              },
                              child: Text("+ Add passenger".toUpperCase())),
                        ],
                      ),
                    ),
                  for (int i = 0;
                      i < flightsController.passengersDetailsList.length;
                      i++)
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: const Offset(0.0, 0.75),
                                      blurRadius: 5,
                                      color: kgrey)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 10),
                                  child: Text(
                                    "${flightsController.passengersDetailsList[i].firstName} ${flightsController.passengersDetailsList[i].lastName}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: kblue,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, top: 5, bottom: 10),
                                  child: Text(
                                    "${flightsController.passengersDetailsList[i].maleOrFemale == 0 ? "Male" : "Female"} (${flightsController.passengersDetailsList[i].age})",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: kblue,
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 15),
                                //   child: InkWell(
                                //     onTap: () {
                                //       addSsrDetails(context, index, size);
                                //     },
                                //     child: Text(
                                //       "+ Add Special Services",
                                //       style:
                                //           primaryFont.copyWith(color: kOrange),
                                //     ),
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 5,
                            child: InkWell(
                              onTap: () {
                                flightsController.passengersDetailsList
                                    .removeAt(i);
                                flightsController.update();
                              },
                              child: const Icon(
                                Icons.delete_outlined,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ksizedbox20,
                  InkWell(
                    onTap: () async {
                      // Get.to(()=> const FlightBookingSuccessPage());
                      // PaxDetails paxDetails = PaxDetails(
                      //     firstName: profileController.profileData.first.name,
                      //     gender: 0,
                      //     lastName: "t",
                      //     title: "Mr");

                      List<PaxDetails> listOfPaxDetailsList = [];

                      for (var i = 0;
                          i < flightsController.passengersDetailsList.length;
                          i++) {
                        PaxDetails paxDetails = PaxDetails(
                            firstName: flightsController
                                .passengersDetailsList[i].firstName,
                            gender: flightsController
                                .passengersDetailsList[i].maleOrFemale,
                            lastName: flightsController
                                .passengersDetailsList[i].lastName,
                            title: flightsController.passengersDetailsList[i]
                                        .maleOrFemale ==
                                    0
                                ? "Mr"
                                : "Mrs");
                        listOfPaxDetailsList.add(paxDetails);
                      }

                      // String flightKey =
                      //     await flightsController.getFlightRepricing(
                      //         flightSearchModel: widget.flightSearchDataModel,
                      //         flight: widget.flight,
                      //         searchKey: widget.searchKey,
                      //         mobileNumber:
                      //             profileController.profileData.first.mobile);
                      print(
                          "%%%%%%%%%%%<--> <-----------> Flight key <-----------> <-->%%%%%%%%%%%%%%%");
                      print(widget.flightKey);

                      if (listOfPaxDetailsList.length ==
                          flightsController.adultsCount.value) {
                        BookingModel bookingModel = BookingModel(
                            bookingRemark:
                                "${widget.flightSearchDataModel.fromIata} - ${widget.flightSearchDataModel.toIata}",
                            customerMobile:
                                profileController.profileData.first.mobile,
                            flightKey: widget.flightKey,
                            passengerEmail:
                                profileController.profileData.first.email,
                            passengerMobile:
                                profileController.profileData.first.mobile,
                            paxDetails: listOfPaxDetailsList,
                            bookingSsrDetails: [],
                            searchKey: widget.searchKey);

                        // flightsController.createBooking(
                        //     amount: widget.flight.fares.first.fareDetails.first
                        //         .totalAmount
                        //         .toDouble(),
                        //     bookingModel: bookingModel,
                        //     refernceID: "5656");

                        flightsController.initiatePayment(
                            amount: widget.flight.fares.first.fareDetails.first
                                    .totalAmount
                                    .toDouble() *
                                listOfPaxDetailsList.length,
                            bookingModel: bookingModel);
                      } else {
                        Get.rawSnackbar(
                            message: "Add passanger to Continue booking",
                            backgroundColor: Colors.red);
                      }

                      // flightsController.initiatePayment(
                      //     amount: widget
                      //         .flight.fares.first.fareDetails.first.totalAmount
                      //         .toDouble(),
                      //     bookingModel: bookingModel);
                      // flightsController.payUseingEaseBuzzSubs(
                      //     id: 0,
                      //     amount: widget
                      //         .flight.fares.first.fareDetails.first.totalAmount
                      //         .toString(),
                      //     customerName:
                      //         profileController.profileData.first.name.trim().split(" ").first,
                      //     email: profileController.profileData.first.email,
                      //     phone: profileController.profileData.first.mobile,
                      //     bookingModel: bookingModel);

                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return Dialog(
                      //         child: Container(
                      //           height: MediaQuery.of(context).size.width * 0.9,
                      //           width: MediaQuery.of(context).size.width,
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             children: [
                      //               Padding(
                      //                 padding: const EdgeInsets.only(top: 60),
                      //                 child: Image.asset(
                      //                     'assets/images/ordercomplete.png'),
                      //               ),
                      //               const Padding(
                      //                 padding: const EdgeInsets.only(top: 10),
                      //                 child: Text(
                      //                   'Successful!',
                      //                   style: TextStyle(
                      //                       fontSize: 20, color: Colors.green),
                      //                 ),
                      //               ),
                      //               ksizedbox20,
                      //               const Padding(
                      //                 padding: EdgeInsets.only(left: 20),
                      //                 child: Text(
                      //                     'Your flight booking is successfull'
                      //                     ''),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [kyellow, korange]),
                          borderRadius: BorderRadius.circular(15)),
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Center(
                        child: Text(
                          'Complete',
                          style: TextStyle(fontSize: 18, color: kwhite),
                        ),
                      ),
                    ),
                  ),
                  ksizedbox20,
                ],
              );
            }),
          if (index == 2)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: kwhite,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: const Offset(0.0, 0.75),
                              blurRadius: 10,
                              color: kwhite)
                        ],
                        border: Border.all(
                          color: kwhite,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: kgrey,
                              ),
                              suffixIcon: Icon(
                                Icons.expand_more,
                                color: kgrey,
                              ),
                              hintText: 'Your Credit Cards',
                              hintStyle: const TextStyle(fontSize: 16),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kwhite),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: kwhite,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 5,
                              color: kgrey)
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 10, left: 10),
                          child: Container(
                            height: 220,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/ordercontainer.png',
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 30, left: 40),
                                  child: Row(
                                    children: [
                                      Text(
                                        'BlaBla Card',
                                        style: TextStyle(
                                            color: kwhite, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 40),
                                  child: Row(
                                    children: [
                                      Text(
                                        '3384 4003 4885 2334',
                                        style: TextStyle(
                                            fontSize: 18, color: kwhite),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 60, top: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'CARD HOLDER',
                                        style: TextStyle(
                                            color: kwhite, fontSize: 12),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          'EXP DATE',
                                          style: TextStyle(
                                              color: kwhite, fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 65, top: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Bugra Dere',
                                        style: TextStyle(
                                            color: kwhite, fontSize: 18),
                                      ),
                                      Text(
                                        '19/05',
                                        style: TextStyle(
                                            color: kwhite, fontSize: 18),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 15),
                          child: TextField(
                            controller: numberController,
                            decoration: InputDecoration(
                                hintText: '3384 4003 4885 2334'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: TextField(
                            controller: cardnameController,
                            decoration:
                                InputDecoration(hintText: 'Card Holder'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: TextField(
                            controller: expiredateController,
                            decoration:
                                InputDecoration(hintText: 'Expire Date'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ksizedbox20,
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              height: MediaQuery.of(context).size.width * 0.9,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 60),
                                    child: Image.asset(
                                        'assets/images/ordercomplete.png'),
                                  ),
                                  const Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Successful!',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.green),
                                    ),
                                  ),
                                  ksizedbox20,
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                        'Lorem Ipsum has been the industry'
                                        's \nstandard dummy text ever since the 1500s'),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [kyellow, korange]),
                        borderRadius: BorderRadius.circular(15)),
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Center(
                      child: Text(
                        'Complete',
                        style: TextStyle(fontSize: 18, color: kwhite),
                      ),
                    ),
                  ),
                ),
                ksizedbox30
              ],
            ),
        ]),
      ])),
    );
  }

  Future<void> _addNewAdult(BuildContext context) {
    firstNameController.clear();
    lastNameController.clear();
    ageController.clear();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Details"),
          content: Container(
            height: 270,
            width: 500,
            child: Column(
              children: [
                TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                      hintText: "First Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: kblue))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                      hintText: "Last Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: kblue))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Age",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: kblue))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Container(
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              flightsController.isMaleOrFemale(0);
                            },
                            child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: flightsController
                                                .isMaleOrFemale.value ==
                                            0
                                        ? kblue
                                        : kwhite,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: kblue)),
                                alignment: Alignment.center,
                                child: Text(
                                  "Male",
                                  style: TextStyle(
                                      color: flightsController
                                                  .isMaleOrFemale.value ==
                                              0
                                          ? kwhite
                                          : kblue),
                                )),
                          ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              flightsController.isMaleOrFemale(1);
                            },
                            child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: flightsController
                                                .isMaleOrFemale.value ==
                                            1
                                        ? kblue
                                        : kwhite,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: kblue)),
                                alignment: Alignment.center,
                                child: Text(
                                  "Female",
                                  style: TextStyle(
                                      color: flightsController
                                                  .isMaleOrFemale.value ==
                                              1
                                          ? kwhite
                                          : kblue),
                                )),
                          ),
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Add'),
              onPressed: () {
                if (ageController.text.isNotEmpty &&
                    firstNameController.text.isNotEmpty &&
                    lastNameController.text.isNotEmpty &&
                    flightsController.isMaleOrFemale.value != 2) {
                  PassengerDetail passengerDetail = PassengerDetail(
                      age: int.parse(ageController.text),
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      maleOrFemale: flightsController.isMaleOrFemale.value,
                      bookingSsrDetails: []);

                  flightsController.passengersDetailsList.add(passengerDetail);
                  flightsController.update();

                  Navigator.of(context).pop();
                } else {
                  Get.snackbar("Please Fill all the fields", "",
                      backgroundColor: Colors.red,
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
