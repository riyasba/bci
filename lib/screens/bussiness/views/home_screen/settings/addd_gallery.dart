import 'dart:io';

import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../constands/constands.dart';
import '../../../../../controllers/profile_controller.dart';
import '../../busines_widget/bottumnavigation.dart';

class AddGallery extends StatefulWidget {
  final String userid;
  const AddGallery({super.key, required this.userid});

  @override
  State<AddGallery> createState() => _AddGalleryState();
}

class _AddGalleryState extends State<AddGallery> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    profileController.getInstance(userid: widget.userid);
    profileController.update();
  }

  final profileController = Get.find<ProfileController>();

  File? imageprofile;

  Future profileimage() async {
    try {
      final imageprofile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageprofile == null) return;
      final imageprofiletemp = File(imageprofile.path);
      

   await   profileController.addgalleryApiServices(
          imageprofiletemp: imageprofiletemp.path);
           profileController.getInstance(userid: widget.userid);
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      Get.offAll(HomeBottomnavigationBar(
                        index: 4,
                      ));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: kwhite,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 90),
                  child: Text(
                    'Gallery',
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder<ProfileController>(builder: (_) {
        return profileController.galleryListData.isEmpty
            ? Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logoutimage.png'),
                      Text('No data')
                    ],
                  ),
                ),
              )
            : Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: profileController.galleryListData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          profileController.galleryListData[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 10),
                ),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          profileimage();
           
        },
        child: Icon(
          Icons.add_a_photo,
          color: kwhite,
        ),
        backgroundColor: kblue,
      ),
    );
  }
}
