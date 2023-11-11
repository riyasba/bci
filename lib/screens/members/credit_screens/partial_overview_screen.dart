import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/plans_controller.dart';
import 'package:bci/screens/members/otcpayment/partial_addpayment_view.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartialCollectScreen extends StatefulWidget {
  const PartialCollectScreen({super.key});

  @override
  State<PartialCollectScreen> createState() => _PartialCollectScreenState();
}

class _PartialCollectScreenState extends State<PartialCollectScreen> {
  final plansController = Get.find<PlanController>();

  @override
  void initState() {
    super.initState();
    plansController.getPartialPaymentDatas();
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
          "Partial Collect",
          style: TextStyle(
              fontSize: 22,
              color: Color(0xFF05406E),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<PlanController>(builder: (_) {
          return plansController.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Text(
                      //   "Total Credit Limit",
                      //   style: TextStyle(
                      //       fontSize: 19,
                      //       color: Color(0xFF05406E),
                      //       fontWeight: FontWeight.w400),
                      // ),
                      for (int i = 0;
                          i < plansController.partialAmountdataList.length;
                          i++)
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, bottom: 10, right: 30),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Plan Name",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF05406E),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            plansController
                                                .partialAmountdataList[i]
                                                .planTitle,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Color(0xFF05406E),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Plan Amount",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF05406E),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "₹ ${plansController.partialAmountdataList[i].planAmount}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Color(0xFF05406E),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Paid",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF05406E),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "₹ ${plansController.partialAmountdataList[i].collectedAmount}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Color(0xFF05406E),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Unpaid",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF05406E),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "₹ ${plansController.calculateUnPaid(double.parse(plansController.partialAmountdataList[i].planAmount), double.parse(plansController.partialAmountdataList[i].collectedAmount))}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Color(0xFF05406E),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Status",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF05406E),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        height: 20,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: Colors.amber[100],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: Colors.brown,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                            Text(
                                              plansController
                                                  .partialAmountdataList[i]
                                                  .status,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFF05406E),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0;
                                    i <
                                        plansController
                                            .partialAmountHistoryList.length;
                                    i++)
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                const Image(
                                                  image: AssetImage(
                                                      "assets/images/tick.png"),
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Container(
                                                    height: 20,
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
                                                    plansController
                                                        .partialAmountHistoryList[
                                                            i]
                                                        .planTitle,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xFF05406E),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    // "Paid Date : ${formatDate(, [
                                                    //       dd,
                                                    //       "-",
                                                    //       mm,
                                                    //       "-",
                                                    //       yyyy
                                                    //     ])}",
                                                    "Paid Date: ${plansController.partialAmountHistoryList[i].collectedDate}",
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF05406E),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "₹ ${plansController.partialAmountHistoryList[i].collectedAmount}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xFF05406E),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: InkWell(
          onTap: () {
            Get.to(() => PartialAddPAymentView(
                  planId: plansController.partialAmountdataList.first.planName,
                  saleAmount:
                      plansController.partialAmountdataList.first.planAmount,
                ));
          },
          child: Container(
            height: 55,
            decoration: BoxDecoration(
                color: kblue, borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                "Pay now",
                style: primaryFont.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
