import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartialCollectScreen extends StatefulWidget {
  const PartialCollectScreen({super.key});

  @override
  State<PartialCollectScreen> createState() => _PartialCollectScreenState();
}

class _PartialCollectScreenState extends State<PartialCollectScreen> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 15, bottom: 10, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Plan Name",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF05406E),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Platinum",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF05406E),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Plan Amount",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF05406E),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "₹ 10,700",
                                style: TextStyle(
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Paid",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF05406E),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "₹ 10,000",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF05406E),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Unpaid",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF05406E),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "₹ 10,700",
                                style: TextStyle(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                const Text(
                                  "Pending",
                                  style: TextStyle(
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
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  const Image(
                                    image: AssetImage("assets/images/tick.png"),
                                    height: 20,
                                    width: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Container(
                                      height: 20,
                                      width: 2,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  const Image(
                                    image: AssetImage("assets/images/tick.png"),
                                    height: 20,
                                    width: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Container(
                                      height: 20,
                                      width: 2,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  const Image(
                                    image: AssetImage("assets/images/tick.png"),
                                    height: 20,
                                    width: 20,
                                  ),
                                ],
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Payment 1",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF05406E),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Remaining Amount",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF05406E),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Payment 2",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF05406E),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Paid on 30 Dec 2023",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF05406E),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Payment 3",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF05406E),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Paid on 30 Dec 2023",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF05406E),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              Text(
                                "₹ 34,000",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF05406E),
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "₹ 24,700",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF05406E),
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "₹ 17,000",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF05406E),
                                    fontWeight: FontWeight.w600),
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
          ],
        ),
      ),
    );
  }
}
