import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constands/constands.dart';
import '../../../views/business/notification_screen.dart';
import 'widget/liquers_containers.dart';

class liquer_screen extends StatelessWidget {
  const liquer_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kwhite,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(210),
          child: Column(
            children: [
              ClipPath(
                clipper: SinCosineWaveClipper(),
                child: Container(
                  height: 150,
                  color: kblue,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: Get.back,
                            child: Image.asset(
                                'assets/images/chevron-left (2).png')),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            'Liquors',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: kwhite),
                          ),
                        ),
                     IconButton(onPressed: (){Get.to(NotificationScreen());}, icon:   Icon(
                    Icons.notifications,
                    color: kwhite,
                  ))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 55,
                  child: TextFormField(
                    // controller: _controller,
                    
                
                    decoration: InputDecoration(hintText: 'Search',
                        fillColor: Colors.grey[200],
                        focusColor: Colors.grey[200],
                        isDense: true,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        prefixIcon: Image.asset('assets/images/622669.png'),
                        suffixIcon: Image.asset(
                            'assets/images/Icon material-location-on.png')),
                  ),
                ),
              ),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child:Card(child: members_liquer_container()) ,
              );
            }),
      ),
    );
  }
}
