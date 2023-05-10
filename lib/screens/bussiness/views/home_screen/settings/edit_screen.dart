import 'dart:io';

import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constands/constands.dart';

class SettingEditScreen extends StatefulWidget {
  const SettingEditScreen({super.key});

  @override
  State<SettingEditScreen> createState() => _SettingEditScreenState();
}

class _SettingEditScreenState extends State<SettingEditScreen> {
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
  File? imageprofile;

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

  Future imagepic() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imagetemp = File(image.path);
      setState(() {
        this.image = imagetemp;
      });
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }

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

  Future imagepic2() async {
    try {
      final image2 = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image2 == null) return;
      final imagetemp2 = File(image2.path);
      setState(() {
        this.image2 = imagetemp2;
      });
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }

  Future profileimage() async {
    try {
      final imageprofile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageprofile == null) return;
      final imageprofiletemp = File(imageprofile.path);
      setState(() {
        this.imageprofile = imageprofiletemp;
      });
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }

  Future profilepic() async {
    try {
      final imageprofile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (imageprofile == null) return;
      final imagepictemp = File(imageprofile.path);
      setState(() {
        this.imageprofile = imagepictemp;
      });
    } catch (e) {
      print('Failed to pick image:$e');
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
      body: ListView(
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imageprofile != null
                      ? Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          height: 130,
                          width: 135,
                          child: Image.file(imageprofile!))
                      : InkWell(
                          onTap: () {
                            profileimage();
                          },
                          child: Container(
                            height: 130,
                            width: 135,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset(
                              'assets/images/settingprofile.png',
                              fit: BoxFit.fitWidth,
                              width: 110,
                            ),
                          ),
                        ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 95, left: 50),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    shadows: [
                      BoxShadow(
                          offset: Offset(0.0, 0.75),
                          blurRadius: 1,
                          color: kgrey)
                    ],
                  )
                ]),
              )
            ],
          ),
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
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: TextField(
              controller: signatureController,
              decoration: InputDecoration(
                  hintText: '  Authorized signature name',
                  hintStyle: TextStyle(fontSize: 20, color: kblue),
                  border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: TextField(
              controller: contactController,
              decoration: InputDecoration(
                  hintText: '  Contact Person',
                  hintStyle: TextStyle(fontSize: 20, color: kblue),
                  border: OutlineInputBorder()),
            ),
          ),
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
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            pickerimage();
                                          },
                                          child: Text(
                                            'Choose ur gallery',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            imagepic();
                                          },
                                          child: Text(
                                            'Choose ur Camera',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          ))
                                    ],
                                  ),
                                );
                              });
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
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            pickerimage2();
                                          },
                                          child: Text(
                                            'Choose ur gallery',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            imagepic2();
                                          },
                                          child: Text(
                                            'Choose ur Camera',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          ))
                                    ],
                                  ),
                                );
                              });
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
          ksizedbox30,
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kOrange,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.5, 45)),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                )),
          ),
          ksizedbox20
        ],
      ),
    );
  }
}
