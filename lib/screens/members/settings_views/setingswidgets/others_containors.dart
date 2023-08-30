import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'dart:math' as math;


class VendorCoupons extends StatefulWidget {
  const VendorCoupons({super.key});

  @override
  State<VendorCoupons> createState() => _CouponsState();

}

class _CouponsState extends State<VendorCoupons> {

  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    

    super.initState();
    profileController.redeemgetCoupons();

  }

 

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<ProfileController>(builder: (_) {
        return Container(
          //height: size.height * 0.55,
          child: profileController.redeemcouponsData.isEmpty
              ? const Center(
                  child: Text("No Coupons Available"),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: profileController.redeemcouponsData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: CouponCard(
                        shadow: Shadow(),
                        height: 150,
                        backgroundColor: Colors.white,
                        curveAxis: Axis.vertical,
                        firstChild: Container(
                          decoration: BoxDecoration(
                              color: Color((math.Random().nextDouble() *
                                          0xFFFFFF)
                                      .toInt())
                                  .withOpacity(1.0)),
                          child: profileController.redeemcouponsData[index].image == "null" ? 
                          Image.asset("assets/icons/coupon.jpg",fit: BoxFit.cover,) :
                           Image.network(profileController.redeemcouponsData[index].image,
                           fit: BoxFit.cover,
                          ),
                        ),
                        secondChild: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                          children: [
                           const Text(
                              "Coupon Code :",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              profileController
                                  .redeemcouponsData[index].couponcode,
                              style: primaryFont.copyWith(
                                  fontSize: 14,
                                  color: Color(
                                          (math.Random().nextDouble() *
                                                  0xFFFFFF)
                                              .toInt())
                                      .withOpacity(1.0),
                                  fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                              onTap: () {
                                // FlutterClipboard.copy(profileController
                                //         .redeemcouponsData[index].couponcode)
                                //     .then(
                                //   (value) => Fluttertoast.showToast(
                                //       msg: "Copy to clipboard",
                                //       toastLength: Toast.LENGTH_SHORT,
                                //       gravity: ToastGravity.CENTER,
                                //       timeInSecForIosWeb: 1,
                                //       backgroundColor: Colors.white,
                                //       textColor: Colors.black,
                                //       fontSize: 16.0),
                                //   //print("code copied")
                                // );
                              },
                              child: Container(
                                height: 25,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius:
                                        BorderRadius.circular(4)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Redeemed",
                                      style: primaryFont.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    
                  },
                ),
        );
      }),
    );
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = Color.fromARGB(255, 233, 230, 230)
      ..strokeWidth = size.width;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
