import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/search_service_list_model.dart';
import 'package:bci/models/services_details_list_model.dart';
import 'package:date_format/date_format.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServiceDetailsScreen extends StatefulWidget {
  SearchServiceListData searchServicelist;
  ServiceDetailsScreen({super.key, required this.searchServicelist});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  String? _setTime, _setDate;

  String? _hour, _minute, _time;

  String? dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  var selectedValue;

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
    _dateController.text = formatDate(selectedDate, [M, ',', dd, ',', yyyy]);

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  final homeController = Get.find<HomeController>();

  final redeemCouponcontroller = TextEditingController();

  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: kblue,
            ),
          ),
        ),
        titleSpacing: 10,
        title: Text(
          'Details',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: kblue),
        ),
      ),
      body: ListView(
        children: [
          if (widget.searchServicelist.images.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  widget.searchServicelist.images.first,
                  height: 350,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ksizedbox10,
          Container(
            height: 80,
            child: GetBuilder<HomeController>(builder: (_) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: widget.searchServicelist.images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: Colors.white,
                                    title: Column(
                                      children: [
                                        Image.network(widget
                                            .searchServicelist.images[index]),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Image.network(
                            widget.searchServicelist.images[index],
                            height: 50,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  });
            }),
          ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 200,
                  child: Text(
                    widget.searchServicelist.title,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: kblue),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "₹${widget.searchServicelist.actualAmount}",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "₹${widget.searchServicelist.saleAmount}",
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: kblue),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: kblue),
                ),
                ksizedbox10,
                Text(
                  widget.searchServicelist.description,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                      color: kblue),
                ),
                ksizedbox10,
                if (widget.searchServicelist.amenties.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amenities',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: kblue),
                      ),
                      ksizedbox20,
                      for (int i = 0;
                          i < widget.searchServicelist.amenties.length;
                          i++)
                        Row(
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: kgrey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.searchServicelist.amenties[i].value,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: kgrey),
                            ),
                          ],
                        ),
                      ksizedbox10,
                    ],
                  ),
                GetBuilder<HomeController>(builder: (_) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (homeController.slotDetailList.isNotEmpty)
                        Text(
                          'Time Slot',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: kblue),
                        ),
                      ksizedbox10,
                      if (homeController.slotDetailList.isNotEmpty)
                        DropdownButtonFormField2<SlotDetail>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            // Add Horizontal padding using menuItemStyleData.padding so it matches
                            // the menu padding when button's width is not specified.
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // Add more decoration..
                          ),
                          hint: const Text(
                            'Select Your Time slot',
                            style: TextStyle(fontSize: 14),
                          ),
                          items: homeController.slotDetailList
                              .map((item) => DropdownMenuItem<SlotDetail>(
                                    value: item,
                                    child: Text(
                                      "${item.weekday} ${formatDate(DateTime(2023, 1, 1, int.parse(item.startTime.split(":").first), int.parse(item.startTime.split(":")[1])), [
                                            hh,
                                            ":",
                                            nn,
                                            " ",
                                            am
                                          ])}-${formatDate(DateTime(2023, 1, 1, int.parse(item.endTime.split(":").first),int.parse(item.endTime.split(":")[1])), [
                                            hh,
                                            ":",
                                            nn,
                                            " ",
                                            am
                                          ])}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select Time slot.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            //Do something when selected item is changed.
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 24,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                    ],
                  );
                }),
                // const SizedBox(height: 30),
                // Row(
                //   children: [
                //     InkWell(
                //         onTap: () {
                //           _selectDate(context);
                //         },
                //         child: const Icon(Icons.date_range)),
                //     Padding(
                //       padding: const EdgeInsets.only(
                //         left: 4,
                //       ),
                //       child: Text(_dateController.text),
                //     ),
                //     const Padding(
                //       padding: EdgeInsets.only(left: 2, right: 2),
                //       child: Text('-'),
                //     ),
                //     Text(_timeController.text),
                //   ],
                // ),
                ksizedbox10,
                ksizedbox10,
                Text(
                  'Promo Code',
                  style: TextStyle(
                      fontSize: 16.5,
                      color: kblue,
                      fontWeight: FontWeight.w500),
                ),
                ksizedbox10,
                TextField(
                  controller: redeemCouponcontroller,
                  decoration: InputDecoration(
                    disabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    hintText: 'Enter Your Coupon code',
                    fillColor: kwhite,
                    focusColor: kwhite,
                    isDense: true,
                    filled: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 20,
                        width: 130,
                        decoration: BoxDecoration(
                          color: kblue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () async {
                            String tempSaleAmount =
                                widget.searchServicelist.saleAmount;
                            String amount =
                                await profileController.redeemCoupon(
                                    amount: tempSaleAmount,
                                    couponcode: redeemCouponcontroller.text,
                                    serviceId:
                                        widget.searchServicelist.id.toString(),
                                    vendorId:
                                        widget.searchServicelist.vendorId);

                            double tAmount = double.parse(amount);
                            double tempSaleAmounz =
                                double.parse(tempSaleAmount);

                            if (tAmount < tempSaleAmounz) {
                              double totalAmountTobeAdded =
                                  tempSaleAmounz - tAmount;

                              setState(() {
                                widget.searchServicelist.saleAmount =
                                    totalAmountTobeAdded.toStringAsFixed(2);
                              });
                            } else {
                              Get.rawSnackbar(
                                  message:
                                      "Coupon is not applicable for this service",
                                  backgroundColor: Colors.red);
                            }
                          },
                          child: Center(
                            child: Text(
                              'Redeem Now',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ksizedbox20,
                Container(
                  height: 60,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), color: kyellow),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Total : ₹${widget.searchServicelist.saleAmount}",
                          style: primaryFont.copyWith(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(
                              right: 5, top: 5, bottom: 5),
                          child: homeController.isLoading.isTrue
                              ? Container(
                                  height: 65,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: kwhite,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: const Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.black87,
                                  )),
                                )
                              : InkWell(
                                  onTap: () {
                                    homeController.addToCart(
                                        amount:
                                            widget.searchServicelist.saleAmount,
                                        startTime: selectedValue != null
                                            ? "${selectedValue.weekday} ${selectedValue.startTime}-${selectedValue.endTime}"
                                            : "",
                                        serviceid: widget.searchServicelist.id
                                            .toString());
                                  },
                                  child: Container(
                                    height: 65,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: kwhite,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: const Center(
                                        child: Text(
                                      "Add To Booking",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    )),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
