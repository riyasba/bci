import 'dart:convert';
import 'dart:io';

import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/plans_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/upi_apps_model.dart';
import 'package:bci/screens/members/manual_payment_options/payment_waiting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

class PaymentScreenView extends StatefulWidget {
  double amount;
  int id;
  String gstPercentage;
  String percentageAmount;
  String totalAmount;
  PaymentScreenView(
      {super.key,
      required this.amount,
      required this.id,
      required this.gstPercentage,
      required this.percentageAmount,
      required this.totalAmount});

  @override
  State<PaymentScreenView> createState() => _PaymentScreenViewState();
}

class _PaymentScreenViewState extends State<PaymentScreenView> {
  final planController = Get.find<PlanController>();
  var utrTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getInstalledUpiAppsForAndroid();
  }

  var otherUpiApps = UPIApp("others", "others", "0.0.0");

  List<UPIApp> upiAppsList = [];

  void getInstalledUpiAppsForAndroid() {
    if (Platform.isAndroid) {
      PhonePePaymentSdk.getInstalledUpiAppsForAndroid()
          .then((apps) => {
                setState(() {
                  if (apps != null) {
                    Iterable l = json.decode(apps);
                    print("<---from apps--->");
                    print(apps);

                    List<UPIApp> upiApps = List<UPIApp>.from(
                        l.map((model) => UPIApp.fromJson(model)));

                    upiApps.add(otherUpiApps);

                    upiAppsList = upiApps;
                    String appString = '';
                    for (var element in upiApps) {
                      appString +=
                          "${element.applicationName} ${element.version} ${element.packageName}";
                    }
                    // result = 'Installed Upi Apps - $appString';
                    print('Installed Upi Apps - $appString');
                  } else {
                    print("'Installed Upi Apps - 0'");
                    // result = 'Installed Upi Apps - 0';
                  }
                })
              })
          .catchError((error) {
        return <dynamic>{};
      });
    }
  }

  getImages(String packageName) {
    String imageLink = "assets/icons/upi (1).png";
    if (packageName == "GPay") {
      imageLink = "assets/icons/gpay.jpg";
    } else if (packageName == "MobiKwik") {
      imageLink = "assets/icons/mobiqwicks.png";
    } else if (packageName == "PhonePe") {
      imageLink = "assets/icons/phonePe.png";
    } else if (packageName == "Paytm") {
      imageLink = "assets/icons/Paytm.png";
    }

    return imageLink;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Payment Options",
          style: primaryFont.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/images/qr_code.jpeg"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.find<ProfileController>().downloadPaymentQrCode();
                    },
                    child: Text(
                      "Download Qr code",
                      style: primaryFont.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Amount: ₹${widget.totalAmount}",
                    style: primaryFont.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Paymemt Methods",
                style: primaryFont.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () {
                    planController.paymentIndex(0);
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              color: Colors.grey.withOpacity(0.6))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Google Pay",
                                style: primaryFont.copyWith(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  planController.paymentIndex(0);
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color:
                                          planController.paymentIndex.value == 0
                                              ? Colors.green
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.black)),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                          if (planController.paymentIndex.value == 0)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                    "UPI Transaction ID or UTR from the receipt"),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 55,
                                  child: TextField(
                                    controller: utrTextController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(12),
                                      FilteringTextInputFormatter.digitsOnly,
                                      FilteringTextInputFormatter.deny(
                                          RegExp(r'\s 1-9')),
                                    ],
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter UTR Number',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Required",
                                      style: primaryFont.copyWith(
                                          fontSize: 11, color: Colors.black45),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () {
                    planController.paymentIndex(1);
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              color: Colors.grey.withOpacity(0.6))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Cash",
                                style: primaryFont.copyWith(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  planController.paymentIndex(1);
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color:
                                          planController.paymentIndex.value == 1
                                              ? Colors.green
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.black)),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () {
                    planController.paymentIndex(2);
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              color: Colors.grey.withOpacity(0.6))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Card Swiping",
                                style: primaryFont.copyWith(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  planController.paymentIndex(2);
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color:
                                          planController.paymentIndex.value == 2
                                              ? Colors.green
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.black)),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () {
                    planController.paymentIndex(3);
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              color: Colors.grey.withOpacity(0.6))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Net Banking / UPI",
                                style: primaryFont.copyWith(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  planController.paymentIndex(3);
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color:
                                          planController.paymentIndex.value == 3
                                              ? Colors.green
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.black)),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                          if (planController.paymentIndex.value == 3 &&
                              widget.amount < 100000 &&
                              upiAppsList.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("Select any UPI Apps"),
                                const SizedBox(
                                  height: 15,
                                ),
                                GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 10,
                                            crossAxisCount: 4),
                                    itemCount: upiAppsList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          if (upiAppsList[index].packageName! ==
                                              "others") {
                                            planController.initiatePayment(
                                                id: widget.id,
                                                amount: widget.amount,
                                                gstPercentage:
                                                    widget.gstPercentage,
                                                percentageAmount:
                                                    widget.percentageAmount,
                                                planId: widget.id,
                                                totalAmount:
                                                    widget.totalAmount);
                                          } else {
                                            planController.phonePePayment(
                                                id: widget.id,
                                                amount: widget.amount,
                                                gstPercentage:
                                                    widget.gstPercentage,
                                                percentageAmount:
                                                    widget.percentageAmount,
                                                planId: widget.id,
                                                totalAmount: widget.totalAmount,
                                                packageName: upiAppsList[index]
                                                    .packageName!);
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 55,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 2,
                                                        color: Colors.grey
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: upiAppsList[index]
                                                          .packageName! ==
                                                      "others"
                                                  ? const Icon(
                                                      Icons.more_horiz_outlined)
                                                  : Container(
                                                    height: 40,
                                                    width: 40,
                                                    child: Image.asset(getImages(
                                                        upiAppsList[index]
                                                            .applicationName!)),
                                                  ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              upiAppsList[index]
                                                  .applicationName!,
                                              style: primaryFont.copyWith(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      String? paymentMenthod;

                      if (planController.paymentIndex.value == 0) {
                        paymentMenthod = "2";
                      } else if (planController.paymentIndex.value == 1) {
                        paymentMenthod = "3";
                      } else if (planController.paymentIndex.value == 2) {
                        paymentMenthod = "4";
                      }

                      if (planController.paymentIndex.value == 3) {
                        // Get.find<ProfileController>().payfoSubscription(
                        //     id: widget.id,
                        //     amount: widget.amount,
                        //     gstPercentage: widget.gstPercentage,
                        //     percentageAmount: widget.percentageAmount,
                        //     totalAmount: widget.totalAmount);
                        // planController.phonePePayment(
                        //     id: widget.id,
                        //     amount: widget.amount,
                        //     gstPercentage: widget.gstPercentage,
                        //     percentageAmount: widget.percentageAmount,
                        //     planId: widget.id,
                        //     totalAmount: widget.totalAmount);

                        planController.initiatePayment(
                            id: widget.id,
                            amount: widget.amount,
                            gstPercentage: widget.gstPercentage,
                            percentageAmount: widget.percentageAmount,
                            planId: widget.id,
                            totalAmount: widget.totalAmount);
                      } else {
                        Get.find<HomeController>().addSubscriptionManual(
                            planId: widget.id,
                            customerId: Get.find<ProfileController>()
                                .profileData
                                .first
                                .id,
                            paymentMenthod: paymentMenthod!,
                            utrNumber: utrTextController.text.isEmpty
                                ? ""
                                : utrTextController.text,
                            gstPercentage: widget.gstPercentage,
                            percentageAmount: widget.percentageAmount,
                            amount: widget.amount.toStringAsFixed(2),
                            totalAmount: widget.totalAmount);

                        Get.off(() => PaymentWaitingScreen());
                      }
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: korange),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Text(
                          "PROCEED TO PAYMENT",
                          style: primaryFont.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}