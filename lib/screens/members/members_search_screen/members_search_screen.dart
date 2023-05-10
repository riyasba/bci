import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constands/constands.dart';
import '../../bussiness/views/home_screen/contact_admin.dart';
import '../members widgets/bropdown.dart';
import '../members widgets/gridciew.dart';

class Members_search_screen extends StatefulWidget {
  Members_search_screen({super.key, required this.title, required this.items});
  final String title;
  final List<String> items;

  @override
  State<Members_search_screen> createState() => _Members_search_screenState();
}

class _Members_search_screenState extends State<Members_search_screen> {
  //final List<String> options = ['Catogory', 'Hotel', 'Club''Resort''Saloon''Parour''Service Apartment''Textile''SPA'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 190,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    ksizedbox20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Search',
                          style: TextStyle(fontSize: 22, color: kwhite),
                        ),
                        InkWell(
                            onTap: () {
                              Get.to(ContactAdmin());
                            },
                            child: Image.asset(
                                'assets/images/3669173_help_ic_icon.png'))
                      ],
                    ),
                    ksizedbox20,
                    TextField(
                      // controller: _controller,

                      decoration: InputDecoration(hintText: 'Search',
                          fillColor: kwhite,
                          focusColor: kwhite,
                          isDense: true,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          suffixIcon:
                              Image.asset('assets/images/XMLID_223_.png')),
                    ),
                  ],
                ),
              ),
            ),
          )),
      body: ListView(
        children: [
          MyDropdown(
            label: 'Result',
            options: [],
          ),
          MyGridView(title: 'Search Result', image: [
            'assets/images/NoPath - Copy (32).png',
            'assets/images/NoPath - Copy (33).png',
            'assets/images/NoPath - Copy (34).png',
            'assets/images/NoPath - Copy (35).png'
          ]),
        ],
      ),
    );
  }
}
