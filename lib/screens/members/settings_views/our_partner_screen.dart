import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF9F8FD),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    ),
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
                    Container()
                   // Image.asset('assets/images/helps.png')
                  ],
                ),
              ),
            ),
          )),
      body: GetBuilder<SettingsController>(builder: (_) {
        return  settingsController.ourPartnersData.isNotEmpty? GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: settingsController.ourPartnersData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 410.sh,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2, color: Colors.grey.withOpacity(0.5))
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                            height: 100,
                            child: Image.network(
                              settingsController.ourPartnersData[index].image,
                              fit: BoxFit.fill,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7, top: 2),
                        child: Container(
                          width: size.width,
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              settingsController.ourPartnersData[index].title,
                              style: primaryFont.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 7, top: 2, right: 3),
                        child: Text(
                          settingsController.ourPartnersData[index].description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: primaryFont.copyWith(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 38,
                              
                              decoration: BoxDecoration(
                                  color: kblue,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.grey.withOpacity(0.5))
                                  ],
                                  borderRadius: BorderRadius.circular(45)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 7),
                                child: Row(
                                  children: [
                                    Text("Locaion",style: primaryFont.copyWith(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 12),),
                                    InkWell(
                                        onTap: () {
                                          launchUrl(Uri.parse(settingsController
                                              .ourPartnersData[index].mapUrl));
                                        },
                                        child: const Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }): Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/ourpartnernotavailableimage.png'),
                      ksizedbox20,
                      Text('No Memberships',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: kblue,
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
              
              );
      }),
    );
  }
}
