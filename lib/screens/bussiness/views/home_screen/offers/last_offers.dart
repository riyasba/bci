import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constands/constands.dart';

class LastOffers extends StatefulWidget {
  const LastOffers({super.key});

  @override
  State<LastOffers> createState() => _LastOffersState();
}

class _LastOffersState extends State<LastOffers> {
  List lastimage = [
    'assets/images/lastoffers1.png',
    'assets/images/lastjewell.png',
    'assets/images/lastshoe.png',
    'assets/images/lastlaptop.png',
    
  ];
  List title = [
    'New Arrival Men Spring \nSummer Cotton Liner \nShirt Slim',
    'Stunning Temple jewellery \nPieces to Effortless Amp \nUp your Bridal Look',
    'Hollow Out Men PU Leather \nOxford Formal Shoes -9/9.5',
    'Best Buy:Apple Macbook \n"12"Display Intel Core i5\n8GB Memory 512GB Flash \nStorage'
  ];
  List description = [
    'Gender: Men Item Type: Shirts \nType: Casual Shirts Material: \nModal,Linen,Cotton Sleeve quare\nStyle: Casual Shirt',
    'Formerly used to adorn the idols \nof gods and goddesses and latern \nTemple Jewellery has  bride''\ns wedding day look.',
    'Brand Name: US MART NEW \nYORKUpper Material: Shoes \nMaterial:RubberClosure \nType: Lace-upInsole \nMaterial:',
    'Shop Apple Macbook® 12" \nDisplay Intel Core i5 8GB Memory \n512GB Flash Storage (Old Model) \nGold at Best Buy. ',

  ];
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
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      'Last Offers',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset('assets/images/helps.png'),
                  )
                ],
              ),
            ),
          )),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children:[ Column(
          children: [
            Container(
             child:   ListView.builder(
            physics: NeverScrollableScrollPhysics(),
                itemCount: lastimage.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(children: [
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Row(
                              children: [
                                Container(
                                  height: 180,
                                  width: 140,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 5, right: 10, bottom: 10),
                                    child: Image.asset(
                                      lastimage[index],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title[index].toString(),
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          description[index].toString(),
                                          style: TextStyle(
                                              fontSize: 13, color: kgrey),
                                        ),
                                      ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: (){},
                                icon: Icon(Icons.more_vert)),
                            ],
                          ),
                    ]),
                  );
                }),
            ),
          ],
        ),
        ]
      ),
    );
  }
}
