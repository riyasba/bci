import 'dart:io';

import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/screens/bussiness/views/business/business_home_screen.dart';
import 'package:bci/screens/bussiness/views/business/notification_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/bookings_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/setting_screen.dart';
import 'package:bci/screens/members/booking/booking.dart';
import 'package:bci/screens/members/settings_screen/settings_screen.dart';
import 'package:bci/screens/members/settings_views/settings_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/wallet_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeBottomnavigationBar extends StatefulWidget {
  int index;

  HomeBottomnavigationBar({super.key,this.index = 0});

  @override
  State<HomeBottomnavigationBar> createState() => _HomeBottomnavigationBarState();
}

class _HomeBottomnavigationBarState extends State<HomeBottomnavigationBar> {
  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(widget.index);
    setindex();
  }

  setindex(){
      selectedpage = widget.index;
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }

  final List1 = [
    BusinessHomeScreen(),
    const NotificationScreen(),
    const WalletScreen(),
    const BusinessBookingScreen(),
    const BusinessSettingScreen()
  ];

  int selectedpage = 0;

  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Home", korange,
        circleStrokeColor: Colors.white,
        labelStyle:
           const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    TabItem(Icons.notifications, "Notification", korange,
        circleStrokeColor: Colors.white,
        labelStyle:
          const  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    TabItem(Icons.wallet, "Wallet", korange,
        circleStrokeColor: Colors.white,
        labelStyle:
           const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    TabItem(Icons.book_online, "Booking", korange,
        circleStrokeColor: Colors.white,
        labelStyle:
           const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    TabItem(Icons.settings, "Settings", korange,
        circleStrokeColor: Colors.white,
        labelStyle:
          const  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
  ]);

  back(){
    showDialog(
                context: context,
                builder: (BuildContext context) {
                  return mAlertItem2;
                });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
           return back();
      },
      child: Scaffold(
          body: List1[selectedpage],
          // bottomNavigationBar: ConvexAppBar(
          //     backgroundColor: kblue,
          //     color: kwhite,
          //     style: TabStyle.reactCircle,
          //     items:const [
          //       TabItem(icon: Icons.home, title: 'Home'),
          //       TabItem(icon: Icons.search, title: 'Search'),
          //       TabItem(icon: Icons.wallet, title: 'Wallet'),
          //       TabItem(icon: Icons.book_online, title: 'Booking'),
          //       TabItem(icon: Icons.settings, title: 'Settings'),
          //     ],
          //     initialActiveIndex: selectedpage,
          //     onTap: (int index) {
          //       setState(() {
          //         selectedpage = index;
          //       });
          //     }),
          bottomNavigationBar: CircularBottomNavigation(
            barBackgroundColor: kblue,
            tabItems,
            controller: _navigationController,
            selectedPos: selectedpage,
            animationDuration: const Duration(milliseconds: 300),
            selectedCallback: (int? selectedPos) {
              setState(() {
                selectedpage = selectedPos ?? 0;
                // print(_navigationController.value);
              });
            },
          )),
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