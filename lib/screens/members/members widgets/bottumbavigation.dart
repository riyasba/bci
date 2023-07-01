import 'package:bci/constands/constands.dart';
import 'package:bci/screens/members/booking/booking.dart';
import 'package:bci/screens/members/settings_screen/settings_screen.dart';
import 'package:bci/screens/members/settings_views/settings_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/wallet_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import '../../../views/home_screen/wallet_screen.dart';
import '../../bussiness/views/home_screen/setting_screen.dart';
import '../../bussiness/views/home_screen/settings/my_account_screen.dart';
import '../home_screen/Members_home_screen.dart';
import '../liquer_screen/widget/add_buttton.dart';
import '../members_search_screen/members_search_screen.dart';
import '../wallet/Wallet_members.dart';

class HelloConvexAppBar extends StatefulWidget {
  @override
  State<HelloConvexAppBar> createState() => _HelloConvexAppBarState();
}

class _HelloConvexAppBarState extends State<HelloConvexAppBar> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: List1[selectedpage],
      bottomNavigationBar: ConvexAppBar(
          backgroundColor: kblue,
          color: kwhite,
          style: TabStyle.reactCircle,
          items:const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.search, title: 'Search'),
            TabItem(icon: Icons.wallet, title: 'Wallet'),
            TabItem(icon: Icons.book_online, title: 'Booking'),
            TabItem(icon: Icons.settings, title: 'Settings'),
          ],
          initialActiveIndex: selectedpage,
          onTap: (int index) {
            setState(() {
              selectedpage = index;
            });
          }),
    );
  }
}
