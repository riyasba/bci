import 'package:bci/authentications/generate_otp/member_login_screen.dart';
import 'package:bci/authentications/otp_verification/otp_verification.dart';
import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/models/members_register_model.dart';
import 'package:bci/screens/members/sign_up_view/residential_address_screen.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MemberSignUpScreen extends StatefulWidget {
  
   MemberSignUpScreen({super.key,});

  @override
  State<MemberSignUpScreen> createState() => _MemberSignUpScreenState();
}

class _MemberSignUpScreenState extends State<MemberSignUpScreen> {
  bool isChecked = false;

  var usernamecontroller = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var occupationController = TextEditingController();
  var fatherNameController = TextEditingController();
  var motherNameController = TextEditingController();
  var referralController = TextEditingController();

  final authController = Get.find<AuthController>();

  bool isReferral = false;

  DateTime date = DateTime.now().subtract(const Duration(days: 6570));

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(1910),
      locale: const Locale('en', 'IN'),
      lastDate: DateTime.now().subtract(const Duration(days: 6570)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: kblue, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: kblue, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null)
      setState(() {
        date = picked;
        dateOfBirthController.text = formatDate(date, [dd, "/", mm, "/", yyyy]);
      });
  }

  var _formKey = GlobalKey<FormState>();

  FocusNode emailFocusNode = FocusNode();
  FocusNode mobileNumberFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF9F8FD),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Center(
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
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    controller: usernamecontroller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "User name can't be empty";
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
                        hintText: "User Name",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 15),
                //   child: TextFormField(
                //     textInputAction: TextInputAction.next,
                //     controller: dateOfBirthController,
                //     autovalidateMode: AutovalidateMode.onUserInteraction,
                //     validator: (value) {
                //       if (value!.isEmpty) {
                //         return "Date of Birth can't be empty";
                //       }
                //       return null;
                //     },
                //     onTap: () {
                //       _selectDate(context);
                //     },
                //     readOnly: true,
                //     decoration: InputDecoration(
                //         fillColor: Colors.white,
                //         filled: true,
                //         enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide:
                //                 const BorderSide(color: const Color(0xff707070))),
                //         focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide:
                //                 const BorderSide(color: const Color(0xff707070))),
                //         isCollapsed: false,
                //         isDense: true,
                //         contentPadding:
                //             const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide:
                //                 const BorderSide(color: const Color(0xff707070))),
                //         hintText: "Date of Birth",
                //         hintStyle: TextStyle(
                //           color: kblue,
                //           fontWeight: FontWeight.w400,
                //         )),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email can't be empty";
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
                        hintText: "Email",
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
                    controller: mobileController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Mobile Number can't be empty";
                      }
                      return null;
                    },
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
                        hintText: "Mobile Number",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                if(isReferral == true)
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: referralController,
                    //autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color:  Color(0xff707070))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color:  Color(0xff707070))),
                        isCollapsed: false,
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color:  Color(0xff707070))),
                        hintText: "Referral Code",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                          checkColor: Colors.white,
                           fillColor:
                           MaterialStateProperty.all(kblue),
                            value: isReferral,
                            onChanged: (bool? value) {
                              setState(() {
                                isReferral = value!;
                              });
                             },
                     ),
                     Text(
                  "Referral Code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400, color: kblue),
                ),
                  ],
                ),

                // Padding(
                //   padding: const EdgeInsets.only(top: 15),
                //   child: TextFormField(
                //     textInputAction: TextInputAction.next,
                //     controller: occupationController,
                //     autovalidateMode: AutovalidateMode.onUserInteraction,
                //     validator: (value) {
                //       if (value!.isEmpty) {
                //         return "Occupation can't be empty";
                //       }
                //       return null;
                //     },
                //     decoration: InputDecoration(
                //         fillColor: Colors.white,
                //         filled: true,
                //         enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide:
                //                 const BorderSide(color: const Color(0xff707070))),
                //         focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide:
                //                 const BorderSide(color: const Color(0xff707070))),
                //         isCollapsed: false,
                //         isDense: true,
                //         contentPadding:
                //             const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide:
                //                 const BorderSide(color: const Color(0xff707070))),
                //         hintText: "Occupation",
                //         hintStyle: TextStyle(
                //           color: kblue,
                //           fontWeight: FontWeight.w400,
                //         )),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 15),
                //   child: TextFormField(
                //     textInputAction: TextInputAction.next,
                //     controller: fatherNameController,
                //     autovalidateMode: AutovalidateMode.onUserInteraction,
                //     decoration: InputDecoration(
                //         fillColor: Colors.white,
                //         filled: true,
                //         enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide:
                //                 const BorderSide(color: const Color(0xff707070))),
                //         focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide:
                //                 const BorderSide(color: const Color(0xff707070))),
                //         isCollapsed: false,
                //         isDense: true,
                //         contentPadding:
                //             const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide:
                //                 const BorderSide(color: const Color(0xff707070))),
                //         hintText: "Father Name",
                //         hintStyle: TextStyle(
                //           color: kblue,
                //           fontWeight: FontWeight.w400,
                //         )),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 15),
                //   child: TextFormField(
                //     textInputAction: TextInputAction.none,
                //     controller: motherNameController,
                //     autovalidateMode: AutovalidateMode.onUserInteraction,
                //     decoration: InputDecoration(
                //         fillColor: Colors.white,
                //         filled: true,
                //         enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide:
                //                 const BorderSide(color:  Color(0xff707070))),
                //         focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide:
                //                 const BorderSide(color:  Color(0xff707070))),
                //         isCollapsed: false,
                //         isDense: true,
                //         contentPadding:
                //             const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide:
                //                 const BorderSide(color:  Color(0xff707070))),
                //         hintText: "Mother Name",
                //         hintStyle: TextStyle(
                //           color: kblue,
                //           fontWeight: FontWeight.w400,
                //         )),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10, left: 10),
                //   child: Row(
                //     children: [
                //       Text(
                //         "Married :",
                //         style: primaryFont.copyWith(color: kblue, fontSize: 16),
                //       ),
                //       const SizedBox(
                //         width: 5,
                //       ),
                //       Checkbox(
                //         checkColor: Colors.white,
                //         fillColor: MaterialStateProperty.all(kblue),
                //         value: isChecked,
                //         onChanged: (bool? value) {
                //           setState(() {
                //             isChecked = value!;
                //           });
                //         },
                //       )
                //     ],
                //   ),
                // ),
                ksizedbox20,
                // InkWell(
                //   onTap: () {
                //     if (_formKey.currentState!.validate()) {
                //       MemberRegisterModel memberRegisterModel =
                //           MemberRegisterModel(
                //               aadharNo: "",
                //               email: emailController.text,
                //               fatherName: fatherNameController.text,
                //               isMarried: isChecked ? "1" : "0",
                //               mobile: mobileController.text,
                //               motherName: motherNameController.text,
                //               name: usernamecontroller.text,
                //               occupation: occupationController.text,
                //               panNo: "",
                //               password: "12345678",
                //               passwordConfirmation: "12345678",
                //               roleId: "3");
                //       Get.to(ResidentialAddressScreen(
                //         memberRegisterModel: memberRegisterModel,
                //       ));
                //     }
                //   },
                //   child: Container(
                //     height: 50.h,
                //     width: size.width.w,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(6),
                //       border: Border.all(color: const Color(0xffFFBF7E)),
                //       boxShadow: const [
                //         BoxShadow(
                //           color: Color(0xFFFF5C29),
                //           blurRadius: 3.0,
                //         )
                //       ],
                //       gradient: const LinearGradient(
                //         begin: Alignment.centerLeft,
                //         end: Alignment.centerRight,
                //         colors: [
                //           Color(0xFFFF5C29),
                //           Color(0xFFFFCD38),
                //         ],
                //       ),
                //     ),
                //     child: Center(
                //       child: Text(
                //         "Next",
                //         style: TextStyle(
                //             fontSize: 22.sp,
                //             color: Colors.white,
                //             fontWeight: FontWeight.w500),
                //       ),
                //     ),
                //   ),
                // ),
                
                Obx(
                  () => authController.isLoading.isTrue
                      ? Container(
                        height: 50,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border:
                              Border.all(color: const Color(0xffFFBF7E)),
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
                              Color.fromARGB(255, 255, 123, 34),
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
                              // AddressModel oficeaddressModel = AddressModel(
                              //     doorNo: doorNumberController.text,
                              //     buildingName: buildingNameController.text,
                              //     address: addressController.text,
                              //     city: cityController.text,
                              //     state: stateController.text,
                              //     personalId: "",
                              //     aadhrId: "");
                              MemberRegisterModel memberRegisterModel = MemberRegisterModel(
                                email: emailController.text,
                                name: usernamecontroller.text,
                                mobile: mobileController.text,
                                roleId: "3"
                                );
                              authController.registerMember(
                                  referralCode: referralController.text,
                                  memberRegisterModel: memberRegisterModel,
                                  //officialAddress: oficeaddressModel,
                                  //residentialAddress: widget.addressModel
                                  );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: const Color(0xffFFBF7E)),
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
                                  Color.fromARGB(255, 255, 123, 34),
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
                        Get.to(const MemberLoginScreen());
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
      ),
    );
  }
}
