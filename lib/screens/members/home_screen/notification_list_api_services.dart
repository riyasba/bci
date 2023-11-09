import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/screens/members/settings_views/support_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../constands/constands.dart';

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

  final authController = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.notification();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
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
                  ),
                  Container(
                    width: 20,
                  )
                  // InkWell(
                  //   onTap: () {
                  //     Get.to(const SupportScreen());
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 10),
                  //     child: Container(
                  //         height: 30,
                  //         width: 30,
                  //         child: Image.asset('assets/images/helps.png')),
                  //   ),
                  // )
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 20),
                  //   child: Image.asset('assets/images/helps.png'),
                  // )
                ],
              ),
            ),
          )),
      body: GetBuilder<AuthController>(builder: (_) {
        return authController.notificationData.isEmpty
            ? const Center(
                child: Text("No data found"),
              )
            : ListView.builder(
                itemCount: authController.notificationData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Image.asset("assets/images/logo.png"),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      authController
                                          .notificationData[index].title,
                                      style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Container(
                                        width: size.width * 0.81,
                                        child: Text(
                                          authController
                                              .notificationData[index].message,
                                          style: TextStyle(
                                              fontSize: 14, color: kgrey),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        formatDate(
                                            authController
                                                .notificationData[index]
                                                .createdAt,
                                            [dd, '-', mm, '-', yyyy]),
                                        style: const TextStyle(
                                            fontSize: 11.5,
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    )
                                  ],
                                ),
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
                });
      }),
    );
  }
}
