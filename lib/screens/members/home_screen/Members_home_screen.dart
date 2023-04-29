import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constands/constands.dart';

class Home_screen1 extends StatefulWidget {
  const Home_screen1({super.key});

  @override
  State<Home_screen1> createState() => _Home_screen1State();
}

class _Home_screen1State extends State<Home_screen1> {
  CarouselController sliderController = CarouselController();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/images/projectlogo.png'),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      'Hello,Jhon',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Icon(
                    Icons.notification_add,
                    color: kwhite,
                  )
                ],
              ),
            ),
          )),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Row(
            children: [
              kwidth10,
              Text(
                'Subscribe Pakages',
                style: TextStyle(
                    color: knavblue, fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Image.asset('assets/images/Group 5826.png'),
          Row(
            children: [
              kwidth10,
              Text(
                'Coupons',
                style: TextStyle(
                    color: knavblue, fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          ksizedbox20,
          Image.asset('assets/images/Group 5755.png'),
          ksizedbox20,
          Row(
            children: [
              kwidth10,
              Text(
                'Add Booking',
                style: TextStyle(
                    color: knavblue, fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          ksizedbox20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset('assets/images/Group 5778.png'),
                  Text(
                    'Flight',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Column(
                children: [
                  Image.asset('assets/images/Group 5827.png'),
                  Text(
                    'Hotel',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Column(
                children: [
                  Image.asset('assets/images/Group 5828.png'),
                  Text(
                    'Liquer',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Column(
                children: [
                  Image.asset('assets/images/Group 5829.png'),
                  Text(
                    'Holiday\nPackage',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ],
          ),
          ksizedbox30,
          CarouselSlider(
              carouselController: sliderController,
              items: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/Scroll Group 10.png'))),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/Scroll Group 10.png'))),
                ),
              ],
              options: CarouselOptions(
                height: 170,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: 2,
                effect: ScaleEffect(
                    dotHeight: 9.0,
                    dotWidth: 9.0,
                    dotColor: kgrey,
                    activeDotColor: Colors.yellow),
              ),
            ],
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today Offer',
                  style: TextStyle(
                      color: knavblue,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'See All',
                  style: TextStyle(color: korange),
                )
              ],
            ),
          ),
 Container(
              height: 150,
               child: ListView.builder(scrollDirection: Axis.horizontal,
                         physics: const BouncingScrollPhysics(),
                         itemCount: 6,
                         shrinkWrap: true,
                         itemBuilder: (context, index) {
                return  Padding(
                  padding: EdgeInsets.all(8.0),
                  child:  Container(
                    height: 106,
                    width: 144,
                    child: Image.asset('assets/images/aaaa.png'),
                  ),
                );
                         }),
             )],
      ),
    );
  }
}
