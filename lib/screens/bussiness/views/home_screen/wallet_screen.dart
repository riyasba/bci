import 'package:bci/screens/bussiness/views/business/notification_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/wallet/bank_deatails.dart';
import 'package:custom_clippers/custom_clippers.dart';
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
          preferredSize: Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 158,
              color: kblue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
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
      body: ListView(physics: BouncingScrollPhysics(), children: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    'Total Wallet',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, right: 20),
                      child: Column(
                        children: [
                          Text(
                            'Total Wallet Amount',
                            style: TextStyle(color: kwhite, fontSize: 17.sp),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 30),
                            child:profileController.profileData.isNotEmpty? Text('₹${profileController.profileData.first.walletAmount}'
                              ,
                              style: TextStyle(fontSize: 21.sp, color: kwhite),
                            ):Padding(
                              padding: const EdgeInsets.only(top: 10,right: 30),
                              child: Text('₹ 0.0',
                              style: TextStyle(fontSize: 21.sp, color: kwhite), ),
                            ),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0.0, 0.75),
                            blurRadius: 7.0,
                            color: kyellow)
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: kOrange,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25),
                                        child: Text(
                                          'Add Bank Account to Withdraw',
                                          style: TextStyle(
                                              fontSize: 17, color: kblue),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: Size(170, 45),
                                          backgroundColor: kblue,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      onPressed: () {
                                        Get.to(BankDetailsScreen());
                                      },
                                      child: Text(
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
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: kyellow,
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
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Withdraw \nCash',
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 16.sp, color: kwhite),
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Text(
                    'Transaction History',
                    style: TextStyle(fontSize: 25, color: kblue),
                  ),
                ),
                Image.asset('assets/images/transactionicon.png')
              ],
            ),
            GetBuilder<AuthController>(builder: (_) {
              return Container(
                height: _mediaQuery.height * 0.4,
                child:authController.transactionHistorydata.isNotEmpty? ListView.builder(
                  shrinkWrap: true,
                    itemCount: authController.transactionHistorydata.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: kwhite,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        offset: Offset(0.0, 0.75),
                                        blurRadius: 1.0,
                                        color: kgrey)
                                  ]),
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  //Image.asset(amountimage[index]),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 35, left: 10),
                                    child: authController.transactionHistorydata.isNotEmpty? Text(
                                      authController
                                          .transactionHistorydata[index].type,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ):Text('No Found Data'),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                right: 15,
                                top: 50,
                                child:authController.transactionHistorydata.isNotEmpty? Text(
                                  authController
                                      .transactionHistorydata[index].amount,
                                  style: TextStyle(
                                      color: index == 0 ? kOrange : kblue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ):Text('No Found Data')),
                            Positioned(
                              left: 50,
                              top: 70,
                              child:authController.transactionHistorydata.isNotEmpty? Text(authController
                                  .transactionHistorydata[index].updatedAt
                                  .toString()):Text('No Found Data'),
                            ),
                            // Positioned(
                            //     left: 170,
                            //     top: 70,
                            //     child: Text(refno[index].toString()))
                          ],
                        ),
                      );
                    }):Center(child: Text('No Found Data')),
              );
            }),
          ],
        ),
      ]),
    );
  }
}
