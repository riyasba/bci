import 'package:bci/authentications/langing_screen/landing_screen.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/screens/members/settings_views/offers_screen.dart';
import 'package:bci/screens/members/settings_views/our_partner_screen.dart';
import 'package:bci/screens/members/settings_views/setingswidgets/My_account.dart';
import 'package:bci/screens/members/settings_views/support_screen.dart';
import 'package:bci/screens/members/settings_views/upgrade_screen.dart';
import 'package:bci/screens/members/settings_views/your_refferal_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/your_referal_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../bussiness/views/home_screen/settings/my_account_screen.dart';
import '../coupen/coupons_screen.dart';
import 'Dashbord.dart';
import 'aditional_coupons.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F8FD),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffF9F8FD)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            InkWell(onTap: (){Get.to(MyAccountScreen());},
              child: Row(
                children: const [
                  Image(
                    image: AssetImage("assets/icons/myaccount.png"),
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "My Account",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff003366)),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(DashBoardScreen_menbers());
              },
              child: Row(
                children: const [
                  Image(
                    image: AssetImage("assets/icons/dashboard.png"),
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Dashboard",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff003366)),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OfferScreen()));
              },
              child: Row(
                children: const [
                  Image(
                    image: AssetImage("assets/icons/offers.png"),
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Offers",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff003366)),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(Coupens_members());
              },
              child: Row(
                children: const [
                  Image(
                    image: AssetImage("assets/icons/coupans.png"),
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Your Coupons",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff003366)),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            InkWell(onTap: (){Get.to(Additional_coupons());},
              child: Row(
                children: const [
                  Image(
                    image: AssetImage("assets/icons/additionalCoupons.png"),
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Additional Coupons",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff003366)),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const YourReferralScreen()));
              },
              child: Row(
                children: const [
                  Image(
                    image: AssetImage("assets/icons/refferels.png"),
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Your Referrals",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff003366)),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OurPartnerScreen()));
              },
              child: Row(
                children: const [
                  Image(
                    image: AssetImage("assets/icons/partner.png"),
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Our Partner",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff003366)),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpgradeScreen()));
              },
              child: Row(
                children: const [
                  Image(
                    image: AssetImage("assets/icons/upgrade.png"),
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Upgrade",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff003366)),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SupportScreen()));
              },
              child: Row(
                children: const [
                  Image(image: AssetImage("assets/icons/sprt.png"), width: 20),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Support",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff003366)),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            InkWell(onTap: (){Get.to(landing_screen());},
              child: Row(
                children: const [
                  Image(
                    image: AssetImage("assets/icons/logout.png"),
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Logout",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff003366)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
