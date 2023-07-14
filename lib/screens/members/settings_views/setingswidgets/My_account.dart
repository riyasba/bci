import 'dart:io';
import 'package:bci/controllers/plans_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:bci/models/member_profile_update_model.dart';
import 'package:bci/models/members_register_model.dart';
import 'package:bci/screens/bussiness/views/home_screen/contact_admin.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constands/constands.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var occupationController = TextEditingController();
  var fatherNameController = TextEditingController();
  var motherNameController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  bool isMarried = false;

  var oDoorNumberCN = TextEditingController();
  var oBuildingNumberCN = TextEditingController();
  var oAddressCN = TextEditingController();
  var oCityCN = TextEditingController();
  var oStateCN = TextEditingController();

  var rDoorNumberCN = TextEditingController();
  var rBuildingNumberCN = TextEditingController();
  var rAddressCN = TextEditingController();
  var rCityCN = TextEditingController();
  var rStateCN = TextEditingController();
  var rpersonalIdCN = TextEditingController();
  var rAadhrCN = TextEditingController();

  final settingsController = Get.find<SettingsController>();
  final plansController = Get.find<PlanController>();
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    setDefault();
    profileController.getProfile();
    plan();
  }

  plan(){
    if(profileController.planid != ""){
      plansController.getPlanDetails(id: int.parse(profileController.planid.value));
    }else{

    }
  }

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

  setDefault() async {
    await profileController.getProfile();
    if (profileController.profileData.isNotEmpty) {
      nameController.text = profileController.profileData.first.name;
      phoneController.text = profileController.profileData.first.mobile;
      emailController.text = profileController.profileData.first.email;
      occupationController.text =
          profileController.profileData.first.occupation;
      fatherNameController.text =
          profileController.profileData.first.fatherName;
      motherNameController.text =
          profileController.profileData.first.motherName;

      oDoorNumberCN.text =
          profileController.profileData.first.officialAddress.doorNo;
      oBuildingNumberCN.text =
          profileController.profileData.first.officialAddress.buildingName;
      oAddressCN.text =
          profileController.profileData.first.officialAddress.address;

      oCityCN.text = profileController.profileData.first.officialAddress.city;
      oStateCN.text = profileController.profileData.first.officialAddress.state;

      rDoorNumberCN.text =
          profileController.profileData.first.residentialAddress.doorNo;
      rBuildingNumberCN.text =
          profileController.profileData.first.residentialAddress.buildingName;
      rAddressCN.text =
          profileController.profileData.first.residentialAddress.address;

      rCityCN.text =
          profileController.profileData.first.residentialAddress.city;
      rStateCN.text =
          profileController.profileData.first.residentialAddress.state;
      rpersonalIdCN.text =
          profileController.profileData.first.residentialAddress.personalId;
      rAadhrCN.text =
          profileController.profileData.first.residentialAddress.aadharId;

      setState(() {
        isMarried =
            profileController.profileData.first.isMarried == "0" ? false : true;
      });
      dateOfBirthController.text = profileController.profileData.first.dob;
    }
  }

  File? imageprofile;

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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF9F8FD),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: InkWell(
                          onTap: Get.back,
                          child:const Icon(Icons.arrow_back_ios,color: Colors.white,)
                              ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'My Account',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    
                    InkWell(
                        onTap: () {
                          Get.to(ContactAdmin());
                        },
                        child: Image.asset(
                            'assets/images/3669173_help_ic_icon.png'))
                  ],
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: GetBuilder<PlanController>(
          builder: (_) {
            return GetBuilder<SettingsController>(builder: (_) {
              return ListView(
                children: [
                  InkWell(
                    onTap: () {
                      print(settingsController.actIndex);
                      if (settingsController.actIndex.value == 0) {
                        print("-----");
                        settingsController.actIndex(10);
                        print(settingsController.actIndex);
                      } else {
                        settingsController.actIndex(0);
                      }
                      settingsController.update();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Profile Setting',
                          style: TextStyle(
                              color: kblue,
                              fontSize: 21,
                              fontWeight: FontWeight.w500),
                        ),
                        Image.asset('assets/images/Icon awesome-caret-down.png')
                      ],
                    ),
                  ),
                  if (settingsController.actIndex.value == 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        height: 600,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  offset: Offset(0, 0)),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              GetBuilder<ProfileController>(builder: (_) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(""),
                                   if (profileController.profileData.isNotEmpty)
                                      InkWell(
                                          onTap: () {
                                            profileimage();
                                          },
                                          child: profileController.profileData.first
                                                      .profilePicture ==
                                                  null
                                              ? Image.asset(
                                                  'assets/icons/prfl.png')
                                              : Stack(
                                                children: [
                                                  Container(
                                                    height: 80,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(50),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                profileController.profileData.first.profilePicture,
                                                                ))),
                                                  ),
                                                  Positioned(
                                                    left: 55,
                                                    top: 55,
                                                    child: Container(
                                                      height: 25,
                                                      width: 25,
                                                      decoration: BoxDecoration(
                                                        color: kblue,
                                                        borderRadius: BorderRadius.circular(15)
                                                      ),
                                                      child:const Center(
                                                        child: Icon(Icons.camera_alt,color: Colors.white,size: 17,),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 40),
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                            color: Color(0xffFF5003),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "User Name",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "Email",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: phoneController,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(10),
                                        FilteringTextInputFormatter.digitsOnly,
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'\s')),
                                      ],
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "Phone",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: occupationController,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "Occupation",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: fatherNameController,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "Father Name",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: motherNameController,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "Mother Name",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 10),
                              //   child: Container(
                              //     height: 37,
                              //     width: size.width,
                              //     decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(2),
                              //         border: Border.all(
                              //             color: const Color(0xff707070)),
                              //         color: const Color(0xffF9F8FD)),
                              //     alignment: Alignment.center,
                              //     child: Padding(
                              //       padding:
                              //           const EdgeInsets.only(left: 15, right: 10),
                              //       child: Row(
                              //         children: [
                              //           Text(
                              //             "Married :",
                              //             style: TextStyle(
                              //               color: kblue,
                              //               fontWeight: FontWeight.w400,
                              //             ),
                              //           ),
                              //           Checkbox(
                              //             checkColor: Colors.white,
                              //             fillColor:
                              //                 MaterialStateProperty.all(kblue),
                              //             value: isMarried,
                              //             onChanged: (bool? value) {
                              //               setState(() {
                              //                 isMarried = value!;
                              //               });
                              //             },
                              //           )
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: dateOfBirthController,
                                      readOnly: true,
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "Date of Birth",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: profileController.isLoading.isTrue
                                      ? Container(
                                          height: 50,
                                          width: size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              border: Border.all(
                                                  color: const Color(0xffFF9021)),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color(0xffFF5003),
                                                  blurRadius: 2.0,
                                                ),
                                              ]),
                                          child: const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            MemberProfileUpdateModel
                                                memberProfileUpdateModel =
                                                MemberProfileUpdateModel(
                                              name: nameController.text,
                                              email: emailController.text,
                                              dateOfBirth:
                                                  dateOfBirthController.text,
                                              fatherName: fatherNameController.text,
                                              isMarried:
                                                  isMarried == true ? "1" : "0",
                                              mobile: phoneController.text,
                                              motherName: motherNameController.text,
                                              occupation: occupationController.text,
                                            );

                                            profileController.updateProfile(
                                                memberProfileUpdateModel:
                                                    memberProfileUpdateModel);
                                          },
                                          child: Container(
                                            height: 50,
                                            width: size.width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                border: Border.all(
                                                    color: const Color(0xffFF9021)),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0xffFF5003),
                                                    blurRadius: 2.0,
                                                  ),
                                                ]),
                                            child: const Center(
                                              child: Text(
                                                "Submit",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  const Divider(thickness: 2),
                  InkWell(
                    onTap: () {
                      print(settingsController.actIndex);
                      if (settingsController.actIndex.value == 1) {
                        print("-----");
                        settingsController.actIndex(10);
                        print(settingsController.actIndex);
                      } else {
                        settingsController.actIndex(1);
                      }
                      settingsController.update();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Office Address',
                          style: TextStyle(
                              color: kblue,
                              fontSize: 21,
                              fontWeight: FontWeight.w500),
                        ),
                        Image.asset('assets/images/Icon awesome-caret-down.png')
                      ],
                    ),
                  ),
                  if (settingsController.actIndex.value == 1)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        height: 350,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  offset: Offset(0, 0)),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    "",
                                    style: TextStyle(
                                        color: Color(0xffFF5003),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: oDoorNumberCN,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "Door No",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: oBuildingNumberCN,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "Building name",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: oAddressCN,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "Address",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: oCityCN,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "City",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: oStateCN,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "State",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => profileController.isLoading.isTrue
                                    ? Container(
                                        height: 50,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(3),
                                            border: Border.all(
                                                color: const Color(0xffFF9021)),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color(0xffFF5003),
                                                blurRadius: 2.0,
                                              ),
                                            ]),
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: InkWell(
                                          onTap: () {
                                            AddressModel addressModel =
                                                AddressModel(
                                              aadhrId: "",
                                              address: oAddressCN.text,
                                              buildingName: oBuildingNumberCN.text,
                                              city: oCityCN.text,
                                              doorNo: oDoorNumberCN.text,
                                              personalId: "",
                                              state: oStateCN.text,
                                            );

                                            profileController.updateOfficalAddress(
                                                officialAddress: addressModel);
                                          },
                                          child: Container(
                                            height: 50,
                                            width: size.width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                border: Border.all(
                                                    color: const Color(0xffFF9021)),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0xffFF5003),
                                                    blurRadius: 2.0,
                                                  ),
                                                ]),
                                            child: const Center(
                                              child: Text(
                                                "Submit",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  const Divider(thickness: 2),
                  InkWell(
                    onTap: () {
                      print(settingsController.actIndex);
                      if (settingsController.actIndex.value == 2) {
                        print("-----");
                        settingsController.actIndex(10);
                        print(settingsController.actIndex);
                      } else {
                        settingsController.actIndex(2);
                      }
                      settingsController.update();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Residential Address',
                          style: TextStyle(
                              color: kblue,
                              fontSize: 21,
                              fontWeight: FontWeight.w500),
                        ),
                        Image.asset('assets/images/Icon awesome-caret-down.png')
                      ],
                    ),
                  ),
                  if (settingsController.actIndex.value == 2)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        height: 445,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  offset: Offset(0, 0)),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    "",
                                    style: TextStyle(
                                        color: Color(0xffFF5003),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: rDoorNumberCN,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "Door No",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: rBuildingNumberCN,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "Building name",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: rAddressCN,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "Address",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: rCityCN,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "City",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: rStateCN,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "State",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: rpersonalIdCN,
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "Personal ID",
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 37,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          color: const Color(0xff707070)),
                                      color: const Color(0xffF9F8FD)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, right: 10),
                                    child: TextField(
                                      controller: rAadhrCN,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(15),
                                        FilteringTextInputFormatter.digitsOnly,
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'\s')),
                                      ],
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: "Adhaar ID",
                                          //suffixIcon:const Icon(Icons.upload),
                                          hintStyle: TextStyle(
                                            color: kblue,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: profileController.isLoading.isTrue
                                      ? Container(
                                          height: 50,
                                          width: size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              border: Border.all(
                                                  color: const Color(0xffFF9021)),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color(0xffFF5003),
                                                  blurRadius: 2.0,
                                                ),
                                              ]),
                                          child: const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            AddressModel addressModel =
                                                AddressModel(
                                                    aadhrId: rAadhrCN.text,
                                                    address: rAddressCN.text,
                                                    buildingName:
                                                        rBuildingNumberCN.text,
                                                    city: rCityCN.text,
                                                    doorNo: rDoorNumberCN.text,
                                                    personalId: rpersonalIdCN.text,
                                                    state: rStateCN.text);
                                            profileController
                                                .updateRecidencyAddress(
                                                    residentialAddress:
                                                        addressModel);
                                          },
                                          child: Container(
                                            height: 50,
                                            width: size.width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                border: Border.all(
                                                    color: const Color(0xffFF9021)),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0xffFF5003),
                                                    blurRadius: 2.0,
                                                  ),
                                                ]),
                                            child: const Center(
                                              child: Text(
                                                "Submit",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //
                    ksizedbox30,
                    plansController.subscribePlansData.isEmpty ? 
                    const Image(image: AssetImage("assets/images/Group 4930.png"),height: 200,) :
                          Stack(
                            children: [
                              Image.network(plansController.subscribePlansData.first.cardImg,
                              height: 200,
                              width: size.width,
                              fit: BoxFit.fill,),
                                          Positioned(
                                                    left: 15,
                                                    top: 130,
                                                    child:profileController.profileData.first
                                                      .profilePicture == null
                                              ? Image.asset('assets/icons/prfl.png')
                                              : Container(
                                                      height: 55,
                                                      width: 55,
                                                      decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius: BorderRadius.circular(30),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                profileController.profileData.first.profilePicture,
                                                                ))
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 155,
                                                    left: 80,
                                                    child: Text(profileController.profileData.first.name,
                                                    style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                                  ),
                                                  
                            ],
                          ),
                          //
                          ksizedbox10,
                          plansController.subscribePlansData.isEmpty ? Text("") : 
                          Text(plansController.subscribePlansData.first.planDescription),
                ],
              );
            });
          }
        ),
      ),
    );
  }
}
