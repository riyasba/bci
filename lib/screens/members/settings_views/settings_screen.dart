import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/screens/members/liquer_screen/cart_screen.dart';
import 'package:bci/screens/members/settings_views/my_subcriptions_screen.dart';
import 'package:bci/screens/members/settings_views/offers_screen.dart';
import 'package:bci/screens/members/settings_views/our_partner_screen.dart';
import 'package:bci/screens/members/settings_views/setingswidgets/My_account.dart';
import 'package:bci/screens/members/settings_views/support_screen.dart';
import 'package:bci/screens/members/settings_views/upgrade_screen.dart';
import 'package:bci/screens/members/settings_views/your_refferal_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../coupen/coupons_screen.dart';
import 'aditional_coupons.dart';
import 'member_Dashbord.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int logoutindexvalue = 0;
  final authController = Get.find<AuthController>();

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
              child: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
        padding:
            const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 0),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Get.to(const MyAccount());
              },
              child: const Row(
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
              child: const Row(
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
                Get.to(const DashBoardScreenMenbers());
              },
              child: const Row(
                children: [
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
              child: const Row(
                children: [
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
                Get.to(MemberCouponScreen());
              },
              child: const Row(
                children: [
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
              child: const Row(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Color(0xff003366),
                  ),
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
              child: const Row(
                children: [
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
              child: const Row(
                children: [
                  Image(
                    image: AssetImage("assets/icons/ourpartnericon.png"),
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
              child: const Row(
                children: [
                  Image(
                    image: AssetImage("assets/icons/upgradicon.png"),
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
              child: const Row(
                children: [
                  Image(
                      image: AssetImage("assets/icons/supporticon.png"),
                      width: 20),
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
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.white,
                        title: Column(
                          children: [
                            Image.asset('assets/images/logoutimage.png'),
                            Text("Comeback Soon!",
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                        content: Text(
                          "Are you sure you Want to logout?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      // ignore: unrelated_type_equality_checks
                                      color: kwhite),
                                  child: Center(
                                      child: Text("Cancel",
                                          style: primaryTextStyle(
                                              color: kOrange))),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // authController.logoutindex(1);
                                  // authController.update();
                                  Get.find<AuthController>().logout();
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: kOrange,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      "Yes, Logout",
                                      style: primaryTextStyle(color: kwhite),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    });
                //Get.find<AuthController>().logout();
              },
              child: Row(
                children: const [
                  Image(
                    image: AssetImage("assets/icons/logouticon.png"),
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
