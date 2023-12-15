import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/widgets/home_widgets/payment_bottom_sheet.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constands/constands.dart';

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
          preferredSize: const Size.fromHeight(150),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: kwhite,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        'View Bookings',
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
                    //       Get.to(const NotificationScreen());
                    //     },
                    //     icon: Icon(
                    //       Icons.notifications,
                    //       color: kwhite,
                    //     ))
                  ],
                ),
              ),
            ),
          )),
      body: GetBuilder<HomeController>(builder: (_) {
        return Container(
          child: homeController.cartListData.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/cartnotavailableimage.png'),
                      ksizedbox20,
                      Text(
                        'Booking is Empty',
                        style: TextStyle(
                            fontSize: 22.sp,
                            color: kblue,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeController.cartListData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          // if (homeController.cartListData[index].isSelected) {
                          //   homeController.cartListData[index].isSelected =
                          //       false;
                          //   homeController.update();
                          // } else {
                          //   homeController.cartListData[index].isSelected =
                          //       true;
                          //   homeController.update();
                          // }
                        },
                        child: Container(
                            width: size.width,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          height: 100,
                                          width: 70,
                                          child: Image.network(
                                            homeController
                                                .cartListData[index].image,
                                            height: 100,
                                            width: 70,
                                            fit: BoxFit.cover,
                                          ),
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
                                          Container(
                                            width: 150,
                                            child: Text(
                                              homeController.cartListData[index]
                                                  .serviceName,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                              width: 150,
                                              child: Text(
                                                homeController
                                                    .cartListData[index]
                                                    .description,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    color: Colors.black54),
                                              )),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              const Text("Qty:"),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                height: 25,
                                                width: 75,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black54),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          if (homeController
                                                                  .cartListData[
                                                                      index]
                                                                  .quantity
                                                                  .toString() ==
                                                              "1") {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    title: Text(
                                                                        "Remove Item",
                                                                        style: boldTextStyle(
                                                                            color:
                                                                                Colors.black)),
                                                                    content:
                                                                        Text(
                                                                      "Are you sure you want to remove this item?",
                                                                      style: secondaryTextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                    actions: [
                                                                      TextButton(
                                                                        child:
                                                                            Text(
                                                                          "cancel",
                                                                          style:
                                                                              primaryTextStyle(color: Colors.grey),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Get.back();
                                                                          //Get.find<AuthController>().logout();
                                                                        },
                                                                      ),
                                                                      TextButton(
                                                                        child: Text(
                                                                            "Remove",
                                                                            style:
                                                                                primaryTextStyle(color: Colors.grey)),
                                                                        onPressed:
                                                                            () {
                                                                          Get.back();
                                                                          homeController.deleteToCart(
                                                                              serviceid: homeController.cartListData[index].serviceId.toString());
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                });
                                                          } else {
                                                            var quantity =
                                                                homeController
                                                                    .cartListData[
                                                                        index]
                                                                    .quantity
                                                                    .toString();
                                                            int tempQty =
                                                                int.parse(
                                                                    quantity);
                                                            homeController
                                                                    .cartListData[
                                                                        index]
                                                                    .quantity =
                                                                tempQty - 1;
                                                            homeController.updateQuantity(
                                                                cartid: homeController
                                                                    .cartListData[
                                                                        index]
                                                                    .id
                                                                    .toString(),
                                                                quantity: homeController
                                                                    .cartListData[
                                                                        index]
                                                                    .quantity
                                                                    .toString());
                                                            homeController
                                                                .update();
                                                          }
                                                        },
                                                        child: const Icon(
                                                          Icons.remove,
                                                          size: 20,
                                                        )),
                                                    Container(
                                                      height: 25,
                                                      width: 25,
                                                      color: Colors.orange,
                                                      child: Center(
                                                        child: Text(
                                                          homeController
                                                              .cartListData[
                                                                  index]
                                                              .quantity
                                                              .toString(),
                                                          //homeController.adult.value.toString(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                        onTap: () async{
                                                          //homeController.adult++;
                                                          var quantity =
                                                              homeController
                                                                  .cartListData[
                                                                      index]
                                                                  .quantity
                                                                  .toString();
                                                          int tempQty =
                                                              int.parse(
                                                                  quantity);
                                                          homeController
                                                                  .cartListData[
                                                                      index]
                                                                  .quantity =
                                                              tempQty + 1;
                                                           
                                                        bool isValid = await  homeController.updateQuantity(
                                                              cartid: homeController
                                                                  .cartListData[
                                                                      index]
                                                                  .id
                                                                  .toString(),
                                                              quantity: homeController
                                                                  .cartListData[
                                                                      index]
                                                                  .quantity
                                                                  .toString());
                                                              if(!isValid){
                                                                 homeController
                                                                  .cartListData[
                                                                      index]
                                                                  .quantity =  tempQty;
                                                              }
                                                          
                                                          homeController
                                                              .update();
                                                        },
                                                        child: const Icon(
                                                          Icons.add,
                                                          size: 20,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
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
                                      child: Container(
                                        height: 100,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 10,
                                                  right: 5,
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    if (homeController
                                                        .cartListData[index]
                                                        .isSelected) {
                                                      homeController
                                                          .cartListData[index]
                                                          .isSelected = false;
                                                      homeController.update();
                                                    } else {
                                                      homeController
                                                          .cartListData[index]
                                                          .isSelected = true;
                                                      homeController.update();
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                      color: homeController
                                                                  .cartListData[
                                                                      index]
                                                                  .isSelected ==
                                                              true
                                                          ? Colors.green
                                                          : Colors.white,
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                    ),
                                                    child: const Center(
                                                        child: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                    )),
                                                  ),
                                                ),
                                              ),
                                              // InkWell(
                                              //     onTap: () {
                                              //       showDialog(
                                              //           context: context,
                                              //           builder:
                                              //               (BuildContext context) {
                                              //             return AlertDialog(
                                              //               backgroundColor:
                                              //                   Colors.white,
                                              //               title: Text("Remove Item",
                                              //                   style: boldTextStyle(
                                              //                       color: Colors
                                              //                           .black)),
                                              //               content: Text(
                                              //                 "Are you sure you want to remove this item?",
                                              //                 style:
                                              //                     secondaryTextStyle(
                                              //                         color: Colors
                                              //                             .black),
                                              //               ),
                                              //               actions: [
                                              //                 TextButton(
                                              //                   child: Text(
                                              //                     "cancel",
                                              //                     style:
                                              //                         primaryTextStyle(
                                              //                             color: Colors
                                              //                                 .grey),
                                              //                   ),
                                              //                   onPressed: () {
                                              //                     Get.back();
                                              //                     //Get.find<AuthController>().logout();
                                              //                   },
                                              //                 ),
                                              //                 TextButton(
                                              //                   child: Text("Remove",
                                              //                       style: primaryTextStyle(
                                              //                           color: Colors
                                              //                               .grey)),
                                              //                   onPressed: () {
                                              //                     Get.back();
                                              //                     homeController.deleteToCart(
                                              //                         serviceid: homeController
                                              //                             .cartListData[
                                              //                                 index]
                                              //                             .serviceId
                                              //                             .toString());
                                              //                   },
                                              //                 ),
                                              //               ],
                                              //             );
                                              //           });
                                              //       // homeController.deleteToCart(
                                              //       //     serviceid: homeController
                                              //       //         .cartListData[index]
                                              //       //         .serviceId
                                              //       //         .toString());
                                              //     },
                                              //     child: const Row(
                                              //       children: [
                                              //         Icon(
                                              //           CupertinoIcons.delete,
                                              //           color: Colors.grey,
                                              //           size: 15,
                                              //         ),
                                              //         SizedBox(
                                              //           width: 5,
                                              //         ),
                                              //         Text(
                                              //           "Remove",
                                              //           style: TextStyle(
                                              //               color: Colors.grey),
                                              //         )
                                              //       ],
                                              //     )),
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
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    );
                  },
                ),
        );
      }),
      bottomNavigationBar: GetBuilder<HomeController>(builder: (_) {
        return homeController.cartListData.isEmpty
            ? Container(
                height: 20,
              )
            : Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: kyellow, borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "₹ ${homeController.getGrandTotal().toStringAsFixed(2)}",
                        style: primaryFont.copyWith(
                            color: kwhite,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Obx(
                        () => profileController.isLoading.isTrue
                            ? Container(
                                height: 50,
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
                                  if (homeController.cartListData.isNotEmpty) {
                                    if (homeController.getGrandTotal() > 0) {
                                      var tempAmount =
                                          homeController.getGrandTotal();
                                      // profileController.payFromCart(tempAmount);
                                      paymentBottomSheet(
                                          context,
                                          tempAmount,
                                          homeController.cartListData.first.id
                                              .toString());
                                    } else {
                                      Get.rawSnackbar(
                                          message:
                                              "Please select any service to continue",
                                          backgroundColor: Colors.black);
                                    }
                                  } else {
                                    Get.rawSnackbar(
                                        message: "No Booking found",
                                        backgroundColor: Colors.red);
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: kblue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Book Now",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
