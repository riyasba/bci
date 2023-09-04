import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../constands/constands.dart';

class bookings_containers extends StatelessWidget {
  const bookings_containers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                height: 127,
                width: double.infinity,
                color: kwhite,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/Rectangle 1877.png'),
                    ),
                    kwidth10,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ksizedbox10,
                        Row(
                          children: [
                            const Text(
                              'Rich Hotels, Chennai',
                              style: TextStyle(fontSize: 21),
                            ),SizedBox(width: 30,),
                       Image.asset('assets/images/Icon material-location-on.png')   ],
                        ),
                        Text(
                          'Date : 15/04/2023 to 16/04/2023',
                          style: TextStyle(color: kblue),
                        ),  Text(
                          'Check in : 03:44PM Check Out 03:43 PM',
                          style: TextStyle(color: kblue),
                        ),  Text(
                          'Total Person : 5 Members',
                          style: TextStyle(color: kblue),
                        ),  Text(
                          'Ac Rooms',
                          style: TextStyle(color: kblue),
                        ),
                        ksizedbox10
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
