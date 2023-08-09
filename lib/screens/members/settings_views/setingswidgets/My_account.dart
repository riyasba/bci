import 'dart:io';
import 'package:bci/controllers/plans_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:bci/models/member_profile_update_model.dart';
import 'package:bci/models/members_register_model.dart';
import 'package:bci/screens/bussiness/views/home_screen/contact_admin.dart';
import 'package:bci/screens/members/members%20widgets/bottumbavigation.dart';
import 'package:bci/screens/members/settings_views/upgrade_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:velocity_x/velocity_x.dart';
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
  var weddingDateController = TextEditingController();
  var gstNoController = TextEditingController();
  var panNoController = TextEditingController();
  var adharNoController = TextEditingController();
  var branchController = TextEditingController();
  var spouseController = TextEditingController();
  var genderController = TextEditingController();
  var qualificationController = TextEditingController();
  var alternateMobController = TextEditingController();
  var childController = TextEditingController();
  bool isMarried = false;
  String selectedGender = '';
  bool isGSTNum = true;

  var oDoorNumberCN = TextEditingController();
  var oBuildingNumberCN = TextEditingController();
  var oAddressCN = TextEditingController();
  var oCityCN = TextEditingController();
  var oStateCN = TextEditingController();
  var proofidController = TextEditingController();
  var pincodeController = TextEditingController();

  var rDoorNumberCN = TextEditingController();
  var rBuildingNumberCN = TextEditingController();
  var rAddressCN = TextEditingController();
  var rCityCN = TextEditingController();
  var rStateCN = TextEditingController();
  var rpersonalIdCN = TextEditingController();
  var rAadhrCN = TextEditingController();
  var rproofidController = TextEditingController();
  var rpincodeController = TextEditingController();

  final settingsController = Get.find<SettingsController>();
  final plansController = Get.find<PlanController>();
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    setDefault();
    profileController.getProfile();
    plan();
    _controller = TextfieldTagsController();
  }

  double? _distanceToField;
  TextfieldTagsController? _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  plan(){
    if(profileController.planid != ""){
      plansController.getPlanDetails(id: profileController.planid.value);
    }else{

    }
  }

  DateTime date = DateTime.now();

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(1910),
      locale: const Locale('en', 'IN'),
      lastDate: DateTime.now(),
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

  //
  DateTime wdate = DateTime.now();

  _wselectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: wdate,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(1910),
      locale: const Locale('en', 'IN'),
      lastDate: DateTime.now(),
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
        wdate = picked;
        weddingDateController.text = formatDate(wdate, [dd, "/", mm, "/", yyyy]);
      });
  }

  setDefault() async {
    await profileController.getProfile();
    if (profileController.profileData.isNotEmpty) {
      nameController.text = profileController.profileData.first.name;
      phoneController.text = profileController.profileData.first.mobile;
      emailController.text = profileController.profileData.first.email;
      occupationController.text = profileController.profileData.first.occupation;
      fatherNameController.text = profileController.profileData.first.fatherName;
      motherNameController.text = profileController.profileData.first.motherName;
      qualificationController.text = profileController.profileData.first.qualification;
      gstNoController.text = profileController.profileData.first.gstNo;
      panNoController.text = profileController.profileData.first.panNo;
      adharNoController.text = profileController.profileData.first.aadharNo;
      selectedGender = profileController.profileData.first.gender;
      alternateMobController.text = profileController.profileData.first.alternateMobile;
      weddingDateController.text = profileController.profileData.first.weddingDate;
     
      selectedGender = profileController.profileData.first.gender;
      branchController.text = profileController.profileData.first.branch;
      spouseController.text = profileController.profileData.first.spouse;
      dateOfBirthController.text = profileController.profileData.first.dob;


      oDoorNumberCN.text =
          profileController.profileData.first.officialAddress.doorNo;
      oBuildingNumberCN.text =
          profileController.profileData.first.officialAddress.buildingName;
      oAddressCN.text =
          profileController.profileData.first.officialAddress.address;

      oCityCN.text = profileController.profileData.first.officialAddress.city;
      oStateCN.text = profileController.profileData.first.officialAddress.state;
      proofidController.text = profileController.profileData.first.officialAddress.proofIdNo;
      pincodeController.text = profileController.profileData.first.officialAddress.pincode;

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
      // rAadhrCN.text =
      //     profileController.profileData.first.residentialAddress.aadharId;
          rproofidController.text = profileController.profileData.first.residentialAddress.personalId;
          rpincodeController.text = profileController.profileData.first.residentialAddress.pincode;

      setState(() {
        isMarried =
            profileController.profileData.first.isMarried == "0" ? false : true;
      });
       _controller?.addTag = profileController.profileData.first.childName;
    }
  }

  File? image;
  File? image2;

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

  getback(){
    Get.offAll(HelloConvexAppBar());
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
                          onTap: (){
                            getback();
                          },
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
                          Get.to(const ContactAdmin());
                        },
                        child: Image.asset(
                            'assets/images/3669173_help_ic_icon.png'))
                  ],
                ),
              ),
            ),
          )),
      body: WillPopScope(
        onWillPop: (){
          return getback();
        },
        child: Padding(
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
                                                        .profilePicture.isEmpty
                                                ? Stack(
                                                  children: [
                                                    Image.asset(
                                                        'assets/icons/prfl.png',height: 80,),
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
                                                )
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
                                GetBuilder<ProfileController>(
                                  builder: (_) {
                                    return Padding(
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
                                    );
                                  }
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
                                        controller: alternateMobController,
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
                                            hintText: "Alternate Mobile Number",
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
                                        controller: qualificationController,
                                        decoration: InputDecoration(
                                            isCollapsed: true,
                                            isDense: true,
                                            border: InputBorder.none,
                                            hintText: "Qualification",
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
                                //       child: TextField(
                                //         controller: childController,
                                //         decoration: InputDecoration(
                                //             isCollapsed: true,
                                //             isDense: true,
                                //             border: InputBorder.none,
                                //             hintText: "Children",
                                //             hintStyle: TextStyle(
                                //               color: kblue,
                                //               fontWeight: FontWeight.w400,
                                //             )),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                ksizedbox10,
                                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('GENDER').text.gray500.semiBold.make(),
                        ],
                      ),
                      RadioListTile(
              title:const Text('Male'),
              value: 'Male',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
            ),
            RadioListTile(
              title:const Text('Female'),
              value: 'Female',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
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
                                 if(isMarried == true)
                                 TextFieldTags(
              textfieldTagsController: _controller,
              initialTags: const [],
              textSeparators: const [','],
              letterCase: LetterCase.normal,
              validator: (String tag) {
                if (tag == 'php') {
                  return 'No, please just no';
                } else if (_controller!.getTags!.contains(tag)) {
                  return 'you already entered that';
                }
                return null;
              },
              inputfieldBuilder:
                  (context, tec, fn, error, onChanged, onSubmitted) {
                return ((context, sc, tags, onTagDelete) {
                  return Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: TextField(
                      controller: tec,
                      focusNode: fn,
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 74, 137, 92),
                            width: 3.0,
                          ),
                        ),
                        // focusedBorder: const OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Color.fromARGB(255, 74, 137, 92),
                        //     width: 3.0,
                        //   ),
                        // ),
                        //helperText: 'No Of Children',
                        // helperStyle: TextStyle(
                        //   color: kblue,
                        // ),
                        hintText: _controller!.hasTags ? '' : "Children Name",
                        errorText: error,
                        prefixIconConstraints:
                            BoxConstraints(maxWidth: _distanceToField! * 0.74),
                        prefixIcon: tags.isNotEmpty
                            ? SingleChildScrollView(
                                controller: sc,
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children: tags.map((String tag) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      color: Color.fromARGB(255, 74, 80, 137),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          child: Text(
                                            '$tag',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          onTap: () {
                                            print("$tag selected");
                                          },
                                        ),
                                        const SizedBox(width: 4.0),
                                        InkWell(
                                          child: const Icon(
                                            Icons.cancel,
                                            size: 14.0,
                                            color: Color.fromARGB(
                                                255, 233, 233, 233),
                                          ),
                                          onTap: () {
                                            onTagDelete(tag);
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                }).toList()),
                              )
                            : null,
                      ),
                      onChanged: onChanged,
                      onSubmitted: onSubmitted,
                    ),
                  );
                });
              },
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
                                        controller: weddingDateController,
                                        readOnly: true,
                                        onTap: () {
                                          _wselectDate(context);
                                        },
                                        decoration: InputDecoration(
                                            isCollapsed: true,
                                            isDense: true,
                                            border: InputBorder.none,
                                            hintText: "Wedding Date",
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
                                        controller: dateOfBirthController,
                                        readOnly: true,
                                        onTap: () {
                                          _selectDate(context);
                                        },
                                        decoration: InputDecoration(
                                            isCollapsed: true,
                                            isDense: true,
                                            border: InputBorder.none,
                                            hintText: "Date Of Birth",
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
                                        onChanged: (value) {
                                        setState(() {
                                           isGSTNum = gstvalidate(value);
                                        });
                                      },
                                        controller: gstNoController,
                                        textCapitalization: TextCapitalization.characters,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(15),
                                       ],
                                        decoration: InputDecoration(
                                            isCollapsed: true,
                                            isDense: true,
                                            border: InputBorder.none,
                                            hintText: "GST No",
                                            hintStyle: TextStyle(
                                              color: kblue,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                                 if(isGSTNum == false && gstNoController.text.isNotEmpty) const Padding(
                              padding:  EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Text("GST number is not valid",
                                  style: TextStyle(color: Colors.red),),
                                ],
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
                                        controller: panNoController,
                                         textCapitalization: TextCapitalization.characters,
                                        inputFormatters: [
                                        LengthLimitingTextInputFormatter(10),
                                       ],
                                        decoration: InputDecoration(
                                            isCollapsed: true,
                                            isDense: true,
                                            border: InputBorder.none,
                                            hintText: "PAN No",
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
                                        controller: adharNoController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(12),
                                          FilteringTextInputFormatter.digitsOnly,
                                          FilteringTextInputFormatter.deny(
                                              RegExp(r'\s')),
                                        ],
                                        decoration: InputDecoration(
                                            isCollapsed: true,
                                            isDense: true,
                                            border: InputBorder.none,
                                            hintText: "Aadhar No",
                                            hintStyle: TextStyle(
                                              color: kblue,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                                //
                                ksizedbox10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                   image != null
                      ? Container(
                          height: 100, 
                          width: 100, 
                          child: profileController.profileData.first.adharProof.isEmpty ? Image.file(image!) : Image.network(profileController.profileData.first.adharProof))
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
                              child:profileController.profileData.first.adharProof.isEmpty ? Image.asset('assets/images/imageupload.png') : Image.network(profileController.profileData.first.adharProof)
                                  ),
                        ),
                  image2 != null
                      ? Container(
                          height: 100, width: 100, child: profileController.profileData.first.panProof.isEmpty ? Image.file(image2!) : Image.network(profileController.profileData.first.panProof))
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
                              child: profileController.profileData.first.panProof.isEmpty ? Image.asset('assets/images/imageupload.png') : Image.network(profileController.profileData.first.panProof)
                              ),
                        ),
                                ],),
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
                                        controller: branchController,
                                        decoration: InputDecoration(
                                            isCollapsed: true,
                                            isDense: true,
                                            border: InputBorder.none,
                                            hintText: "Branch",
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
                                        controller: spouseController,
                                        decoration: InputDecoration(
                                            isCollapsed: true,
                                            isDense: true,
                                            border: InputBorder.none,
                                            hintText: "Spouse",
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
                                                dateOfBirth: dateOfBirthController.text,
                                                fatherName: fatherNameController.text,
                                                isMarried: isMarried,
                                                mobile: phoneController.text,
                                                motherName: motherNameController.text,
                                                occupation: occupationController.text,
                                                adharNo: adharNoController.text,
                                                panNo: panNoController.text,
                                                gstNo: gstNoController.text,
                                                gender: selectedGender == "Male" ? "Male" : "Female",
                                                qualification: qualificationController.text,
                                                weddingDate: weddingDateController.text,
                                                branch: branchController.text,
                                                spouse: spouseController.text,
                                                alternateMob: alternateMobController.text,
                                                adharproofimg: image == null ? "null": image!.path,
                                                panproofimg: image2 == null ? "null": image2!.path,
                                                children: _controller!.getTags,
                                              );
      
                                              profileController.updateProfile(
                                                  memberProfileUpdateModel:
                                                      memberProfileUpdateModel);
                                                      print(_controller!.getTags);
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
                                        controller: proofidController,
                                        decoration: InputDecoration(
                                            isCollapsed: true,
                                            isDense: true,
                                            border: InputBorder.none,
                                            hintText: "Proof Id No",
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
                                        controller: pincodeController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(6),
                                          FilteringTextInputFormatter.digitsOnly,
                                          FilteringTextInputFormatter.deny(
                                              RegExp(r'\s')),
                                        ],
                                        decoration: InputDecoration(
                                            isCollapsed: true,
                                            isDense: true,
                                            border: InputBorder.none,
                                            hintText: "Pincode",
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
                                                personalId: proofidController.text,
                                                state: oStateCN.text,
                                                pincode: pincodeController.text
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
                                        controller: rproofidController,
                                        decoration: InputDecoration(
                                            isCollapsed: true,
                                            isDense: true,
                                            border: InputBorder.none,
                                            hintText: "Proof Id No",
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
                                        controller: rpincodeController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(6),
                                          FilteringTextInputFormatter.digitsOnly,
                                          FilteringTextInputFormatter.deny(
                                              RegExp(r'\s')),
                                        ],
                                        decoration: InputDecoration(
                                            isCollapsed: true,
                                            isDense: true,
                                            border: InputBorder.none,
                                            hintText: "Pincode",
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
                                                      personalId:rproofidController.text,
                                                      pincode: rpincodeController.text,
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
                                 InkWell(
                                      onTap: () {
                                        Get.to(const UpgradeScreen());
                                      },
                                      child: Image.asset(
                                          'assets/images/Group 5826.png')) :
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
                                                        .profilePicture.isEmpty
                                                ? Image.asset('assets/icons/prfl.png',height: 50,width: 50,)
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


