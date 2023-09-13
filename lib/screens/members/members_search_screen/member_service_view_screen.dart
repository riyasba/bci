import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/search_service_list_model.dart';
import 'package:bci/screens/bussiness/views/business/notification_screen.dart';
import 'package:bci/screens/members/liquer_screen/cart_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MemberSearchViewScreen extends StatefulWidget {
  SearchServiceListData searchServicelist;
  MemberSearchViewScreen({super.key, required this.searchServicelist});

  @override
  State<MemberSearchViewScreen> createState() => _MemberSearchViewScreenState();
}

class _MemberSearchViewScreenState extends State<MemberSearchViewScreen> {
  final homeController = Get.find<HomeController>();

  final redeemCouponcontroller = TextEditingController();

  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.all(15),
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
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            '',
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: kwhite),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.to(const NotificationScreen());
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    widget.searchServicelist.title,
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: kblue),
                  ),
                  ksizedbox10,
                  Container(
                    height: 100,
                    width: 150,
                    child: Image.network(widget.searchServicelist.image),
                  ),
                  ksizedbox20,
                  Text(
                    "About",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: kblue),
                  ),
                  ksizedbox10,
                  Text(
                    widget.searchServicelist.description,
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: kgrey),
                  ),
                  ksizedbox20,
                  Text(
                    "₹ ${widget.searchServicelist.actualAmount}",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: kOrange),
                  ),
                  ksizedbox40,
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Center(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(const CartScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 40,
                                width: 110,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "View Cart",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          controller: redeemCouponcontroller,
                          decoration: InputDecoration(
                            disabledBorder: const OutlineInputBorder(),
                            hintText: 'Enter Your Coupon code',
                            fillColor: kwhite,
                            focusColor: kwhite,
                            isDense: true,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      ),
                      ksizedbox20,
                      Container(
                        height: 70,
                        width: 335,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: kyellow),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: InkWell(
                            //     onTap: () {
                            //       dialogBuilder(context);
                            //     },
                            //     child: Container(
                            //       height: 65,
                            //       width: 150,
                            //       decoration: BoxDecoration(
                            //           color: kwhite,
                            //           borderRadius: BorderRadius.circular(16)),
                            //       child: const Center(
                            //           child: Text(
                            //         "Book Now",
                            //         style: TextStyle(
                            //             fontSize: 18,
                            //             fontWeight: FontWeight.w700),
                            //       )),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "₹${widget.searchServicelist.actualAmount}",
                                style: primaryFont.copyWith(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Obx(
                              () => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: homeController.isLoading.isTrue
                                    ? Container(
                                        height: 65,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: kwhite,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: const Center(
                                            child: CircularProgressIndicator(
                                          color: Colors.black87,
                                        )),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          homeController.addToCart(
                                              amount: widget.searchServicelist
                                                  .actualAmount,
                                                  startTime: "",
                                              serviceid: widget
                                                  .searchServicelist.id
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //  title: const Text('Basic dialog title'),
          content: const Text('Are you sure book this services'),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Text(
                "No",
                style: primaryFont.copyWith(
                  color: kblue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Obx(
              () => homeController.isLoading.isTrue
                  ? CircularProgressIndicator(
                      color: Colors.blue[800],
                    )
                  : InkWell(
                      onTap: () {
                        Get.back();
                        if (redeemCouponcontroller.text.isNotEmpty) {
                          print(">>>>>>>>>>>11111111111111111111");
                          profileController.redeemCoupon(
                              couponcode: redeemCouponcontroller.text,
                              serviceId: widget.searchServicelist.id.toString(),
                              vendorId: widget.searchServicelist.vendorId);
                          homeController.addBooking(
                              cartid: widget.searchServicelist.id.toString(),
                              serviceid: widget.searchServicelist.id.toString(),
                              qty: "1",
                              offerOrCoupon: "",
                              couponcode: redeemCouponcontroller.text,
                              amount: widget.searchServicelist.actualAmount);
                        } else {
                          print(">>>>>>>>>>>>>>>222222222222222222");
                          homeController.addBooking(
                              cartid: widget.searchServicelist.id.toString(),
                              serviceid: widget.searchServicelist.id.toString(),
                              qty: "1",
                              offerOrCoupon: "",
                              couponcode: redeemCouponcontroller.text,
                              amount: widget.searchServicelist.actualAmount);
                        }
                      },
                      child: Text(
                        "Yes",
                        style: primaryFont.copyWith(
                          color: kblue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        );
      },
    );
  }
}
