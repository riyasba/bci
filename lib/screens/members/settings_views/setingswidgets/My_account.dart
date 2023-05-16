import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:bci/screens/bussiness/views/home_screen/contact_admin.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    setDefault();
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
      // dateOfBirthController.text =
      //     formatDate(date, profileController.profileData.first.dob);

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
                    InkWell(
                        onTap: Get.back,
                        child:
                            Image.asset('assets/images/chevron-left (2).png')),
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
        child: GetBuilder<SettingsController>(builder: (_) {
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(""),
                              Image.asset('assets/images/settingprofile.png'),
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
                                child: Row(
                                  children: [
                                    Text(
                                      "Married :",
                                      style: TextStyle(
                                        color: kblue,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      fillColor:
                                          MaterialStateProperty.all(kblue),
                                      value: isMarried,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isMarried = value!;
                                        });
                                      },
                                    )
                                  ],
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
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
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
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
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
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
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
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
