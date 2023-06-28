import 'package:bci/authentications/langing_screen/landing_screen.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:bci/screens/members/liquer_screen/cart_screen.dart';
import 'package:bci/screens/members/settings_views/my_subcriptions_screen.dart';
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
import 'package:nb_utils/nb_utils.dart';

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
              child:const Padding(
                padding:  EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
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
        padding: const EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 20),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Get.to(const MyAccount());
              },
              child:const Row(
                children: [
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
                Get.to(const MySubcriptionScreen());
              },
              child:const Row(
                children: [
                  Image(
                    image: AssetImage("assets/icons/additionalCoupons.png"),
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "My Subscriptions",
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
                Get.to(const DashBoardScreen_menbers());
              },
              child:const Row(
                children:  [
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
              child:const Row(
                children:  [
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
              child:const Row(
                children:  [
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
             InkWell(
              onTap: () {
                Get.to(const CartScreen());
              },
              child:const Row(
                children:  [
                  Icon(Icons.shopping_cart,color:  Color(0xff003366),),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "View Cart",
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
            // InkWell(
            //   onTap: () {
            //     Get.to(Additional_coupons());
            //   },
            //   child: Row(
            //     children: const [
            //       Image(
            //         image: AssetImage("assets/icons/additionalCoupons.png"),
            //         width: 20,
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Text(
            //         "Additional Coupons",
            //         style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.w500,
            //             color: Color(0xff003366)),
            //       )
            //     ],
            //   ),
            // ),
            // const Padding(
            //   padding: EdgeInsets.only(top: 5, bottom: 10),
            //   child: Divider(
            //     thickness: 1,
            //     color: Colors.grey,
            //   ),
            // ),
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
            InkWell(
              onTap: () {
                showDialog(
                context: context,
                builder: (BuildContext context) {
                  return mAlertItem2;
                });
                //Get.find<AuthController>().logout();
              },
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

  AlertDialog mAlertItem2 = AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Confirmation", style: boldTextStyle(color: Colors.black)),
      content: Text(
        "Are you sure you want to logout?",
        style: secondaryTextStyle(color: Colors.black),
      ),
      actions: [
        TextButton(
          child: Text(
            "Yes",
            style: primaryTextStyle(color: kblue),
          ),
          onPressed: () {
           Get.find<AuthController>().logout();
          },
        ),
        TextButton(
          child: Text("No", style: primaryTextStyle(color: kblue)),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );

}
