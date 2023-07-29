import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/bus_controllers.dart';
import 'package:bci/models/bus_booking_models/search_bus_model.dart';
import 'package:bci/screens/members/bus/bus_contact_details.dart';
import 'package:bci/screens/members/bus/bus_payment_screen.dart';
import 'package:bci/screens/members/bus/ticket_details_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusSeatsScreen extends StatefulWidget {
  Bus busData;
  String boardingId;
  String dropingId;
  String searchkey;

  BusSeatsScreen({
    super.key,
    required this.busData,
    required this.boardingId,
    required this.dropingId,
    required this.searchkey,
  });

  @override
  State<BusSeatsScreen> createState() => _BusSeatsScreenState();
}

class _BusSeatsScreenState extends State<BusSeatsScreen> {
  final busController = Get.find<BusController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    busController.busSeat(
        boardingId: widget.boardingId,
        droppingId: widget.dropingId,
        busData: widget.busData,
        searchKey: widget.searchkey);
  }

  List<String> seatIds = [];

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
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 200,
                    height: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 30,
                            child: ListView.builder(
                                itemCount: busController.seatMap.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: InkWell(
                                      onTap: () {
                                        if (busController
                                                .seatMap[index].isSelect ==
                                            true) {
                                          busController
                                              .seatMap[index].isSelect = false;
                                          setState(() {
                                            seatIds.remove(busController
                                                .seatMap[index].seatNumber);
                                          });

                                          double tempAmount =
                                              busController.totalAmount.value -
                                                  busController.seatMap[index]
                                                      .fareMaster.totalAmount;

                                          busController.totalAmount(tempAmount);

                                          busController.update();
                                        } else {
                                          busController
                                              .seatMap[index].isSelect = true;
                                          setState(() {
                                            seatIds.add(busController
                                                .seatMap[index].seatNumber);
                                          });

                                          double tempAmount =
                                              busController.totalAmount.value +
                                                  busController.seatMap[index]
                                                      .fareMaster.totalAmount;

                                          busController.totalAmount(tempAmount);

                                          busController.update();
                                        }
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: busController.seatMap[index]
                                                        .isSelect ==
                                                    true
                                                ? kOrange
                                                : Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: Center(
                                          child: Text(busController
                                              .seatMap[index].seatNumber),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          ksizedbox10,
                          //
                          Container(
                            width: 70,
                            child: ListView.builder(
                              itemCount: busController.seatMap.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 5,
                                    left: 5,
                                  ),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 60,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          child: Center(
                                            child: Text(busController
                                                .seatMap[index].seatNumber),
                                          ),
                                        ),
                                      ),
                                      kwidth5,
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 60,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          child: Center(
                                            child: Text(busController
                                                .seatMap[index].seatNumber),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                       amount: busController.totalAmount.value.toStringAsFixed(2),
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
