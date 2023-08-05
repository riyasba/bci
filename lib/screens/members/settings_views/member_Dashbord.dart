import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/my_account_screen.dart';
import 'package:bci/screens/members/coupen/coupons_screen.dart';
import 'package:bci/screens/members/settings_views/your_refferal_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../../constands/constands.dart';

class DashBoardScreenMenbers extends StatefulWidget {
  const DashBoardScreenMenbers({super.key});

  @override
  State<DashBoardScreenMenbers> createState() =>
      _DashBoardScreenMenbersState();
}

class _DashBoardScreenMenbersState extends State<DashBoardScreenMenbers> {

  final settingController = Get.find<SettingsController>();
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.getProfile();
    settingController.getWalletList();
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
                    padding: EdgeInsets.only(right: 120),
                    child: Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: GetBuilder<ProfileController>(
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
                        child:profileController.profileData.isEmpty
                          ? Container()
                          : Text(
                          'Hello, ${profileController.profileData.first.name}',
                          style: TextStyle(fontSize: 20, color: kblue),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: profileController.profileData.isEmpty ?
                         Image.asset('assets/images/settingprofile.png') : 
                         profileController.profileData.first.profilePicture.isEmpty ? Image.asset(
                                      'assets/images/settingprofile.png') : ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                           child: Image.network(
                            profileController.profileData.first.profilePicture,
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                            ),
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
                        Text(
                          '₹ 1.00',
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
                     Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                       child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Your Coupons',
                                style: TextStyle(fontSize: 20, color: kblue,fontWeight: FontWeight.w500),
                              ),
                              InkWell(
                                onTap: (){
                                  Get.to(const CoupensMembers());
                                },
                                child: Text(
                                  'view',
                                  style: TextStyle(color: kyellow, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                     ),
                GetBuilder<SettingsController>(
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: kwhite, 
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset:const Offset(0.0, 0.5), blurRadius: 2, color: kgrey)
                        ]),
                        child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    CircularPercentIndicator(
                                       radius: 35.0,
                                       lineWidth: 5.0,
                                       animation: true,
                                       percent: 0.4,
                                       center:settingController.getWalletData.isEmpty ? const Text("") : Text(settingController.getWalletData.first.coupon.totalCouponCodes.toString(),
                                       style: TextStyle(color: kblue,fontWeight: FontWeight.w400,fontSize: 18),),
                                       circularStrokeCap: CircularStrokeCap.round,
                                       backgroundColor: kblue,
                                       progressColor: kOrange,
                                      ),
                                      Text(
                                'Total',
                                style: TextStyle(color: kblue, fontSize: 14.5),
                              ),
                                  ],
                                ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      CircularPercentIndicator(
                                       radius: 35.0,
                                       lineWidth: 5.0,
                                       animation: true,
                                       percent: 0.3,
                                       center:settingController.getWalletData.isEmpty ? const Text("") : Text(settingController.getWalletData.first.coupon.thisMonthUsed.toString(),
                                       style: TextStyle(color: kblue,fontWeight: FontWeight.w400,fontSize: 18),),
                                       circularStrokeCap: CircularStrokeCap.round,
                                       backgroundColor: kblue,
                                       progressColor: kOrange,
                                      ),
                                      Text(
                                'Used',
                                style: TextStyle(color: kblue, fontSize: 14.5),
                              ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      CircularPercentIndicator(
                                       radius: 35.0,
                                       lineWidth: 5.0,
                                       animation: true,
                                       percent: 0.2,
                                       center:settingController.getWalletData.isEmpty ? const Text("") : Text(settingController.getWalletData.first.coupon.todayUsed.toString(),
                                       style: TextStyle(color: kblue,fontWeight: FontWeight.w400,fontSize: 18),),
                                       circularStrokeCap: CircularStrokeCap.round,
                                       backgroundColor: kblue,
                                       progressColor: kOrange,
                                      ),
                                      Text(
                                'Pending',
                                style: TextStyle(color: kblue, fontSize: 14.5),
                              ),
                                    ],
                                  ),
                              ],
                            )),
                      ),
                    );
                  }
                ),
                ksizedbox20,
                Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                       child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Your Referrals',
                                style: TextStyle(fontSize: 20, color: kblue,fontWeight: FontWeight.w500),
                              ),
                              InkWell(
                                onTap: (){
                                  Get.to(const YourReferralScreen());
                                },
                                child: Text(
                                  'view',
                                  style: TextStyle(color: kyellow, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                     ),
                GetBuilder<SettingsController>(
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: kwhite, 
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset:const Offset(0.0, 0.5), blurRadius: 2, color: kgrey)
                        ]),
                        child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    CircularPercentIndicator(
                                       radius: 35.0,
                                       lineWidth: 5.0,
                                       animation: true,
                                       percent: 0.1,
                                       center:settingController.getWalletData.isEmpty ? const Text("") : Text(settingController.getWalletData.first.referrals.totalReferrals.toString(),
                                       style: TextStyle(color: kblue,fontWeight: FontWeight.w400,fontSize: 18),),
                                       circularStrokeCap: CircularStrokeCap.round,
                                       backgroundColor: kblue,
                                       progressColor: kOrange,
                                      ),
                                      Text(
                                'Total',
                                style: TextStyle(color: kblue, fontSize: 14.5),
                              ),
                                  ],
                                ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      CircularPercentIndicator(
                                       radius: 35.0,
                                       lineWidth: 5.0,
                                       animation: true,
                                       percent: 0.3,
                                       center:settingController.getWalletData.isEmpty ? const Text("") : Text(settingController.getWalletData.first.referrals.todayReferrals.toString(),
                                       style: TextStyle(color: kblue,fontWeight: FontWeight.w400,fontSize: 18),),
                                       circularStrokeCap: CircularStrokeCap.round,
                                       backgroundColor: kblue,
                                       progressColor: kOrange,
                                      ),
                                      Text(
                                'Used',
                                style: TextStyle(color: kblue, fontSize: 14.5),
                              ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      CircularPercentIndicator(
                                       radius: 35.0,
                                       lineWidth: 5.0,
                                       animation: true,
                                       percent: 0.2,
                                       center:settingController.getWalletData.isEmpty ? const Text("") : Text(settingController.getWalletData.first.referrals.thisMonthReferrals.toString(),
                                       style: TextStyle(color: kblue,fontWeight: FontWeight.w400,fontSize: 18),),
                                       circularStrokeCap: CircularStrokeCap.round,
                                       backgroundColor: kblue,
                                       progressColor: kOrange,
                                      ),
                                      Text(
                                'Pending',
                                style: TextStyle(color: kblue, fontSize: 14.5),
                              ),
                                    ],
                                  ),
                              ],
                            )),
                      ),
                    );
                  }
                ),
                ksizedbox20,
                ksizedbox30
              ],
            ),
          ]);
        }
      ),
    );
  }
}
