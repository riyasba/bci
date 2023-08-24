import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/search_service_list_model.dart';
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
