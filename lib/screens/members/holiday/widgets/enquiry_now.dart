import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnquiryNowWidget extends StatefulWidget {
  const EnquiryNowWidget({super.key});

  @override
  State<EnquiryNowWidget> createState() => _EnquiryNowWidgetState();
}

class _EnquiryNowWidgetState extends State<EnquiryNowWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: kgrey,
                      blurRadius: 2.5
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: size.width,
                      color: korange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Want to go for a memorable holidays?',
                              style: TextStyle(
                                fontSize: 19.sp, 
                                color: Colors.white,
                              fontWeight: FontWeight.w500),
                            ),ksizedbox10,
                            Text('Provide your details to know best holidays deals',
                              style: TextStyle(
                                fontSize: 13.sp, 
                                color: Colors.white,
                              fontWeight: FontWeight.w400),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Package Name',
                                    style: TextStyle(
                                      fontSize: 20.sp, 
                                      color: kblue,
                                    fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(),
                      color:const Color(0xffF2F1F1)),
                  alignment: Alignment.center,
                  child:const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      //controller: usernamecontroller,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Your Name",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}