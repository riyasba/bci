import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlaightOrderDetailsScreen extends StatefulWidget {
  const FlaightOrderDetailsScreen({super.key});

  @override
  State<FlaightOrderDetailsScreen> createState() =>
      _FlaightOrderDetailsScreenState();
}

class _FlaightOrderDetailsScreenState extends State<FlaightOrderDetailsScreen> {
  int index = 0;
  var searchController = TextEditingController();
  var numberController = TextEditingController();
  var cardnameController = TextEditingController();
  var expiredateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Column(
            children: [
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                color: kblue,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Image.asset(
                                  'assets/images/parflaightback.png')),
                          Text(
                            'Order Details',
                            style: TextStyle(fontSize: 20, color: kwhite),
                          )
                        ],
                      ),
                      ksizedbox30,
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'JFK',
                              style: TextStyle(color: kwhite),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Image.asset(
                              'assets/images/pardoubleflaight.png',
                              color: kwhite,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text(
                              'BTJ',
                              style: TextStyle(color: kwhite),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ksizedbox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Boarding Pass',
                          style: TextStyle(fontSize: 17),
                        ),
                       index==0? Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            height: 6,
                            width: 45,
                           decoration: BoxDecoration(
                             color: kOrange,
                             borderRadius: BorderRadius.circular(10)
                           ),
                          ),
                        ):Text('')
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                     setState(() {
                        index = 1;
                     });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Confirmation',
                          style: TextStyle(fontSize: 17),
                        ),
                        index==1? Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            height: 6,
                            width: 45,
                           decoration: BoxDecoration(
                             color: kOrange,
                             borderRadius: BorderRadius.circular(10)
                           ),
                          ),
                        ):Text('')
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Payment',
                          style: TextStyle(fontSize: 17),
                        ),
                        index==2? Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            height: 6,
                            width: 45,
                           decoration: BoxDecoration(
                             color: kOrange,
                             borderRadius: BorderRadius.circular(10)
                           ),
                          ),
                        ):Text('')
                      ],
                    ),
                  ),
                ],
              ),
              if (index == 0)
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kwhite,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  offset: Offset(0.0, 0.75),
                                  blurRadius: 10,
                                  color: kwhite)
                            ],
                            border: Border.all(
                              color: kwhite,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: kgrey,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.expand_more,
                                    color: kgrey,
                                  ),
                                  hintText: 'Your Credit Cards',
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: kwhite),
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: kwhite,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  offset: Offset(0.0, 0.75),
                                  blurRadius: 5,
                                  color: kgrey)
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 10, left: 10),
                              child: Container(
                                height: 220,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/ordercontainer.png',
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 40),
                                      child: Row(
                                        children: [
                                          Text(
                                            'BlaBla Card',
                                            style: TextStyle(
                                                color: kwhite, fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 40),
                                      child: Row(
                                        children: [
                                          Text(
                                            '3384 4003 4885 2334',
                                            style: TextStyle(
                                                fontSize: 18, color: kwhite),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 60, top: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'CARD HOLDER',
                                            style: TextStyle(
                                                color: kwhite, fontSize: 12),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(
                                              'EXP DATE',
                                              style: TextStyle(
                                                  color: kwhite, fontSize: 12),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 65, top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Bugra Dere',
                                            style: TextStyle(
                                                color: kwhite, fontSize: 18),
                                          ),
                                          Text(
                                            '19/05',
                                            style: TextStyle(
                                                color: kwhite, fontSize: 18),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 15),
                              child: TextField(
                                controller: numberController,
                                decoration: InputDecoration(
                                    hintText: '3384 4003 4885 2334'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 20),
                              child: TextField(
                                controller: cardnameController,
                                decoration:
                                    InputDecoration(hintText: 'Card Holder'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 20),
                              child: TextField(
                                controller: expiredateController,
                                decoration:
                                    InputDecoration(hintText: 'Expire Date'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ksizedbox20,
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.9,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 60),
                                        child: Image.asset(
                                            'assets/images/ordercomplete.png'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          'Successful!',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green),
                                        ),
                                      ),
                                      ksizedbox20,
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                            'Lorem Ipsum has been the industry'
                                            's \nstandard dummy text ever since the 1500s'),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient:
                                LinearGradient(colors: [kyellow, korange]),
                            borderRadius: BorderRadius.circular(15)),
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Center(
                          child: Text(
                            'Complete',
                            style: TextStyle(fontSize: 18, color: kwhite),
                          ),
                        ),
                      ),
                    ),
                    ksizedbox30
                  ],
                ),
              if (index == 1)
               Column (
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                            color: kwhite,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  offset: Offset(0.0, 0.75),
                                  blurRadius: 5,
                                  color: kgrey)
                            ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20,left: 20),
                                  child: Row(
                                    children: [
                                      Text('Mr. Bugra Dere',style: TextStyle(fontSize: 20,color: kblue),)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,top: 30),
                                  child: Row(
                                    children: [
                                      Text('bugra@dere.com',style: TextStyle(fontSize: 18,),)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,top: 15),
                                  child: Row(
                                    children: [
                                      Text('(+1)'),
                                      Text(' 81280089900',style: TextStyle(fontSize: 18,),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                      ),
                    ),
                    Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                          height: 210,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color:kwhite,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: Offset(0.0, 0.75),
                                    blurRadius: 10,
                                    color: kgrey),
                              ],
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, top: 19),
                                    child: Text(
                                      'From',
                                      style: TextStyle(
                                          fontSize: 20.5, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 120, top: 20),
                                    child: Text(
                                      'To',
                                      style: TextStyle(
                                          color: kblue, fontSize: 20.5),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 27, top: 20),
                                    child: Text(
                                      'JFK',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 148, top: 20),
                                    child: Text(
                                      'BTJ',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 27, top: 20),
                                    child: Text(
                                      'John F. Kennedy \nAirport',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 60, top: 20),
                                    child: Text(
                                      'Abbotsford National \nAirport',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 27, top: 20),
                                    child: Text(
                                      'Terminal\n\n 54',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 115, top: 20),
                                    child: Text(
                                      'Gate \n\n12',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 27, top: 30),
                                    child: Text(
                                      'Seat \n\n24H',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 140, top: 30),
                                    child: Text(
                                      'Boarding \n\n14:54',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 27, top: 30),
                                    child: Text(
                                      'Date \n\n30.10.2019',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 100, top: 30),
                                    child: Text(
                                      'Flight \n\nTK 2411',
                                      style: TextStyle(
                                          fontSize: 15, color: kblue),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                ksizedbox20,
                
                  ],
                ),
                   if (index == 2)
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kwhite,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  offset: Offset(0.0, 0.75),
                                  blurRadius: 10,
                                  color: kwhite)
                            ],
                            border: Border.all(
                              color: kwhite,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: kgrey,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.expand_more,
                                    color: kgrey,
                                  ),
                                  hintText: 'Your Credit Cards',
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: kwhite),
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: kwhite,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  offset: Offset(0.0, 0.75),
                                  blurRadius: 5,
                                  color: kgrey)
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 10, left: 10),
                              child: Container(
                                height: 220,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/ordercontainer.png',
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 40),
                                      child: Row(
                                        children: [
                                          Text(
                                            'BlaBla Card',
                                            style: TextStyle(
                                                color: kwhite, fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 40),
                                      child: Row(
                                        children: [
                                          Text(
                                            '3384 4003 4885 2334',
                                            style: TextStyle(
                                                fontSize: 18, color: kwhite),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 60, top: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'CARD HOLDER',
                                            style: TextStyle(
                                                color: kwhite, fontSize: 12),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(
                                              'EXP DATE',
                                              style: TextStyle(
                                                  color: kwhite, fontSize: 12),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 65, top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Bugra Dere',
                                            style: TextStyle(
                                                color: kwhite, fontSize: 18),
                                          ),
                                          Text(
                                            '19/05',
                                            style: TextStyle(
                                                color: kwhite, fontSize: 18),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 15),
                              child: TextField(
                                controller: numberController,
                                decoration: InputDecoration(
                                    hintText: '3384 4003 4885 2334'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 20),
                              child: TextField(
                                controller: cardnameController,
                                decoration:
                                    InputDecoration(hintText: 'Card Holder'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 20),
                              child: TextField(
                                controller: expiredateController,
                                decoration:
                                    InputDecoration(hintText: 'Expire Date'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                                        ksizedbox20,
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.9,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 60),
                                        child: Image.asset(
                                            'assets/images/ordercomplete.png'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          'Successful!',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green),
                                        ),
                                      ),
                                      ksizedbox20,
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                            'Lorem Ipsum has been the industry'
                                            's \nstandard dummy text ever since the 1500s'),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient:
                                LinearGradient(colors: [kyellow, korange]),
                            borderRadius: BorderRadius.circular(15)),
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Center(
                          child: Text(
                            'Complete',
                            style: TextStyle(fontSize: 18, color: kwhite),
                          ),
                        ),
                      ),
                    ),
                    ksizedbox30
            ],
          ),
        ]),
        ]
        )
      ),
    );
  }
}
