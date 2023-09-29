import 'dart:io';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/screens/members/booking/booking.dart';
import 'package:bci/screens/members/settings_views/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../home_screen/Members_home_screen.dart';
import '../members_search_screen/members_search_screen.dart';
import '../wallet/Wallet_members.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

class MemberBottomNavBar extends StatefulWidget {
  int index;
  MemberBottomNavBar({this.index = 0});

  @override
  State<MemberBottomNavBar> createState() => _MemberBottomNavBarState();
}

class _MemberBottomNavBarState extends State<MemberBottomNavBar> {
  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedpage);
    setDefaultPage();
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }

  setDefaultPage() async {
    selectedpage = widget.index;
  }

  final List1 = [
    const Home_screen1(),
    MembersSearchScreen(),
    const WalletScreenMembers(),
    const MembersBooking(),
    const SettingScreen(),
  ];

  int selectedpage = 0;

  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Home", korange,
        circleStrokeColor: Colors.white,
        labelStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    TabItem(Icons.search, "Search", korange,
        circleStrokeColor: Colors.white,
        labelStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
  ]);

  back() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
            content: const Text(
              "Are you sure want to exit?",
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
                              style: TextStyle(color: kblue))),
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
                          color: kblue, borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "Exit",
                          style: TextStyle(color: kwhite),
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
      onWillPop: () {
        return back();
      },
      child: Scaffold(
          body: List1[selectedpage],
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
    title: Text("Confirmation", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
    content: Text(
      "Are you sure you want to Exit?",
      style: TextStyle(color: Colors.black),
    ),
    actions: [
      TextButton(
        child: Text(
          "Yes",
          style: TextStyle(color: kblue),
        ),
        onPressed: () {
          exit(0);
        },
      ),
      TextButton(
        child: Text("No", style: TextStyle(color: kblue)),
        onPressed: () {
          Get.back();
        },
      ),
    ],
  );
}
