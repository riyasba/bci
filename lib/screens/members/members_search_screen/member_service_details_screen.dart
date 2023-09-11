import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/search_service_list_model.dart';
import 'package:date_format/date_format.dart';
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
  
   String ?_setTime, _setDate;

   String ?_hour, _minute, _time;

  String? dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

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
        _dateController.text = formatDate(selectedDate, [MM,'-',dd]);
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
    
    _dateController.text = formatDate(selectedDate, [M,',',dd,',',yyyy]);

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
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: kblue,
          ),
        ),
        titleSpacing: 10,
        title: Text(
          'Details',
          style: TextStyle(
              fontSize: 20.sp, fontWeight: FontWeight.w500, color: kblue),
        ),
      ),
      body: ListView(
        children: [
          Image.network(
            widget.searchServicelist.image,
            height: 350,
            width: size.width,
            fit: BoxFit.cover,
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
                    widget.searchServicelist.title,
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: kblue),
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
                      color: Colors.black),
                ),
                ksizedbox10,
                Text(
                  widget.searchServicelist.description,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                      color: kgrey),
                ),
                ksizedbox10,
                Text(
                  'Services',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                ksizedbox10,
                Text('Time Slot',
                         style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                ),
                        ),  
                        Row(
                          children: [
                             Text(_dateController.text),
                            IconButton(onPressed: (){
                              _selectDate(context);
                            }, 
                            icon:Icon(Icons.date_range)),
                           
                           
                          ],
                        ),
                         Text(_timeController.text),
                ksizedbox10,
                for (int i = 0;
                    i < widget.searchServicelist.amenties!.length;
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
                        widget.searchServicelist.amenties![i].value,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: kgrey),
                      ),
                    ],
                  ),
                ksizedbox20,
                TextField(
                  controller: redeemCouponcontroller,
                  decoration: InputDecoration(
                    disabledBorder: const OutlineInputBorder(),
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
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: InkWell(
                          onTap: () async {
                            String tempSaleAmount =
                                widget.searchServicelist.saleAmount;
                            String amount =
                                await profileController.redeemCoupon(
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
                      borderRadius: BorderRadius.circular(4.0),
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
                              fontWeight: FontWeight.w600),
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
                                      "Add To Cart",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
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
