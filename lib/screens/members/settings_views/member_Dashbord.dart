import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/my_account_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                        child:profileController.profileData.isEmpty ?
                         Image.asset('assets/images/settingprofile.png') : 
                         ClipRRect(
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
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 160,
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
                                'Your Coupons',
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
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/images/circle.png'),
                                Image.asset('assets/images/circle.png'),
                                Image.asset('assets/images/circle.png'),
                              ],
                            )),
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
                ),
                ksizedbox20,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 160,
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
                                'Your Referals',
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
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/images/circle.png'),
                                Image.asset('assets/images/circle.png'),
                                Image.asset('assets/images/circle.png'),
                              ],
                            )),
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
