import 'package:bci/controllers/settings_controllers.dart';
import 'package:bci/screens/bussiness/views/home_screen/contact_admin.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constands/constands.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

 final settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:const Color(0xffF9F8FD),
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: Get.back,
                        child:
                            Image.asset('assets/images/chevron-left (2).png')),
                    const Padding(
                      padding:  EdgeInsets.only(right: 20),
                      child: Text(
                        'My Account',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(ContactAdmin());
                        },
                        child: Image.asset(
                            'assets/images/3669173_help_ic_icon.png'))
                  ],
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: 
           GetBuilder<SettingsController>(
             builder: (_) {
               return ListView(
                children: [
                  InkWell(
                    onTap: (){
                       print(settingsController.actIndex);
                      if(settingsController.actIndex.value == 0){
                        print("-----");
                         settingsController.actIndex(10);
                         print(settingsController.actIndex);
                      }else 
                       {
                         settingsController.actIndex(0);
                      }
                      settingsController.update();
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Profile Setting',
                          style: TextStyle(
                              color: kblue, fontSize: 21, fontWeight: FontWeight.w500),
                        ),
                     Image.asset('assets/images/Icon awesome-caret-down.png') ],
                    ),
                  ),
                  if(settingsController.actIndex.value == 0)
                   Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      height: 800,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            offset: Offset(0, 0)
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(""),
                                Image.asset('assets/images/settingprofile.png'),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 40),
                                  child: Text("Edit",
                                  style: TextStyle(color: Color(0xffFF5003),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),),
                                ),
                              ],
                            ),
                            Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "User Name",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "07/06/2023",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "user123@gmail.com",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "9876543210",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "Occupation",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "Father Name",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "Mother Name",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "Married Unmarried",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "Wedding Date",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "Spouse Name",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "Date of Birth",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "No.of Childrens",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "18 yrs",
                                                     //suffixIcon:const Icon(Icons.upload),
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 20),
                             child: Container(
                              height: 50,
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(color:const Color(0xffFF9021)),
                                boxShadow:const [
                                  BoxShadow(
                                    color: Color(0xffFF5003),
                                    blurRadius: 2.0,
                                  ),
                                ]
                              ),
                              child:const Center(
                                child: Text("Submit",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w500),),
                              ),
                             ),
                           ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(thickness: 2),
                  InkWell(
                    onTap: (){
                        print(settingsController.actIndex);
                      if(settingsController.actIndex.value == 1){
                        print("-----");
                         settingsController.actIndex(10);
                         print(settingsController.actIndex);
                      }else 
                       {
                         settingsController.actIndex(1);
                      }
                      settingsController.update();
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Office Address',
                          style: TextStyle(
                              color: kblue, fontSize: 21, fontWeight: FontWeight.w500),
                        ),
                    Image.asset('assets/images/Icon awesome-caret-down.png')  ],
                    ),
                  ),
                   if(settingsController.actIndex.value == 1)
                   Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            offset: Offset(0, 0)
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:const [
                                Text("Edit",
                                style: TextStyle(color: Color(0xffFF5003),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),),
                              ],
                            ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "Door No",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "Building name",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "Address",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "City",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "State",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                          
                           Padding(
                             padding: const EdgeInsets.only(top: 20),
                             child: Container(
                              height: 50,
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(color:const Color(0xffFF9021)),
                                boxShadow:const [
                                  BoxShadow(
                                    color: Color(0xffFF5003),
                                    blurRadius: 2.0,
                                  ),
                                ]
                              ),
                              child:const Center(
                                child: Text("Submit",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w500),),
                              ),
                             ),
                           ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const Divider(thickness: 2),
                  InkWell(
                    onTap: (){
                        print(settingsController.actIndex);
                      if(settingsController.actIndex.value == 2){
                        print("-----");
                         settingsController.actIndex(10);
                         print(settingsController.actIndex);
                      }else 
                       {
                         settingsController.actIndex(2);
                      }
                      settingsController.update();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Residential Address',
                          style: TextStyle(
                              color: kblue, fontSize: 21, fontWeight: FontWeight.w500),
                        ),
                    Image.asset('assets/images/Icon awesome-caret-down.png')  ],
                    ),
                  ),
                   if(settingsController.actIndex.value == 2)
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      height: 445,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            offset: Offset(0, 0)
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:const [
                                Text("Edit",
                                style: TextStyle(color: Color(0xffFF5003),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),),
                              ],
                            ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "Door No",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "Building name",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "Address",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "City",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "State",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "Personal ID",
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                                             height: 37,
                                             width: size.width,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(2),
                                                 border: Border.all(color:const Color(0xff707070)),
                                                 color:const Color(0xffF9F8FD)),
                                             alignment: Alignment.center,
                                             child: Padding(
                                               padding:const EdgeInsets.only(left: 15, right: 10),
                                               child: TextField(
                                                 //controller: usernamecontroller,
                                                 decoration: InputDecoration(
                                                     isCollapsed: true,
                                                     isDense: true,
                                                     border: InputBorder.none,
                                                     hintText: "Adhaar ID",
                                                     //suffixIcon:const Icon(Icons.upload),
                                                     hintStyle: TextStyle(
                                                     color: kblue,
                                                     fontWeight: FontWeight.w400,
                                                     )),
                                               ),
                                             ),
                                           ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 20),
                             child: Container(
                              height: 50,
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(color:const Color(0xffFF9021)),
                                boxShadow:const [
                                  BoxShadow(
                                    color: Color(0xffFF5003),
                                    blurRadius: 2.0,
                                  ),
                                ]
                              ),
                              child:const Center(
                                child: Text("Submit",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w500),),
                              ),
                             ),
                           ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
          );
             }
           ),
        ),
    );
  }
}
