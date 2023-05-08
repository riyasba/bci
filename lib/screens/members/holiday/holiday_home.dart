import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Holiday_Home extends StatelessWidget {
  const Holiday_Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/images/Icon awesome-arrow-right.png')),
        title: Text(
          'Plan your trip with us.',
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.w800, color: kblue),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 55,
              child: TextFormField(
                  // controller: _controller,
                  decoration: InputDecoration(
                hintText: 'Search',
                fillColor: Colors.grey[200],
                focusColor: Colors.grey[200],
                isDense: true,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5, color: Colors.grey.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(19.0),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              )),
            ),
          ),
          ksizedbox30,
          Row(
            children: [
              kwidth10,
              Text(
                'Categories',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                    color: kgrey, borderRadius: BorderRadius.circular(14)),
              )
            ],
          )
        ],
      ),
    );
  }
}
