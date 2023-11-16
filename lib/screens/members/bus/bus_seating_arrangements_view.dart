import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/bus_controllers.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/bus_booking_models/bus_contact_details_model.dart';
import 'package:bci/models/bus_booking_models/search_bus_model.dart';
import 'package:bci/screens/members/bus/bus_contact_details.dart';
import 'package:bci/screens/members/bus/bus_payment_screen.dart';
import 'package:bci/screens/members/bus/ticket_details_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class BusDynamicSeatsScreen2 extends StatefulWidget {
  Bus busData;
  String boardingId;
  String dropingId;
  String searchkey;

  BusDynamicSeatsScreen2({
    super.key,
    required this.busData,
    required this.boardingId,
    required this.dropingId,
    required this.searchkey,
  });

  @override
  State<BusDynamicSeatsScreen2> createState() => _BusSeatsScreenState();
}

class _BusSeatsScreenState extends State<BusDynamicSeatsScreen2> {
  final busController = Get.find<BusController>();
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.getProfile();
    busController.busSeat(
        boardingId: widget.boardingId,
        droppingId: widget.dropingId,
        busData: widget.busData,
        searchKey: widget.searchkey);
  }

  List<String> seatIds = [];
  List<BusContactDetailsModel> busContactDetailsModel = [];

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
                      width: size.width,
                      color: kblue,
                      child: Column(
                        children: [
                          AppBar(
                            backgroundColor: kblue,
                            elevation: 0,
                            leading: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: kwhite,
                                )),
                            title: Text(
                              '${widget.busData.fromCity} - ${widget.busData.toCity}',
                              style: TextStyle(color: kwhite, fontSize: 20),
                            ),
                            centerTitle: true,
                          ),
                          Text(
                            widget.busData.busType,
                            style: TextStyle(color: kwhite, fontSize: 15),
                          ),
                        ],
                      )),
                ),
              ),
              Positioned(
                top: 139,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: kwhite,
                        boxShadow: [BoxShadow(color: kgrey, blurRadius: 2)],
                        borderRadius: BorderRadius.circular(3)),
                    child: Center(
                      child: Text(
                        'Bus Seats',
                        style: TextStyle(color: kOrange, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
      body: GetBuilder<BusController>(builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Container(
                height: 500,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    if (busController.upperSeatsList.isNotEmpty)
                      Column(
                        children: [
                          Text(
                            "Upper birth",
                            style: primaryFont.copyWith(fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              width: 180,
                              height: 450,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          for (var seats
                                              in busController.upperSeatsList)
                                            seats.isEmpty
                                                ? const SizedBox(
                                                    height: 10,
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      for (var seat in seats)
                                                        InkWell(
                                                          onTap: () {
                                                            if (seat.bookable ) {
                                                              if (seat.isSelect ==
                                                                  true) {
                                                                seat.isSelect =
                                                                    false;
                                                                setState(() {
                                                                  seatIds.remove(
                                                                      seat.seatNumber);

                                                                  BusContactDetailsModel busContactDetailsModeldata = BusContactDetailsModel(
                                                                      ageController:
                                                                          TextEditingController(),
                                                                      gender:
                                                                          "",
                                                                      nameController:
                                                                          TextEditingController(),
                                                                      seats: seat
                                                                          .seatNumber);

                                                                  busContactDetailsModel.removeWhere(
                                                                      (element) =>
                                                                          element
                                                                              .seats ==
                                                                          seat.seatNumber);
                                                                });

                                                                double tempAmount = busController
                                                                        .totalAmount
                                                                        .value -
                                                                    seat.fareMaster
                                                                        .totalAmount;

                                                                busController
                                                                    .totalAmount(
                                                                        tempAmount);

                                                                busController
                                                                    .update();
                                                              } else {
                                                                if(seat.bookable && seatIds.length <6 ){
                                                                  seat.isSelect =
                                                                    true;
                                                                setState(() {
                                                                  seatIds.add(seat
                                                                      .seatNumber);

                                                                  BusContactDetailsModel busContactDetailsModeldata = BusContactDetailsModel(
                                                                      ageController:
                                                                          TextEditingController(),
                                                                      gender:
                                                                          "",
                                                                      nameController:
                                                                          TextEditingController(),
                                                                      seats: seat
                                                                          .seatNumber);

                                                                  busContactDetailsModel
                                                                      .add(
                                                                          busContactDetailsModeldata);
                                                                });

                                                                double tempAmount = busController
                                                                        .totalAmount
                                                                        .value +
                                                                    seat.fareMaster
                                                                        .totalAmount;

                                                                busController
                                                                    .totalAmount(
                                                                        tempAmount);

                                                                busController
                                                                    .update();
  
                                                                } else {
                                                                   Get.rawSnackbar(
                                                                      message: "Maximum 6 seats allowed per passenger",
                                                                      backgroundColor: const Color.fromARGB(255, 141, 168, 181));
                                                                  }
                                                              }
                                                            } 
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 4),
                                                            child: seat.length ==
                                                                    "2"
                                                                ? Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            13),
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/sleeper.png",
                                                                      width: 45,
                                                                      color: seat
                                                                              .ladiesSeat
                                                                          ? Colors
                                                                              .pink
                                                                          : seat.isSelect
                                                                              ? Colors.green
                                                                              : seat.bookable
                                                                                  ? Colors.black
                                                                                  : Colors.grey.withOpacity(0.5),
                                                                    ),
                                                                  )
                                                                : seat.width ==
                                                                        "2"
                                                                    ? Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 10),
                                                                        child: Image
                                                                            .asset(
                                                                          "assets/images/sleeper2.png",
                                                                          width:
                                                                              45,
                                                                          color: seat.ladiesSeat
                                                                              ? Colors.pink
                                                                              : seat.isSelect
                                                                                  ? Colors.green
                                                                                  : seat.bookable
                                                                                      ? Colors.black
                                                                                      : Colors.grey.withOpacity(0.5),
                                                                        ),
                                                                      )
                                                                    : Image
                                                                        .asset(
                                                                        "assets/images/seater.png",
                                                                        color: seat.ladiesSeat
                                                                            ? Colors.pink
                                                                            : seat.isSelect
                                                                                ? Colors.green
                                                                                : seat.bookable
                                                                                    ? Colors.black
                                                                                    : Colors.grey.withOpacity(0.5),
                                                                        height:
                                                                            26,
                                                                      ),
                                                          ),
                                                        ),
                                                    ],
                                                  )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          "Lower birth",
                          style: primaryFont.copyWith(fontSize: 12),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 180,
                          height: 450,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.grey, width: 0.5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (var seats
                                          in busController.lowerSeatsList)
                                        seats.isEmpty
                                            ? const SizedBox(
                                                height: 10,
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  for (var seat in seats)
                                                    InkWell(
                                                      onTap: () {
                                                        // print(seat.seatNumber);
                                                        if (seat.bookable) {
                                                          if (seat.isSelect ==
                                                              true) {
                                                            seat.isSelect =
                                                                false;
                                                            setState(() {
                                                              seatIds.remove(seat
                                                                  .seatNumber);

                                                              BusContactDetailsModel
                                                                  busContactDetailsModeldata =
                                                                  BusContactDetailsModel(
                                                                      ageController:
                                                                          TextEditingController(),
                                                                      gender:
                                                                          "",
                                                                      nameController:
                                                                          TextEditingController(),
                                                                      seats: seat
                                                                          .seatNumber);

                                                              busContactDetailsModel
                                                                  .removeWhere((element) =>
                                                                      element
                                                                          .seats ==
                                                                      seat.seatNumber);
                                                            });

                                                            double tempAmount =
                                                                busController
                                                                        .totalAmount
                                                                        .value -
                                                                    seat.fareMaster
                                                                        .totalAmount;

                                                            busController
                                                                .totalAmount(
                                                                    tempAmount);

                                                            busController
                                                                .update();
                                                          } else {
                                                            if(seat.bookable && seatIds.length <6){
                                                              seat.isSelect =
                                                                true;
                                                            setState(() {
                                                              seatIds.add(seat
                                                                  .seatNumber);

                                                              BusContactDetailsModel
                                                                  busContactDetailsModeldata =
                                                                  BusContactDetailsModel(
                                                                      ageController:
                                                                          TextEditingController(),
                                                                      gender:
                                                                          "",
                                                                      nameController:
                                                                          TextEditingController(),
                                                                      seats: seat
                                                                          .seatNumber);

                                                              busContactDetailsModel
                                                                  .add(
                                                                      busContactDetailsModeldata);
                                                            });

                                                            double tempAmount =
                                                                busController
                                                                        .totalAmount
                                                                        .value +
                                                                    seat.fareMaster
                                                                        .totalAmount;

                                                            busController
                                                                .totalAmount(
                                                                    tempAmount);

                                                            busController
                                                                .update();
                            
                                                            } else {
                                                              Get.rawSnackbar(
                                                               message: "Maximum 6 seats allowed per passenger",
                                                               backgroundColor: const Color.fromARGB(255, 141, 168, 181));
                                                            }
                                                            
                                                          }
                                                        } 
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 4),
                                                        child:
                                                            seat.length == "2"
                                                                ? Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            13),
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/sleeper.png",
                                                                      width: 45,
                                                                      color: seat
                                                                              .ladiesSeat
                                                                          ? Colors
                                                                              .pink
                                                                          : seat.isSelect
                                                                              ? Colors.green
                                                                              : seat.bookable
                                                                                  ? Colors.black
                                                                                  : Colors.grey.withOpacity(0.5),
                                                                    ),
                                                                  )
                                                                : seat.width ==
                                                                        "2"
                                                                    ? Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 10),
                                                                        child: Image
                                                                            .asset(
                                                                          "assets/images/sleeper2.png",
                                                                          width:
                                                                              36,
                                                                          color: seat.ladiesSeat
                                                                              ? Colors.pink
                                                                              : seat.isSelect
                                                                                  ? Colors.green
                                                                                  : seat.bookable
                                                                                      ? Colors.black
                                                                                      : Colors.grey.withOpacity(0.5),
                                                                        ),
                                                                      )
                                                                    : Image
                                                                        .asset(
                                                                        "assets/images/seater.png",
                                                                        color: seat.ladiesSeat
                                                                            ? Colors.pink
                                                                            : seat.isSelect
                                                                                ? Colors.green
                                                                                : seat.bookable
                                                                                    ? Colors.black
                                                                                    : Colors.grey.withOpacity(0.5),
                                                                        height:
                                                                            26,
                                                                      ),
                                                      ),
                                                    ),
                                                ],
                                              )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
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
                  Text(
                    'Seat No  :  ',
                    style: TextStyle(color: kgrey, fontSize: 15),
                  ),
                  for (int i = 0; i < seatIds.length; i++)
                    Text(
                      '${seatIds[i]},',
                      style: TextStyle(color: kgrey, fontSize: 15),
                    ),
                ],
              ),
            ),
            Row(
              children: [
                Obx(
                  () => Text(
                    '₹${busController.totalAmount.value}',
                    style: TextStyle(
                        color: kblue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                kwidth10,
                kwidth10,
                InkWell(
                  onTap: () {
                    if (seatIds.isEmpty) {
                      Get.rawSnackbar(
                          message: "Please select any seats to continue",
                          backgroundColor: Colors.red);
                    } else {
                      Get.to(BusContactDetails(
                        boardingId: widget.boardingId,
                        busData: widget.busData,
                        dropingId: widget.dropingId,
                        searchkey: widget.searchkey,
                        seatIds: seatIds,
                        cusName: profileController.profileData.isEmpty
                            ? "test"
                            : profileController.profileData.first.name,
                        busContactmodel: busContactDetailsModel,
                        amount:
                            busController.totalAmount.value.toStringAsFixed(2),
                      ));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [kyellow, kOrange],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'PAY',
                        style: TextStyle(color: kwhite, fontSize: 15),
                      ),
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
