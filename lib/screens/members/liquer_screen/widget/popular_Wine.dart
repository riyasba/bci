import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constands/constands.dart';
import 'like.dart';

class Wine_widget extends StatelessWidget {
  const Wine_widget({super.key, required this.wineimg});
final String wineimg;
  @override
  Widget build(BuildContext context) {
    return     Container(
                    height: 270.h,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Container(
                            height: 250.h,
                            width: 170,
                            decoration: BoxDecoration(
                                color: Color(0xffFFF4D6),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            right: 15,
                            child: Image.asset(
                              wineimg,
                              height: 130,
                            )),
                        Positioned(
                            top: 100,
                            left: 1,
                            right: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LikeButton(),
                                  //Image.asset('assets/images/Favourite Button.png'),
                                  Text(
                                    "Red Wine",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    'Barefoot Wine',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  ksizedbox10,
                                  Text('750.0 ml'),
                                  ksizedbox10,
                                  Text(
                                    '₹ 8.54',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  ksizedbox20
                                ],
                                
                              ),
                              
                            )),
                            
                      ],
                    ),
                  );
  }
}