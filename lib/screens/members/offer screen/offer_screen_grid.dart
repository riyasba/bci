import 'package:bci/controllers/home_page_controller.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../constands/constands.dart';
import '../../bussiness/views/business/notification_screen.dart';
import '../../bussiness/views/home_screen/contact_admin.dart';
import '../members widgets/gridciew.dart';
import 'offer_details.dart';

class TodayOfferScreen extends StatefulWidget {
  const TodayOfferScreen({super.key});

  @override
  State<TodayOfferScreen> createState() => _TodayOfferScreenState();
}

class _TodayOfferScreenState extends State<TodayOfferScreen> {
  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.todayOffers();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                        child: Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                                'assets/images/chevron-left (2).png'))),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Offers',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(const ContactAdmin());
                        },
                        child: Image.asset(
                            'assets/images/3669173_help_ic_icon.png'))
                  ],
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 8,
          ),
          itemCount: homeController.todayOfferListData.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
                child: InkWell(
              onTap: () {
                Get.to(OffersDetail(
                    todayOfferListData:
                        homeController.todayOfferListData[index]));
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 110,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.grey.withOpacity(0.5))
                            ]),
                        child: Image.network(
                            homeController.todayOfferListData[index].image)),
                    ksizedbox10,
                    //kwidth10,
                    // Text(homeController.todayOfferListData[index].title,
                    // style: TextStyle(fontSize: 17,color: kblue,fontWeight: FontWeight.w700),)
                  ]),
            ));
          },
        ),
      ),
      // body: ListView(
      //   physics:const BouncingScrollPhysics(),
      //   children: [
      //     InkWell(onTap: (){Get.to(const offer_screen2());},
      //       child: MyGridView(
      //         title: 'Today offers',
      //       image: [

      //         'assets/images/NoPath - Copy (32).png',
      //         'assets/images/NoPath - Copy (33).png',
      //         'assets/images/NoPath - Copy (34).png',
      //         'assets/images/NoPath - Copy (35).png'
      //       ]),
      //     ),
      //    MyGridView(title: 'Yesterday Offers', image: [

      //       'assets/images/NoPath - Copy (32).png',
      //       'assets/images/NoPath - Copy (33).png',
      //       'assets/images/NoPath - Copy (34).png',
      //       'assets/images/NoPath - Copy (35).png'
      //     ]), ],
      // )
    );
  }
}
