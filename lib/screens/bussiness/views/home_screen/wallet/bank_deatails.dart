import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../constands/constands.dart';
import 'dart:io';

import 'edit_screen.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({super.key});

  @override
  State<BankDetailsScreen> createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  var nameController = TextEditingController();
  var accountController = TextEditingController();
  var accountypeController = TextEditingController();
  var numberController = TextEditingController();
  var ifscController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();

  File? image;

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

  bool passwordvisible = false;
  bool conpasswordvisible = false;
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: kwhite,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text(
                      'Bank Details',
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kwhite,
                            minimumSize: Size(60, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onPressed: () {
                          Get.to(EditScreen());
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(color: kblue),
                        )),
                  )
                ],
              ),
            ),
          )),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: 'Bank Name',
                    hintStyle: TextStyle(fontSize: 18, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: accountController,
                decoration: InputDecoration(
                    hintText: 'Bank Account Name',
                    hintStyle: TextStyle(fontSize: 18, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: accountypeController,
                decoration: InputDecoration(
                    hintText: ' Account Type',
                    hintStyle: TextStyle(fontSize: 18, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: numberController,
                decoration: InputDecoration(
                    hintText: 'Bank Account Number',
                    hintStyle: TextStyle(fontSize: 18, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: ifscController,
                decoration: InputDecoration(
                    hintText: 'IFSC code',
                    hintStyle: TextStyle(fontSize: 18, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordvisible = !passwordvisible;
                          });
                        },
                        icon: passwordvisible
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                    hintStyle: TextStyle(fontSize: 18, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                controller: confirmController,
                decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: conpasswordvisible
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                    hintStyle: TextStyle(fontSize: 18, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            ksizedbox40,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
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
                        
                ],
              ),
            ),
            ksizedbox10,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'Upload Your Shop Photo',
                    style: TextStyle(fontSize: 15, color: kblue),
                  ),
                ],
              ),
            ),
            ksizedbox20,
            
          ],
        ),
      ]),
    );
  }
}
