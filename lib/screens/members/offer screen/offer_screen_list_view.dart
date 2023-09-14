import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/screens/bussiness/views/home_screen/contact_admin.dart';
import 'package:bci/screens/members/offer%20screen/view_vendors_offers_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferScreenListView extends StatefulWidget {
  const OfferScreenListView({super.key});

  @override
  State<OfferScreenListView> createState() => _OfferScreenListViewState();
}

class _OfferScreenListViewState extends State<OfferScreenListView> {
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
                    Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: kblue,
              ),
            ),
          ),
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
                    Container()
                    // InkWell(
                    //     onTap: () {
                    //       Get.to(const ContactAdmin());
                    //     },
                    //     child: Image.asset(
                    //         'assets/images/3669173_help_ic_icon.png'))
                  ],
                ),
              ),
            ),
          )),
      body: GetBuilder<HomeController>(builder: (_) {
        return ListView.builder(
            itemCount: homeController.todayOfferListData.length,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => VendorViewOffers(
                              vendorId: homeController
                                  .todayOfferListData[index].vendorId,
                                  offersListModel: homeController.todayOfferListData[index],
                            ));
                      },
                      child: Container(
                        height: 150,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 140,
                              width: size.width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.grey.withOpacity(0.5),
                                    )
                                  ]),
                              child: Image.network(
                                homeController.todayOfferListData[index].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Column(
                                children: [
                                  Container(
                                      width: size.width * 0.45,
                                      child: Text(
                                        homeController
                                            .todayOfferListData[index].title,
                                        style: primaryFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                      width: size.width * 0.45,
                                      child: Text(
                                        "Discount value : ₹${homeController.todayOfferListData[index].discountValue}",
                                        style: primaryFont.copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      width: size.width * 0.45,
                                      child: Text(
                                        "Ends on : ${formatDate(homeController.todayOfferListData[index].endsAt, [
                                              dd,
                                              "-",
                                              mm,
                                              "-",
                                              yyyy
                                            ])}",
                                        style: primaryFont.copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1.5,
                  )
                ],
              );
            }));
      }),
    );
  }
}
