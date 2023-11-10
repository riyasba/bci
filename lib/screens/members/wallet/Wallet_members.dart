import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constands/constands.dart';
import '../otcpayment/add_to_wallet.dart';

class WalletScreenMembers extends StatefulWidget {
  const WalletScreenMembers({super.key});

  @override
  State<WalletScreenMembers> createState() => _WalletScreenMembersState();
}

class _WalletScreenMembersState extends State<WalletScreenMembers> {
  int index = 0;
  List amountimage = [
    'assets/images/amounticon.png',
    'assets/images/amounticon.png',
  ];
  List amounttitle = ['Luck Draw registeration', 'Wallet Topup'];
  List amountcash = ['-  ₹4500', ' +  ₹500'];
  List amountdate = [
    '20/04/2023',
    '20/04/2023',
  ];
  List refno = [
    'Ref.no:654',
    'Ref.no:25',
  ];
  List yesterdayamountimage = [
    'assets/images/amounticon.png',
    'assets/images/amounticon.png',
  ];
  List yesterdayamounttitle = [
    'Money Send to Ankit',
    'Money Received From Tom'
  ];
  List yesterdaydate = ['20/03/2023', '20/03/2023'];

  final authController = Get.find<AuthController>();
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.getProfile();
    authController.transactionHistoryDetails();
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
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
                      'Wallet',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 20),
                  //   child: InkWell(
                  //       onTap: () {
                  //         Get.to(const NotificationScreen());
                  //       },
                  //       child:
                  //           Image.asset('assets/images/notificationimage.png')),
                  // )
                ],
              ),
            ),
          )),
      body: GetBuilder<ProfileController>(builder: (_) {
        return ListView(physics: const BouncingScrollPhysics(), children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      'Total Wallet',
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Container(
                      height: 110.h,
                      width: 245.w,
                      child:  Padding(
                        padding: EdgeInsets.only(top: 20, right: 40, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Wallet Amount',
                              style: TextStyle(color: kwhite, fontSize: 17.sp),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, right: 70),
                              child: profileController.profileData.isEmpty
                                  ? Text("")
                                  : Text(
                                      '₹${profileController.profileData.first.walletAmount}',
                                      style: TextStyle(
                                          fontSize: 21.sp, color: kwhite),
                                    ),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: const Offset(0.0, 0.75),
                              blurRadius: 7.0,
                              color: kyellow)
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: kOrange,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: InkWell(
                          onTap: () {
                            Get.to(const AddWaletScreen());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: kyellow,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: kOrange, width: 1)),
                            height: _mediaQuery.height > 700 ? 108 : 110.h,
                            width: _mediaQuery.width > 700 ? 90 : 95.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 11),
                                  child: CircleAvatar(
                                    backgroundColor: kwhite,
                                    radius: 22.r,
                                    child: Image.asset(
                                      'assets/images/cirlewallet.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Deposit \nCash',
                                  style:
                                      TextStyle(fontSize: 15.sp, color: kwhite),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: kblue),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Reward points",
                          style: primaryFont.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/icons/reward_coin.png",
                              height: 17,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                           if(profileController.profileData.isNotEmpty) Text(
                              profileController.profileData.first.rewardPoints,
                              style: primaryFont.copyWith(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Transaction History',
                      style: TextStyle(fontSize: 25.sp, color: kblue),
                    ),
                  ),
                  // Image.asset('assets/images/transactionicon.png')
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              GetBuilder<AuthController>(builder: (_) {
                return Container(
                  height: _mediaQuery.height * 0.4,
                  child: authController.transactionHistorydata.isNotEmpty
                      ? ListView.builder(
                          itemCount:
                              authController.transactionHistorydata.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 65,
                                width: _mediaQuery.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.grey.withOpacity(0.5))
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 7),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          authController
                                                      .transactionHistorydata[
                                                          index]
                                                      .status ==
                                                  "credit"
                                              ? Text(
                                                  "Credited",
                                                  style: primaryFont.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              : Text(
                                                  "Debited",
                                                  style: primaryFont.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          authController
                                                      .transactionHistorydata[
                                                          index]
                                                      .status ==
                                                  "credit"
                                              ? Text(
                                                  "Credited on ${formatDate(authController.transactionHistorydata[index].createdAt, [
                                                        dd,
                                                        "-",
                                                        mm,
                                                        "-",
                                                        yyyy,
                                                        " ",
                                                        hh,
                                                        ":",
                                                        nn,
                                                        " ",
                                                        am
                                                      ])}",
                                                  style: primaryFont.copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              : Text(
                                                  "Debited on ${formatDate(authController.transactionHistorydata[index].createdAt, [
                                                        dd,
                                                        "-",
                                                        mm,
                                                        "-",
                                                        yyyy,
                                                        " ",
                                                        hh,
                                                        ":",
                                                        nn,
                                                        " ",
                                                        am
                                                      ])}",
                                                  style: primaryFont.copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                        ],
                                      ),
                                      authController
                                                  .transactionHistorydata[index]
                                                  .status ==
                                              "credit"
                                          ? Text(
                                              "+ ₹${authController.transactionHistorydata[index].amount}",
                                              style: primaryFont.copyWith(
                                                  fontSize: 16,
                                                  color: Colors.green),
                                            )
                                          : Text(
                                              "- ₹${authController.transactionHistorydata[index].amount}",
                                              style: primaryFont.copyWith(
                                                  fontSize: 16,
                                                  color: Colors.red),
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  'assets/images/walletnotavailableimage.png'),
                              ksizedbox20,
                              Text(
                                'No Transaction History',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: kblue),
                              )
                            ],
                          ),
                        ),
                );
              }),
            ],
          ),
        ]);
      }),
    );
  }
}
