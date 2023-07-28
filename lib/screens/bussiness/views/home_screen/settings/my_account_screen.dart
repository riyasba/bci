import 'dart:io';

import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/category_model.dart';
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
  var bankNameController = TextEditingController();
  var bankAccountNameController = TextEditingController();
  var bankAccountNumberController = TextEditingController();
  var accountTypeController = TextEditingController();
  var ifscCodeController = TextEditingController();
  File? image;
  File? image2;

  final authController = Get.find<AuthController>();

  var merchantCategory;

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
    authController.getCategoryList();
    setDefault();
  }

  setDefault() async {
    await profileController.getProfile();
    profileController.update();
    if (profileController.profileData.isNotEmpty) {
      numberController.text = profileController.profileData.first.mobile;
      displayNameController.text = profileController.profileData.first.name;
      addressController.text =
          profileController.profileData.first.address ?? "";
      aleternativeController.text =
          profileController.profileData.first.alternateMobile ?? "";
      gstnoController.text = profileController.profileData.first.gstNo ?? "";
      categoryController.text = profileController.profileData.first.category;
      bankAccountNameController.text = profileController.profileData.first.bankAccountName;
      bankAccountNumberController.text = profileController.profileData.first.bankAccountNumber;
      bankNameController.text = profileController.profileData.first.bankName;
      accountTypeController.text = profileController.profileData.first.accountType;
      ifscCodeController.text = profileController.profileData.first.ifscCode;
      getCategorybyID();
    }
  }

  getCategorybyID() {
    authController.categoryList.forEach((element) {
      if (element.id.toString() ==
          profileController.profileData.first.category) {
        setState(() {
          merchantCategory = element;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
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
                  const Padding(
                    padding: EdgeInsets.only(right: 85),
                    child: Text(
                      'My Account',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: GetBuilder<ProfileController>(
        builder: (_) {
          return ListView(children: [
            Column(
              children: [
                Stack(children: [
                  if (profileController.profileData.isNotEmpty)
                    GetBuilder<ProfileController>(builder: (_) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          profileController.profileData.first.profilePicture == null
                              ? Image.asset('assets/images/settingprofile.png')
                              : Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(profileController
                                              .profileData.first.profilePicture)),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                        ],
                      );
                    }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 10),
                        child: TextButton(
                            onPressed: () {
                              Get.to(const SettingEditScreen());
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
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Container(
                    height: 55,
                    child: TextField(
                      controller: displayNameController,
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: '  Merchant display name',
                          hintStyle: TextStyle(fontSize: 20, color: kblue),
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Container(
                    height: 55,
                    child: TextField(
                      controller: addressController,
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: '  Business Address',
                          hintStyle: TextStyle(fontSize: 20, color: kblue),
                          border: const OutlineInputBorder()),
                    ),
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
                  child: Container(
                    height: 55,
                    child: TextField(
                      controller: numberController,
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: '  Mobile Number',
                          hintStyle: TextStyle(fontSize: 20, color: kblue),
                          border:const OutlineInputBorder()),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Container(
                    height: 55,
                    child: TextField(
                      controller: aleternativeController,
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: 'Alternate Phone Number',
                          hintStyle: TextStyle(fontSize: 18, color: kblue),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Container(
                    height: 55,
                    child: TextField(
                      controller: gstnoController,
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: 'GST No.',
                          hintStyle: TextStyle(fontSize: 18, color: kblue),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                ),
                ksizedbox10,
                GetBuilder<AuthController>(builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Container(
                      height: 55,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                              color: const Color.fromARGB(255, 5, 5, 5)
                                  .withOpacity(0.8))),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 15),
                        child: DropdownButton<CategoryList>(
                          value: merchantCategory,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          elevation: 0,
                          itemHeight: 55,
                          isDense: true,
                          dropdownColor: Colors.grey[250],
                          style: const TextStyle(color: Colors.black54),
                          hint: Text(
                            "Merchant Category Name",
                            style: TextStyle(fontSize: 16, color: kblue),
                          ),
                          onChanged: (CategoryList? value) {
                            setState(() {
                              merchantCategory = value!;
                              categoryController.text = value.id.toString();
                            });
                          },
                          items: authController.categoryList
                              .map<DropdownMenuItem<CategoryList>>(
                                  (CategoryList value) {
                            return DropdownMenuItem<CategoryList>(
                              value: value,
                              child: Text(value.title),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  );
                }
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Container(
                    height: 55,
                    child: TextField(
                      controller: bankAccountNameController,
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: 'Bank Name',
                          hintStyle: TextStyle(fontSize: 18, color: kblue),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Container(
                    height: 55,
                    child: TextField(
                      controller: bankAccountNameController,
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: 'Bank Account Name',
                          hintStyle: TextStyle(fontSize: 18, color: kblue),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Container(
                    height: 55,
                    child: TextField(
                      controller: accountTypeController,
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: 'Account Type',
                          hintStyle: TextStyle(fontSize: 18, color: kblue),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Container(
                    height: 55,
                    child: TextField(
                      controller: bankAccountNumberController,
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: 'Bank Account Number',
                          hintStyle: TextStyle(fontSize: 18, color: kblue),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Container(
                    height: 55,
                    child: TextField(
                      controller: ifscCodeController,
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: 'IFSC Code',
                          hintStyle: TextStyle(fontSize: 18, color: kblue),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                ),
                ksizedbox20
              ],
            ),
          ]);
        }
      ),
    );
  }
}
