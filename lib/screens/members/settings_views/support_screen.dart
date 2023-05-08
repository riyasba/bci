import 'package:bci/constands/constands.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:const Color(0xffF9F8FD),
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child:const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Support',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffF9F8FD)),
                      ),
                    ),
                    Text("")
                  ],
                ),
              ),
            ),
          )),
          body: ListView(
            children: [
               Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color:const Color(0xffF2F1F1)),
                  alignment: Alignment.center,
                  child:const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      //controller: usernamecontroller,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Your Name",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,top: 20),
                child: Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color:const Color(0xffF2F1F1)),
                  alignment: Alignment.center,
                  child:const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      //controller: usernamecontroller,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Mobile",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,top: 20),
                child: Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color:const Color(0xffF2F1F1)),
                  alignment: Alignment.center,
                  child:const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      //controller: usernamecontroller,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,top: 20),
                child: Container(
                  height: 150,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color:const Color(0xffF2F1F1)),
                  alignment: Alignment.center,
                  child:const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      //controller: usernamecontroller,
                      maxLines: 100,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Description",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                        color:const Color(0xff003366)
                  ),
                  child:const Center(
                    child: Text("Submit",style: TextStyle(fontSize: 25,color: Color(0xffF9F8FD)),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  children: [
                    Column(
                      children:const [
                        Text('Contact Admin',style: TextStyle(fontSize: 18,color: Color(0xff443C3C)),),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(width: 15,),
                        Text('+91 9914581540',style: TextStyle(fontSize: 16,color: kblue)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  children: [
                    Row(
                      children:const [
                        Text('Admin Email :',style: TextStyle(fontSize: 18,color: Color(0xff443C3C)),),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(":"),
                        const SizedBox(width: 15,),
                        Text('Customer@gmail.com',style: TextStyle(fontSize: 16,color: kblue)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}