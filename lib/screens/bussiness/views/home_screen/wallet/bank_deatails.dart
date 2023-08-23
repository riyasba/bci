import 'package:bci/controllers/profile_controller.dart';
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
 


  var bankNameController = TextEditingController();
  var bankAccountNameController = TextEditingController();
  var bankAccountNumberController = TextEditingController();
  var accountTypeController = TextEditingController();
  var ifscCodeController = TextEditingController();

  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    setDefault();
  }

  setDefault() async {
    await profileController.getProfile();
    profileController.update();
    if (profileController.profileData.isNotEmpty) {
      bankAccountNameController.text = profileController.profileData.first.bankAccountName;
      bankAccountNumberController.text = profileController.profileData.first.bankAccountNumber;
      bankNameController.text = profileController.profileData.first.bankName;
      accountTypeController.text = profileController.profileData.first.accountType;
      ifscCodeController.text = profileController.profileData.first.ifscCode;
    }
  }

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
                          fontSize: 21,
                          color: Colors.white),
                    ),
                  ),
                  Container()
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 10),
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //           backgroundColor: kwhite,
                  //           minimumSize: Size(60, 30),
                  //           shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(12))),
                  //       onPressed: () {
                  //         Get.to(EditScreen());
                  //       },
                  //       child: Text(
                  //         'Edit',
                  //         style: TextStyle(color: kblue),
                  //       )),
                  // )
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
                controller: bankNameController,
                readOnly: true,
                decoration: InputDecoration(
                    hintText: 'Bank Name',
                    hintStyle: TextStyle(fontSize: 16, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: bankAccountNameController,
                readOnly: true,
                decoration: InputDecoration(
                    hintText: 'Bank Account Name',
                    hintStyle: TextStyle(fontSize: 16, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: accountTypeController,
                readOnly: true,
                decoration: InputDecoration(
                    hintText: ' Account Type',
                    hintStyle: TextStyle(fontSize: 16, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: bankAccountNumberController,
                readOnly: true,
                decoration: InputDecoration(
                    hintText: 'Bank Account Number',
                    hintStyle: TextStyle(fontSize: 16, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: ifscCodeController,
                readOnly: true,
                decoration: InputDecoration(
                    hintText: 'IFSC code',
                    hintStyle: TextStyle(fontSize: 16, color: kblue),
                    border: OutlineInputBorder()),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            //   child: TextField(
            //     controller: passwordController,
            //     decoration: InputDecoration(
            //         hintText: 'Password',
            //         suffixIcon: IconButton(
            //             onPressed: () {
            //               setState(() {
            //                 passwordvisible = !passwordvisible;
            //               });
            //             },
            //             icon: passwordvisible
            //                 ? Icon(Icons.visibility)
            //                 : Icon(Icons.visibility_off)),
            //         hintStyle: TextStyle(fontSize: 18, color: kblue),
            //         border: OutlineInputBorder()),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            //   child: TextField(
            //     keyboardType: TextInputType.visiblePassword,
            //     controller: confirmController,
            //     decoration: InputDecoration(
            //         hintText: 'Confirm Password',
            //         suffixIcon: IconButton(
            //             onPressed: () {},
            //             icon: conpasswordvisible
            //                 ? Icon(Icons.visibility)
            //                 : Icon(Icons.visibility_off)),
            //         hintStyle: TextStyle(fontSize: 18, color: kblue),
            //         border: OutlineInputBorder()),
            //   ),
            // ),
            // ksizedbox40,
            ksizedbox20,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GetBuilder<ProfileController>(
                builder: (_) {
                  return Row(
                    children: [
                      profileController.profileData.isEmpty
                                  ? Image.asset('assets/images/settingprofile.png')
                                  : Container(
                                      height: 130,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(profileController
                                                  .profileData.first.shopImage)),
                                          borderRadius: BorderRadius.circular(5)),
                                    ),
                            
                    ],
                  );
                }
              ),
            ),
            ksizedbox10,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'Your Shop Photo',
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
