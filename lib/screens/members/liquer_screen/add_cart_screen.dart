import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/search_service_list_model.dart';
import 'package:bci/screens/members/home_screen/notification_list_api_services.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constands/constands.dart';

class LiquorDetailScreen extends StatefulWidget {
  SearchServiceListData searchServicelist;
  LiquorDetailScreen({super.key, required this.searchServicelist});

  @override
  State<LiquorDetailScreen> createState() => _LiquorDetailScreenState();
}

class _LiquorDetailScreenState extends State<LiquorDetailScreen> {
  final homeController = Get.find<HomeController>();
  final profileController = Get.find<ProfileController>();

   var redeemCouponcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: ClipPath(
          clipper: SinCosineWaveClipper(),
          child: Container(
            height: 150,
            color: kblue,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kwhite,
                        ),
                      ),),
                  Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Text(
                      widget.searchServicelist.title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(NotificationScreen());
                    },
                    icon: Icon(
                      Icons.notifications,
                      color: kwhite,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/Clip.png',
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.searchServicelist.title,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                        ksizedbox10,
                        // Text(
                        //   widget.searchServicelist.amenties.first.toString(),
                        //   style: TextStyle(fontSize: 16),
                        // ),
                    //    ksizedbox20,
                        Text('Quantity: ${widget.searchServicelist.status}'),
                        ksizedbox20,
                        Text('MRP: ₹${widget.searchServicelist.actualAmount}'),
                        ksizedbox20,
                        // const Text(
                        //   'Apple, Rich, Vanilla',
                        //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        // ),
                        // ksizedbox20,
                        // const Text(
                        //   'White Wine',
                        //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        // ),
                        // ksizedbox20,
                        // const Text('Size'),
                        // ksizedbox10,
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: kwhite,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Text(
                                  "${widget.searchServicelist.status.toString()} L",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     AddSubtractScreen(),
                        //   ],
                        // ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            widget.searchServicelist.image,
                            height: 250,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // AddSubtractScreen(),
                //  ksizedbox20,
                // Container(
                //   child: Center(
                //       child: Text(
                //     '1.5 L',
                //     style: TextStyle(fontSize: 16),
                //   )),
                //   height: 35,
                //   width: 150,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(7), color: kgrey),
                // ),
                //  ksizedbox30,
                // Container(
                //   child: Center(
                //       child: Text(
                //     '+        02      _',
                //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                //   )),
                //   height: 35,
                //   width: 150,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(7), color: kgrey),
                // ),
                // ksizedbox40,
                const Text(
                  'About',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                ksizedbox10,
                Text(
                  widget.searchServicelist.description,
                  style: TextStyle(fontSize: 11, color: kgrey),
                ),
                ksizedbox20,
                // const Text(
                //   'Delivery Information',
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                // ),
                // ksizedbox10,
                // Text(
                //  widget.searchServicelist.status,
                //   style: TextStyle(fontSize: 11, color: kgrey),
                // ),
                ksizedbox40,
                 ksizedbox20,
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: TextField(
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
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                ),
                // ksizedbox20,
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      //Get.to(CartScreen());
                      homeController.addToCart(
                          amount: widget.searchServicelist.saleAmount,
                          startTime: "",
                          slotId: "",
                          bookingDate: DateTime.now().toIso8601String(),
                          serviceid: widget.searchServicelist.id.toString());
                    },
                    child: Container(
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          kwidth5,
                          Text(
                            'Total  ₹ ${widget.searchServicelist.saleAmount}',
                            style: TextStyle(color: kwhite, fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Center(
                                  child: Text(
                                'Add To Booking',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              )),
                              height: 65,
                              width: 160,
                              decoration: BoxDecoration(
                                  color: kwhite,
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        ],
                      ),
                      height: 70,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: kyellow),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      // backgroundColor: kwhite,
    );
  }
}
