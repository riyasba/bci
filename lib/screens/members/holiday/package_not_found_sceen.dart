import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PackageNotFoundScreen extends StatefulWidget {
  const PackageNotFoundScreen({super.key});

  @override
  State<PackageNotFoundScreen> createState() => _PackageNotFoundScreenState();
}

class _PackageNotFoundScreenState extends State<PackageNotFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/icons/animation_lktfqljw.json"),
          const Text("Package not found"),
        ],
      ),
    );
  }
}