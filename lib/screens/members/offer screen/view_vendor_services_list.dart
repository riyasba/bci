import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/models/search_service_list_model.dart';
import 'package:bci/screens/bussiness/views/business/notification_screen.dart';
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

  VendorViewServicesList({super.key, required this.vendorId});

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

  @override
  void initState() {
    homeController.vendorServiceList(widget.vendorId);
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
          preferredSize: Size.fromHeight(150.h),
          child: Column(
            children: [
              ClipPath(
                clipper: SinCosineWaveClipper(),
                child: Container(
                  height: 150.h,
                  color: kblue,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 5, right: 5, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                    'assets/images/chevron-left (2).png'))),
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Text(
                            'Services',
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: kwhite),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.to(NotificationScreen());
                            },
                            icon: Icon(
                              Icons.notifications,
                              color: kwhite,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
      body: GetBuilder<HomeController>(builder: (_) {
        return homeController.vendorServiceListData.isEmpty
            ? const Center(
                child: Text("No Data Found"),
              )
            : GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeController.vendorServiceListData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
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
                        Get.to(
                          ServiceDetailsScreen(
                            searchServicelist: searchServiceListData,
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: kgrey, blurRadius: 0.5),
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                homeController
                                    .vendorServiceListData[index].image,
                                height: 125,
                                width: size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ksizedbox10,
                            Text(
                              homeController.vendorServiceListData[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: kblue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}
