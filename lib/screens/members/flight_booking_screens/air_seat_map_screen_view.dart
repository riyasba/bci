import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/models/flight_booking_models/air_search_model.dart';
import 'package:bci/models/flight_booking_models/flight_search_data_model.dart';
import 'package:bci/screens/members/flight_booking_screens/plane_details_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AirSeatMapScreenView extends StatefulWidget {
  String searchKey;
  String flightKey;
  dynamic paxDetails;
  Flight flight;

  FlightSearchDataModel flightSearchDataModel;

  AirSeatMapScreenView({
    super.key,
    required this.searchKey,
    required this.flightKey,
    required this.paxDetails,
    required this.flight,
    required this.flightSearchDataModel,
  });

  @override
  State<AirSeatMapScreenView> createState() => _AirSeatMapScreenViewState();
}

class _AirSeatMapScreenViewState extends State<AirSeatMapScreenView> {
  int index = 333;
  final flightController = Get.find<FlightsController>();

  Map<String, int> seatPosition = {"x": 1010, "y": 009};

  List<Map<String, int>> seatSelectedList = [];
  List<Map<String, int>> seatSelectedRightList = [];

  @override
  void initState() {
    super.initState();
  }

  bool checkContaines({required int i, required int j}) {
    Map<String, int> seatToFind = {"x": i, "y": j};
    bool isSeatSelected = seatSelectedList.any(
        (seat) => seat["x"] == seatToFind["x"] && seat["y"] == seatToFind["y"]);
    return isSeatSelected;
  }

  bool checkContainesRight({required int i, required int j}) {
    Map<String, int> seatToFind = {"x": i, "y": j};
    bool isSeatSelected = seatSelectedRightList.any(
        (seat) => seat["x"] == seatToFind["x"] && seat["y"] == seatToFind["y"]);
    return isSeatSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblue,
      body: Builder(builder: (context) {
        return GetBuilder<FlightsController>(builder: (_) {
          return ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      Text(
                        "Plane Details",
                        style: primaryFont.copyWith(
                            color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              for (int i = 0; i < flightController.airSeatMapsList.length; i++)
                Padding(
                  padding: EdgeInsets.only(
                      bottom: i == 6
                          ? 30
                          : i == 12
                              ? 30
                              : 10,
                      top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          for (int j = 0;
                              j <
                                  flightController.airSeatMapsList[i]
                                          .seatDetails.length /
                                      2;
                              j++)
                            checkContaines(i: i, j: j)
                                ? InkWell(
                                    onTap: () {
                                      Map<String, int> seatToFind = {
                                        "x": i,
                                        "y": j
                                      };

                                      for (var seat in seatSelectedList) {
                                        if (seat["x"] == seatToFind["x"] &&
                                            seat["y"] == seatToFind["y"]) {
                                          setState(() {
                                            seatSelectedList.remove(seat);
                                          });
                                          break; // Assuming you want to remove only one instance if it exists
                                        }
                                      }
                                    },
                                    child: SvgPicture.asset(
                                        "assets/images/flight_booking/flight_seat (2).svg"),
                                  )
                                : InkWell(
                                    onTap: () {
                                      Map<String, int> seatToFind = {
                                        "x": i,
                                        "y": j
                                      };
                                      setState(() {
                                        // index = i;
                                        seatSelectedList.add(seatToFind);
                                      });
                                    },
                                    child: SvgPicture.asset(
                                        "assets/images/flight_booking/flight_seat (1).svg"),
                                  ),
                          // const SizedBox(
                          //   width: 3,
                          // ),
                          // SvgPicture.asset(
                          //     "assets/images/flight_booking/flight_seat (1).svg"),
                          // const SizedBox(
                          //   width: 3,
                          // ),
                          // SvgPicture.asset(
                          //     "assets/images/flight_booking/flight_seat (1).svg"),
                        ],
                      ),
                      Row(
                        children: [
                          for (int j = flightController
                                      .airSeatMapsList[i].seatDetails.length ~/
                                  2;
                              j <
                                  flightController.airSeatMapsList[i]
                                          .seatDetails.length /
                                      2;
                              j++)
                            checkContainesRight(i: i, j: j)
                                ? InkWell(
                                    onTap: () {
                                      Map<String, int> seatToFind = {
                                        "x": i,
                                        "y": j
                                      };

                                      for (var seat in seatSelectedRightList) {
                                        if (seat["x"] == seatToFind["x"] &&
                                            seat["y"] == seatToFind["y"]) {
                                          setState(() {
                                            seatSelectedRightList.remove(seat);
                                          });
                                          break; // Assuming you want to remove only one instance if it exists
                                        }
                                      }
                                    },
                                    child: SvgPicture.asset(
                                        "assets/images/flight_booking/flight_seat (2).svg"),
                                  )
                                : InkWell(
                                    onTap: () {
                                      Map<String, int> seatToFind = {
                                        "x": i,
                                        "y": j
                                      };
                                      setState(() {
                                        // index = i;
                                        seatSelectedRightList.add(seatToFind);
                                      });
                                    },
                                    child: SvgPicture.asset(
                                        "assets/images/flight_booking/flight_seat (1).svg"),
                                  ),
                        ],
                      ),
                    ],
                  ),
                )
            ],
          );
        });
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: InkWell(
          onTap: () {
            Get.to(() => PlaneDetailsScreen(
                  flight: widget.flight,
                  flightSearchDataModel: widget.flightSearchDataModel,
                  seachKey: widget.searchKey,
                  flightKey: widget.flightKey,
                ));
          },
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [kyellow, korange]),
                borderRadius: BorderRadius.circular(15)),
            height: 45,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Center(
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 18, color: kwhite),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
