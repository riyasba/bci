import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/my_account_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../constands/constands.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  final settingsController = Get.find<SettingsController>();
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settingsController.getWalletList();
    profileController.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 158,
              color: kblue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
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
                    padding: const EdgeInsets.only(right: 120),
                    child: Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: GetBuilder<SettingsController>(
        builder: (_) {
          return ListView(
            shrinkWrap: true, scrollDirection: Axis.vertical, children: [
            Column(
              children: [
                Stack(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child:profileController.profileData.isEmpty ? Container() : Text(
                          'Hello, ${profileController.profileData.first.name}',
                          style: TextStyle(fontSize: 20, color: kblue),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: profileController.profileData.isEmpty
                              ? Image.asset('assets/images/settingprofile.png')
                              : Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(profileController
                                              .profileData.first.profilePicture)),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 56, left: 20),
                    child: InkWell(
                      onTap: () {
                        Get.to(const MyAccountScreen());
                      },
                      child: Row(
                        children: [
                          Text(
                            'View Profile',
                            style: TextStyle(color: kblue, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                        color: kwhite,
                        border: Border.all(
                          color: kblue,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Image(
                            image: AssetImage(
                              'assets/images/cirlewallet.png',
                            ),
                            fit: BoxFit.fitHeight,
                            height: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Text(
                            'Wallet Amount ',
                            style: TextStyle(fontSize: 18, color: kblue),
                          ),
                        ),
                        profileController.profileData.isEmpty ? const Text("0.0") : Text(
                          '₹ ${profileController.profileData.first.walletAmount}',
                          style: TextStyle(
                              fontSize: 18,
                              color: kblue,
                              fontWeight: FontWeight.bold),
                        ),
                        Image.asset('assets/images/dashboardforward.png')
                      ],
                    ),
                  ),
                ),
                ksizedbox40,
                GetBuilder<SettingsController>(
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: kwhite, boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset:const Offset(0.0, 0.75), blurRadius: 5, color: kgrey)
                        ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, top: 15),
                                  child: Text(
                                    'Earnings',
                                    style: TextStyle(fontSize: 20, color: kblue),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(right: 10, top: 15),
                                    child: Text(
                                      'view',
                                      style: TextStyle(color: kyellow, fontSize: 15),
                                    )),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: kOrange,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                        child: settingsController.getWalletData.isEmpty ? const Text("") : Text(
                                               settingsController.getWalletData.first.earnings.todayEarnings.toString(),
                                      style: TextStyle(color: kwhite),
                                    )),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: kOrange,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                        child: settingsController.getWalletData.isEmpty ? const Text("") : Text(
                                               settingsController.getWalletData.first.earnings.thisMonthEarnings.toString(),
                                      style: TextStyle(color: kwhite),
                                    )),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: kOrange,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                        child: settingsController.getWalletData.isEmpty ? const Text("") : Text(
                                               settingsController.getWalletData.first.earnings.totalEarnings.toString(),
                                      style: TextStyle(color: kwhite),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Today',
                                    style: TextStyle(color: kblue, fontSize: 14.5),
                                  ),
                                  Text(
                                    'Monthly',
                                    style: TextStyle(fontSize: 14.5, color: kblue),
                                  ),
                                  Text(
                                    'Total',
                                    style: TextStyle(color: kblue, fontSize: 14.5),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
                ksizedbox20,
                GetBuilder<SettingsController>(
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: kwhite, boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset:const  Offset(0.0, 0.75), blurRadius: 5, color: kgrey)
                        ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, top: 15),
                                  child: Text(
                                    'Bookings',
                                    style: TextStyle(fontSize: 20, color: kblue),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10, top: 15),
                                  child: Text(
                                    'view',
                                    style: TextStyle(color: kyellow, fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: kOrange,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                        child: settingsController.getWalletData.isEmpty ? const Text("") : Text(
                                               settingsController.getWalletData.first.bookings.todayBooking.toString(),
                                      style: TextStyle(color: kwhite),
                                    )),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: kOrange,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                        child: settingsController.getWalletData.isEmpty ? const Text("") : Text(
                                               settingsController.getWalletData.first.bookings.thisMonthBooking.toString(),
                                      style: TextStyle(color: kwhite),
                                    )),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: kOrange,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                        child: settingsController.getWalletData.isEmpty ? const Text("") : Text(
                                               settingsController.getWalletData.first.bookings.totalBooking.toString(),
                                      style: TextStyle(color: kwhite),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Today',
                                    style: TextStyle(color: kblue, fontSize: 14.5),
                                  ),
                                  Text(
                                    'Monthly',
                                    style: TextStyle(fontSize: 14.5, color: kblue),
                                  ),
                                  Text(
                                    'Total',
                                    style: TextStyle(color: kblue, fontSize: 14.5),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
                ksizedbox20,
                GetBuilder<SettingsController>(
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: kwhite, boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset:const Offset(0.0, 0.75), color: kgrey, blurRadius: 5)
                        ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, top: 15),
                                  child: Text(
                                    'Referrals',
                                    style: TextStyle(fontSize: 20, color: kblue),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10, top: 15),
                                  child: Text(
                                    'view',
                                    style: TextStyle(color: kyellow, fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: kOrange,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                        child: settingsController.getWalletData.isEmpty ? const Text("") : Text(
                                               settingsController.getWalletData.first.referrals.todayReferrals.toString(),
                                      style: TextStyle(color: kwhite),
                                    )),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: kOrange,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                        child: settingsController.getWalletData.isEmpty ? const Text("") : Text(
                                               settingsController.getWalletData.first.referrals.thisMonthReferrals.toString(),
                                      style: TextStyle(color: kwhite),
                                    )),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: kOrange,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                        child: settingsController.getWalletData.isEmpty ? const Text("") : Text(
                                               settingsController.getWalletData.first.referrals.totalReferrals.toString(),
                                      style: TextStyle(color: kwhite),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Today',
                                    style: TextStyle(color: kblue, fontSize: 14.5),
                                  ),
                                  Text(
                                    'Paid',
                                    style: TextStyle(fontSize: 14.5, color: kblue),
                                  ),
                                  Text(
                                    'Unpaid',
                                    style: TextStyle(color: kblue, fontSize: 14.5),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
                ksizedbox30
              ],
            ),
          ]);
        }
      ),
    );
  }
}
