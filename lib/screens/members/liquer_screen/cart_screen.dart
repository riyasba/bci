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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kwhite  ,
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
          GetBuilder<HomeController>(
            builder: (_) {
              return Container(
                height: size.height * 0.5,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeController.cartListData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                      width: double.infinity,
                      height: 110,
                      decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                      BoxShadow(
                         color: kgrey,
                         blurRadius: 0.5,
                        ),
                              ]
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.network(
                                          homeController.cartListData[index].image,
                                          height: 50,
                                          width: 60,
                                          fit: BoxFit.cover,
                                            ),
                                             kwidth10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              homeController.cartListData[index].serviceName,
                              style:const TextStyle(
                                  fontSize: 20,color: Colors.black, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 230,
                              child: Text(homeController.cartListData[index].description,maxLines: 3,)),
                            Text("Qty: ${homeController.cartListData[index].quantity}"),
                          ],
                        ),
                      ],
                         ),
                                      Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                  homeController.deleteToCart(serviceid: homeController.cartListData[index].serviceId.toString());
                                                },
                                                child:const Icon(Icons.delete,color: Colors.redAccent,)),
                                              ksizedbox10,
                                              Text(
                                        '₹ ${homeController.cartListData[index].price}',
                                         style: TextStyle(
                                         fontSize: 17.sp,
                                         fontWeight: FontWeight.w600,
                                        color: kyellow),
                                      ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                    );
                  },
                  ),
              );
            }
          ),
         
         
          const Divider(thickness: 1,),
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
          )),
          InkWell(
            onTap: (){
              for(int i = 0; i < homeController.cartListData.length; i++){
                homeController.addBooking(
                serviceid: homeController.cartListData[i].serviceId, 
                qty: homeController.cartListData[i].quantity, 
                offerOrCoupon: "", 
                couponcode: "", 
                amount: homeController.cartListData[i].price
                );
              }
              
            },
            child: Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                color: kblue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text("Book Now",
                style: TextStyle(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
