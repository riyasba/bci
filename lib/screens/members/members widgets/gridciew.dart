import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyGridView extends StatefulWidget {
   String title;
   List image;

  MyGridView({required this.title, required this.image});

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {

   
   final homeController = Get.find<HomeController>();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.todayOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            widget.title,
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
          itemCount: widget.image.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Column(children:[
                 Image.asset(widget.image[index].toString()),
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
