import 'package:bci/screens/bussiness/views/business/notification_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/wallet/bank_deatails.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constands/constands.dart';
import '../otcpayment/add_to_wallet.dart';

class WalletScreen_members extends StatefulWidget {
  const WalletScreen_members({super.key});

  @override
  State<WalletScreen_members> createState() => _WalletScreen_membersState();
}

class _WalletScreen_membersState extends State<WalletScreen_members> {
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
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    'Total Wallet',
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, right: 40),
                      child: Column(
                        children: [
                          Text(
                            'Total Wallet Amount',
                            style: TextStyle(color: kwhite, fontSize: 17.sp),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 70),
                            child: Text(
                              '₹1990.0',
                              style: TextStyle(fontSize: 21.sp, color: kwhite),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: InkWell(onTap: (){Get.to( AddWaletScreen());},
                        child: Container(
                          decoration: BoxDecoration(
                              color: kyellow,
                              border: Border.all(color: kOrange, width: 1)),
                          height: _mediaQuery.height>700?108:110.h,
                          width: _mediaQuery.width>700?90:95.w,
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
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Deposit \nCash',
                                style: TextStyle(fontSize: 15.sp, color: kwhite),
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
                    style: TextStyle(fontSize: 25.sp, color: kblue),
                  ),
                ),
                Image.asset('assets/images/transactionicon.png')
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Today Transaction',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 250.h,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: amountimage.length,
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
                                Image.asset(amountimage[index]),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 35, left: 10),
                                  child: Text(
                                    amounttitle[index].toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              right: 15,
                              top: 50,
                              child: Text(
                                amountcash[index].toString(),
                                style: TextStyle(
                                    color: index == 0 ? kOrange : kblue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                          Positioned(
                            left: 50,
                            top: 70,
                            child: Text(amountdate[index].toString()),
                          ),
                          Positioned(
                              left: 170,
                              top: 70,
                              child: Text(refno[index].toString()))
                        ],
                      ),
                    );
                  }),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'yesterday Transaction',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Container(
              height: 250,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: amountimage.length,
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
                                Image.asset(yesterdayamountimage[index]),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 35, left: 10),
                                  child: Text(
                                    yesterdayamounttitle[index].toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              right: 15,
                              top: 50,
                              child: Text(
                                amountcash[index].toString(),
                                style: TextStyle(
                                    color: index == 0 ? kOrange : kblue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                          Positioned(
                            left: 50,
                            top: 70,
                            child: Text(yesterdaydate[index].toString()),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ]),
    );
  }
}
