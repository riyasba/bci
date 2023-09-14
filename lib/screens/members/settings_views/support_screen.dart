import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final profileController = Get.find<ProfileController>();
  final settingsController = Get.find<SettingsController>();
  final homePageController = Get.find<HomeController>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setDefault();
    homePageController.supportAdminDetail();
  }

  setDefault() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await profileController.getProfile();
      nameController.text = profileController.profileData.first.name;
      phoneController.text = profileController.profileData.first.mobile;
      emailController.text = profileController.profileData.first.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF9F8FD),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Support',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffF9F8FD)),
                      ),
                    ),
                    Container()
                  ],
                ),
              ),
            ),
          )),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 50,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xffF2F1F1)),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      isCollapsed: true,
                      isDense: true,
                      border: InputBorder.none,
                      hintText: "Name",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              height: 50,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xffF2F1F1)),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                      isCollapsed: true,
                      isDense: true,
                      border: InputBorder.none,
                      hintText: "Mobile",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              height: 50,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xffF2F1F1)),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      isCollapsed: true,
                      isDense: true,
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              height: 50,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xffF2F1F1)),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      isCollapsed: true,
                      isDense: true,
                      border: InputBorder.none,
                      hintText: "Title",
                      hintStyle: TextStyle(
                        color: Color(0xff6E6D6E),
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              height: 150,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xffF2F1F1)),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: TextField(
                  controller: descriptionController,
                  maxLines: 100,
                  decoration: const InputDecoration(
                      isCollapsed: true,
                      isDense: true,
                      border: InputBorder.none,
                      hintText: "Description",
                      hintStyle: TextStyle(
                        color: Color(0xff6E6D6E),
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: InkWell(
              onTap: () {
                settingsController.createSupport(
                    title: titleController.text,
                    message: descriptionController.text);
              },
              child: Container(
                height: 50,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xff003366)),
                child: const Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 25, color: Color(0xffF9F8FD)),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Row(
              children: [
                const Column(
                  children: [
                    Text(
                      'Contact Admin :',
                      style: TextStyle(fontSize: 16, color: Color(0xff443C3C)),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                homePageController.contactDetailsData!.appPhone.isEmpty ? const Text("Not Available") :
                Text(homePageController.contactDetailsData!.appPhone,
                    style: TextStyle(fontSize: 16, color: kblue)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: [
                const Row(
                  children: [
                    Text(
                      'Admin Email :',
                      style: TextStyle(fontSize: 16, color: Color(0xff443C3C)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 29,
                    ),
                    homePageController.contactDetailsData!.appEmail.isEmpty ? const Text("Not Available") :
                    Container(
                      child: Text(homePageController.contactDetailsData!.appEmail,maxLines: 2,
                          style: TextStyle(fontSize: 16, color: kblue)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: [
                const Row(
                  children: [
                    Text(
                      'Admin Address :',
                      style: TextStyle(fontSize: 16, color: Color(0xff443C3C)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    homePageController.contactDetailsData!.appEmail.isEmpty ? const Text("Not Available") :
                    Container(
                      width: 200,
                      child: Text(homePageController.contactDetailsData!.appAddress,maxLines: 4,
                          style: TextStyle(fontSize: 16, color: kblue)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
