import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/plans_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/screens/members/settings_views/support_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MySubcriptionScreen extends StatefulWidget {
  const MySubcriptionScreen({super.key});

  @override
  State<MySubcriptionScreen> createState() => _MySubcriptionScreenState();
}

class _MySubcriptionScreenState extends State<MySubcriptionScreen> {

  final plansController = Get.find<PlanController>();
  final profileController = Get.find<ProfileController>();
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.getProfile();
    plansController.getPlanDetails(id: int.parse(profileController.planid.value));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: const Color(0xffF9F8FD),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150.h,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Padding(
                      padding:const EdgeInsets.only(right: 20),
                      child: Text(
                        'Subcriptions',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color:const Color(0xffF9F8FD)),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(const SupportScreen());
                      },
                      child: Image.asset('assets/images/helps.png'))
                  ],
                ),
              ),
            ),
          )),
          body: GetBuilder<PlanController>(
            builder: (_) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Column(
                    children: [
                      plansController.subscribePlansData.isEmpty ? Image(image: AssetImage("assets/images/Group 4930.png"),height: 200,) :
                      Image.network(plansController.subscribePlansData.first.cardImg,height: 200,),
                      //const Image(image: AssetImage("assets/images/Group 4930.png"),height: 200,),
                      ksizedbox10,
                      plansController.subscribePlansData.isEmpty? Container() : Text(plansController.subscribePlansData.first.title,
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color:kblue),
                            ),
                            ksizedbox10,
                            Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: kgrey),
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(
                                child:plansController.subscribePlansData.isEmpty? Container() : Text(double.parse(plansController.subscribePlansData.first.saleAmount).toStringAsFixed(2),
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color:kOrange),
                            ), 
                              ),
                            ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 350,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: kblue,
                          borderRadius:const BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                              'Subcribe Details:',
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color:const Color(0xffF9F8FD)),
                            ),
                            ksizedbox10,
                            // const Icon(CupertinoIcons.suit_diamond,color: Colors.white,),
                              plansController.subscribePlansData.isEmpty? Container() : Container(
                                width: size.width,
                                child: Text(plansController.subscribePlansData.first.planDescription,
                                    maxLines: 13,
                                   style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color:const Color(0xffF9F8FD)),
                                                      ),
                              ),
                            
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          ),
    );
  }
}