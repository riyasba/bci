import 'package:bci/screens/members/members%20widgets/bottumbavigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoadingWidgets extends StatefulWidget {
  const LoadingWidgets({super.key});

  @override
  State<LoadingWidgets> createState() => _LoadingWidgetsState();
}

class _LoadingWidgetsState extends State<LoadingWidgets> {
  @override
  void initState() {
    super.initState();
    redirectToNext();
  }

  redirectToNext() async {
    await Future.delayed(const Duration(seconds: 3));

    Get.offAll(() => MemberBottomNavBar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.asset("assets/icons/96081-successful-animation.json",
              height: 200, fit: BoxFit.fitHeight, repeat: false)),
    );
  }
}
