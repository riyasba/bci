import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/plans_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paged_vertical_calendar/utils/date_utils.dart';

class MySubcriptionScreen extends StatefulWidget {
  const MySubcriptionScreen({super.key});

  @override
  State<MySubcriptionScreen> createState() => _MySubcriptionScreenState();
}

class _MySubcriptionScreenState extends State<MySubcriptionScreen> {
  final plansController = Get.find<PlanController>();
  final profileController = Get.find<ProfileController>();
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setDefault();
  }

  setDefault() async {
    await profileController.getProfile();
    if (profileController.planid.value != "") {
      await plansController.getPlanDetails(
          id: int.parse(profileController.planid.value));
    }

    setState(() {
      isLoading = false;
    });
  }


  getCardNumber(String carNum){
      // Initialize an empty string to accumulate the formatted result
  String formattedResult = "";

  // Split the string into groups of 4 characters each and accumulate them with spaces
  for (int i = 0; i < carNum.length; i += 4) {
    formattedResult += carNum.substring(i, i + 4) + "  ";
  }

  // Remove the trailing space and print the formatted result
  formattedResult = formattedResult.trimRight();

     return formattedResult;
   }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF9F8FD),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
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
                    const Text(
                      'Subcriptions',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffF9F8FD)),
                    ),
                    Container(
                      width: 20,
                    )
                    // InkWell(
                    //     onTap: () {
                    //       Get.to(const SupportScreen());
                    //     },
                    //     child: Image.asset('assets/images/helps.png'))
                  ],
                ),
              ),
            ),
          )),
      body: GetBuilder<PlanController>(builder: (_) {
        return isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        plansController.subscribePlansData.isEmpty
                            ? Container(
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          "assets/images/offersnotavailableimage.png"),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "No Plans Found",
                                        style: primaryFont.copyWith(
                                            color: kblue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                height: 220,
                                width: 500,
                                // color: Colors.red,
                                child: Stack(
                                  children: [
                                    Container(
                                 height: 220,
                                width: 500,
                                alignment: Alignment.center,
                                      child: Image.network(
                                        plansController
                                            .subscribePlansData.first.cardImg,
                                        // height: 200,
                                        //width: size.width,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      right: 15,
                                      top: 20,
                                      child: profileController.profileData.first
                                              .profilePicture.isEmpty
                                          ? Image.asset(
                                              'assets/icons/prfl.png',
                                              height: 50,
                                              width: 50,
                                            )
                                          : Container(
                                              height: 55,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    profileController
                                                        .profileData
                                                        .first
                                                        .profilePicture,
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                    Positioned(
                                      top: 130,
                                      left: 50,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                           getCardNumber(plansController
                                          .subscribePlansData.first.cardNo),
                                            style:  GoogleFonts.orbitron(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                        const  SizedBox(
                                          height: 5,
                                         ),
                                          Text(
                                            profileController
                                                .profileData.first.name,
                                            style:  GoogleFonts.orbitron(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 175,
                                      left: 135,
                                      child: Text(
                                        formatDate(plansController
                                          .subscribePlansData.first.createdAt.addDays(int.parse(plansController
                                          .subscribePlansData.first.validityDays)), [mm,"/",yy]),
                                        style: GoogleFonts.orbitron(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                                    Positioned(
                                       top: 175,
                                      left: 65,
                                      child: Text(
                                        formatDate(plansController
                                          .subscribePlansData.first.createdAt, [mm,"/",yy]),
                                        style: GoogleFonts.orbitron(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        //const Image(image: AssetImage("assets/images/Group 4930.png"),height: 200,),
                        ksizedbox10,
                        plansController.subscribePlansData.isEmpty
                            ? Container()
                            : Text(
                                plansController.subscribePlansData.first.title,
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                    color: kblue),
                              ),
                        ksizedbox10,
                        plansController.subscribePlansData.isEmpty
                            ? Container()
                            : Text(
                                "₹${double.parse(plansController.subscribePlansData.first.saleAmount).toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                    color: kOrange),
                              ),
                      ],
                    ),
                  ),
                  if (plansController.subscribePlansData.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Subcribe Details:',
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                ksizedbox10,
                                // const Icon(CupertinoIcons.suit_diamond,color: Colors.white,),
                                plansController.subscribePlansData.isEmpty
                                    ? Container()
                                    : Container(
                                        width: size.width,
                                        child: Text(
                                          plansController.subscribePlansData
                                              .first.planDescription,
                                          maxLines: 13,
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
      }),
    );
  }
}
