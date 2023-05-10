import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:math' as math;
import '../../../../constands/constands.dart';

class Flight_widget extends StatelessWidget {
  const Flight_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(child:  Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, top: 19),
                                      child: Text(
                                        'From',
                                        style:
                                            TextStyle(fontSize: 20, color: kblue),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 85, top: 20),
                                      child: Text(
                                        'To',
                                        style:
                                            TextStyle(color: kblue, fontSize: 19),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, top: 19),
                                      child: Text(
                                        'JFK',
                                        style:
                                            TextStyle(fontSize: 15, color: kblue),
                                      ),
                                    ),Padding(
                                      padding: const EdgeInsets.only(left: 39),
                                      child: Image.asset('assets/images/Group 291.png'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 108, top: 20),
                                      child: Text(
                                        'BTJ',
                                        style:
                                            TextStyle(color: kblue, fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 28, top: 19),
                                      child: Text(
                                        'John F. Kennedy \nAirport',
                                        style:
                                            TextStyle(fontSize: 15, color: kblue),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 22, top: 5),
                                      child: Text(
                                        'Abbotsford National \nAirport',
                                        style:
                                            TextStyle(color: kblue, fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                                
                               ]),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      blurRadius: 5,
                                      color: kgrey),
                                ],
                                borderRadius: BorderRadius.circular(5)),
            ),
          ),ksizedbox30,
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Stack(
              children: [
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                          height: 210,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: kwhite,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: Offset(0.0, 0.75),
                                    blurRadius: 5,
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
                                      style:
                                          TextStyle(fontSize: 20, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 85, top: 20),
                                    child: Text(
                                      'To',
                                      style:
                                          TextStyle(color: kblue, fontSize: 19),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, top: 19),
                                    child: Text(
                                      'JFK',
                                      style:
                                          TextStyle(fontSize: 15, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 108, top: 20),
                                    child: Text(
                                      'BTJ',
                                      style:
                                          TextStyle(color: kblue, fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 28, top: 19),
                                    child: Text(
                                      'John F. Kennedy \nAirport',
                                      style:
                                          TextStyle(fontSize: 15, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 22, top: 5),
                                    child: Text(
                                      'Abbotsford National \nAirport',
                                      style:
                                          TextStyle(color: kblue, fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                              ksizedbox10,
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.error,
                                      color: kblue,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ksizedbox30,
                              Stack(
                                children: [
                                  Column(children: [
                                    Image.asset(
                                      'assets/images/parflaightdown1.png',
                                      color: kblue,
                                    ),
                                    SizedBox(
                                      height: 65,
                                    ),
                                    Image.asset(
                                      'assets/images/parflaightdown3.png',
                                      color: kblue,
                                    ),
                                    SizedBox(
                                      height: 65,
                                    ),
                                    Image.asset(
                                      'assets/images/parflaightdown.png',
                                      color: kblue,
                                    ),
                                  ]),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 95, top: 120),
                                    child: Container(
                                      child: Transform.rotate(
                                        angle: -math.pi / 2.0,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: kOrange,
                                                  shape: BoxShape.circle),
                                            ),
                                            Text(
                                              '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ',
                                              style: TextStyle(color: kgrey),
                                            ),
                                            Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: kOrange,
                                                  shape: BoxShape.circle),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 120,
                                    top: 20,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 18),
                                          child: Text(
                                            '24 October',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff8C8AAf)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 35, top: 5),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.schedule,
                                                size: 13,
                                              ),
                                              Text(
                                                '19:00',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff8C8AAf)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ksizedbox40,
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 27, top: 30),
                                              child: Text(
                                                'Duration: 2h 55min',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff8C8AAf)),
                                              ),
                                            ),
                                            Text('Non Stop',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff8C8AAf)))
                                          ],
                                        ),
                                        ksizedbox40,
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20, top: 30),
                                              child: Text(
                                                '31 October',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff8C8AAf)),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 40),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.schedule,
                                                    size: 13,
                                                  ),
                                                  Text('21:55',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xff8C8AAf))),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                ),
                Positioned(
                  top: -5,
                  right: -1,
                  child: Column(children: [
                    Image.asset('assets/images/parflaightclipath.png'),
                  ]),
                ),
                Positioned(
                    top: 15,
                    right: 15,
                    child: Image.asset(
                      'assets/images/flaightswap.png',
                      color: kwhite,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
