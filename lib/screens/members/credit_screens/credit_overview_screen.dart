import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditOverviewScreen extends StatefulWidget {
  const CreditOverviewScreen({super.key});

  @override
  State<CreditOverviewScreen> createState() => _CreditOverviewScreenState();
}

class _CreditOverviewScreenState extends State<CreditOverviewScreen> {
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
                child: const Padding(
                  padding:
                      EdgeInsets.only(top: 15, left: 15, bottom: 20, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Credit Limit",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "₹ 15,000",
                            style: TextStyle(
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
                              Text(
                                "Current Outstanding",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "₹ 10,000",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Available Credit Limit",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "₹ 10,700",
                                style: TextStyle(
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
                    const Padding(
                      padding: EdgeInsets.all(10.0),
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
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bill Due",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF05406E),
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "₹ 5000",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF05406E),
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            child: const Text("Pay Bill",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Container(
                            height: 30,
                            width: 2,
                            color: Colors.white,
                          ),
                          Container(
                            width: 150,
                            child: const Text("View Statement",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
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
              child: Container(
                height: 200,
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
                                          "Hotel Booking",
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
                                          "Flight Booking",
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
                                          "Bus Ticket",
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
                                    color: Colors.pink,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "₹ 24,700",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "₹ 17,000",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
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
                      child: const Center(
                        child: Text("Last 30 Days",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
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
