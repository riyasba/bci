import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeSlotScreen extends StatefulWidget {
  const TimeSlotScreen({super.key});

  @override
  State<TimeSlotScreen> createState() => _TimeSlotScreenState();
}

class _TimeSlotScreenState extends State<TimeSlotScreen> {

  int selectedIndex = 999;
  int sunday = 0;
  int monday = 0;
  int tuesday = 0;
  int wednesday = 0;
  int thursday = 0;
  int friday = 0;
  int saturday = 0;
  int allday = 0;

  final authController = Get.find<AuthController>();

  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
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
                      padding: EdgeInsets.only(left: 0, right: 20),
                      child: Text(
                        'Time Slots',
                        style:
                            TextStyle(fontSize: 20, 
                            color: Color(0xffF8F9FD),
                            fontWeight: FontWeight.w700
                            ),
                      ),
                    ),
                    Container(width: 20,)
                  ],
                ),
              ),
            ),
          )),
          body: Obx( () =>
             ListView(
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                         'Select Day',
                            style:
                                TextStyle(fontSize: 20, 
                                color: Colors.black,
                                fontWeight: FontWeight.w600
                                ),
                     ),
                  ),
                  const Divider(thickness: 1,),
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: InkWell(
                      onTap: (){
                        if(authController.isExpand.value != 0){
                           authController.isExpand(0);
                        } else {
                           authController.isExpand(999);
                        }
                      },
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Sunday",
                            style:
                                  TextStyle(fontSize: 18, 
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                  ),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: Icon(Icons.arrow_drop_down_outlined,color: kwhite,)),
                          ),
                        ],
                       ),
                     ),
                   ),  
                   if(authController.isExpand.value == 0)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 InkWell(
                                  onTap: () async {
                                    final TimeOfDay? timeOfDay = await showTimePicker(
                                      context: context,
                                      initialTime: selectedTime,
                                      initialEntryMode: TimePickerEntryMode.dial
                                    );
                                    if(timeOfDay != null){
                                      setState(() {
                                        selectedTime = timeOfDay;
                                      });
                                    }
                                  },
                                   child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child:  Padding(
                                          padding: const EdgeInsets.only(left: 5,right: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(selectedTime.format(context).toString()),
                                              // Text("${selectedTime.hour}:${selectedTime.minute}"),
                                              Icon(Icons.history,color: kblue,)
                                            ],
                                          ),
                                        ),
                                   ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                           sunday++;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.add_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),   
                   for(int i = 0; i < sunday; i ++)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                          sunday--;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.remove_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),    
                   const Divider(thickness: 1,),
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: InkWell(
                      onTap: (){
                       if(authController.isExpand.value != 1){
                           authController.isExpand(1);
                        } else {
                           authController.isExpand(999);
                        }
                      },
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Monday",
                            style:
                                  TextStyle(fontSize: 18, 
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                  ),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: Icon(Icons.arrow_drop_down_outlined,color: kwhite,)),
                          ),
                        ],
                       ),
                     ),
                   ), 
                   if(authController.isExpand.value == 1)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                           monday++;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.add_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),   
                   for(int i = 0; i < monday; i ++)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                          monday--;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.remove_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),  
                   const Divider(thickness: 1,),
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: InkWell(
                      onTap: (){
                        if(authController.isExpand.value != 2){
                           authController.isExpand(2);
                        } else {
                           authController.isExpand(999);
                        }
                      },
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Tuesday",
                            style:
                                  TextStyle(fontSize: 18, 
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                  ),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: Icon(Icons.arrow_drop_down_outlined,color: kwhite,)),
                          ),
                        ],
                       ),
                     ),
                   ),     
                   if(authController.isExpand.value == 2)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                           tuesday++;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.add_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),   
                   for(int i = 0; i < tuesday; i ++)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                          tuesday--;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.remove_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),    
                   const Divider(thickness: 1,),
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: InkWell(
                      onTap: (){
                        if(authController.isExpand.value != 3){
                           authController.isExpand(3);
                        } else {
                           authController.isExpand(999);
                        }
                      },
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Wednesday",
                            style:
                                  TextStyle(fontSize: 18, 
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                  ),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: Icon(Icons.arrow_drop_down_outlined,color: kwhite,)),
                          ),
                        ],
                       ),
                     ),
                   ),     
                   if(authController.isExpand.value == 3)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                           wednesday++;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.add_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),   
                   for(int i = 0; i < wednesday; i ++)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                          wednesday--;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.remove_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),    
                   const Divider(thickness: 1,),
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: InkWell(
                      onTap: (){
                        if(authController.isExpand.value != 4){
                           authController.isExpand(4);
                        } else {
                           authController.isExpand(999);
                        }
                      },
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Thursday",
                            style:
                                  TextStyle(fontSize: 18, 
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                  ),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: Icon(Icons.arrow_drop_down_outlined,color: kwhite,)),
                          ),
                        ],
                       ),
                     ),
                   ),     
                   if(authController.isExpand.value == 4)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                           thursday++;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.add_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),   
                   for(int i = 0; i < thursday; i ++)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                          thursday--;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.remove_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),    
                   const Divider(thickness: 1,),
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: InkWell(
                      onTap: (){
                        if(authController.isExpand.value != 5){
                           authController.isExpand(5);
                        } else {
                           authController.isExpand(999);
                        }
                      },
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Friday",
                            style:
                                  TextStyle(fontSize: 18, 
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                  ),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: Icon(Icons.arrow_drop_down_outlined,color: kwhite,)),
                          ),
                        ],
                       ),
                     ),
                   ),     
                   if(authController.isExpand.value == 5)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                           friday++;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.add_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),   
                   for(int i = 0; i < friday; i ++)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                          friday--;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.remove_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),    
                   const Divider(thickness: 1,),
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: InkWell(
                       onTap: (){
                        if(authController.isExpand.value != 6){
                           authController.isExpand(6);
                        } else {
                           authController.isExpand(999);
                        }
                       },
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Saturday",
                            style:
                                  TextStyle(fontSize: 18, 
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                  ),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: Icon(Icons.arrow_drop_down_outlined,color: kwhite,)),
                          ),
                        ],
                       ),
                     ),
                   ),     
                   if(authController.isExpand.value == 6)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                           saturday++;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.add_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),   
                   for(int i = 0; i < saturday; i ++)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                          saturday--;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.remove_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),    
                   const Divider(thickness: 1,),
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: InkWell(
                      onTap: (){
                        if(authController.isExpand.value != 7){
                           authController.isExpand(7);
                        } else {
                           authController.isExpand(999);
                        }
                      },
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("All Days Available",
                            style:
                                  TextStyle(fontSize: 18, 
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                  ),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: Icon(Icons.arrow_drop_down_outlined,color: kwhite,)),
                          ),
                        ],
                       ),
                     ),
                   ),   
                   if(authController.isExpand.value == 7)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                           allday++;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.add_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),   
                   for(int i = 0; i < allday; i ++)
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                     child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.2,
                            color: kgrey
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                 ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                 style:TextStyle(fontSize: 18, 
                                  color: kblue,
                                  fontWeight: FontWeight.w500
                                  ),
                                 ),
                                 const SizedBox(height: 5,),
                                 Row(
                                   children: [
                                     Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("---|---"),
                                            Icon(Icons.history,color: kblue,)
                                          ],
                                        ),
                                      ),
                                     ),
                                     const SizedBox(width: 5),
                                     InkWell(
                                      onTap: (){
                                        setState(() {
                                          allday--;
                                        });
                                      },
                                       child: Container(
                                        height: 40,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.remove_circle_outline,color: kwhite,),
                                        ),
                                       ),
                                     ),
                                   ],
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),    
                   const Divider(thickness: 1,),  
                   Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: korange,
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child: Center(
                        child: Text("SUBMIT",style: TextStyle(color: kwhite,fontSize: 18),),
                      ),
                      ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(bottom: 20,right: 20,left: 20),
                     child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child: Center(
                        child: Text("Cancel",style: TextStyle(color: kblue,fontSize: 18),),
                      ),
                      ),
                   ),
              ],
            ),
          ),
    );
  }
}