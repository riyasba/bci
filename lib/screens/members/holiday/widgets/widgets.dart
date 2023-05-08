import 'package:flutter/cupertino.dart';

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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'Jordan',
                style: TextStyle(fontSize: 13, color: kgrey),
              ),
              Image.asset('assets/images/location-svgrepo-com (1).png'),
            ],
          ),
        )
      ],
    ),
    height: 235,
    width: 165,
    decoration:
        BoxDecoration(color: kwhite, borderRadius: BorderRadius.circular(19)),
  );
}
