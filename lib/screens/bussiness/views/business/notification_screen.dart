import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
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
  List todayimages = [
    'assets/images/listnotiimage.png',
    'assets/images/listnotiimage2.png',
    'assets/images/listnotiimage3.png'
  ];
  List todaytitle = ['New Offers', 'Liquor Wine', 'Room Booking'];
  List todaydiscription = [
    'Hello Everyone new casual dress\noffer today launch this time just \ncheck the offers list and enjoy and\nhappiness user for offers',
    'New Order Complete In pay and \njust wine taste for enjoy more\nthen orders get in offers',
    'New Taji Hotels room booking \nconfirm enjoy your rooms and\nsleep check for full details\nbooking process',
  ];
  List todaysubtitle = [
    'Few minutes ago',
    '30 minutes ago',
    '1 Hour ago',
  ];
  List yesterdayimage = [
    'assets/images/listnotiimage4.png',
    'assets/images/listnotiimage5.png',
    'assets/images/listnotiimage6.png',
  ];
  List yesterdaytitle = [
    'flight Offers in Tourism',
    'New Subscriptions',
    'Transaction completes'
  ];
  List yesterdaydiscriptions = [
    'Just clik and booking this tourism \nand travel offers only for 2days',
    'Get in new subscription options\nenjoys and Welcome to BCI process\nused for offers',
    'Your amount transaction for your \noficial account and More check \namount your wallet'
  ];
  List yesterdaysubtitle = ['2 days ago', '2 days ago', '2 days ago'];

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
          preferredSize:const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 158,
              color: kblue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: kwhite,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 22),
                    child: Text(
                      'Notification',
                      style: TextStyle(
                          fontSize: 23,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(onTap: (){Get.to(const ContactAdmin());},
                      child: Image.asset('assets/images/3669173_help_ic_icon.png')),
                  )
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 20),
                  //   child: Image.asset('assets/images/helps.png'),
                  // )
                ],
              ),
            ),
          )),
      body: GetBuilder<NotificationController>(
          builder: (_) {
            return Container(
              height: size.height,
              child: ListView.builder(
                  itemCount: notificationController.notificationlist.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 110,
                            width: MediaQuery.of(context).size.width,
                            decoration:const BoxDecoration(
                          
                                //  boxShadow: <BoxShadow>[
                                //   BoxShadow(
                                //     offset: Offset(0.0, 0.75),
                                //     blurRadius: 5,
                                //     color: kgrey
                                //   )
                                //  ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notificationController.notificationlist[index].title,
                                  style:const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  notificationController.notificationlist[index].message,
                                  style: TextStyle(
                                      fontSize: 12, color: kgrey),
                                ),
                                Text(
                                  formatDate(notificationController.notificationlist[index].createdAt,
                                   [dd ,'-',mm,'-',yyyy])
                                  ,
                                  style:const TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 1.5,
                          )
                        ],
                      ),
                    );
                  }),
            );
          }
        ),
    );
  }
}
