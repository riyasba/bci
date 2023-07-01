import 'package:bci/constands/constands.dart';
import 'package:bci/screens/members/booking/booking.dart';
import 'package:bci/screens/members/settings_screen/settings_screen.dart';
import 'package:bci/screens/members/settings_views/settings_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/wallet_screen.dart';
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import '../../../views/home_screen/wallet_screen.dart';
import '../../bussiness/views/home_screen/setting_screen.dart';
import '../../bussiness/views/home_screen/settings/my_account_screen.dart';
import '../home_screen/Members_home_screen.dart';
import '../liquer_screen/widget/add_buttton.dart';
import '../members_search_screen/members_search_screen.dart';
import '../wallet/Wallet_members.dart';

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

class HelloConvexAppBar extends StatefulWidget {
  @override
  State<HelloConvexAppBar> createState() => _HelloConvexAppBarState();
}

class _HelloConvexAppBarState extends State<HelloConvexAppBar> {
  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedpage);
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }

  final List1 = [
    const Home_screen1(),
    MembersSearchScreen(
      title: 'Search Result',
      items: const ['Item 1', 'Item 2', 'Item 3', 'Item 4'],
    ),
    const WalletScreen_members(),
    const MembersBooking(),
    const SettingScreen(),
  ];

  int selectedpage = 0;

  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Home", korange,
        circleStrokeColor: Colors.white,
        labelStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    TabItem(Icons.search, "Search", korange,
        circleStrokeColor: Colors.white,
        labelStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    TabItem(Icons.wallet, "Wallet", korange,
        circleStrokeColor: Colors.white,
        labelStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    TabItem(Icons.book_online, "Booking", korange,
        circleStrokeColor: Colors.white,
        labelStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    TabItem(Icons.settings, "Settings", korange,
        circleStrokeColor: Colors.white,
        labelStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          animationDuration: Duration(milliseconds: 300),
          selectedCallback: (int? selectedPos) {
            setState(() {
              selectedpage = selectedPos ?? 0;
              // print(_navigationController.value);
            });
          },
        ));
  }
}
