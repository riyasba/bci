import 'package:flutter/material.dart';

class CouponDetailsPage extends StatefulWidget {
  const CouponDetailsPage({super.key});

  @override
  State<CouponDetailsPage> createState() => _CouponDetailsPageState();
}

class _CouponDetailsPageState extends State<CouponDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: size.width,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
