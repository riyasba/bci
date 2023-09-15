import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/screens/members/settings_views/setingswidgets/My_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../constands/constands.dart';
import '../../screens/members/members widgets/member_bottumbavigation.dart';

class MemberOnbordingScreen extends StatefulWidget {
  const MemberOnbordingScreen({super.key});

  @override
  State<MemberOnbordingScreen> createState() => _MemberOnbordingScreenState();
}

class _MemberOnbordingScreenState extends State<MemberOnbordingScreen> {
  bool isPageViewEnabled = false;
  late PageController _pageController;
  // @override
  // void initState() {

  //   _pageController = PageController(initialPage: 0);

  //   super.initState();
  // }

  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
    profileController.getProfile();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          'assets/images/01 Login Screen Options.png',
        ),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                      child: PageView(controller: _pageController, 
                      children:const [
                    Onbording(),
                    Onbording2(),
                    Onbording3(),
                    Onbording4(),
                    Onbording5()
                  ])),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.decelerate,
                              );
                            },
                            child: Image.asset('assets/images/jaba.png')),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SmoothPageIndicator(
                                controller: _pageController,
                                count: 5,
                                axisDirection: Axis.horizontal,
                                effect: SlideEffect(
                                  activeDotColor: kOrange,
                                  dotHeight: 10.sp,
                                  dotColor: Colors.white,
                                  dotWidth: 10.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     AnimatedSmoothIndicator(
                        //       activeIndex: isPageViewEnabled
                        //           ? _pageController.page!.toInt()
                        //           : 0,
                        //       count: 5,
                        //       effect: ScaleEffect(
                        //           dotHeight: 9.0,
                        //           dotWidth: 9.0,
                        //           dotColor: kgrey,
                        //           activeDotColor: korange),
                        //     ),
                        //   ],
                        // ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isPageViewEnabled = true;
                              });
                              if (_pageController.page!.toInt() == 4) {
                                if(profileController.profileData.first.occupation.isEmpty){
                                  Get.to(const MyAccount());
                                }else{
                                  Get.offAll(MemberBottomNavBar());
                                }
                              } else {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.decelerate,
                                );
                              }
                            },
                            child: Image.asset('assets/images/Group 5819.png')),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  right: 7,
                  top: 7,
                  child: InkWell(
                      onTap: () async {
                        await profileController.getProfile();
                        if(profileController.profileData.first.occupation.isEmpty){
                                  Get.to(const MyAccount());
                                }else{
                                  Get.offAll(MemberBottomNavBar());
                                }
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

class Onbording extends StatefulWidget {
  const Onbording({
    super.key,
  });

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/introimg.png',
        ),
        ksizedbox30,
        Text(
          'ALL IN ONE PRESTIGIOUS ',
          style: TextStyle(
              fontSize: 27.sp, fontWeight: FontWeight.w700, color: kwhite),
        ),
        Text(
          'MEMBERSHIP',
          style: TextStyle(
              fontSize: 27.sp, fontWeight: FontWeight.w700, color: kwhite),
        ),
        ksizedbox40,
        Image.asset('assets/images/Group 111111.png'),
      ],
    );
  }
}

class Onbording2 extends StatefulWidget {
  const Onbording2({
    super.key,
  });

  @override
  State<Onbording2> createState() => _Onbording2State();
}

class _Onbording2State extends State<Onbording2> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          'assets/images/onbording2.png',
         height: size.height*0.62.h,
        ),
        Text(
          'HOTELS & SERVICES',
          style: TextStyle(
              fontSize: 27.sp, fontWeight: FontWeight.w700, color: kwhite),
        ),
        Text(
          'BCI Prestigious Members Can Access our Amazing\n Discounts Coupons @ Our Associate Hotels / Resorts / Spas / Saloons / Services Apartments / \nMarriage Halls / Tours & Travels.',
          style: TextStyle(
              color: kwhite, fontWeight: FontWeight.w600, fontSize: 17.sp),
          textAlign: TextAlign.center,
        ),
        ksizedbox30,
        Image.asset('assets/images/50.png')
      ],
    );
  }
}

class Onbording3 extends StatelessWidget {
  const Onbording3({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset('assets/images/onbording3.png',
        height: size.height*0.62.h,
        ),
        Text(
          'ESSENTIAL BAZZAR',
          style: TextStyle(
              fontSize: 27.sp, fontWeight: FontWeight.w700, color: kwhite),
        ),
        Text(
          'BCI Prestigious Members Can Access our Amazing\n Discounts Coupons @ Our Associate Provision / \nRestaurant / Jewellery / Textile / Complimentary\n Coupon.',
          style: TextStyle(
              color: kwhite, fontWeight: FontWeight.w600, fontSize: 17.sp),
          textAlign: TextAlign.center,
        ),
        ksizedbox20,
        Image.asset('assets/images/50.png')
      ],
    );
  }
}

class Onbording4 extends StatelessWidget {
  const Onbording4({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset('assets/images/onbording4.png',
        height: size.height*0.62.h,
        ),
        Text(
          'A TO Z UTILITY SERVICE &\n ONLINE DISCOUNTS',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 27.sp, fontWeight: FontWeight.w700, color: kwhite),
        ),
        Text(
          'BCI Prestigious Members Can Access our Amazing\n Discounts Coupons @ Our Associate Utility Service Providers / Online Shopping / Online Recharge / Online Cinema Tickets.',
          style: TextStyle(
              color: kwhite, fontWeight: FontWeight.w600, fontSize: 17.sp),
          textAlign: TextAlign.center,
        ),
        ksizedbox30,
        Image.asset('assets/images/50.png')
      ],
    );
  }
}

class Onbording5 extends StatelessWidget {
  const Onbording5({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MEMBER CAN AVAIL',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 27.sp, fontWeight: FontWeight.w700, color: kwhite),
            ),
          ],
        ),
        Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: Image.asset(
              'assets/images/onbord55.png',
              height: 530.h,
            )),
        Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/images/onbording5.png',
              height: 300.h,
              width: size.width,
              fit: BoxFit.fitWidth,
            ))
      ],
    );
  }
}
