import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constands/constands.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
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
                  Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: Text(
                      'Notification',
                      style: TextStyle(
                          fontSize: 23,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(onTap: (){Get.to(ContactAdmin());},
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
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Today',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
                itemCount: todayimages.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Container(
                                height: 180,
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 5, right: 10, bottom: 10),
                                  child: Image.asset(
                                    todayimages[index],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      todaytitle[index].toString(),
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        todaydiscription[index].toString(),
                                        style: TextStyle(
                                            fontSize: 12, color: kgrey),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        todaysubtitle[index].toString(),
                                        style: TextStyle(
                                            fontSize: 13.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1.5,
                        )
                      ],
                    ),
                  );
                }),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11),
                  child: Text(
                    'Yesterday',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            ListView.builder(
                itemCount: yesterdayimage.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Container(
                                height: 180,
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 5, right: 10, bottom: 10),
                                  child: Image.asset(
                                    yesterdayimage[index],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      yesterdaytitle[index].toString(),
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        yesterdaydiscriptions[index].toString(),
                                        style: TextStyle(
                                            fontSize: 13, color: kgrey),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 25),
                                      child: Text(
                                        yesterdaysubtitle[index].toString(),
                                        style: TextStyle(
                                            fontSize: 13.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1.5,
                        )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ]),
    );
  }
}
