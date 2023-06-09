import 'package:bci/screens/bussiness/views/busines_widget/bottumnavigation.dart';
import 'package:bci/screens/members/members%20widgets/bottumbavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constands/image_string.dart';
import '../langing_screen/landing_screen.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();

    checkForAuth();
  }

  toHomePage() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.offAll(
      () => HomeBottomnavigationBar(),
    );
  }

  toHomePageMember() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.offAll(
      () => HelloConvexAppBar(),
    );
  }

  toLoginPage() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.offAll(
      () => landing_screen(),
    );
  }

  checkForAuth() async {
    final prefs = await SharedPreferences.getInstance();
    String? authtoken = prefs.getString("auth_token");
    String? role = prefs.getString("role");
    print("Token is here");
    print(authtoken);
    if (authtoken == "null" || authtoken == null) {
      toLoginPage();
    } else {
      if (role == "0") {
        toHomePageMember();
      } else {
        toHomePage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Image.asset(splashImage),
        ),
      ),
    );
  }
}
