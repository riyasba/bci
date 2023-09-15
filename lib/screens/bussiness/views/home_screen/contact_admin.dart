import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constands/constands.dart';


class ContactAdmin extends StatefulWidget {
  const ContactAdmin({super.key});

  @override
  State<ContactAdmin> createState() => _ContactAdminState();
}

class _ContactAdminState extends State<ContactAdmin> {
  
  final profileController = Get.find<ProfileController>();
  final settingsController = Get.find<SettingsController>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setDefault();
  }

  setDefault() async {
    await profileController.getProfile();
    nameController.text = profileController.profileData.first.name;
    phoneController.text = profileController.profileData.first.mobile;
    emailController.text = profileController.profileData.first.email;
  }



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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
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
                    padding: const EdgeInsets.only(right: 40),
                    child: Text(
                      'Support',
                      style: TextStyle(fontSize: 23, color: Color(0xffF8F9FD)),
                    ),
                  ),
                   Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Image.asset('assets/images/helps.png'),
                    )
                ],
              ),
            ),
          )),
      body: ListView(
        children:[ 
          Column(
            children:[ 
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color:const Color(0xffF2F1F1)),
                alignment: Alignment.center,
                child: Padding(
                  padding:const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: nameController,
                    decoration:const InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText:"Name",
                        hintStyle: TextStyle(
                          color: Colors.black,
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
                child: Padding(
                  padding:const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    controller: phoneController,
                    decoration:const InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText:"Mobile",
                        hintStyle: TextStyle(
                          color: Colors.black,
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
                child: Padding(
                  padding:const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    controller: emailController,
                    decoration:const InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText:"Email",
                        hintStyle: TextStyle(
                          color: Colors.black,
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
                child: Padding(
                  padding:const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: titleController,
                    decoration:const InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText:"Title",
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
                child: Padding(
                  padding:const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: descriptionController,
                    maxLines: 100,
                    decoration:const InputDecoration(
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
              child: InkWell(
                onTap: (){
                  settingsController.createSupport(title: titleController.text, message: descriptionController.text);
                },
                child: Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                        color:const Color(0xff003366)
                  ),
                  child:const Center(
                    child: Text("Submit",style: TextStyle(fontSize: 20,color: Color(0xffF9F8FD)),),
                  ),
                ),
              ),
            ),
            ksizedbox20,
            Padding(
              padding: const EdgeInsets.only(left: 30,),
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Text('Contact Admin',style: TextStyle(fontSize:17),)),
                        Text(':',style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ),
                
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Text('+9991458154',style: TextStyle(fontSize: 15.5,color: kblue),))
                  
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,),
              child: Row(
                children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text('BVC Number ',style: TextStyle(fontSize: 16),)),
                       Text(':',style: TextStyle(fontSize: 16),),
                  ],
                ),
               
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Text('',style: TextStyle(fontSize: 15.5,color: kblue),))
                  
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text('Admin Email',style: TextStyle(fontSize: 17),)),
                       Text(':',style: TextStyle(fontSize: 16),),
                  ],
                ),
               
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Text('Customer@gmail.com',style: TextStyle(fontSize: 15.5 ,color: kblue),))
                  
                ],
              ),
            ),
              Padding(
                padding: const EdgeInsets.only(left: 30,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Text('Head Office',style: TextStyle(fontSize: 17),)),
                         Text(':',style: TextStyle(fontSize: 16),),
                    ],
                  ),
                 
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text('No 781,Second Street',style: TextStyle(fontSize: 15.5 ,color: kblue),))
                    
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Text('Address',style: TextStyle(fontSize: 17),)),
                          Text(':',style: TextStyle(fontSize: 16),),
                    ],
                  ),
                
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text('New Chennai',style: TextStyle(fontSize: 15.5 ,color: kblue),))
                    
                  ],
                ),
              )
          ]),
        ]
      ),
    );
  }

  Widget textFiled(String hinttext, dynamic controller) {
    return Padding(
      padding: const EdgeInsets.only(right: 12,left: 12,top: 12),
      child: Container(
        height: 50,
        decoration:const BoxDecoration(
         color: Color(0xffF2F1F1),
         border: Border(
          bottom: BorderSide(
              color: Color(0xffF2F1F1),
          )
         )
        ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                hintText: hinttext,
                hintStyle: TextStyle(
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
          maxLines: 7,
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
