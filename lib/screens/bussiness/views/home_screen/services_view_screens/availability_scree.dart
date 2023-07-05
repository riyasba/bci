import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/controllers/services_controller.dart';
import 'package:bci/models/category_model.dart';
import 'package:bci/screens/bussiness/views/home_screen/services_view_screens/add_services_view.dart';
import 'package:bci/screens/bussiness/views/home_screen/services_view_screens/update_services_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constands/constands.dart';

class AvailabilityScreen extends StatefulWidget {
  const AvailabilityScreen({super.key});

  @override
  State<AvailabilityScreen> createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {
  List title = [
    'Car Services',
    'Hotel Room Services',
    'Top Laptop Repair \nService'
  ];
  List serviceimage = [
    'assets/images/carservice.png',
    'assets/images/hotelservice.png',
    'assets/images/laptopservice.png'
  ];
  List description = [
    'Choose from a wide variety of car \nservices such as car repair,wheel\ncar service ',
    'Book at Over 900,000 Hodels \nWorldwide now Easy booking Great \nRates,Choose From a Wide Range of \nproperties which Booking.com',
    '208 laptop repair services in \nT nagarFind Emergency laptop \nRepairs laptop Servicing Centre \nEmergency laptop Repairs in \nT nagar '
  ];
  @override
  var serviceController = TextEditingController();
  var descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  final servicesController = Get.find<ServicesController>();

  @override
  void initState() {
    super.initState();
    servicesController.getServicesByVendor();
  }

  var merchantCategory;

  var authController = Get.find<AuthController>();

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 158,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: IconButton(
                          onPressed: () {
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
                        'Availability',
                        style:
                            TextStyle(fontSize: 23, color: Color(0xffF8F9FD)),
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
          )),
      body: ListView(children: [
        Column(
          children: [
            ksizedbox20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Your Services',
                  style: TextStyle(
                    fontSize: 22,
                    color: kblue,
                  ),
                ),
                ksizedbox10,
                InkWell(
                  onTap: () {
                    Get.to(() => AddServicesView());
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return Padding(
                    //         padding: const EdgeInsets.only(top: 80, bottom: 65),
                    //         child: Dialog(
                    //           shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(10)),
                    //           child: Container(
                    //             child: Column(
                    //               children: [
                    //                 Row(
                    //                   children: [
                    //                     IconButton(
                    //                         onPressed: () {

                    //                         },
                    //                         icon: Icon(Icons.arrow_back)),
                    //                     Text(
                    //                       'Add Service',
                    //                       style: TextStyle(
                    //                           fontSize: 16, color: kblue),
                    //                     )
                    //                   ],
                    //                 ),
                    //                 Padding(
                    //                   padding: const EdgeInsets.only(
                    //                       left: 10, right: 10, top: 5),
                    //                   child: TextField(
                    //                     controller: serviceController,
                    //                     decoration: InputDecoration(
                    //                         labelText: 'Service',
                    //                         labelStyle: TextStyle(
                    //                             fontSize: 16, color: kgrey),
                    //                         border: OutlineInputBorder(
                    //                             borderRadius:
                    //                                 BorderRadius.circular(10),
                    //                             borderSide:
                    //                                 BorderSide(color: kgrey))),
                    //                   ),
                    //                 ),
                    //                 ksizedbox20,
                    //                 Padding(
                    //                   padding: const EdgeInsets.only(
                    //                       left: 10, right: 10),
                    //                   child: TextField(
                    //                     controller: serviceController,
                    //                     decoration: InputDecoration(
                    //                         labelText: 'Description',
                    //                         labelStyle: TextStyle(
                    //                             fontSize: 16, color: kgrey),
                    //                         border: OutlineInputBorder(
                    //                             borderRadius:
                    //                                 BorderRadius.circular(10),
                    //                             borderSide:
                    //                                 BorderSide(color: kgrey))),
                    //                   ),
                    //                 ),
                    //                 ksizedbox30,
                    //                 Container(
                    //                   height: 200,
                    //                   width: 200,
                    //                   decoration: BoxDecoration(
                    //                     color: Color(0xffE5E5E5),
                    //                   ),
                    //                   child: Column(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.center,
                    //                     children: [
                    //                       Image.asset(
                    //                           'assets/images/avaiimageupload.png'),
                    //                       Padding(
                    //                         padding:
                    //                             const EdgeInsets.only(top: 8),
                    //                         child: Text(
                    //                           'Add Images',
                    //                           style: TextStyle(
                    //                               color: kgrey, fontSize: 15),
                    //                         ),
                    //                       )
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 ksizedbox30,
                    //                 ElevatedButton(
                    //                     style: ElevatedButton.styleFrom(
                    //                         backgroundColor: kblue,
                    //                         minimumSize: Size(
                    //                             MediaQuery.of(context)
                    //                                     .size
                    //                                     .width *
                    //                                 0.6,
                    //                             40)),
                    //                     onPressed: () {},
                    //                     child: Text(
                    //                       'Submit',
                    //                       style: TextStyle(color: kwhite),
                    //                     ))
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     });
                  },
                  child: Container(
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                          border: Border.all(color: kOrange, width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'Add Service',
                              style: TextStyle(fontSize: 18, color: kOrange),
                            ),
                          ),
                          ksizedbox10,
                          kwidth10,
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Image.asset(
                                'assets/images/availabilitycircle.png'),
                          )
                        ],
                      )),
                )
              ],
            ),
            ksizedbox30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetBuilder<AuthController>(builder: (_) {
                  return Container(
                    height: 40,
                    width: 160,
                    decoration: BoxDecoration(
                        color: const Color(0xffE4E4E4),
                        border: Border.all(color: kblue, width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: DropdownButton<CategoryList>(
                        value: merchantCategory,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        elevation: 0,
                        itemHeight: 55,
                        isDense: true,
                        dropdownColor: Colors.grey[250],
                        style: const TextStyle(color: Colors.black54),
                        hint: Text(
                          "All Services",
                          style: TextStyle(fontSize: 16, color: kblue),
                        ),
                        onChanged: (CategoryList? value) {
                          setState(() {
                            merchantCategory = value!;
                          });
                          servicesController.getServicesByCategory(
                              categoryId: value!.id.toString());
                        },
                        items: authController.categoryList
                            .map<DropdownMenuItem<CategoryList>>(
                                (CategoryList value) {
                          return DropdownMenuItem<CategoryList>(
                            value: value,
                            child: Text(value.title),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }),
                // Container(
                //     height: 40,
                //     width: 160,
                //     decoration: BoxDecoration(
                //         color: const Color(0xffE4E4E4),
                //         border: Border.all(color: kblue, width: 1),
                //         borderRadius: BorderRadius.circular(8)),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(left: 5),
                //           child: Text(
                //             'All Services',
                //             style: TextStyle(fontSize: 18, color: kblue),
                //           ),
                //         ),
                //         ksizedbox10,
                //         kwidth10,
                //         Padding(
                //           padding: const EdgeInsets.only(right: 5),
                //           child: Image.asset(
                //               'assets/images/availabilitycircle2.png'),
                //         )
                //       ],
                //     )),
                Container(
                    height: 40,
                    width: 160,
                    decoration: BoxDecoration(
                        color: const Color(0xffE4E4E4),
                        border: Border.all(color: kblue, width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "${selectedDate.toLocal()}".split(' ')[0],
                            style: TextStyle(fontSize: 18, color: kblue),
                          ),
                        ),
                        ksizedbox10,
                        kwidth10,
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: InkWell(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Image.asset(
                                'assets/images/availabilitycircle3.png'),
                          ),
                        )
                      ],
                    )),
              ],
            ),
            GetBuilder<ServicesController>(builder: (_) {
              return servicesController.serviceDataList.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.only(top: 200),
                      child: Center(
                        child: Text("No Service Added"),
                      ),
                    )
                  : Container(
                      height: size.height * 0.65,
                      child: ListView.builder(
                          itemCount: servicesController.serviceDataList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 140,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 180,
                                            width: 140,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10,
                                                  left: 5,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Image.network(
                                                servicesController
                                                    .serviceDataList[index]
                                                    .image,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 169,
                                                  child: Text(
                                                    servicesController
                                                        .serviceDataList[index]
                                                        .title,
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Container(
                                                    width: 169,
                                                    child: Text(
                                                      servicesController
                                                          .serviceDataList[
                                                              index]
                                                          .description,
                                                      maxLines: 4,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: kgrey),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1.5,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    PopupMenuButton(
                                      // Callback that sets the selected popup menu item.
                                      onSelected: (var item) {
                                        Get.to(() => UpdateServicesView(
                                            serviceData: servicesController
                                                .serviceDataList[index]));
                                      },
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry>[
                                        const PopupMenuItem(
                                          value: 1,
                                          child: Text('Edit'),
                                        ),
                                      ],
                                    ),
                                    // IconButton(
                                    //     onPressed: () {
                                    //       Get.to(() => UpdateServicesView(
                                    //           serviceData: servicesController
                                    //               .serviceDataList[index]));
                                    //     },
                                    //     icon: const Icon(Icons.more_vert)),
                                  ],
                                ),
                              ]),
                            );
                          }),
                    );
            }),
          ],
        ),
      ]),
    );
  }
}
