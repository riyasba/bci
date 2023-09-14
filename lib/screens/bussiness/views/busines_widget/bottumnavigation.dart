import 'dart:io';

import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/screens/bussiness/views/home_screen/bookings_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/setting_screen.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bci/screens/bussiness/views/business/business_home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';


import '../business/notification_screen.dart';
import '../home_screen/wallet_screen.dart';

// import '../business/notification_screen.dart';
// import '../home_screen/wallet_screen.dart';

class HomeBottomnavigationBar extends StatefulWidget {
  int index;
  
    HomeBottomnavigationBar({
       this.index = 0
    });
  
  @override
  State<HomeBottomnavigationBar> createState() => _HomeBottomnavigationBarState();
}

class _HomeBottomnavigationBarState extends State<HomeBottomnavigationBar> {
  final List2 = [
    BusinessHomeScreen(),
    NotificationScreen(),
    WalletScreen(),
    BusinessBookingScreen(),
    BusinessSettingScreen()
  ];

  int selectedpage = 0;
@override
  void initState() {
    
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedpage=widget.index;
    });
  }

  back(){
    showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.white,
                        title: Column(
                          children: [
                            Image.asset('assets/icons/exit.png'),
                            // Text("Comeback Soon!",
                            //     style: TextStyle(
                            //         fontSize: 25.sp,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.black)),
                          ],
                        ),
                        content:const Text(
                          "Are you sure Want to Exit?",
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
                                              color: kblue))),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                 exit(0);
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: kblue,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      "Exit",
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
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
       return back();
      },
      child: Scaffold(
        body: List2[selectedpage],
        bottomNavigationBar: StyleProvider(
          style: Style(),
          child: ConvexAppBar(
              activeColor:kwhite,
        
              backgroundColor: kblue,
              color: kwhite,
              style: TabStyle.reactCircle,
        
              items: [
               const TabItem(
                  icon: Icons.home, title: 'Home'),
                TabItem(
                  icon: ImageIcon(
                   const AssetImage(
                      'assets/images/notificationimage.png',
                    ),
                    color: selectedpage == 1 ?kblue : kwhite,
                  ),
                  title: 'Notification',
                ),
                TabItem(
                    icon: ImageIcon(
                     const AssetImage(
                        'assets/images/bottomwallet.png',
                      ),
                      color: selectedpage == 2 ? kblue : kwhite,
                    ),
                    title: 'Wallet'),
                TabItem(
                    icon: ImageIcon(
                   const   AssetImage(
                        'assets/images/bottombooking.png',
                      ),
                      color: selectedpage == 3 ? kblue : kwhite,
                    ),
                    title: 'Booking'),
                TabItem(
                  
                    icon: ImageIcon(
                      
                    const  AssetImage(
                        'assets/images/bottomsetting.png',
                        
                      ),
                      color: selectedpage == 4 ? kblue : kwhite,
                      
                    ),
                    title: 'Settings'),
              ],
              initialActiveIndex: selectedpage,
              onTap: (int index) {
                setState(() {
                  selectedpage = index;
                });
              }),
        ),
      ),
    );
  }

 AlertDialog mAlertItem2 = AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Confirmation", style: boldTextStyle(color: Colors.black)),
      content: Text(
        "Are you sure you want to Exit?",
        style: secondaryTextStyle(color: Colors.black),
      ),
      actions: [
        TextButton(
          child: Text(
            "Yes",
            style: primaryTextStyle(color: kblue),
          ),
          onPressed: () {
           exit(0);
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

class p1 extends StatelessWidget {
  const p1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class p2 extends StatelessWidget {
  const p2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class p3 extends StatelessWidget {
  const p3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class p4 extends StatelessWidget {
  const p4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class p5 extends StatelessWidget {
  const p5({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}



class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 20;

  
  @override
  TextStyle textStyle(Color color,String ) {
    return TextStyle(fontSize: 12.sp, color: color);
  }

}