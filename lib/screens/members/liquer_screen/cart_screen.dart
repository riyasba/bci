import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/screens/members/liquer_screen/widget/order_widget.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constands/constands.dart';
import '../../bussiness/views/business/notification_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getCartdetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kwhite  ,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: Get.back,
                        child:
                            Image.asset('assets/images/chevron-left (2).png')),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'Orders',
                        style: TextStyle(
                            fontSize: 20,
                            //  fontWeight: FontWeight.bold,
                            color: kwhite),
                      ),
                    ),
                   IconButton(onPressed: (){Get.to(NotificationScreen());}, icon:   Icon(
                    Icons.notifications,
                    color: kwhite,
                  ))
                  ],
                ),
              ),
            ),
          )),
      body: Column(
        children: [
          Orders(
            bottleimg: 'assets/images/Group 5831.png',
          ),
          Orders(
            bottleimg: 'assets/images/Group 5833.png',
          ),
         
          Divider(thickness: 1,),
          Expanded(
              child: Container(
            height: 100.h,
            width: double.infinity,
            color: kwhite,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   // ksizedbox40,
                    Text(
                      'Support',
                      style:
                          TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
                    ),
                    ksizedbox10,
                    Text(
                      'Member ID Number:',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: korange),
                    ),
                    Text(
                      'BCI123456QWE',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    ksizedbox10,
                    Text(
                      'Phone Number:',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: korange),
                    ),
                    Text(
                      '92345 43453',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    ksizedbox10,
                    Text(
                      'Delivery Address:',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: korange),
                    ),
                    Text(
                      '2A,Street Nager, Anna Nagar, Chennai, 600021.',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ]),
            ),
          ))
        ],
      ),
    );
  }
}
