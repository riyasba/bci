import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/models/search_service_list_model.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constands/constands.dart';
import '../../bussiness/views/business/notification_screen.dart';

class LiquorDetailScreen extends StatefulWidget {
  SearchServiceListData searchServicelist;
  LiquorDetailScreen({super.key, required this.searchServicelist});

  @override
  State<LiquorDetailScreen> createState() => _LiquorDetailScreenState();
}

class _LiquorDetailScreenState extends State<LiquorDetailScreen> {
  final homeController = Get.find<HomeController>();

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
                        Text('Quantity ${widget.searchServicelist.status}'),
                        ksizedbox20,
                        Text('MFG ${widget.searchServicelist.createdAt}'),
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      //Get.to(CartScreen());
                      homeController.addToCart(
                          amount: widget.searchServicelist.saleAmount,
                          serviceid: widget.searchServicelist.id.toString());
                    },
                    child: Container(
                      child: Row(
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
                                'Add To Cart',
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
