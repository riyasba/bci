import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../constands/constands.dart';
import '../../../../controllers/notification_controller.dart';
import '../home_screen/contact_admin.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  void initState() {
    super.initState();
    notificationController.notification();
  }
final notificationController = Get.find<NotificationController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child:const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Notification',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 20),
                  //   child: InkWell(onTap: (){Get.to(const ContactAdmin());},
                  //     child: Image.asset('assets/images/3669173_help_ic_icon.png')),
                  // )
                  // // Padding(
                  // //   padding: const EdgeInsets.only(right: 20),
                  // //   child: Image.asset('assets/images/helps.png'),
                  // // )
                ],
              ),
            ),
          )),
      body: GetBuilder<NotificationController>(
          builder: (_) {
            return  Container(
              height: size.height,
              child:notificationController.notificationlist.isNotEmpty? ListView.builder(
                  itemCount: notificationController.notificationlist.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 2,
                              color: Color.fromARGB(255, 202, 202, 202)
                            )
                          ]
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10,bottom: 30),
                              child: Image(image: AssetImage("assets/images/logo.png",),
                              height: 30,width: 30,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    notificationController.notificationlist[index].title,
                                    style:const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    notificationController.notificationlist[index].message,
                                    style: const TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  ),
                                   const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    formatDate(notificationController.notificationlist[index].createdAt,
                                     [dd ,'-',mm,'-',yyyy])
                                    ,
                                    style:const TextStyle(
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey
                                        ),
                                  ),
                                   const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                  :
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                       Image.asset("assets/images/notificationnotavailableimage.png"),
                       ksizedbox20,
                       Text('No Notification Data',
                       style: TextStyle(
                        fontSize: 16,
                        color: kblue,
                        fontWeight: FontWeight.w700
                       ),)
                       ])),
            );
          }
        ),
    );
  }
}
