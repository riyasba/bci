import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/screens/bussiness/views/home_screen/coupons/view_history.dart';
import 'package:clipboard/clipboard.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../constands/constands.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  var couponController = TextEditingController();

  final authController = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.redeemptionCoupon();
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(250),
            child: ClipPath(
              clipper: SinCosineWaveClipper(),
              child: Container(
                height: 158,
                color: kblue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: kwhite,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'Coupon Redemption',
                        style: TextStyle(
                            fontSize: 23,
                            //fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset('assets/images/helps.png'),
                    )
                  ],
                ),
              ),
            )),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 15),
                  child: Text(
                    'VIEW HISTORY',
                    style: TextStyle(
                        fontSize: 23,
                        color: kblue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            ksizedbox20,

            GetBuilder<AuthController>(
              builder: (_) {
                return Container(
                  height: 300,
                  child: ListView.builder(
                              itemCount: authController.couponRedeemptionData.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: CouponCard(
                                    shadow:const Shadow(),
                                    height: 150,
                                    backgroundColor: Colors.white,
                                    curveAxis: Axis.vertical,
                                    firstChild: Container(
                                      decoration:const BoxDecoration(
                                          // color: Color((math.Random().nextDouble() *
                                          //             0xFFFFFF)
                                          //         .toInt())
                                            //  .withOpacity(1.0)
                                              ),
                                      child:authController.couponRedeemptionData.isEmpty ? Container() : Image.network(
                                        authController.couponRedeemptionData[index].image,fit: BoxFit.cover,
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
                                          authController.couponRedeemptionData[index].couponcode,
                                          style: primaryFont.copyWith(
                                              fontSize: 14,
                                              // color: Color(
                                              //         (math.Random().nextDouble() *
                                              //                 0xFFFFFF)
                                              //             .toInt())
                                              //     .withOpacity(1.0),
                                              fontWeight: FontWeight.w500),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // FlutterClipboard.copy(authController.couponRedeemptionData[index].couponcode)
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
              }
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            //   child: TextField(
            //     controller: couponController,
            //     decoration: InputDecoration(
            //         enabledBorder: OutlineInputBorder(
            //             borderSide: BorderSide(color: kblue)),
            //         border: OutlineInputBorder()),
            //   ),
            // ),
            // ksizedbox40,
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: kOrange,
            //         minimumSize:
            //             Size(MediaQuery.of(context).size.width * 0.9, 55)),
            //     onPressed: () {
            //       showDialog(
            //           context: context,
            //           builder: (context) {
            //             return Padding(
            //               padding: const EdgeInsets.only(top: 180, bottom: 120),
            //               child: Dialog(
            //                 child: Container(
            //                   height: _mediaQuery.height > 700 ? 400 : 350,
            //                   width: MediaQuery.of(context).size.width * 0.9,
            //                   child: Column(
            //                     children: [
            //                       Padding(
            //                         padding: const EdgeInsets.only(top: 30),
            //                         child: Image.asset(
            //                           'assets/images/coupondone.png',
            //                           width:
            //                               _mediaQuery.width > 700 ? 140 : 150,
            //                         ),
            //                       ),
            //                       ksizedbox20,
            //                       Text(
            //                         'Coupon Code Apply',
            //                         style: TextStyle(
            //                             fontSize: 25,
            //                             fontWeight: FontWeight.bold),
            //                       ),
            //                       SizedBox(
            //                         height: 10,
            //                       ),
            //                       Text(
            //                         'Your Coupon Code used Successful Applied',
            //                         style: TextStyle(fontSize: 14),
            //                       ),
            //                       SizedBox(
            //                         height: 5,
            //                       ),
            //                       Text('and submit your coupon complete',
            //                           style: TextStyle(fontSize: 14)),
            //                       ksizedbox20,
            //                       ElevatedButton(
            //                           style: ElevatedButton.styleFrom(
            //                               minimumSize: Size(
            //                                   MediaQuery.of(context)
            //                                           .size
            //                                           .width *
            //                                       0.5, 
            //                                   50),
            //                               backgroundColor: kOrange),
            //                           onPressed: () {
            //                             Get.back(); 
            //                           },
            //                           child: Text(
            //                             'DONE',
            //                             style: TextStyle(fontSize: 23),
            //                           ))
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             );
            //           });
            //     },
            //     child: Text(
            //       'APPLY',
            //       textAlign: TextAlign.center,
            //       style: TextStyle(fontSize: 20),
            //     )),
          ],
        ),
        // bottomNavigationBar: Padding(
        //     padding:
        //         const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        //     child: InkWell(
        //       onTap: () {
        //         Get.to(CouponViewHistory());
        //       },
        //       child: Container(
        //         height: 55,
        //         width: MediaQuery.of(context).size.width * 0.9,
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(4),
        //             color: kwhite,
        //             border: Border.all(color: kblue)),
        //         child: Center(
        //           child: Text('VIEW HISTORY',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                 fontSize: 22,
        //                 color: kblue,
        //               )),
        //         ),
        //       ),
          //  )
           // )
            );
  }
}
