import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/services_controller.dart';
import 'package:bci/screens/bussiness/views/home_screen/contact_admin.dart';
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
  final servicesController = Get.find<ServicesController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    servicesController.offerList();
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
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: kwhite,
                          )),
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
                    Container(width: 20,)
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
      body: GetBuilder<ServicesController>(builder: (_) {
        return servicesController.offerListData.isEmpty ?
         Container(
                    child: Center(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/offer.jpeg',
                          //height: 300,
                          //fit: BoxFit.fitHeight,
                          ),
                          ksizedbox20,
                          Text('No offers Available',
                          style: TextStyle(
                            fontSize: 16,
                            color: kblue,
                            fontWeight: FontWeight.w700
                          ),)
                        ],
                      ),
                    ),
                  ) :
          ListView.builder(
            itemCount: servicesController.offerListData.length,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        // Get.to(() => VendorViewOffers(
                        //       vendorId: homeController
                        //           .todayOfferListData[index].vendorId,
                        //     ));
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
                                servicesController.offerListData[index].image,
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
                                        servicesController
                                            .offerListData[index].title,
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
                                        "Discount value : ₹${servicesController.offerListData[index].discountValue}",
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
                                        "Ends on : ${formatDate(servicesController.offerListData[index].endsAt, [
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
