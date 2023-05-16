import 'dart:io';

import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/screens/bussiness/views/home_screen/settings/edit_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constands/constands.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  var nameController = TextEditingController();
  var displayNameController = TextEditingController();
  var addressController = TextEditingController();
  var signatureController = TextEditingController();
  var contactController = TextEditingController();
  var numberController = TextEditingController();
  var aleternativeController = TextEditingController();
  var gstnoController = TextEditingController();
  var gstcategoryController = TextEditingController();
  var weblinkController = TextEditingController();
  var digitController = TextEditingController();
  var categoryController = TextEditingController();
  File? image;
  File? image2;

  Future pickerimage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imagetemp = File(image.path);
      setState(() {
        this.image = imagetemp;
      });
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }

  // Future imagepic() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (image == null) return;
  //     final imagetemp = File(image.path);
  //     setState(() {
  //       this.image = imagetemp;
  //     });                               this is camera picking code
  //   } catch (e) {
  //     print('Failed to pick image:$e');
  //   }
  // }

  Future pickerimage2() async {
    try {
      final image2 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image2 == null) return;
      final imagetemp2 = File(image2.path);
      setState(() {
        this.image2 = imagetemp2;
      });
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }

  // Future imagepic2() async {
  //   try {
  //     final image2 = await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (image2 == null) return;
  //     final imagetemp2 = File(image2.path);
  //     setState(() {
  //       this.image2 = imagetemp2;
  //     });
  //   } catch (e) {
  //     print('Failed to pick image:$e');
  //   }
  // }

  final profileController = Get.find<ProfileController>();

  @override
  void initState() {

    super.initState();
    setDefault();
  }

  setDefault() async {
    await profileController.getProfile();
    if (profileController.profileData.isNotEmpty) {
      nameController.text = profileController.profileData.first.name;
      numberController.text = profileController.profileData.first.mobile;
    }
  }

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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
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
                    padding: const EdgeInsets.only(right: 85),
                    child: Text(
                      'My Account',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: ListView(children: [
        Column(
          children: [
            Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/settingprofile.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 10),
                    child: TextButton(
                        onPressed: () {
                          Get.to(SettingEditScreen());
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(fontSize: 22, color: kOrange),
                        )),
                  ),
                ],
              )
            ]),
            ksizedbox20,
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: '  User Name',
                    hintStyle: TextStyle(fontSize: 20, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextField(
                controller: displayNameController,
                decoration: InputDecoration(
                    hintText: '  Merchant display name',
                    hintStyle: TextStyle(fontSize: 20, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextField(
                controller: addressController,
                decoration: InputDecoration(
                    hintText: '  Business Address',
                    hintStyle: TextStyle(fontSize: 20, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            //   child: TextField(
            //     controller: signatureController,
            //     decoration: InputDecoration(
            //         hintText: '  Authorized signature name',
            //         hintStyle: TextStyle(fontSize: 20, color: kblue),
            //         border: OutlineInputBorder()),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            //   child: TextField(
            //     controller: contactController,
            //     decoration: InputDecoration(
            //         hintText: '  Contact Person',
            //         hintStyle: TextStyle(fontSize: 20, color: kblue),
            //         border: OutlineInputBorder()),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextField(
                controller: numberController,
                decoration: InputDecoration(
                    hintText: '  Mobile Number',
                    hintStyle: TextStyle(fontSize: 20, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextField(
                controller: aleternativeController,
                decoration: InputDecoration(
                    hintText: '  Alternate Phone Number',
                    hintStyle: TextStyle(fontSize: 20, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextField(
                controller: gstnoController,
                decoration: InputDecoration(
                    hintText: '  GST No.',
                    hintStyle: TextStyle(fontSize: 20, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextField(
                controller: gstcategoryController,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    hintText: '  We are GST exempted category',
                    hintStyle: TextStyle(fontSize: 20, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextField(
                controller: weblinkController,
                decoration: InputDecoration(
                    hintText: '  Weblink',
                    hintStyle: TextStyle(fontSize: 20, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            ksizedbox40,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  image != null
                      ? Container(
                          height: 130, width: 135, child: Image.file(image!))
                      : InkWell(
                          onTap: () {
                            pickerimage();
                          },
                          child: Container(
                              height: 130,
                              width: 135,
                              color: Color(0xffE4E4E4),
                              child:
                                  Image.asset('assets/images/imageupload.png')),
                        ),
                  image2 != null
                      ? Container(
                          height: 130, width: 135, child: Image.file(image2!))
                      : InkWell(
                          onTap: () {
                            pickerimage2();
                          },
                          child: Container(
                              height: 130,
                              width: 135,
                              color: Color(0xffE4E4E4),
                              child:
                                  Image.asset('assets/images/imageupload.png')),
                        ),
                ],
              ),
            ),
            ksizedbox10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Aadhar Card',
                  style: TextStyle(fontSize: 16, color: kblue),
                ),
                Text(
                  'Pan Card',
                  style: TextStyle(fontSize: 16, color: kblue),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextField(
                controller: digitController,
                decoration: InputDecoration(
                    hintText: '  0.0,0.0',
                    hintStyle: TextStyle(fontSize: 20, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextField(
                controller: categoryController,
                decoration: InputDecoration(
                    hintText: '  Merchant Category',
                    hintStyle: TextStyle(fontSize: 20, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            ksizedbox20
          ],
        ),
      ]),
    );
  }
}
