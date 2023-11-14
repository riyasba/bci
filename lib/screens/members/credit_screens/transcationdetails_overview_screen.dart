import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/profile_controller.dart';

class TransationDetailsOverviewScreen extends StatelessWidget {
  TransationDetailsOverviewScreen({super.key});
  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Transaction Details",
          style: TextStyle(
              fontSize: 22,
              color: Color(0xFF05406E),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
              itemCount: profileController.creditTransactionsList.length,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        const Icon(
                                          Icons.check_circle_rounded,
                                          size: 20,
                                          color: Colors.green,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
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
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            profileController
                                                .creditTransactionsList[index]
                                                .creditFor,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xFF05406E),
                                                fontWeight: FontWeight.w600),
                                          ),
                                          profileController
                                                      .creditTransactionsList[
                                                          index]
                                                      .isPaid ==
                                                  "2"
                                              ? Text(
                                                  "Credit on ${formatDate(profileController.creditTransactionsList[index].createdAt, [
                                                        dd,
                                                        " ",
                                                        M,
                                                        " ",
                                                        yyyy
                                                      ])}",
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF05406E),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              : Text(
                                                  "Paid on ${formatDate(profileController.creditTransactionsList[index].createdAt, [
                                                        dd,
                                                        " ",
                                                        M,
                                                        " ",
                                                        yyyy
                                                      ])}",
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF05406E),
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
                              style: TextStyle(
                                  fontSize: 15,
                                  color: profileController
                                              .creditTransactionsList[index]
                                              .isPaid ==
                                          "2"
                                      ? Colors.green
                                      : Colors.pink,
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
        ),
      ),
    );
  }
}
