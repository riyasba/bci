import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/models/bus_booking_models/search_bus_model.dart';
import 'package:bci/screens/members/bus/bus_seats_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusBoardingDetailsScreen extends StatefulWidget {
  Bus busData;
  String searcKey;
  BusBoardingDetailsScreen(
      {super.key, required this.busData, required this.searcKey});

  @override
  State<BusBoardingDetailsScreen> createState() =>
      _BusBoardingDetailsScreenState();
}

class _BusBoardingDetailsScreenState extends State<BusBoardingDetailsScreen> {
  List<String> placesList = [
    "Koyambedu",
    "Kolathur",
    "Adayar",
    "Chinnayan colony",
  ];

  var boardingId;
  var dropingId;

  bool isBordingOrDroping = true;

  int boardingIndex = 777;
  int dropingIndex = 777;

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
              child: Padding(
                padding: const EdgeInsets.only(bottom: 22, left: 15, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: kwhite,
                          ),
                        )),
                    Text(
                      'Bus Boarding ',
                      style: TextStyle(color: kwhite, fontSize: 20),
                    ),
                    Container()
                  ],
                ),
              ),
            ),
          )),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
                height: 50,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2, color: Colors.grey.withOpacity(0.5))
                    ],
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isBordingOrDroping = true;
                        });
                      },
                      child: Container(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Boarding",
                                style: primaryFont.copyWith(
                                  color: isBordingOrDroping ? kOrange : kgrey,
                                ),
                              ),
                              Container(
                                height: 5,
                                width: 100,
                                color: isBordingOrDroping ? kOrange : kwhite,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isBordingOrDroping = false;
                        });
                      },
                      child: Container(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Dropping",
                                style: primaryFont.copyWith(
                                  color: !isBordingOrDroping ? kOrange : kgrey,
                                ),
                              ),
                              Container(
                                height: 5,
                                width: 100,
                                color: !isBordingOrDroping ? kOrange : kwhite,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2, color: Colors.grey.withOpacity(0.5))
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: isBordingOrDroping
                    ? Column(
                        children: [
                          for (int i = 0;
                              i < widget.busData.boardingDetails.length;
                              i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    boardingId = widget
                                        .busData.boardingDetails[i].boardingId;
                                    boardingIndex = i;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: boardingIndex == i
                                                      ? korange
                                                      : Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: boardingIndex == i
                                                      ? kOrange
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: size.width * 0.4,
                                          child: Text(widget.busData
                                              .boardingDetails[i].boardingName),
                                        )
                                      ],
                                    ),
                                    Text(
                                      widget.busData.boardingDetails[i]
                                          .boardingTime,
                                      style: primaryFont.copyWith(
                                          color: Colors.black45),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      )
                    : Column(
                        children: [
                          for (int i = 0;
                              i < widget.busData.droppingDetails.length;
                              i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    dropingId = widget
                                        .busData.droppingDetails[i].droppingId;
                                    dropingIndex = i;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: dropingIndex == i
                                                      ? kOrange
                                                      : Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: dropingIndex == i
                                                      ? kOrange
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: size.width * 0.4,
                                          child: Text(widget.busData
                                              .droppingDetails[i].droppingName),
                                        )
                                      ],
                                    ),
                                    Text(
                                      widget.busData.droppingDetails[i]
                                          .droppingTime,
                                      style: primaryFont.copyWith(
                                          color: Colors.black45),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: InkWell(
          onTap: () {
            if (boardingId == null) {
              Get.rawSnackbar(
                  message: "Please select boarding place",
                  backgroundColor: Colors.red);
            } else if (dropingId == null) {
              Get.rawSnackbar(
                  message: "Please select droping place",
                  backgroundColor: Colors.red);
            } else {
              Get.to(() => BusSeatsScreen(
                    boardingId: boardingId,
                    busData: widget.busData,
                    dropingId: dropingId,
                    searchkey: widget.searcKey,
                  ));
            }
          },
          child: Container(
            height: 44,
            width: 250,
            decoration: BoxDecoration(
                color: kOrange,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: const Offset(0.0, 0.75),
                      blurRadius: 5,
                      color: kyellow)
                ],
                borderRadius: BorderRadius.circular(6)),
            child: Center(
                child: Text(
              'Continue',
              style: TextStyle(color: kwhite, fontSize: 12),
            )),
          ),
        ),
      ),
      
    );
  }
}
