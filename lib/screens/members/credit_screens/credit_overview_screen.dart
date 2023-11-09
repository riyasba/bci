import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/screens/members/credit_screens/transcationdetails_overview_screen.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditOverviewScreen extends StatefulWidget {
  const CreditOverviewScreen({super.key});

  @override
  State<CreditOverviewScreen> createState() => _CreditOverviewScreenState();
}

class _CreditOverviewScreenState extends State<CreditOverviewScreen> {
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    profileController.getCreditProfile();
    profileController.getCreditStatement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        titleSpacing: -10,
        title: const Text(
          "Credit Overview",
          style: TextStyle(
              fontSize: 22,
              color: Color(0xFF05406E),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Total Credit Limit",
              style: TextStyle(
                  fontSize: 19,
                  color: Color(0xFF05406E),
                  fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 15, bottom: 20, right: 30),
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Total Credit Limit",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "₹ ${profileController.creditLimit.value}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Current Outstanding",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "₹ ${profileController.pendingLimit.value}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Available Credit Limit",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "₹ ${profileController.availableLimit.value}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              "Your Billed Details",
              style: TextStyle(
                  fontSize: 19,
                  color: Color(0xFF05406E),
                  fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment Due Date",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF05406E),
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "29 Oct 2023",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF05406E),
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Bill Due",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF05406E),
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "₹ ${profileController.totalUnpaidAmountCurrentMonth.value}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF05406E),
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "The Indian rupee sign ⟨₹⟩ is the currency symbol for the Indian rupee, the official currency of India. Designed by D. Udaya Kumar.",
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF05406E),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF05406E),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                profileController.initiatePaymentPayBill(
                                    amount: double.parse(profileController
                                        .totalUnpaidAmountCurrentMonth.value));
                              },
                              child: Container(
                                child: const Text("Pay Bill",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 2,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.to(() => TransationDetailsOverviewScreen());
                              },
                              child: Container(
                                child: const Text("View Statement",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
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
            const Text(
              "Transaction Details",
              style: TextStyle(
                  fontSize: 19,
                  color: Color(0xFF05406E),
                  fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: GetBuilder<ProfileController>(builder: (_) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          profileController.creditTransactionsList.length > 3
                              ? 3
                              : profileController.creditTransactionsList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                const Icon(
                                                  Icons.check_circle_rounded,
                                                  size: 20,
                                                  color: Colors.green,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Container(
                                                    height: 22,
                                                    width: 2,
                                                    color: Colors.grey[300],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    profileController
                                                        .creditTransactionsList[
                                                            index]
                                                        .creditFor,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xFF05406E),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    "Paid on ${formatDate(profileController.creditTransactionsList[index].createdAt, [
                                                          dd,
                                                          " ",
                                                          M,
                                                          " ",
                                                          yyyy
                                                        ])}",
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF05406E),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  // Text(
                                                  //   "TXNID: ${profileController.creditTransactionsList[index].}",
                                                  //   style: const TextStyle(
                                                  //       fontSize: 12,
                                                  //       color: Color(0xFF05406E),
                                                  //       fontWeight: FontWeight.w400),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "₹ ${profileController.creditTransactionsList[index].amount}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.pink,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
