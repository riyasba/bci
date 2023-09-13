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

class BusDynamicSeatsScreen extends StatefulWidget {
  Bus busData;
  String boardingId;
  String dropingId;
  String searchkey;

  BusDynamicSeatsScreen({
    super.key,
    required this.busData,
    required this.boardingId,
    required this.dropingId,
    required this.searchkey,
  });

  @override
  State<BusDynamicSeatsScreen> createState() => _BusSeatsScreenState();
}

class _BusSeatsScreenState extends State<BusDynamicSeatsScreen> {
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
                      width: 400,
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
              padding: const EdgeInsets.only(left: 10,),
              child: Container(
                height: 450,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      children: [
                        Text("Upper birth",style: primaryFont.copyWith(
                          fontSize: 12
                        ),),
                      const  SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 180,
                          height: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey, width: 0.5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: busController.seatMapList.length,
                                itemBuilder: (context, index1) {
                                  return Container(
                                    height: 40,
                                    child: ListView.builder(
                                        itemCount:
                                            busController.seatMapList[index1].length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return busController.seatMapList[index1]
                                                  [index]
                                              .zIndex == "1"? Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 5, right: index == 1 ? 7 : 2),
                                            child: busController
                                                    .seatMapList[index1][index]
                                                    .bookable == true
                                                ? InkWell(
                                                    onTap: () {
                                                      if (busController
                                                              .seatMapList[index1]
                                                                  [index]
                                                              .isSelect ==
                                                          true) {
                                                        busController
                                                            .seatMapList[index1]
                                                                [index]
                                                            .isSelect = false;
                                                        setState(() {
                                                          seatIds.remove(busController
                                                              .seatMapList[index1]
                                                                  [index]
                                                              .seatNumber);
              
                                                          BusContactDetailsModel
                                                              busContactDetailsModeldata =
                                                              BusContactDetailsModel(
                                                                  ageController:
                                                                      TextEditingController(),
                                                                  gender: "",
                                                                  nameController:
                                                                      TextEditingController(),
                                                                  seats: busController
                                                                      .seatMapList[
                                                                          index1]
                                                                          [index]
                                                                      .seatNumber);
              
                                                          busContactDetailsModel
                                                              .removeWhere((element) =>
                                                                  element.seats ==
                                                                  busController
                                                                      .seatMapList[
                                                                          index1]
                                                                          [index]
                                                                      .seatNumber);
                                                        });
              
                                                        double tempAmount =
                                                            busController.totalAmount
                                                                    .value -
                                                                busController
                                                                    .seatMapList[
                                                                        index1][index]
                                                                    .fareMaster
                                                                    .totalAmount;
              
                                                        busController
                                                            .totalAmount(tempAmount);
              
                                                        busController.update();
                                                      } else {
                                                        busController
                                                            .seatMapList[index1]
                                                                [index]
                                                            .isSelect = true;
                                                        setState(() {
                                                          seatIds.add(busController
                                                              .seatMapList[index1]
                                                                  [index]
                                                              .seatNumber);
              
                                                          BusContactDetailsModel
                                                              busContactDetailsModeldata =
                                                              BusContactDetailsModel(
                                                                  ageController:
                                                                      TextEditingController(),
                                                                  gender: "",
                                                                  nameController:
                                                                      TextEditingController(),
                                                                  seats: busController
                                                                      .seatMapList[
                                                                          index1]
                                                                          [index]
                                                                      .seatNumber);
              
                                                          busContactDetailsModel.add(
                                                              busContactDetailsModeldata);
                                                        });
              
                                                        double tempAmount =
                                                            busController.totalAmount
                                                                    .value +
                                                                busController
                                                                    .seatMapList[
                                                                        index1][index]
                                                                    .fareMaster
                                                                    .totalAmount;
              
                                                        busController
                                                            .totalAmount(tempAmount);
              
                                                        busController.update();
                                                      }
                                                    },
                                                    child: Container(
                                                      height: busController
                                                                      .seatMapList[
                                                                          index1]
                                                                          [index].length == "1" ? 60: 80,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          color: busController
                                                                      .seatMapList[
                                                                          index1]
                                                                          [index]
                                                                      .isSelect ==
                                                                  true
                                                              ? kOrange
                                                              : Colors.grey[200],
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  5),
                                                          border: Border.all(
                                                              color: Colors.grey)),
                                                      child: Center(
                                                        child: Text(busController
                                                            .seatMapList[index1]
                                                                [index]
                                                            .seatNumber),
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    height: 60,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        color:  Colors.red[200],
                                                        borderRadius:
                                                            BorderRadius.circular(5),
                                                        border: Border.all(
                                                            color: Colors.grey)),
                                                    child: Center(
                                                      child: Text(busController
                                                          .seatMapList[index1][index]
                                                          .seatNumber),
                                                    ),
                                                  ),
                                          ) : Container();
                                        }),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                   const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                         Text("Lower birth",style: primaryFont.copyWith(
                          fontSize: 12
                        ),),
                      const  SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 180,
                          height: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey, width: 0.5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: busController.seatMapList.length,
                                itemBuilder: (context, index1) {
                                  return Container(
                                    height: 40,
                                    child: ListView.builder(
                                        itemCount:
                                            busController.seatMapList[index1].length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return busController.seatMapList[index1]
                                                  [index]
                                              .zIndex == "0"? Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 5, right: index == 1 ? 7 : 2),
                                            child: busController
                                                        .seatMapList[index1][index]
                                                        .bookable ==
                                                    true
                                                ? InkWell(
                                                    onTap: () {
                                                      if (busController
                                                              .seatMapList[index1]
                                                                  [index]
                                                              .isSelect ==
                                                          true) {
                                                        busController
                                                            .seatMapList[index1]
                                                                [index]
                                                            .isSelect = false;
                                                        setState(() {
                                                          seatIds.remove(busController
                                                              .seatMapList[index1]
                                                                  [index]
                                                              .seatNumber);
              
                                                          BusContactDetailsModel
                                                              busContactDetailsModeldata =
                                                              BusContactDetailsModel(
                                                                  ageController:
                                                                      TextEditingController(),
                                                                  gender: "",
                                                                  nameController:
                                                                      TextEditingController(),
                                                                  seats: busController
                                                                      .seatMapList[
                                                                          index1]
                                                                          [index]
                                                                      .seatNumber);
              
                                                          busContactDetailsModel
                                                              .removeWhere((element) =>
                                                                  element.seats ==
                                                                  busController
                                                                      .seatMapList[
                                                                          index1]
                                                                          [index]
                                                                      .seatNumber);
                                                        });
              
                                                        double tempAmount =
                                                            busController.totalAmount
                                                                    .value -
                                                                busController
                                                                    .seatMapList[
                                                                        index1][index]
                                                                    .fareMaster
                                                                    .totalAmount;
              
                                                        busController
                                                            .totalAmount(tempAmount);
              
                                                        busController.update();
                                                      } else {
                                                        busController
                                                            .seatMapList[index1]
                                                                [index]
                                                            .isSelect = true;
                                                        setState(() {
                                                          seatIds.add(busController
                                                              .seatMapList[index1]
                                                                  [index]
                                                              .seatNumber);
              
                                                          BusContactDetailsModel
                                                              busContactDetailsModeldata =
                                                              BusContactDetailsModel(
                                                                  ageController:
                                                                      TextEditingController(),
                                                                  gender: "",
                                                                  nameController:
                                                                      TextEditingController(),
                                                                  seats: busController
                                                                      .seatMapList[
                                                                          index1]
                                                                          [index]
                                                                      .seatNumber);
              
                                                          busContactDetailsModel.add(
                                                              busContactDetailsModeldata);
                                                        });
              
                                                        double tempAmount =
                                                            busController.totalAmount
                                                                    .value +
                                                                busController
                                                                    .seatMapList[
                                                                        index1][index]
                                                                    .fareMaster
                                                                    .totalAmount;
              
                                                        busController
                                                            .totalAmount(tempAmount);
              
                                                        busController.update();
                                                      }
                                                    },
                                                    child: Container(
                                                      height: 60,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          color: busController
                                                                      .seatMapList[
                                                                          index1]
                                                                          [index]
                                                                      .isSelect ==
                                                                  true
                                                              ? kOrange
                                                              : Colors.grey[200],
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  5),
                                                          border: Border.all(
                                                              color: Colors.grey)),
                                                      child: Center(
                                                        child: Text(busController
                                                            .seatMapList[index1]
                                                                [index]
                                                            .seatNumber),
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    height: 60,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        color: Colors.red[200],
                                                        borderRadius:
                                                            BorderRadius.circular(5),
                                                        border: Border.all(
                                                            color: Colors.grey)),
                                                    child: Center(
                                                      child: Text(busController
                                                          .seatMapList[index1][index]
                                                          .seatNumber),
                                                    ),
                                                  ),
                                          ) : Container();
                                        }),
                                  );
                                }),
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
