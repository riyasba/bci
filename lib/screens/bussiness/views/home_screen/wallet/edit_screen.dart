import 'dart:io';

import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constands/constands.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
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
    final mediaquery = MediaQuery.of(context).size;
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
                      style: TextStyle(fontSize: 23, color: Color(0xffF8F9FD)),
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
                        onPressed: () {},
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
                    labelText: 'Bank Name',
                    hintStyle: TextStyle(fontSize: 18, color: kblue),
                    border: const OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: accountController,
                decoration: InputDecoration(
                    labelText: 'Bank Account Name',
                    hintStyle: TextStyle(fontSize: 18, color: kblue),
                    border:const OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: accountypeController,
                decoration: InputDecoration(
                    hintText: ' Account Type',
                    hintStyle: TextStyle(fontSize: 18, color: kblue),
                    border: const OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: numberController,
                decoration: InputDecoration(
                    labelText: 'Bank Account Number',
                    hintStyle: TextStyle(fontSize: 18, color: kblue),
                    border: const OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: ifscController,
                decoration: InputDecoration(
                    labelText: 'IFSC code',
                    hintStyle: TextStyle(fontSize: 18, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordvisible = !passwordvisible;
                          });
                        },
                        icon: passwordvisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    hintStyle: TextStyle(fontSize: 18, color: kblue),
                    border: const OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                controller: confirmController,
                decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: conpasswordvisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    hintStyle: TextStyle(fontSize: 18, color: kblue),
                    border: const OutlineInputBorder()),
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
                                            child: const Text(
                                              'Choose Gallery',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              imagepic();
                                            },
                                            child: const Text(
                                              'Choose Camera',
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
                              color: const Color(0xffE4E4E4),
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
            ksizedbox30,
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: kOrange,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: const Offset(0.0, 0.75),
                          blurRadius: 7,
                          color: kyellow)
                    ]),
                height: 42,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Center(
                    child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20, color: kwhite),
                )),
              ),
            ),
            ksizedbox30
          ],
        ),
      ]),
    );
  }
}
