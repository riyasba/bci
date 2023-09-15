import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/screens/bussiness/views/home_screen/contact_admin.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/addd_gallery.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/dashboard_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/my_account_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/your_referal_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/bank_deatails.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../constands/constands.dart';
import '../../../../controllers/profile_controller.dart';

class BusinessSettingScreen extends StatefulWidget {
  const BusinessSettingScreen({super.key});

  @override
  State<BusinessSettingScreen> createState() => _BusinessSettingScreenState();
}

class _BusinessSettingScreenState extends State<BusinessSettingScreen> {
  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Settings',
                      style: TextStyle(fontSize: 20,
                       color: Colors.white,
                       fontWeight: FontWeight.w700
                       ),
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
              Get.to(() => const MyAccountScreen());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 25,
                        child: Image.asset('assets/images/settingperson.png')),
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
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
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
            ),
          ),
          ksizedbox10,
          InkWell(
            onTap: () {
              Get.to(() => AddGallery(
                  userid: profileController.profileData.first.id.toString()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 25,
                        child: Icon(
                          Icons.camera_alt,
                          color: kblue,
                          size: 27,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Text(
                        'Gallery',
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
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
            ),
          ),
          ksizedbox10,
          InkWell(
            onTap: () {
              Get.to(const BankDetailsScreen());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 25,
                        child: Image.asset(
                          'assets/images/settingbank.png',
                          fit: BoxFit.fill,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
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
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
            ),
          ),
          ksizedbox10,
          InkWell(
            onTap: () {
              Get.to(const DashBoardScreen());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 25,
                        child: Image.asset(
                          'assets/images/settingdasbord.png',
                          fit: BoxFit.fill,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
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
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
            ),
          ),
          ksizedbox10,
          InkWell(
            onTap: () {
              Get.to(const BusinessYourReferralScreen());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 25,
                        child: Image.asset('assets/images/settingreferal.png',
                            fit: BoxFit.fill)),
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
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
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
            ),
          ),
          ksizedbox10,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 25,
                        child: Image.asset(
                          'assets/images/settinghelps.png',
                          fit: BoxFit.fill,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
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
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
            ),
          ),
          ksizedbox10,
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
                      content: const Text(
                        "Are you sure want to logout?",
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
                                        style:
                                            primaryTextStyle(color: kOrange))),
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
                                    "Logout",
                                    style: primaryTextStyle(color: kwhite),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ksizedbox10
                      ],
                    );
                  });
              //Get.find<AuthController>().logout();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/settinglogout.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Text(
                        'Log out',
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
