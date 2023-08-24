import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../constands/constands.dart';
import '../../screens/bussiness/views/busines_widget/bottumnavigation.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  bool isPageViewEnabled = false;
  late PageController _pageController;

  // @override
  // void initState() {

  //   _pageController = PageController(initialPage: 0);

  //   super.initState();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
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
      decoration: BoxDecoration(
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
                      child: PageView(controller: _pageController, children: [
                    OnbordingScreen1(),
                    OnboardingScreen2(),
                    OnboardingScreen3(),
                    Onbording4(),
                    onbording5(),
                  ])),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              
                              _pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.decelerate,
                              );
                              
                            },
                            child: Image.asset('assets/images/jaba.png')),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
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
                        ksizedbox20,
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isPageViewEnabled = true;
                              });

                              if (_pageController.page!.toInt() == 4) {
                                Get.to(HomeBottomnavigationBar());
                              } else {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.decelerate,
                                );
                              }
                            },
                            child: Image.asset(
                                'assets/images/onbordingbackbutton.png')),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  right: 7.sp,
                  top: 7.sp,
                  child: GestureDetector(
                      onTap: () {
                        Get.to(HomeBottomnavigationBar());
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

class OnbordingScreen1 extends StatefulWidget {
  const OnbordingScreen1({
    super.key,
  });

  @override
  State<OnbordingScreen1> createState() => _OnbordingScreen1State();
}

class _OnbordingScreen1State extends State<OnbordingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ksizedbox40,
        Image.asset(
          'assets/images/introimage1.png',
        ),
        ksizedbox10,
        Text(
          'BCI INDIA INFORMA',
          style: TextStyle(
              fontSize: 27.sp, fontWeight: FontWeight.w700, color: kwhite),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 20),
          child: Column(
            children: [
              Text(
                'Since 2 Decade BCI INDIA Is Servicing In Indias first \nfamily entertainment club, Have about 45000 Members. \nNow We Are Providing New And Vibrate Management \nIs Excited To Offer Our Members The Best \nMulti-Clubbing Experience Of Life Time.',
                style: TextStyle(fontSize: 15.sp, color: kwhite),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 20),
          child: Column(
            children: [
              Text(
                'BCI INDIA in the Google play store makes world of opportunities and services, offers, value added mutual benefits to members & vendors.',
                style: TextStyle(fontSize: 15.sp, color: kwhite),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 20),
          child: Column(
            children: [
              Text(
                'Now we are Expanding Our Business Operations All over India, we are estimating about 1 Million Members to subscribe within Couple of Years, in The Way Of All Digital, Social, Media, Member 2 Member, Vendors 2 Members & Etc.',
                style: TextStyle(fontSize: 15.sp, color: kwhite),
              )
            ],
          ),
        )
      ],
    );
  }
}

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({
    super.key,
  });

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ksizedbox20,
        Image.asset(
          'assets/images/skipimage.png',
        ),
        Text(
          'THE ORIGINAL VISION',
          style: TextStyle(
              fontSize: 27.sp, fontWeight: FontWeight.w700, color: kwhite),
        ),
        ksizedbox30,
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            children: [
              Text(
                'We Would Like To Expand Our Business Operations \nAll Over India. BCI INDIA Is Planned To Expand 1 \nMillion Members With In Couple Of Years, By The \nWay Of All Digital, Social Media, Member 2 Member, \nVendors 2 Members & Etc.',
                style: TextStyle(color: kwhite, fontSize: 15.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ksizedbox20,
        Image.asset('assets/images/introimage3.png'),
        ksizedbox20,
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'INCREASE ONBOARDING SPEEDY BUSINESS',
            style: TextStyle(
                fontSize: 27.sp, fontWeight: FontWeight.w700, color: kwhite),
          ),
        ),
        ksizedbox30,
        Column(
          children: [
            Text(
              'Vendors Can Push Notifications to All Our Members \nThrough BCI INDIA App to Promote Their Own \nBusiness Offers.',
              style: TextStyle(color: kwhite, fontSize: 15.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}

class Onbording4 extends StatelessWidget {
  const Onbording4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ksizedbox40,
        Image.asset('assets/images/introimage4.png'),
        ksizedbox20,
        Text(
          'A TO Z UTILITY SERVICE &\n ONLINE DISCOUNTS',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 27.sp, fontWeight: FontWeight.w700, color: kwhite),
        ),
        ksizedbox20,
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Vendors Can Put Offers & Discounts Directly on \nthe App, Showing vendors slide for our \nmembers to view your offers and avail the \nsame from the Vendors.',
                style: TextStyle(color: kwhite, fontSize: 15.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class onbording5 extends StatelessWidget {
  const onbording5({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70, right: 10),
          child: Image.asset('assets/images/introimage5.png'),
        ),
        ksizedbox20,
        Text(
          'SETTLEMENT & RECONCILIATION',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 27.sp, fontWeight: FontWeight.w700, color: kwhite),
        ),
        ksizedbox20,
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'BCI INDIA App Offers Payment Settlement On The Same Day As Per The Banking & RBI Rules.',
                style: TextStyle(color: kwhite, fontSize: 15.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
