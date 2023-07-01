import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../constands/constands.dart';

class OfferWidgets extends StatelessWidget {
  const OfferWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container( 
        height: 200,
        width: double.infinity,
        color: kwhite,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/NoPath - Copy (7).png'),
            ),
            kwidth10,
             Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ksizedbox10,
                Text('JK Stores Offer For ',style: TextStyle(fontSize: 25),),
                Text('Casual Shirts',style: TextStyle(fontSize: 25),),
                 Text('25% Offer',style: TextStyle(fontSize: 25,color:Colors.grey),),
             Text('5 Days Only',style: TextStyle(fontSize: 25,color:Colors.grey),),ksizedbox10
              ],
            )
          ],
        ),
      );
  }
}