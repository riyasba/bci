import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constands/constands.dart';

Container Holiday_containors() {
  return Container(
    child: Column(
      children: [
        Image.asset(
          'assets/images/pexels-alex-azabache-4094259.png',
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'The Khaznah',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset('assets/images/location-svgrepo-com (1).png'),kwidth5,
            Text(
                'Jordan',
                style: TextStyle(fontSize: 13.sp, color: kgrey),
              ),  ],
          ),
        )
      ],
    ),
    height: 250.h,
    width: 165.w,
    decoration:
        BoxDecoration(color: kwhite, borderRadius: BorderRadius.circular(19)),
  );
}
