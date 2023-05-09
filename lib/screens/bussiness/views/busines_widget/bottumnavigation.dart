import 'package:bci/constands/constands.dart';
import 'package:bci/screens/bussiness/views/home_screen/bookings_screen.dart';
import 'package:bci/screens/bussiness/views/home_screen/setting_screen.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bci/screens/bussiness/views/business/business_home_screen.dart';


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: List2[selectedpage],
      bottomNavigationBar: ConvexAppBar(
          activeColor:korange,

          backgroundColor: kblue,
          color: kwhite,
          style: TabStyle.reactCircle,

          items: [
            TabItem(icon: Icons.home, title: 'Home',),
            TabItem(
              icon: ImageIcon(
                AssetImage(
                  'assets/images/notificationimage.png',
                ),
                color: selectedpage == 1 ? kwhite : kwhite,
              ),
              title: 'Notification',
            ),
            TabItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/images/bottomwallet.png',
                  ),
                  color: selectedpage == 2 ? kwhite : kwhite,
                ),
                title: 'Wallet'),
            TabItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/images/bottombooking.png',
                  ),
                  color: selectedpage == 3 ? kwhite : kwhite,
                ),
                title: 'Booking'),
            TabItem(
              
                icon: ImageIcon(
                  
                  AssetImage(
                    'assets/images/bottomsetting.png',
                    
                  ),
                  color: selectedpage == 4 ? kwhite : kwhite,
                  
                ),
                title: 'Settings'),
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
