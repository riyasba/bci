import 'dart:io';

import 'package:bci/authentications/generate_otp/generate_otp.dart';
import 'package:bci/authentications/otp_verification/otp_verification.dart';
import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/models/category_model.dart';
import 'package:bci/models/merchants_register_model.dart';
import 'package:bci/models/sub_category_model.dart';
import 'package:bci/screens/bussiness/views/generations/generate_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BusinessSignUpScreen extends StatefulWidget {
  const BusinessSignUpScreen({super.key});

  @override
  State<BusinessSignUpScreen> createState() => _BusinessSignUpScreenState();
}

class _BusinessSignUpScreenState extends State<BusinessSignUpScreen> {
  final authController = Get.find<AuthController>();

  var merchantCategory;
  var merchantSubCategory;

  var _formKey = GlobalKey<FormState>();

  var merchantDistplaynameController = TextEditingController();
  var emailIdController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var alternativeMobileController = TextEditingController();
  var businessAddressController = TextEditingController();
  var gstNoController = TextEditingController();

  File? aadharCardImage;
  File? panCardImage;

  @override
  void initState() {
    super.initState();
    authController.getCategoryList();
    authController.getSubCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF9F8FD),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                "Sign Up Now",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.w600, color: kblue),
              ),
              ksizedbox10,
              Text(
                "Please fill the details and create account",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w400, color: kblue),
              ),
              ksizedbox30,
              const Image(
                  height: 200,
                  image: AssetImage("assets/images/Group 6011.png")),
              ksizedbox30,
              GetBuilder<AuthController>(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    height: 44,
                    width: 330,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                            color: const Color.fromARGB(255, 5, 5, 5)
                                .withOpacity(0.8))),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
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
              // GetBuilder<AuthController>(builder: (_) {
              //   return Padding(
              //     padding: const EdgeInsets.only(top: 15),
              //     child: Container(
              //       height: 44,
              //       width: 330,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(3),
              //           border: Border.all(
              //               color: const Color.fromARGB(255, 5, 5, 5)
              //                   .withOpacity(0.8))),
              //       child: Padding(
              //         padding:
              //             const EdgeInsets.only(left: 10, right: 10, top: 10),
              //         child: DropdownButton<SubCategoryModelList>(
              //           value: merchantSubCategory,
              //           isExpanded: true,
              //           icon: const Icon(Icons.keyboard_arrow_down_outlined),
              //           elevation: 0,
              //           itemHeight: 55,
              //           isDense: true,
              //           dropdownColor: Colors.grey[250],
              //           style: const TextStyle(color: Colors.black54),
              //           hint: Text(
              //             "Sub Category",
              //             style: TextStyle(fontSize: 16, color: kblue),
              //           ),
              //           onChanged: (SubCategoryModelList? value) {
              //             // This is called when the user selects an item.
              //             setState(() {
              //               // authController.isDesignationSelected(false);
              //               merchantSubCategory = value!;
              //             });
              //           },
              //           items: authController.subCategoryList
              //               .map<DropdownMenuItem<SubCategoryModelList>>(
              //                   (SubCategoryModelList value) {
              //             return DropdownMenuItem<SubCategoryModelList>(
              //               value: value,
              //               child: Text(value.title),
              //             );
              //           }).toList(),
              //         ),
              //       ),
              //     ),
              //   );
              // }),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: merchantDistplaynameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Merchant display name can't be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      isCollapsed: false,
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      hintText: "Merchant Display Name",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: emailIdController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email Id can't be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      isCollapsed: false,
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      hintText: "Email ID",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: phoneNumberController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Phone Number name can't be empty";
                    } else if (value.length < 10) {
                      return "Phone Number must be 10 digit";
                    }
                    return null;
                  },
                  //  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      isCollapsed: false,
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      hintText: "Phone Number",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: alternativeMobileController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      isCollapsed: false,
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color:  Color(0xff707070))),
                      hintText: "Alternate Phone Number",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: businessAddressController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Business Address can't be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      isCollapsed: false,
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      hintText: "Business Address",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => Row(
                  children: [
                    InkWell(
                      onTap: () {
                        authController.isGstAvailable(true);
                      },
                      child: Container(
                        height: 17,
                        width: 17,
                        decoration: BoxDecoration(
                            border: Border.all(color: kblue),
                            color: authController.isGstAvailable.isTrue
                                ? kblue
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    InkWell(
                      onTap: () {
                        authController.isGstAvailable(true);
                      },
                      child: Text(
                        "Yes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: kblue),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        authController.isGstAvailable(false);
                      },
                      child: Container(
                        height: 17,
                        width: 17,
                        decoration: BoxDecoration(
                            color: authController.isGstAvailable.isFalse
                                ? kblue
                                : Colors.white,
                            border: Border.all(color: kblue),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    InkWell(
                      onTap: () {
                        authController.isGstAvailable(false);
                      },
                      child: Text(
                        "No",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: kblue),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  textInputAction: TextInputAction.none,
                  //controller: usernamecontroller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (authController.isGstAvailable.isTrue &&
                        value!.isEmpty) {
                      return "Gst Number can't be empty";
                    }
                    return null;
                  },
                  textCapitalization: TextCapitalization.characters,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                  ],
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: Color(0xff707070))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: Color(0xff707070))),
                      isCollapsed: false,
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: Color(0xff707070))),
                      hintText: "Gst No",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          final ImagePicker _picker = ImagePicker();
                          // Pick an image
                          final XFile? tempimage = await _picker.pickImage(
                              source: ImageSource.gallery);

                          setState(() {
                            aadharCardImage = File(tempimage!.path);
                          });
                        },
                        child: Container(
                          height: 130,
                          width: 150,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 215, 215, 213),
                              borderRadius: BorderRadius.circular(3)),
                          child: aadharCardImage != null
                              ? Image.file(aadharCardImage!)
                              : const Center(
                                  child: Icon(
                                    Icons.cloud_upload,
                                    color: Colors.grey,
                                    size: 45,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Aadhaar Card",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: kblue),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          final ImagePicker _picker = ImagePicker();
                          // Pick an image
                          final XFile? tempimage = await _picker.pickImage(
                              source: ImageSource.gallery);

                          setState(() {
                            panCardImage = File(tempimage!.path);
                          });
                        },
                        child: Container(
                          height: 130,
                          width: 150,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 215, 215, 213),
                              borderRadius: BorderRadius.circular(3)),
                          child: panCardImage != null
                              ? Image.file(panCardImage!)
                              : const Center(
                                  child: Icon(
                                    Icons.cloud_upload,
                                    color: Colors.grey,
                                    size: 45,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Pan Card",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: kblue),
                      ),
                    ],
                  ),
                ],
              ),
              ksizedbox40,
              Obx(
                () => authController.isLoading.isTrue
                    ? Container(
                        height: 50,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xffFFBF7E)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFFF5C29),
                              blurRadius: 3.0,
                            )
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFFFF5C29),
                              Color(0xFFFFCD38),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (merchantCategory != null) {
                              if (aadharCardImage == null) {
                                Get.rawSnackbar(
                                    backgroundColor: Colors.red,
                                    messageText: Text(
                                      "Select Aadhar card Image",
                                      style: primaryFont.copyWith(
                                          color: Colors.white),
                                    ));
                              } else if (panCardImage == null) {
                                Get.rawSnackbar(
                                    backgroundColor: Colors.red,
                                    messageText: Text(
                                      "Select Pan card Image",
                                      style: primaryFont.copyWith(
                                          color: Colors.white),
                                    ));
                              } else {
                                MerchantRegisterModel merchantRegisterModel =
                                    MerchantRegisterModel(
                                        aadharProof: aadharCardImage!.path,
                                        address: businessAddressController.text,
                                        alternateMobile:
                                            alternativeMobileController.text,
                                        categoryId:
                                            merchantCategory.id.toString(),
                                       
                                        email: emailIdController.text,
                                        gstNo: gstNoController.text,
                                        mobile: phoneNumberController.text,
                                        name: merchantDistplaynameController.text,
                                        panProof: panCardImage!.path,
                                        password: "12345678",
                                        passwordConfirmation: "12345678",
                                        roleId: "5");

                                authController.registerMerchants(
                                    merchantRegisterModel:
                                        merchantRegisterModel);
                              }
                            } else {
                              Get.rawSnackbar(
                                  backgroundColor: Colors.red,
                                  messageText: Text(
                                    "Fill All the Fields",
                                    style: primaryFont.copyWith(
                                        color: Colors.white),
                                  ));
                            }
                          }
                        },
                        child: Container(
                          height: 50,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xffFFBF7E)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFFFF5C29),
                                blurRadius: 3.0,
                              )
                            ],
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFFFF5C29),
                                Color(0xFFFFCD38),
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
              ),
              ksizedbox10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have account? ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: kblue),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const BusinessLoginScreen());
                    },
                    child: Text(
                      'Log In',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          color: kOrange),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
