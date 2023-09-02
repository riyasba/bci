import 'package:bci/authentications/langing_screen/landing_screen.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/screens/bussiness/views/business/business_home_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/contact_admin.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/dashboard_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/my_account_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/subscription_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/your_referal_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/wallet/bank_deatails.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../constands/constands.dart';

class BusinessSettingScreen extends StatefulWidget {
  const BusinessSettingScreen({super.key});

  @override
  State<BusinessSettingScreen> createState() => _BusinessSettingScreenState();
}

class _BusinessSettingScreenState extends State<BusinessSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 158,
              color: kblue,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 20),
                    child: Text(
                      'Settings',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Get.to(()=> MyAccountScreen());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/settingperson.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 17, top: 10),
                      child: Text(
                        'My Account',
                        style: TextStyle(
                            fontSize: 20,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(const BankDetailsScreen());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/settingbank.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 17, top: 6),
                      child: Text(
                        'Bank Details',
                        style: TextStyle(
                            fontSize: 20,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(const DashBoardScreen());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/settingdasbord.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 17, top: 6),
                      child: Text(
                        'Dashboard',
                        style: TextStyle(
                            fontSize: 20,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(const BusinessYourReferralScreen());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/settingreferal.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 17, top: 6),
                      child: Text(
                        'Your Referral',
                        style: TextStyle(
                            fontSize: 20,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     Get.to(const SubscriptionScreen());
          //   },
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 20),
          //       child: Row(
          //         children: [
          //           Image.asset('assets/images/settingpackage.png'),
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10, top: 6),
          //             child: Text(
          //               'Package Subscription',
          //               style: TextStyle(
          //                   fontSize: 22,
          //                   color: kblue,
          //                   fontWeight: FontWeight.w500),
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // ksizedbox10,
          // Padding(
          //   padding: const EdgeInsets.only(left: 10, right: 10),
          //   child: Divider(
          //     thickness: 1,
          //     color: kgrey,
          //   ),
          // ),
          
          InkWell(
            onTap: () {
              Get.to(const ContactAdmin());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/settinghelps.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 17, top: 6),
                      child: Text(
                        'Support',
                        style: TextStyle(
                            fontSize: 20,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
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
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/settinglogout.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 17, top: 6),
                      child: Text(
                        'LogOut',
                        style: TextStyle(
                            fontSize: 20,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
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
