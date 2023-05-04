import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constands/constands.dart';
import '../busines_widget/textfield_widget.dart';

class ContactAdmin extends StatefulWidget {
  const ContactAdmin({super.key});

  @override
  State<ContactAdmin> createState() => _ContactAdminState();
}

class _ContactAdminState extends State<ContactAdmin> {
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var descriptionController = TextEditingController();
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
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
                    padding: const EdgeInsets.only(left: 81),
                    child: Text(
                      'Support',
                      style: TextStyle(fontSize: 23, color: Color(0xffF8F9FD)),
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: ListView(
        children:[ Column(
          children: [
            Column(children:[ 
              textFiled('  Your Name', nameController),
              ksizedbox10,
              textFiled('  Mobile Number', mobileController),
              ksizedbox10,
              textFiled('  Email', emailController),
             descriptiontextFiled('  Description', descriptionController),
             ksizedbox20,
             ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kblue,
                minimumSize: Size(MediaQuery.of(context).size.width*0.9,44)
              ),
              onPressed: (){},
              child: Text('Submit',style: TextStyle(fontSize: 20),)),
              ksizedbox20,
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Contact Admin',style: TextStyle(fontSize: 21),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(':',style: TextStyle(fontSize: 21),),
                  ),
                  Text('+9991458154',style: TextStyle(fontSize: 18,color: kblue),)
                    
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 21,top: 8),
                child: Row(
                 
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text('BVC Number ',style: TextStyle(fontSize: 21),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Text(':',style: TextStyle(fontSize: 21),),
                  ),
                  Text('',style: TextStyle(fontSize: 18,color: kblue),)
                    
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0,top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('Admin Email',style: TextStyle(fontSize: 21),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 41),
                    child: Text(':',style: TextStyle(fontSize: 21),),
                  ),
                  Text('Customer@gmail.com',style: TextStyle(fontSize: 18 ,color: kblue),)
                    
                  ],
                ),
              ),
                Padding(
                padding: const EdgeInsets.only(right: 0,top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Text('Head Office',style: TextStyle(fontSize: 21),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Text(':',style: TextStyle(fontSize: 21),),
                  ),
                  Text('No 781,Second Street',style: TextStyle(fontSize: 18 ,color: kblue),)
                    
                  ],
                ),
              ),
                Padding(
                padding: const EdgeInsets.only(right: 0,top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0,right:48 ),
                    child: Text('Address',style: TextStyle(fontSize: 21),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text(':',style: TextStyle(fontSize: 21),),
                  ),
                  Text('New Chennai',style: TextStyle(fontSize: 18 ,color: kblue),)
                    
                  ],
                ),
              )
          ])],
        ),
        ]
      ),
    );
  }

  Widget textFiled(String hinttext, dynamic controller) {
    return Padding(
      padding: const EdgeInsets.only(right: 12,left: 12,top: 12),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          
         color: Color(0xffF2F1F1),
         border: Border(
          bottom: BorderSide(
            
              color: Color(0xffF2F1F1)
          )
         )
        ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              hintText: hinttext,hintStyle: TextStyle(
                fontSize: 16.5,
                color: Color(0xff6E6D6E)
              ),

              border: OutlineInputBorder(
                
                borderSide: BorderSide(
                  color: Color(0xffF2F1F1)
                )
              )),
          ),
      
      ),
    );
  }
  Widget descriptiontextFiled(String hinttext, dynamic controller) {
    return Padding(
      padding: const EdgeInsets.only(right: 12,left: 12,top: 12),
      child: Container(
        height: MediaQuery.of(context).size.height*0.2,
        decoration: BoxDecoration(
          
         color: Color(0xffF2F1F1),
         border: Border(
          bottom: BorderSide(
            
              color: Color(0xffF2F1F1)
          )
         )
        ),
          child: TextField(
          
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              hintText: hinttext,hintStyle: TextStyle(
                fontSize: 16.5,
                color: Color(0xff6E6D6E)
              ),
              border: OutlineInputBorder(
                
                borderSide: BorderSide(
                  color: Color(0xffF2F1F1)
                )
              )),
          ),
      
      ),
    );
  }
}
