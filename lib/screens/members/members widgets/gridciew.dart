import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
   String title;
    List image;

  MyGridView({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 8,
          ),
          itemCount: image.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Column(children:[
                 Image.asset(image[index].toString()),
                 Row(
                   children: [kwidth10,
                     Text('Hotel Place',style: TextStyle(fontSize: 17,color: kblue,fontWeight: FontWeight.w700),),
                   ],
                 )
                 ])
            );
          },
        ),
      ],
    );
  }
}
