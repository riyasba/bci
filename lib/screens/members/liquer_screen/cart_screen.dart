import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/screens/members/liquer_screen/widget/order_widget.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constands/constands.dart';
import '../../bussiness/views/business/notification_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final homeController = Get.find<HomeController>();

  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getCartdetails();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kwhite,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: Get.back,
                        child:
                            Image.asset('assets/images/chevron-left (2).png')),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Orders',
                        style: TextStyle(
                            fontSize: 20,
                            //  fontWeight: FontWeight.bold,
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
          )),
      body: GetBuilder<HomeController>(builder: (_) {
        return Container(
          child: homeController.cartListData.isEmpty
              ? const Center(
                  child: Text("No Items In Your Cart"),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeController.cartListData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          width: size.width,
                          height: 110,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: kgrey,
                                  blurRadius: 0.5,
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        homeController
                                            .cartListData[index].image,
                                        height: 100,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5, left: 5, right: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          homeController
                                              .cartListData[index].serviceName,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            width: 150,
                                            child: Text(
                                              homeController.cartListData[index]
                                                  .description,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color: Colors.black54),
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "Qty: ${homeController.cartListData[index].quantity}"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      backgroundColor:
                                                          Colors.white,
                                                      title: Text("Remove Item",
                                                          style: boldTextStyle(
                                                              color: Colors
                                                                  .black)),
                                                      content: Text(
                                                        "Are you sure you want to remove this item?",
                                                        style:
                                                            secondaryTextStyle(
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          child: Text(
                                                            "cancel",
                                                            style:
                                                                primaryTextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                          ),
                                                          onPressed: () {
                                                            Get.back();
                                                            //Get.find<AuthController>().logout();
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: Text("Remove",
                                                              style: primaryTextStyle(
                                                                  color: Colors
                                                                      .grey)),
                                                          onPressed: () {
                                                            homeController.deleteToCart(
                                                                serviceid: homeController
                                                                    .cartListData[
                                                                        index]
                                                                    .serviceId
                                                                    .toString());
                                                            Get.back();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  });
                                              // homeController.deleteToCart(
                                              //     serviceid: homeController
                                              //         .cartListData[index]
                                              //         .serviceId
                                              //         .toString());
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  CupertinoIcons.delete,
                                                  color: Colors.grey,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Remove",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            )),
                                        ksizedbox10,
                                        Text(
                                          '₹ ${double.parse(homeController.cartListData[index].amount).toStringAsFixed(2)}',
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w600,
                                              color: kyellow),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    );
                  },
                ),
        );
      }),
      // const Divider(
      //   thickness: 1,
      // ),
      // Expanded(
      //     child: Container(
      //   height: 100.h,
      //   width: double.infinity,
      //   color: kwhite,
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           // ksizedbox40,
      //           Text(
      //             'Support',
      //             style: TextStyle(
      //                 fontSize: 25.sp, fontWeight: FontWeight.w600),
      //           ),
      //           ksizedbox10,
      //           Text(
      //             'Member ID Number:',
      //             style: TextStyle(
      //                 fontSize: 20.sp,
      //                 fontWeight: FontWeight.w400,
      //                 color: korange),
      //           ),
      //           Text(
      //             'BCI123456QWE',
      //             style: TextStyle(fontSize: 15.sp),
      //           ),
      //           ksizedbox10,
      //           Text(
      //             'Phone Number:',
      //             style: TextStyle(
      //                 fontSize: 20.sp,
      //                 fontWeight: FontWeight.w400,
      //                 color: korange),
      //           ),
      //           Text(
      //             '92345 43453',
      //             style: TextStyle(fontSize: 15.sp),
      //           ),
      //           ksizedbox10,
      //           Text(
      //             'Delivery Address:',
      //             style: TextStyle(
      //                 fontSize: 20.sp,
      //                 fontWeight: FontWeight.w400,
      //                 color: korange),
      //           ),
      //           Text(
      //             '2A,Street Nager, Anna Nagar, Chennai, 600021.',
      //             style: TextStyle(fontSize: 15.sp),
      //           ),
      //         ]),
      //   ),
      // )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GetBuilder<HomeController>(builder: (_) {
                  return Text(
                    "₹${homeController.getGrandTotal().toStringAsFixed(2)}",
                    style: primaryFont.copyWith(
                        color: kblue,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  );
                }),
                Obx(
                  () => profileController.isLoading.isTrue
                      ? Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: kblue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            var tempAmount = homeController.getGrandTotal();
                            profileController.payUseingEaseBuzz(
                                id: 0,
                                amount: tempAmount.toStringAsFixed(2),
                                customerName:
                                    profileController.profileData.first.name,
                                email:
                                    "${profileController.profileData.first.name}@gmail.com",
                                phone:
                                    profileController.profileData.first.mobile,
                                status: "");

                            // for(int i = 0; i < homeController.cartListData.length; i++){
                            //   homeController.addBooking(
                            //   serviceid: homeController.cartListData[i].serviceId,
                            //   qty: homeController.cartListData[i].quantity,
                            //   offerOrCoupon: "",
                            //   couponcode: "",
                            //   amount: homeController.cartListData[i].price
                            //   );
                            // }
                          },
                          child: Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // AlertDialog mAlertItem2 = ;
}
