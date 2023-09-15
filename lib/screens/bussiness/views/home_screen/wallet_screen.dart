import 'package:bci/constands/app_fonts.dart';
import 'package:bci/screens/bussiness/views/business/notification_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/bank_deatails.dart';
import 'package:bci/screens/bussiness/views/home_screen/wallet/enter_amount_for_withdrawal_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constands/constands.dart';
import '../../../../controllers/auth_controllers.dart';
import '../../../../controllers/profile_controller.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.getProfile();
    authController.transactionHistoryDetails();
  }

  final profileController = Get.find<ProfileController>();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 158,
              color: kblue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                   Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: kwhite,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Text(
                      'Wallet',
                      style: TextStyle(
                          fontSize: 23,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                        onTap: () {
                          Get.to(NotificationScreen());
                        },
                        child:
                            Image.asset('assets/images/notificationimage.png')),
                  )
                ],
              ),
            ),
          )),
      body: GetBuilder<ProfileController>(builder: (_) {
        return ListView(physics: const BouncingScrollPhysics(), children: [
          Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Total Wallet',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: Container(
                      height: 110.h,
                      width: 235.w,
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
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 20, left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Wallet Amount',
                              style: TextStyle(color: kwhite, fontSize: 17.sp),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, right: 30),
                              child: profileController.profileData.isNotEmpty
                                  ? Text(
                                      '₹${profileController.profileData.first.walletAmount}',
                                      style: TextStyle(
                                          fontSize: 21.sp, color: kwhite),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 30),
                                      child: Text(
                                        '₹ 0.0',
                                        style: TextStyle(
                                            fontSize: 21.sp, color: kwhite),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (profileController
                                  .profileData.first.bankAccountNumber !=
                              "" &&
                          profileController.profileData.first.bankAccountName !=
                              "" &&
                          profileController.profileData.first.ifscCode != "") {
                        Get.to(() => EnterAmountForWithdrawalScreen());
                      } else {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, bottom: 2),
                                child: Container(
                                  height: 130,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 25),
                                            child: Text(
                                              'Add Bank Account to Withdraw',
                                              style: TextStyle(
                                                  fontSize: 17, color: kblue),
                                            ),
                                          ),
                                        ],
                                      ),
                                     const SizedBox(
                                        height: 25,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(170, 45),
                                              backgroundColor: kblue,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15))),
                                          onPressed: () {
                                            Get.to(const BankDetailsScreen());
                                          },
                                          child: const Text(
                                            'Add',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: kyellow,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: kOrange, width: 1)),
                            height: _mediaQuery.height > 700 ? 108.h : 110.h,
                            width: _mediaQuery.width > 700 ? 90.w : 95.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 11),
                                  child: CircleAvatar(
                                    backgroundColor: kwhite,
                                    radius: 25.h,
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
                                  'Withdraw \nCash',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontSize: 14.sp, color: kwhite),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
             const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        'Transaction History',
                        style: TextStyle(
                            fontSize: 20,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    // Image.asset('assets/images/transactionicon.png')
                  ],
                ),
              ),
              GetBuilder<AuthController>(builder: (_) {
                return Container(
                  height: _mediaQuery.height * 0.4,
                  child: authController.transactionHistorydata.isNotEmpty
                      ? ListView.builder(
                      itemCount: authController.transactionHistorydata.length,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      authController
                                                  .transactionHistorydata[index]
                                                  .status ==
                                              "credit"
                                          ? Text(
                                              "Credited",
                                              style: primaryFont.copyWith(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          : Text(
                                              "Debited",
                                              style: primaryFont.copyWith(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      authController
                                                  .transactionHistorydata[index]
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
                                                  fontWeight: FontWeight.w500),
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
                                                  fontWeight: FontWeight.w500),
                                            )
                                    ],
                                  ),
                                  authController.transactionHistorydata[index]
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
                                              fontSize: 16, color: Colors.red),
                                        )
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                      : Center(child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                         Image.asset('assets/images/walletnotavailableimage.png',
                         fit: BoxFit.fitHeight,height: 200,),
                         ksizedbox20,
                         Text('No Wallet Data',
                         style: TextStyle(
                          fontSize: 16.sp,
                          color: kblue,
                        
                         ),)
                         ])),
                );
              }),
            ],
          ),
        ]);
      }),
    );
  }
}
