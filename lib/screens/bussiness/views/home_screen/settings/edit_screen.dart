import 'dart:io';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/category_model.dart';
import 'package:bci/models/merchant_update_profile.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  var bankNameController = TextEditingController();
  var bankAccountNameController = TextEditingController();
  var bankAccountNumberController = TextEditingController();
  var accountTypeController = TextEditingController();
  var ifscCodeController = TextEditingController();
  

  File? image;
  File? image2;
  File? imageprofile;

  final profileController = Get.find<ProfileController>();

  final authController = Get.find<AuthController>();

  var merchantCategory;

  @override
  void initState() {
    super.initState();
    setDefault();
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

  setDefault() async {
    await profileController.getProfile();
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
  
  //
  File? simage;

  Future spickerimage() async {
    try {
      final simage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (simage == null) return;
      final imagetemp = File(simage.path);
      setState(() {
        this.simage = imagetemp;
      });
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }

  Future simagepic() async {
    try {
      final simage = await ImagePicker().pickImage(source: ImageSource.camera);
      if (simage == null) return;
      final imagetemp = File(simage.path);
      setState(() {
        this.simage = imagetemp;
      });
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }
  //

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
      profileController.updateProfilePic(imageprofiletemp);
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
    var size = MediaQuery.of(context).size;
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
              GetBuilder<ProfileController>(builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    imageprofile != null
                        ? Container(
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            height: 130,
                            width: 135,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.file(imageprofile!)))
                        : InkWell(
                            onTap: () {
                              profileimage();
                            },
                            child: profileController.profileData.isEmpty
                                ? Container()
                                : Container(
                                    height: 130,
                                    width: 135,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
                                    child: profileController.profileData.first
                                                .profilePicture ==
                                            null
                                        ? Image.asset(
                                            'assets/images/settingprofile.png',
                                            fit: BoxFit.fitWidth,
                                            width: 110,
                                          )
                                        : Image.network(profileController
                                            .profileData.first.profilePicture),
                                  ),
                          ),
                  ],
                );
              }),
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
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              height: 55,
              child: TextField(
                controller: displayNameController,
                decoration: InputDecoration(
                    hintText: '  Merchant display name',
                    hintStyle: TextStyle(fontSize: 20, color: kblue),
                    border: const OutlineInputBorder()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              height: 55,
              child: TextField(
                controller: addressController,
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
          //     controller: contactController,
          //     decoration: InputDecoration(
          //         hintText: '  Contact Person',
          //         hintStyle: TextStyle(fontSize: 20, color: kblue),
          //         border: const OutlineInputBorder()),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              height: 55,
              child: TextField(
                controller: numberController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                decoration: InputDecoration(
                    hintText: '  Mobile Number',
                    hintStyle: TextStyle(fontSize: 20, color: kblue),
                    border: const OutlineInputBorder()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              height: 55,
              child: TextField(
                controller: aleternativeController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
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
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15),
                ],
                decoration: InputDecoration(
                    hintText: 'GST No.',
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
                  controller: bankNameController,
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
                  decoration: InputDecoration(
                      hintText: 'IFSC Code',
                      hintStyle: TextStyle(fontSize: 18, color: kblue),
                      border: const OutlineInputBorder()),
                ),
              ),
            ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          //   child: TextField(
          //     controller: gstcategoryController,
          //     decoration: InputDecoration(
          //         suffixIcon: const Icon(Icons.arrow_drop_down),
          //         hintText: '  We are GST exempted category',
          //         hintStyle: TextStyle(fontSize: 20, color: kblue),
          //         border: OutlineInputBorder()),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          //   child: TextField(
          //     controller: weblinkController,
          //     decoration: InputDecoration(
          //         hintText: '  Weblink',
          //         hintStyle: TextStyle(fontSize: 20, color: kblue),
          //         border: OutlineInputBorder()),
          //   ),
          // ),
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                image != null
                    ? Container(
                        height: 100, width: 100, child: Image.file(image!))
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
                                            'Choose ur gallery',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            imagepic();
                                          },
                                          child: const Text(
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
                            height: 100,
                            width: 100,
                            color: const Color(0xffE4E4E4),
                            child:
                                Image.asset('assets/images/imageupload.png')),
                      ),
                image2 != null
                    ? Container(
                        height: 100, width: 100, child: Image.file(image2!))
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
                                          child: const Text(
                                            'Choose ur gallery',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            imagepic2();
                                          },
                                          child: const Text(
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
                            height: 100,
                            width: 100,
                            color: const Color(0xffE4E4E4),
                            child:
                                Image.asset('assets/images/imageupload.png')),
                      ),
                      //
                      simage != null
                      ? Container(
                          height: 100, width: 100, child: Image.file(simage!))
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
                                              spickerimage();
                                            },
                                            child: Text(
                                              'Choose ur gallery',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              simagepic();
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
                              height: 100,
                              width: 100,
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
              ),
              Text(
                'Shop Image',
                style: TextStyle(fontSize: 16, color: kblue),
              ),
            ],
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
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
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
          }),
          ksizedbox30,
          Obx(
            () => profileController.isLoading.isTrue
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kOrange,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.5, 45)),
                    onPressed: () {},
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ))
                : Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kOrange,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.5, 45)),
                        onPressed: () {
                          MerchantUpdateModel merchantUpdateModel =
                              MerchantUpdateModel(
                                  address: addressController.text,
                                  alternateMobile: aleternativeController.text,
                                  categoryId: categoryController.text,
                                  gstNo: gstnoController.text,
                                  mobile: numberController.text,
                                  name: displayNameController.text,
                                  accountType: accountTypeController.text,
                                  bankAccountName: bankAccountNameController.text,
                                  bankAccountNumber: bankAccountNumberController.text,
                                  bankName: bankNameController.text,
                                  ifscCode: ifscCodeController.text,
                                  shopImage: simage!,
                                  );
                          profileController.updateProfile(
                              merchantUpdateModel: merchantUpdateModel);
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        )),
                  ),
          ),
          ksizedbox20
        ],
      ),
    );
  }
}
