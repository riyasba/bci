import 'dart:io';
import 'package:bci/constands/constands.dart';
import 'package:bci/screens/members/booking/booking.dart';
import 'package:bci/screens/members/settings_views/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
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

  setDefaultPage() async{
    selectedpage = widget.index;
  }

  final List1 = [
    const Home_screen1(),
    MembersSearchScreen(
      title: 'Search Result',
      items: const ['Item 1', 'Item 2', 'Item 3', 'Item 4'],
    ),
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
