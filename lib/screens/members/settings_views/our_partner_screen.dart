import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class OurPartnerScreen extends StatefulWidget {
  const OurPartnerScreen({super.key});

  @override
  State<OurPartnerScreen> createState() => _OurPartnerScreenState();
}

class _OurPartnerScreenState extends State<OurPartnerScreen> {

  final settingsController = Get.find<SettingsController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settingsController.ourPartner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffF9F8FD),
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child:const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Our Partner',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffF9F8FD)),
                      ),
                    ),
                    Image.asset('assets/images/helps.png')
                  ],
                ),
              ),
            ),
          )),
      body: GetBuilder<SettingsController>(
        builder: (_) {
          return GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: settingsController.ourPartnersData.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                     height: 150,
                                     width: 150,
                                     decoration: BoxDecoration(
                                      border: Border.all(color: kblue),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                      image: NetworkImage(
                                      settingsController.ourPartnersData[index].image)),
                                     ),
                              ),
                            );
                          });
        }
      ),
    );
  }
}