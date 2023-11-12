import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/controllers/services_controller.dart';
import 'package:bci/models/time_slot_models.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeSlotScreen extends StatefulWidget {
  const TimeSlotScreen({super.key});

  @override
  State<TimeSlotScreen> createState() => _TimeSlotScreenState();
}

class _TimeSlotScreenState extends State<TimeSlotScreen> {
  int selectedIndex = 999;
  int sunday = 0;
  int monday = 0;
  int tuesday = 0;
  int wednesday = 0;
  int thursday = 0;
  int friday = 0;
  int saturday = 0;
  int allday = 0;

  final authController = Get.find<AuthController>();

  TimeOfDay selectedTime = TimeOfDay.now();

  final serviceController = Get.find<ServicesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                          onPressed: () {
                            serviceController.setDefaultSlots();
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: kwhite,
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 0, right: 20),
                      child: Text(
                        'Time Slots',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffF8F9FD),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      width: 20,
                    )
                  ],
                ),
              ),
            ),
          )),
      body: GetBuilder<ServicesController>(builder: (_) {
        return ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Select Day',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  if (serviceController.isExpand.value != 0) {
                    serviceController.isExpand(0);
                    serviceController.update();
                    if (serviceController.sunTimeSlot.isEmpty) {
                      TimeSlotModels timeSlotModels = TimeSlotModels(
                          fromTime: "--:--",
                          toTime: "--:--",
                          tempFromTime: "",
                          tempToTime: "");
                      serviceController.sunTimeSlot.add(timeSlotModels);
                      serviceController.update();
                    }
                  } else {
                    serviceController.isExpand(999);
                    serviceController.update();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Sunday",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: kblue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: kwhite,
                      )),
                    ),
                  ],
                ),
              ),
            ),
            if (serviceController.isExpand.value == 0)
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(blurRadius: 5.2, color: kgrey),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kblue,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () async {
                                final TimeOfDay? timeOfDay =
                                    await showTimePicker(
                                        context: context,
                                        initialTime: selectedTime,
                                        initialEntryMode:
                                            TimePickerEntryMode.dial);
                                if (timeOfDay != null) {
                                  setState(() {
                                    selectedTime = timeOfDay;
                                  });
                                  serviceController.sunTimeSlot[0].fromTime =
                                      timeOfDay.format(context).toString();
                                  serviceController
                                          .sunTimeSlot[0].tempFromTime =
                                      "${timeOfDay.hour}:${timeOfDay.minute}";
                                  serviceController.update();
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(serviceController
                                          .sunTimeSlot[0].fromTime),
                                      // Text("${selectedTime.hour}:${selectedTime.minute}"),
                                      Icon(
                                        Icons.history,
                                        color: kblue,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "To",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kblue,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final TimeOfDay? timeOfDay =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: selectedTime,
                                            initialEntryMode:
                                                TimePickerEntryMode.dial);
                                    if (timeOfDay != null) {
                                      setState(() {
                                        selectedTime = timeOfDay;
                                      });
                                      serviceController.sunTimeSlot[0].toTime =
                                          timeOfDay.format(context).toString();
                                      serviceController
                                              .sunTimeSlot[0].tempToTime =
                                          "${timeOfDay.hour}:${timeOfDay.minute}";
                                      serviceController.update();
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(serviceController
                                              .sunTimeSlot[0].toTime),
                                          Icon(
                                            Icons.history,
                                            color: kblue,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                InkWell(
                                  onTap: () {
                                    TimeSlotModels timeSlotModels =
                                        TimeSlotModels(
                                            fromTime: "--:--",
                                            toTime: "--:--",
                                            tempFromTime: "",
                                            tempToTime: "");
                                    serviceController.sunTimeSlot
                                        .add(timeSlotModels);
                                    serviceController.update();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: kblue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        color: kwhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (serviceController.sunTimeSlot.isNotEmpty &&
                serviceController.isExpand.value == 0)
              Column(
                children: [
                  for (int i = 1; i < serviceController.sunTimeSlot.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(blurRadius: 5.2, color: kgrey),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "From",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final TimeOfDay? timeOfDay =
                                          await showTimePicker(
                                              context: context,
                                              initialTime: selectedTime,
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial);
                                      if (timeOfDay != null) {
                                        setState(() {
                                          selectedTime = timeOfDay;
                                        });
                                        serviceController
                                                .sunTimeSlot[i].fromTime =
                                            timeOfDay
                                                .format(context)
                                                .toString();
                                        serviceController
                                                .sunTimeSlot[i].tempFromTime =
                                            "${timeOfDay.hour}:${timeOfDay.minute}";
                                        serviceController.update();
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(serviceController
                                                .sunTimeSlot[i].fromTime),
                                            Icon(
                                              Icons.history,
                                              color: kblue,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "To",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final TimeOfDay? timeOfDay =
                                              await showTimePicker(
                                                  context: context,
                                                  initialTime: selectedTime,
                                                  initialEntryMode:
                                                      TimePickerEntryMode.dial);
                                          if (timeOfDay != null) {
                                            setState(() {
                                              selectedTime = timeOfDay;
                                            });
                                            serviceController
                                                    .sunTimeSlot[i].toTime =
                                                timeOfDay
                                                    .format(context)
                                                    .toString();
                                            serviceController
                                                    .sunTimeSlot[i].tempToTime =
                                                "${timeOfDay.hour}:${timeOfDay.minute}";
                                            serviceController.update();
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(serviceController
                                                    .sunTimeSlot[i].toTime),
                                                Icon(
                                                  Icons.history,
                                                  color: kblue,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        onTap: () {
                                          serviceController.sunTimeSlot
                                              .removeAt(i);
                                          serviceController.update();
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            color: kblue,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.remove_circle_outline,
                                              color: kwhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  if (serviceController.isExpand.value != 1) {
                    serviceController.isExpand(1);
                    if (serviceController.monTimeSlot.isEmpty) {
                      TimeSlotModels timeSlotModels = TimeSlotModels(
                          fromTime: "--:--",
                          toTime: "--:--",
                          tempFromTime: "",
                          tempToTime: "");
                      serviceController.monTimeSlot.add(timeSlotModels);
                      serviceController.update();
                    }
                    serviceController.update();
                  } else {
                    serviceController.isExpand(999);
                    serviceController.update();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Monday",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: kblue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: kwhite,
                      )),
                    ),
                  ],
                ),
              ),
            ),
            if (serviceController.isExpand.value == 1)
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(blurRadius: 5.2, color: kgrey),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kblue,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () async {
                                final TimeOfDay? timeOfDay =
                                    await showTimePicker(
                                        context: context,
                                        initialTime: selectedTime,
                                        initialEntryMode:
                                            TimePickerEntryMode.dial);
                                if (timeOfDay != null) {
                                  setState(() {
                                    selectedTime = timeOfDay;
                                  });
                                  serviceController.monTimeSlot[0].fromTime =
                                      timeOfDay.format(context).toString();
                                  serviceController
                                          .monTimeSlot[0].tempFromTime =
                                      "${timeOfDay.hour}:${timeOfDay.minute}";
                                  serviceController.update();
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(serviceController
                                          .monTimeSlot[0].fromTime),
                                      Icon(
                                        Icons.history,
                                        color: kblue,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "To",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kblue,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final TimeOfDay? timeOfDay =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: selectedTime,
                                            initialEntryMode:
                                                TimePickerEntryMode.dial);
                                    if (timeOfDay != null) {
                                      setState(() {
                                        selectedTime = timeOfDay;
                                      });
                                      serviceController.monTimeSlot[0].toTime =
                                          timeOfDay.format(context).toString();
                                      serviceController
                                              .monTimeSlot[0].tempToTime =
                                          "${timeOfDay.hour}:${timeOfDay.minute}";
                                      serviceController.update();
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(serviceController
                                              .monTimeSlot[0].toTime),
                                          Icon(
                                            Icons.history,
                                            color: kblue,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                InkWell(
                                  onTap: () {
                                    TimeSlotModels timeSlotModels =
                                        TimeSlotModels(
                                            fromTime: "--:--",
                                            toTime: "--:--",
                                            tempFromTime: "",
                                            tempToTime: "");
                                    serviceController.monTimeSlot
                                        .add(timeSlotModels);
                                    serviceController.update();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: kblue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        color: kwhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (serviceController.monTimeSlot.isNotEmpty &&
                serviceController.isExpand.value == 1)
              Column(
                children: [
                  for (int i = 1; i < serviceController.monTimeSlot.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(blurRadius: 5.2, color: kgrey),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "From",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final TimeOfDay? timeOfDay =
                                          await showTimePicker(
                                              context: context,
                                              initialTime: selectedTime,
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial);
                                      if (timeOfDay != null) {
                                        setState(() {
                                          selectedTime = timeOfDay;
                                        });
                                        serviceController
                                                .monTimeSlot[i].fromTime =
                                            timeOfDay
                                                .format(context)
                                                .toString();

                                        serviceController
                                                .monTimeSlot[i].tempFromTime =
                                            "${timeOfDay.hour}:${timeOfDay.minute}";
                                        serviceController.update();
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(serviceController
                                                .monTimeSlot[i].fromTime),
                                            Icon(
                                              Icons.history,
                                              color: kblue,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "To",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final TimeOfDay? timeOfDay =
                                              await showTimePicker(
                                                  context: context,
                                                  initialTime: selectedTime,
                                                  initialEntryMode:
                                                      TimePickerEntryMode.dial);
                                          if (timeOfDay != null) {
                                            setState(() {
                                              selectedTime = timeOfDay;
                                            });
                                            serviceController
                                                    .monTimeSlot[i].toTime =
                                                timeOfDay
                                                    .format(context)
                                                    .toString();

                                            serviceController
                                                    .monTimeSlot[i].tempToTime =
                                                "${timeOfDay.hour}:${timeOfDay.minute}";
                                            serviceController.update();
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(serviceController
                                                    .monTimeSlot[i].toTime),
                                                Icon(
                                                  Icons.history,
                                                  color: kblue,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        onTap: () {
                                          serviceController.monTimeSlot
                                              .removeAt(i);
                                          serviceController.update();
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            color: kblue,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.remove_circle_outline,
                                              color: kwhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  if (serviceController.isExpand.value != 2) {
                    serviceController.isExpand(2);
                    if (serviceController.tueTimeSlot.isEmpty) {
                      TimeSlotModels timeSlotModels = TimeSlotModels(
                          fromTime: "--:--",
                          toTime: "--:--",
                          tempFromTime: "",
                          tempToTime: "");
                      serviceController.tueTimeSlot.add(timeSlotModels);
                      serviceController.update();
                    }
                    serviceController.update();
                  } else {
                    serviceController.isExpand(999);
                    serviceController.update();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tuesday",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: kblue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: kwhite,
                      )),
                    ),
                  ],
                ),
              ),
            ),
            if (serviceController.isExpand.value == 2)
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(blurRadius: 5.2, color: kgrey),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kblue,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () async {
                                final TimeOfDay? timeOfDay =
                                    await showTimePicker(
                                        context: context,
                                        initialTime: selectedTime,
                                        initialEntryMode:
                                            TimePickerEntryMode.dial);
                                if (timeOfDay != null) {
                                  setState(() {
                                    selectedTime = timeOfDay;
                                  });
                                  serviceController.tueTimeSlot[0].fromTime =
                                      timeOfDay.format(context).toString();

                                  serviceController
                                          .tueTimeSlot[0].tempFromTime =
                                      "${timeOfDay.hour}:${timeOfDay.minute}";
                                  serviceController.update();
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(serviceController
                                          .tueTimeSlot[0].fromTime),
                                      Icon(
                                        Icons.history,
                                        color: kblue,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "To",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kblue,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final TimeOfDay? timeOfDay =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: selectedTime,
                                            initialEntryMode:
                                                TimePickerEntryMode.dial);
                                    if (timeOfDay != null) {
                                      setState(() {
                                        selectedTime = timeOfDay;
                                      });
                                      serviceController.tueTimeSlot[0].toTime =
                                          timeOfDay.format(context).toString();
                                      serviceController
                                              .tueTimeSlot[0].tempToTime =
                                          "${timeOfDay.hour}:${timeOfDay.minute}";
                                      serviceController.update();
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(serviceController
                                              .tueTimeSlot[0].toTime),
                                          Icon(
                                            Icons.history,
                                            color: kblue,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                InkWell(
                                  onTap: () {
                                    TimeSlotModels timeSlotModels =
                                        TimeSlotModels(
                                            fromTime: "--:--",
                                            toTime: "--:--",
                                            tempFromTime: "",
                                            tempToTime: "");
                                    serviceController.tueTimeSlot
                                        .add(timeSlotModels);
                                    serviceController.update();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: kblue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        color: kwhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (serviceController.tueTimeSlot.isNotEmpty &&
                serviceController.isExpand.value == 2)
              Column(
                children: [
                  for (int i = 1; i < serviceController.tueTimeSlot.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(blurRadius: 5.2, color: kgrey),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "From",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final TimeOfDay? timeOfDay =
                                          await showTimePicker(
                                              context: context,
                                              initialTime: selectedTime,
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial);
                                      if (timeOfDay != null) {
                                        setState(() {
                                          selectedTime = timeOfDay;
                                        });
                                        serviceController
                                                .tueTimeSlot[i].fromTime =
                                            timeOfDay
                                                .format(context)
                                                .toString();

                                        serviceController
                                                .tueTimeSlot[i].tempFromTime =
                                            "${timeOfDay.hour}:${timeOfDay.minute}";
                                        serviceController.update();
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(serviceController
                                                .tueTimeSlot[i].fromTime),
                                            Icon(
                                              Icons.history,
                                              color: kblue,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "To",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final TimeOfDay? timeOfDay =
                                              await showTimePicker(
                                                  context: context,
                                                  initialTime: selectedTime,
                                                  initialEntryMode:
                                                      TimePickerEntryMode.dial);
                                          if (timeOfDay != null) {
                                            setState(() {
                                              selectedTime = timeOfDay;
                                            });
                                            serviceController
                                                    .tueTimeSlot[i].toTime =
                                                timeOfDay
                                                    .format(context)
                                                    .toString();
                                            serviceController
                                                    .tueTimeSlot[i].tempToTime =
                                                "${timeOfDay.hour}:${timeOfDay.minute}";
                                            serviceController.update();
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(serviceController
                                                    .tueTimeSlot[i].toTime),
                                                Icon(
                                                  Icons.history,
                                                  color: kblue,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        onTap: () {
                                          serviceController.tueTimeSlot
                                              .removeAt(i);
                                          serviceController.update();
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            color: kblue,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.remove_circle_outline,
                                              color: kwhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  if (serviceController.isExpand.value != 3) {
                    serviceController.isExpand(3);
                    if (serviceController.wedTimeSlot.isEmpty) {
                      TimeSlotModels timeSlotModels = TimeSlotModels(
                          fromTime: "--:--",
                          toTime: "--:--",
                          tempFromTime: "",
                          tempToTime: "");
                      serviceController.wedTimeSlot.add(timeSlotModels);
                      serviceController.update();
                    }
                    serviceController.update();
                  } else {
                    serviceController.isExpand(999);
                    serviceController.update();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Wednesday",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: kblue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: kwhite,
                      )),
                    ),
                  ],
                ),
              ),
            ),
            if (serviceController.isExpand.value == 3)
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(blurRadius: 5.2, color: kgrey),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kblue,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () async {
                                final TimeOfDay? timeOfDay =
                                    await showTimePicker(
                                        context: context,
                                        initialTime: selectedTime,
                                        initialEntryMode:
                                            TimePickerEntryMode.dial);
                                if (timeOfDay != null) {
                                  setState(() {
                                    selectedTime = timeOfDay;
                                  });
                                  serviceController.wedTimeSlot[0].fromTime =
                                      timeOfDay.format(context).toString();

                                  serviceController
                                          .wedTimeSlot[0].tempFromTime =
                                      "${timeOfDay.hour}:${timeOfDay.minute}";
                                  serviceController.update();
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(serviceController
                                          .wedTimeSlot[0].fromTime),
                                      Icon(
                                        Icons.history,
                                        color: kblue,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "To",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kblue,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final TimeOfDay? timeOfDay =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: selectedTime,
                                            initialEntryMode:
                                                TimePickerEntryMode.dial);
                                    if (timeOfDay != null) {
                                      setState(() {
                                        selectedTime = timeOfDay;
                                      });
                                      serviceController.wedTimeSlot[0].toTime =
                                          timeOfDay.format(context).toString();
                                      serviceController
                                              .wedTimeSlot[0].tempToTime =
                                          "${timeOfDay.hour}:${timeOfDay.minute}";
                                      serviceController.update();
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(serviceController
                                              .wedTimeSlot[0].toTime),
                                          Icon(
                                            Icons.history,
                                            color: kblue,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                InkWell(
                                  onTap: () {
                                    TimeSlotModels timeSlotModels =
                                        TimeSlotModels(
                                            fromTime: "--:--",
                                            toTime: "--:--",
                                            tempFromTime: "",
                                            tempToTime: "");
                                    serviceController.wedTimeSlot
                                        .add(timeSlotModels);
                                    serviceController.update();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: kblue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        color: kwhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (serviceController.wedTimeSlot.isNotEmpty &&
                serviceController.isExpand.value == 3)
              Column(
                children: [
                  for (int i = 1; i < serviceController.wedTimeSlot.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(blurRadius: 5.2, color: kgrey),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "From",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final TimeOfDay? timeOfDay =
                                          await showTimePicker(
                                              context: context,
                                              initialTime: selectedTime,
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial);
                                      if (timeOfDay != null) {
                                        setState(() {
                                          selectedTime = timeOfDay;
                                        });
                                        serviceController
                                                .wedTimeSlot[i].fromTime =
                                            timeOfDay
                                                .format(context)
                                                .toString();
                                        serviceController
                                                .wedTimeSlot[i].tempFromTime =
                                            "${timeOfDay.hour}:${timeOfDay.minute}";
                                        serviceController.update();
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(serviceController
                                                .wedTimeSlot[i].fromTime),
                                            Icon(
                                              Icons.history,
                                              color: kblue,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "To",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final TimeOfDay? timeOfDay =
                                              await showTimePicker(
                                                  context: context,
                                                  initialTime: selectedTime,
                                                  initialEntryMode:
                                                      TimePickerEntryMode.dial);
                                          if (timeOfDay != null) {
                                            setState(() {
                                              selectedTime = timeOfDay;
                                            });
                                            serviceController
                                                    .wedTimeSlot[i].toTime =
                                                timeOfDay
                                                    .format(context)
                                                    .toString();

                                            serviceController
                                                    .wedTimeSlot[i].tempToTime =
                                                "${timeOfDay.hour}:${timeOfDay.minute}";
                                            serviceController.update();
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(serviceController
                                                    .wedTimeSlot[i].toTime),
                                                Icon(
                                                  Icons.history,
                                                  color: kblue,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        onTap: () {
                                          serviceController.wedTimeSlot
                                              .removeAt(i);
                                          serviceController.update();
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            color: kblue,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.remove_circle_outline,
                                              color: kwhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  if (serviceController.isExpand.value != 4) {
                    serviceController.isExpand(4);
                    if (serviceController.thuTimeSlot.isEmpty) {
                      TimeSlotModels timeSlotModels = TimeSlotModels(
                          fromTime: "--:--",
                          toTime: "--:--",
                          tempFromTime: "",
                          tempToTime: "");
                      serviceController.thuTimeSlot.add(timeSlotModels);
                      serviceController.update();
                    }
                    serviceController.update();
                  } else {
                    serviceController.isExpand(999);
                    serviceController.update();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Thursday",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: kblue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: kwhite,
                      )),
                    ),
                  ],
                ),
              ),
            ),
            if (serviceController.isExpand.value == 4)
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(blurRadius: 5.2, color: kgrey),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kblue,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () async {
                                final TimeOfDay? timeOfDay =
                                    await showTimePicker(
                                        context: context,
                                        initialTime: selectedTime,
                                        initialEntryMode:
                                            TimePickerEntryMode.dial);
                                if (timeOfDay != null) {
                                  setState(() {
                                    selectedTime = timeOfDay;
                                  });
                                  serviceController.thuTimeSlot[0].fromTime =
                                      timeOfDay.format(context).toString();
                                  serviceController
                                          .thuTimeSlot[0].tempFromTime =
                                      "${timeOfDay.hour}:${timeOfDay.minute}";
                                  serviceController.update();
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(serviceController
                                          .thuTimeSlot[0].fromTime),
                                      Icon(
                                        Icons.history,
                                        color: kblue,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "To",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kblue,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final TimeOfDay? timeOfDay =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: selectedTime,
                                            initialEntryMode:
                                                TimePickerEntryMode.dial);
                                    if (timeOfDay != null) {
                                      setState(() {
                                        selectedTime = timeOfDay;
                                      });
                                      serviceController.thuTimeSlot[0].toTime =
                                          timeOfDay.format(context).toString();
                                      serviceController
                                              .thuTimeSlot[0].tempToTime =
                                          "${timeOfDay.hour}:${timeOfDay.minute}";
                                      serviceController.update();
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(serviceController
                                              .thuTimeSlot[0].toTime),
                                          Icon(
                                            Icons.history,
                                            color: kblue,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                InkWell(
                                  onTap: () {
                                    TimeSlotModels timeSlotModels =
                                        TimeSlotModels(
                                            fromTime: "--:--",
                                            toTime: "--:--",
                                            tempFromTime: "",
                                            tempToTime: "");
                                    serviceController.thuTimeSlot
                                        .add(timeSlotModels);
                                    serviceController.update();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: kblue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        color: kwhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (serviceController.thuTimeSlot.isNotEmpty &&
                serviceController.isExpand.value == 4)
              Column(
                children: [
                  for (int i = 1; i < serviceController.thuTimeSlot.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(blurRadius: 5.2, color: kgrey),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "From",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final TimeOfDay? timeOfDay =
                                          await showTimePicker(
                                              context: context,
                                              initialTime: selectedTime,
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial);
                                      if (timeOfDay != null) {
                                        setState(() {
                                          selectedTime = timeOfDay;
                                        });
                                        serviceController
                                                .thuTimeSlot[i].fromTime =
                                            timeOfDay
                                                .format(context)
                                                .toString();
                                        serviceController
                                                .thuTimeSlot[i].tempFromTime =
                                            "${timeOfDay.hour}:${timeOfDay.minute}";
                                        serviceController.update();
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(serviceController
                                                .thuTimeSlot[i].fromTime),
                                            Icon(
                                              Icons.history,
                                              color: kblue,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "To",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final TimeOfDay? timeOfDay =
                                              await showTimePicker(
                                                  context: context,
                                                  initialTime: selectedTime,
                                                  initialEntryMode:
                                                      TimePickerEntryMode.dial);
                                          if (timeOfDay != null) {
                                            setState(() {
                                              selectedTime = timeOfDay;
                                            });
                                            serviceController
                                                    .thuTimeSlot[i].toTime =
                                                timeOfDay
                                                    .format(context)
                                                    .toString();
                                            serviceController
                                                    .thuTimeSlot[i].tempToTime =
                                                "${timeOfDay.hour}:${timeOfDay.minute}";
                                            serviceController.update();
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(serviceController
                                                    .thuTimeSlot[i].toTime),
                                                Icon(
                                                  Icons.history,
                                                  color: kblue,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        onTap: () {
                                          serviceController.thuTimeSlot
                                              .removeAt(i);
                                          serviceController.update();
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            color: kblue,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.remove_circle_outline,
                                              color: kwhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  if (serviceController.isExpand.value != 5) {
                    serviceController.isExpand(5);
                    if (serviceController.friTimeSlot.isEmpty) {
                      TimeSlotModels timeSlotModels = TimeSlotModels(
                          fromTime: "--:--",
                          toTime: "--:--",
                          tempFromTime: "",
                          tempToTime: "");
                      serviceController.friTimeSlot.add(timeSlotModels);
                      serviceController.update();
                    }
                    serviceController.update();
                  } else {
                    serviceController.isExpand(999);
                    serviceController.update();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Friday",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: kblue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: kwhite,
                      )),
                    ),
                  ],
                ),
              ),
            ),
            if (serviceController.isExpand.value == 5)
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(blurRadius: 5.2, color: kgrey),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kblue,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () async {
                                final TimeOfDay? timeOfDay =
                                    await showTimePicker(
                                        context: context,
                                        initialTime: selectedTime,
                                        initialEntryMode:
                                            TimePickerEntryMode.dial);
                                if (timeOfDay != null) {
                                  setState(() {
                                    selectedTime = timeOfDay;
                                  });
                                  serviceController.friTimeSlot[0].fromTime =
                                      timeOfDay.format(context).toString();
                                  serviceController
                                          .friTimeSlot[0].tempFromTime =
                                      "${timeOfDay.hour}:${timeOfDay.minute}";
                                  serviceController.update();
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(serviceController
                                          .friTimeSlot[0].fromTime),
                                      Icon(
                                        Icons.history,
                                        color: kblue,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "To",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kblue,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final TimeOfDay? timeOfDay =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: selectedTime,
                                            initialEntryMode:
                                                TimePickerEntryMode.dial);
                                    if (timeOfDay != null) {
                                      setState(() {
                                        selectedTime = timeOfDay;
                                      });
                                      serviceController.friTimeSlot[0].toTime =
                                          timeOfDay.format(context).toString();
                                      serviceController
                                              .friTimeSlot[0].tempToTime =
                                          "${timeOfDay.hour}:${timeOfDay.minute}";
                                      serviceController.update();
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(serviceController
                                              .friTimeSlot[0].toTime),
                                          Icon(
                                            Icons.history,
                                            color: kblue,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                InkWell(
                                  onTap: () {
                                    TimeSlotModels timeSlotModels =
                                        TimeSlotModels(
                                            fromTime: "--:--",
                                            toTime: "--:--",
                                            tempFromTime: "",
                                            tempToTime: "");
                                    serviceController.friTimeSlot
                                        .add(timeSlotModels);
                                    serviceController.update();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: kblue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        color: kwhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (serviceController.friTimeSlot.isNotEmpty &&
                serviceController.isExpand.value == 5)
              Column(
                children: [
                  for (int i = 1; i < serviceController.friTimeSlot.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(blurRadius: 5.2, color: kgrey),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "From",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final TimeOfDay? timeOfDay =
                                          await showTimePicker(
                                              context: context,
                                              initialTime: selectedTime,
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial);
                                      if (timeOfDay != null) {
                                        setState(() {
                                          selectedTime = timeOfDay;
                                        });
                                        serviceController
                                                .friTimeSlot[i].fromTime =
                                            timeOfDay
                                                .format(context)
                                                .toString();
                                        serviceController
                                                .friTimeSlot[i].tempFromTime =
                                            "${timeOfDay.hour}:${timeOfDay.minute}";
                                        serviceController.update();
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(serviceController
                                                .friTimeSlot[i].fromTime),
                                            Icon(
                                              Icons.history,
                                              color: kblue,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "To",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final TimeOfDay? timeOfDay =
                                              await showTimePicker(
                                                  context: context,
                                                  initialTime: selectedTime,
                                                  initialEntryMode:
                                                      TimePickerEntryMode.dial);
                                          if (timeOfDay != null) {
                                            setState(() {
                                              selectedTime = timeOfDay;
                                            });
                                            serviceController
                                                    .friTimeSlot[i].toTime =
                                                timeOfDay
                                                    .format(context)
                                                    .toString();
                                            serviceController
                                                    .friTimeSlot[i].tempToTime =
                                                "${timeOfDay.hour}:${timeOfDay.minute}";
                                            serviceController.update();
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(serviceController
                                                    .friTimeSlot[i].toTime),
                                                Icon(
                                                  Icons.history,
                                                  color: kblue,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        onTap: () {
                                          serviceController.friTimeSlot
                                              .removeAt(i);
                                          serviceController.update();
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            color: kblue,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.remove_circle_outline,
                                              color: kwhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  if (serviceController.isExpand.value != 6) {
                    serviceController.isExpand(6);
                    if (serviceController.satTimeSlot.isEmpty) {
                      TimeSlotModels timeSlotModels = TimeSlotModels(
                          fromTime: "--:--",
                          toTime: "--:--",
                          tempFromTime: "",
                          tempToTime: "");
                      serviceController.satTimeSlot.add(timeSlotModels);
                      serviceController.update();
                    }
                    serviceController.update();
                  } else {
                    serviceController.isExpand(999);
                    serviceController.update();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Saturday",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: kblue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: kwhite,
                      )),
                    ),
                  ],
                ),
              ),
            ),
            if (serviceController.isExpand.value == 6)
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(blurRadius: 5.2, color: kgrey),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kblue,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () async {
                                final TimeOfDay? timeOfDay =
                                    await showTimePicker(
                                        context: context,
                                        initialTime: selectedTime,
                                        initialEntryMode:
                                            TimePickerEntryMode.dial);
                                if (timeOfDay != null) {
                                  setState(() {
                                    selectedTime = timeOfDay;
                                  });
                                  serviceController.satTimeSlot[0].fromTime =
                                      timeOfDay.format(context).toString();
                                  serviceController
                                          .satTimeSlot[0].tempFromTime =
                                      "${timeOfDay.hour}:${timeOfDay.minute}";
                                  serviceController.update();
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(serviceController
                                          .satTimeSlot[0].fromTime),
                                      Icon(
                                        Icons.history,
                                        color: kblue,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "To",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kblue,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final TimeOfDay? timeOfDay =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: selectedTime,
                                            initialEntryMode:
                                                TimePickerEntryMode.dial);
                                    if (timeOfDay != null) {
                                      setState(() {
                                        selectedTime = timeOfDay;
                                      });
                                      serviceController.satTimeSlot[0].toTime =
                                          timeOfDay.format(context).toString();
                                      serviceController
                                              .satTimeSlot[0].tempToTime =
                                          "${timeOfDay.hour}:${timeOfDay.minute}";
                                      serviceController.update();
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(serviceController
                                              .satTimeSlot[0].toTime),
                                          Icon(
                                            Icons.history,
                                            color: kblue,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                InkWell(
                                  onTap: () {
                                    TimeSlotModels timeSlotModels =
                                        TimeSlotModels(
                                            fromTime: "--:--",
                                            toTime: "--:--",
                                            tempFromTime: "",
                                            tempToTime: "");
                                    serviceController.satTimeSlot
                                        .add(timeSlotModels);
                                    serviceController.update();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: kblue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        color: kwhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (serviceController.satTimeSlot.isNotEmpty &&
                serviceController.isExpand.value == 6)
              Column(
                children: [
                  for (int i = 1; i < serviceController.satTimeSlot.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(blurRadius: 5.2, color: kgrey),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "From",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final TimeOfDay? timeOfDay =
                                          await showTimePicker(
                                              context: context,
                                              initialTime: selectedTime,
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial);
                                      if (timeOfDay != null) {
                                        setState(() {
                                          selectedTime = timeOfDay;
                                        });
                                        serviceController
                                                .satTimeSlot[i].fromTime =
                                            timeOfDay
                                                .format(context)
                                                .toString();
                                        serviceController
                                                .satTimeSlot[i].tempFromTime =
                                            "${timeOfDay.hour}:${timeOfDay.minute}";
                                        serviceController.update();
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(serviceController
                                                .satTimeSlot[i].fromTime),
                                            Icon(
                                              Icons.history,
                                              color: kblue,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "To",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final TimeOfDay? timeOfDay =
                                              await showTimePicker(
                                                  context: context,
                                                  initialTime: selectedTime,
                                                  initialEntryMode:
                                                      TimePickerEntryMode.dial);
                                          if (timeOfDay != null) {
                                            setState(() {
                                              selectedTime = timeOfDay;
                                            });
                                            serviceController
                                                    .satTimeSlot[i].toTime =
                                                timeOfDay
                                                    .format(context)
                                                    .toString();
                                            serviceController
                                                    .satTimeSlot[i].tempToTime =
                                                "${timeOfDay.hour}:${timeOfDay.minute}";
                                            serviceController.update();
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(serviceController
                                                    .satTimeSlot[i].toTime),
                                                Icon(
                                                  Icons.history,
                                                  color: kblue,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        onTap: () {
                                          serviceController.satTimeSlot
                                              .removeAt(i);
                                          serviceController.update();
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            color: kblue,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.remove_circle_outline,
                                              color: kwhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: korange, borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(color: kwhite, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
              child: InkWell(
                onTap: () {
                  serviceController.setDefaultSlots();
                  Get.back();
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kwhite, borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: kblue, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
