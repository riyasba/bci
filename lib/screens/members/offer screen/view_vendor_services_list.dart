import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/models/search_service_list_model.dart';
import 'package:bci/screens/members/members_search_screen/member_service_details_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../models/get_today_offers_list_model.dart';

class VendorViewServicesList extends StatefulWidget {
  String vendorId;
  String categoryName;
  String categoryId;
  VendorViewServicesList(
      {super.key,
      required this.vendorId,
      required this.categoryName,
      required this.categoryId});

  @override
  State<VendorViewServicesList> createState() => _VendorViewOffersState();
}

class _VendorViewOffersState extends State<VendorViewServicesList> {
  final homeController = Get.find<HomeController>();
  String? _setTime, _setDate;

  String? _hour, _minute, _time;

  String? dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = formatDate(selectedDate, [MM, '-', dd]);
      });
    _selectTime(context);
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour! + ' : ' + _minute!;
        _timeController.text = _time!;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  var searchTextEditingController = TextEditingController();

  _getFilteredList() {
    print("searching .........${searchTextEditingController.text}");
    homeController.vendorServiceListData = homeController.vendorServiceListData
        .where((value) => value.title
            .toLowerCase()
            .contains(searchTextEditingController.text.toLowerCase()))
        .toList();

    if (searchTextEditingController.text.isEmpty) {
      homeController.vendorServiceListData =
          homeController.tempVendorServiceListData;
    }

    homeController.update();
  }

  @override
  void initState() {
    searchTextEditingController.addListener(_getFilteredList);
    homeController.vendorServiceListbyCategory(
        widget.vendorId, widget.categoryId);
    _dateController.text = formatDate(selectedDate, [MM, '-', dd]);

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(190),
          child: Column(
            children: [
              ClipPath(
                clipper: SinCosineWaveClipper(),
                child: Container(
                  height: 150,
                  color: kblue,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 5, right: 5, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 17),
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: kwhite,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Text(
                            'Services',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: kwhite),
                          ),
                        ),
                        Container(
                          width: 20,
                        )
                        // IconButton(
                        //     onPressed: () {
                        //       Get.to(NotificationScreen());
                        //     },
                        //     icon: Icon(
                        //       Icons.notifications,
                        //       color: kwhite,
                        //     ))
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: size.height * 0.06,
                  width: size.width * 0.9,
                  child: TextFormField(
                    controller: searchTextEditingController,
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  )),
            ],
          )),
      body: GetBuilder<HomeController>(builder: (_) {
        return homeController.vendorServiceListData.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                        image: AssetImage("assets/icons/Group 8891.png")),
                    ksizedbox20,
                    Text(
                      "No Service Data",
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            : GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeController.vendorServiceListData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        SearchServiceListData searchServiceListData =
                            SearchServiceListData(
                                actualAmount: homeController
                                    .vendorServiceListData[index].actualAmount,
                                bvcAmount: homeController
                                    .vendorServiceListData[index].bvcAmount,
                                categoryId: homeController
                                    .vendorServiceListData[index].categoryId,
                                createdAt: homeController
                                    .vendorServiceListData[index].createdAt,
                                description: homeController
                                    .vendorServiceListData[index].description,
                                id: homeController
                                    .vendorServiceListData[index].id,
                                image: homeController
                                    .vendorServiceListData[index].image,
                                images: homeController
                                    .vendorServiceListData[index].images,
                                // isBooking: homeController
                                //     .vendorServiceListData[index].isBooking,
                                saleAmount: homeController
                                    .vendorServiceListData[index].saleAmount,
                                status: homeController
                                    .vendorServiceListData[index].status,
                                title: homeController
                                    .vendorServiceListData[index].title,
                                updatedAt: homeController
                                    .vendorServiceListData[index].updatedAt,
                                amenties: homeController
                                    .vendorServiceListData[index].amenties,
                                vendorId: homeController
                                    .vendorServiceListData[index].vendorId,
                                isCoupon: "",
                                isOffer: "",
                                isRecomended: "",
                                quantity: homeController
                                    .vendorServiceListData[index].quantity,
                                unit: "",
                                couponAmount: "",
                                offerPercentage: "",
                                offerUptoAmount: "",
                                shareOption: "");
                        homeController.getServicesDetails(
                            servicesId: searchServiceListData.id);

                        if (homeController
                                .vendorServiceListData[index].isRecomended ==
                            "0") {
                          Get.to(
                            ServiceDetailsScreen(
                              searchServicelist: searchServiceListData,
                            ),
                          );
                        }
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: kgrey, blurRadius: 0.5),
                                ],
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                homeController.vendorServiceListData[index]
                                        .images.isEmpty
                                    ? ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                        child: Image.asset(
                                          "assets/images/Group 9407.png",
                                          height: 125,
                                          width: size.width,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                        child: Image.network(
                                          homeController
                                              .vendorServiceListData[index]
                                              .images
                                              .first,
                                          height: 125,
                                          width: size.width,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                ksizedbox10,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    homeController
                                        .vendorServiceListData[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: kblue),
                                  ),
                                ),
                                ksizedbox5,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    homeController.vendorServiceListData[index]
                                        .description,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color: kblue),
                                  ),
                                ),
                                ksizedbox5,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Actual price",
                                            style: primaryFont.copyWith(
                                                color: kOrange,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "₹${homeController.vendorServiceListData[index].actualAmount}",
                                            style: primaryFont.copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "BCI price",
                                            style: primaryFont.copyWith(
                                                color: kOrange,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "₹${homeController.vendorServiceListData[index].saleAmount}",
                                            style: primaryFont.copyWith(
                                                color: kblue,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          if (homeController
                                  .vendorServiceListData[index].isRecomended ==
                              "1")
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.4),
                              ),
                              child: Center(
                                  child: Text(
                                "All slots are filled",
                                style:
                                    primaryFont.copyWith(color: Colors.red),
                              )
                              ),
                            )
                        ],
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}
