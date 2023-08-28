import 'package:bci/screens/members/settings_views/setingswidgets/others_containors.dart';
import 'package:bci/screens/members/settings_views/setingswidgets/your_coupons.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../constands/constands.dart';
import '../../bussiness/views/home_screen/contact_admin.dart';

class AdditionalCoupons extends StatefulWidget {
  const AdditionalCoupons({super.key});

  @override
  State<AdditionalCoupons> createState() => _AdditionalCouponsState();
}

class _AdditionalCouponsState extends State<AdditionalCoupons> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(250),
            child: Column(
              children: [
                ClipPath(
                  clipper: SinCosineWaveClipper(),
                  child: Container(
                    height: 157,
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
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: kwhite,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              'All Coupons',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kwhite),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                      automaticIndicatorColorAdjustment: true,
                      //  isScrollable: true,
                      labelColor: kwhite,
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: kyellow),
                      onTap: (value) {
                        setState(() {
                          index = value;
                        });
                      },
                      tabs: const [
                        Tab(
                          text: "Your Coupons",
                        ),
                        Tab(
                          text: "Redeemed Coupons",
                        ),
                      ]),
                ),
                const Divider(
                  thickness: 3,
                )
              ],
            )),
        body: const TabBarView(children: [Coupons(), VendorCoupons()]),
      ),
    );
  }
}
