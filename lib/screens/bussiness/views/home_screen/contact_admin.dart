import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
    profileController.supportAdminDetail();
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
          preferredSize:const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      'Support',
                      style: TextStyle(fontSize: 20,
                       color: Color(0xffF8F9FD),
                       fontWeight: FontWeight.w700
                       ),
                    ),
                  ),
                  Container(width: 30,)
                ],
              ),
            ),
          )),
      body: GetBuilder<ProfileController>(
        builder: (_) {
          return ListView(
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
                profileController.contactDetailsData != null
                  ? Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20, right: 20, top: 15),
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  Text(
                                    'Contact Admin :',
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xff443C3C)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              profileController
                                      .contactDetailsData!.appPhone.isEmpty
                                  ? const Text("")
                                  : InkWell(
                                      onTap: () {
                                        launch(
                                            "tel:${profileController.contactDetailsData!.appPhone}");
                                      },
                                      child: Text(
                                          profileController
                                              .contactDetailsData!.appPhone,
                                          style: TextStyle(
                                              fontSize: 15.sp, color: kblue)),
                                    ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: Row(
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    'Admin Email :',
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xff443C3C)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 29,
                                  ),
                                  profileController
                                          .contactDetailsData!.appEmail.isEmpty
                                      ? const Text("")
                                      : Container(
                                          child: Text(
                                              profileController
                                                  .contactDetailsData!.appEmail,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 15.sp, color: kblue)),
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: Row(
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    'Admin Address :',
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xff443C3C)),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  profileController
                                          .contactDetailsData!.appEmail.isEmpty
                                      ? const Text("")
                                      : Container(
                                          width: 200,
                                          child: Text(
                                              profileController
                                                  .contactDetailsData!.appAddress,
                                              maxLines: 4,
                                              style: TextStyle(
                                                  fontSize: 15.sp, color: kblue)),
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(),
              ]),
            ]
          );
        }
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
