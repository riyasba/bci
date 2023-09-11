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
  var mapUrlController = TextEditingController();
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

  bool isGSTNum = true;

  var aadharCardImage;
  var panCardImage;
  var shopImage;

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
      bankAccountNameController.text =
          profileController.profileData.first.bankAccountName;
      bankAccountNumberController.text =
          profileController.profileData.first.bankAccountNumber;
      bankNameController.text = profileController.profileData.first.bankName;
      accountTypeController.text =
          profileController.profileData.first.accountType;
      ifscCodeController.text = profileController.profileData.first.ifscCode;
      aadharCardImage = profileController.profileData.first.adharProof;
      panCardImage = profileController.profileData.first.panProof;
      shopImage = profileController.profileData.first.shopImage;
      mapUrlController.text = profileController.profileData.first.locationAddress;
      setState(() {});
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
        aadharCardImage = null;
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
        aadharCardImage = null;
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
          GetBuilder<ProfileController>(builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imageprofile != null
                    ? Stack(
                        children: [
                          Container(
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              height: 130,
                              width: 135,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.file(imageprofile!))),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: InkWell(
                              onTap: () {
                                profileimage();
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.grey.withOpacity(0.5),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(30)),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  shadows: [
                                    BoxShadow(
                                        offset: const Offset(0.0, 0.75),
                                        blurRadius: 1,
                                        color: kgrey)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : Stack(
                        children: [
                          InkWell(
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
                                            .profilePicture.isEmpty
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            child: Image.asset(
                                              'assets/images/settingprofile.png',
                                              fit: BoxFit.fitWidth,
                                              width: 110,
                                            ),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            child: Image.network(
                                                profileController.profileData
                                                    .first.profilePicture),
                                          ),
                                  ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: InkWell(
                              onTap: () {
                                profileimage();
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.grey.withOpacity(0.5),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(30)),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  shadows: [
                                    BoxShadow(
                                        offset: const Offset(0.0, 0.75),
                                        blurRadius: 1,
                                        color: kgrey)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
              ],
            );
          }),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              height: 55,
              child: TextField(
                controller: displayNameController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
                ],
                decoration: InputDecoration(
                    labelText: 'Merchant display name',
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
                    labelText: 'Business Address',
                    hintStyle: TextStyle(fontSize: 20, color: kblue),
                    border: const OutlineInputBorder()),
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              height: 60,
              child: TextField(
                controller: mapUrlController,
                decoration: InputDecoration(
                    labelText: 'Map Url',
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

                readOnly: true,
                decoration: InputDecoration(
                    labelText: 'Mobile Number',
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
                    labelText: 'Alternate Phone Number',
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
                onChanged: (value) {
                  setState(() {
                    isGSTNum = gstvalidate(value);
                  });
                },
                controller: gstnoController,
                textCapitalization: TextCapitalization.characters,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15),
                ],
                decoration: InputDecoration(
                    labelText: 'GST No',
                    hintStyle: TextStyle(fontSize: 18, color: kblue),
                    border: const OutlineInputBorder()),
              ),
            ),
          ),
          if (isGSTNum == false && gstnoController.text.isNotEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text(
                "GST number is not valid",
                style: TextStyle(color: Colors.red),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              height: 55,
              child: TextField(
                controller: bankNameController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
                ],
                decoration: InputDecoration(
                    labelText: 'Bank Name',
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
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
                ],
                decoration: InputDecoration(
                    labelText: 'Bank Account Holder Name',
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
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
                ],
                decoration: InputDecoration(
                    labelText: 'Account Type',
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
                keyboardType: TextInputType.number,
                controller: bankAccountNumberController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(16),
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                decoration: InputDecoration(
                    labelText: 'Bank Account Number',
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
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                ],
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                    labelText: 'IFSC Code',
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
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                aadharCardImage != null
                    ? Container(
                        height: 100,
                        width: 100,
                        child: Image.network(aadharCardImage))
                    : image != null
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
                                                Get.back();
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
                                                Get.back();
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
                                child: Image.asset(
                                    'assets/images/imageupload.png')),
                          ),
                panCardImage != null
                    ? Container(
                        height: 100,
                        width: 100,
                        child: Image.network(panCardImage))
                    : image2 != null
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
                                                Get.back();
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
                                                Get.back();
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
                                child: Image.asset(
                                    'assets/images/imageupload.png')),
                          ),
                //
                // simage != null
                //     ? Container(
                //         height: 100, width: 100, child: Image.file(simage!))
                //     : InkWell(
                //         onTap: () {
                //           showModalBottomSheet(
                //               context: context,
                //               builder: (context) {
                //                 return Container(
                //                   child: Row(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.spaceAround,
                //                     children: [
                //                       TextButton(
                //                           onPressed: () {
                //                             spickerimage();
                //                           },
                //                           child: const Text(
                //                             'Choose ur gallery',
                //                             style: TextStyle(
                //                                 color: Colors.black,
                //                                 fontSize: 16),
                //                           )),
                //                       TextButton(
                //                           onPressed: () {
                //                             simagepic();
                //                           },
                //                           child: const Text(
                //                             'Choose ur Camera',
                //                             style: TextStyle(
                //                                 color: Colors.black,
                //                                 fontSize: 16),
                //                           ))
                //                     ],
                //                   ),
                //                 );
                //               });
                //         },
                //         child: Container(
                //             height: 100,
                //             width: 100,
                //             color: const Color(0xffE4E4E4),
                //             child:
                //                 Image.asset('assets/images/imageupload.png')),
                //       ),
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
              // Text(
              //   'Shop Image',
              //   style: TextStyle(fontSize: 16, color: kblue),
              // ),
            ],
          ),
          // GetBuilder<AuthController>(builder: (_) {
          //   return Padding(
          //     padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          //     child: Container(
          //       height: 55,
          //       width: size.width,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(3),
          //           border: Border.all(
          //               color: const Color.fromARGB(255, 5, 5, 5)
          //                   .withOpacity(0.8))),
          //       child: Padding(
          //         padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          //         child: DropdownButton<CategoryList>(
          //           value: merchantCategory,
          //           isExpanded: true,
          //           icon: const Icon(Icons.keyboard_arrow_down_outlined),
          //           elevation: 0,
          //           itemHeight: 55,
          //           isDense: true,
          //           dropdownColor: Colors.grey[250],
          //           style: const TextStyle(color: Colors.black54),
          //           hint: Text(
          //             "Merchant Category Name",
          //             style: TextStyle(fontSize: 16, color: kblue),
          //           ),
          //           onChanged: (CategoryList? value) {
          //             setState(() {
          //               merchantCategory = value!;
          //               categoryController.text = value.id.toString();
          //             });
          //           },
          //           items: authController.categoryList
          //               .map<DropdownMenuItem<CategoryList>>(
          //                   (CategoryList value) {
          //             return DropdownMenuItem<CategoryList>(
          //               value: value,
          //               child: Text(value.title),
          //             );
          //           }).toList(),
          //         ),
          //       ),
          //     ),
          //   );
          // }),
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
                                  bankAccountName:
                                      bankAccountNameController.text,
                                  bankAccountNumber:
                                      bankAccountNumberController.text,
                                  bankName: bankNameController.text,
                                  ifscCode: ifscCodeController.text,
                                  shopImage:
                                      simage == null ? "null" : simage!.path,
                                      locationAddress: mapUrlController.text,
                                  aadharProof: image,
                                  panProof: image2);
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

  var mult = [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
    [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
    [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
    [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
    [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
    [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
    [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
    [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
    [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
  ];
  var perm = [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
    [5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
    [8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
    [9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
    [4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
    [2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
    [7, 0, 4, 6, 9, 1, 3, 2, 5, 8]
  ];
  var i, j, x;

  String reverseString(String gstNum) {
    var chars = gstNum.split('');
    return chars.reversed.join();
  }

  int listElementsSum(List a) {
    int sum = 0;
    if (a.length <= 1) {
      return a[0];
    } else {
      for (int e in a) {
        sum += e;
      }
    }
    return sum;
  }

  bool gstvalidate(String gstNum) {
    var check, lmo, gst, csum;
    check = reverseString(gstNum)[0];
    lmo = gstNum.substring(0, 14);
    List l = [], m = [], n = [];
    gst = lmo.split('');
    for (var i = 0; i < gst.length; ++i) {
      if (RegExp(r'^[0-9]+$').hasMatch(gst[i])) {
        l.add(int.parse(gst[i]));
      } else {
        l.add(lmo.codeUnitAt(i) - 55);
      }
    }
    for (var i = 0; i < l.length; ++i) {
      m.add(l[i] * (i % 2 + 1));
    }
    for (var i = 0; i < m.length; ++i) {
      n.add(((m[i] / 36) + (m[i] % 36)).truncate());
    }
    var sum = listElementsSum(n);

    csum = 36 - sum % 36;
    csum = csum < 10 ? csum.toString() : String.fromCharCode(csum + 55);
    bool val = csum == check ? true : false;
    return val;
  }
}
