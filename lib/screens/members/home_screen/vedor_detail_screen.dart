import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/vendor_list_model.dart';
import 'package:bci/screens/members/offer%20screen/view_vendor_services_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class VendorDetailScreen extends StatefulWidget {
  VendorListModelData vendorListModelData;
  final String userid;
  VendorDetailScreen(
      {super.key, required this.vendorListModelData, required this.userid});

  @override
  State<VendorDetailScreen> createState() => _VendorDetailScreenState();
}

class _VendorDetailScreenState extends State<VendorDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    homeController.getInstance(userid: widget.userid);
  }

  final homeController = Get.find<HomeController>();
  final redeemCouponcontroller = TextEditingController();
  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: kblue,
              ),
            ),
          ),
          titleSpacing: 10,
          title: Text(
            'Details',
            style: TextStyle(
                fontSize: 20.sp, fontWeight: FontWeight.w500, color: kblue),
          ),
        ),
        body: ListView(
          children: [
            widget.vendorListModelData.profilePicture != null
                ? Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.vendorListModelData.profilePicture!,
                        height: 350,
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Image.asset(
                    "assets/icons/no-photo.png",
                    height: 200,
                    width: size.width,
                    fit: BoxFit.cover,
                  ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<HomeController>(builder: (_) {
                    return homeController.galleryListData.isEmpty
                        ? Container()
                        : Container(
                            height: 80,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount:
                                    homeController.galleryListData.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  backgroundColor: Colors.white,
                                                  title: Column(
                                                    children: [
                                                      Image.network(
                                                          homeController
                                                              .galleryListData[
                                                                  index]
                                                              .image),
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        child: Image.network(
                                          homeController
                                              .galleryListData[index].image,
                                          height: 50,
                                          width: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          );
                  }),
                  ksizedbox20,
                  Text(
                    widget.vendorListModelData.name,
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: kblue),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ksizedbox10,
                  Text(
                    'Address',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: kblue),
                  ),
                  ksizedbox20,
                  if (widget.vendorListModelData.address != null)
                    Row(
                      children: [
                        Text(
                          "${widget.vendorListModelData.address ?? ""}",
                          style: TextStyle(fontSize: 15.sp, color: kblue),
                        ),
                        Text(","),
                        if (widget.vendorListModelData.address != null)
                          Text(
                            "${widget.vendorListModelData.city}",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                                color: kblue),
                          ),
                        Text(","),
                        if (widget.vendorListModelData.address != null)
                          Text(
                            "${widget.vendorListModelData.state}",
                            style: TextStyle(fontSize: 15.sp, color: kblue),
                          ),
                      ],
                    ),
                  Text(
                    "Mobile : ${widget.vendorListModelData.mobile}",
                    style:
                        TextStyle(fontSize: 15.sp, height: 1.5, color: kblue),
                  ),
                  Text(
                    "Email  : ${widget.vendorListModelData.email}",
                    style:
                        TextStyle(fontSize: 15.sp, height: 1.5, color: kblue),
                  ),
                  ksizedbox20,
                  Text(
                    'Location',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: kblue,
                        fontSize: 18.sp),
                  ),
                  ksizedbox20,
                  if (widget.vendorListModelData.locationAddress != null)
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            launchUrl(
                                Uri.parse(
                                    widget.vendorListModelData.locationAddress),
                                mode: LaunchMode.externalApplication);
                          },
                          child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.grey.withOpacity(0.5))
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, right: 7),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(
                                    Icons.my_location,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                  Text(
                                    "Location",
                                    style: primaryFont.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ksizedbox20,
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              Get.to(() => VendorViewServicesList(
                    vendorId: widget.vendorListModelData.id.toString(),
                  ));
            },
            child: Container(
              height: 55,
              width: size.width,
              decoration: BoxDecoration(
                  color: korange, borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              child: Text(
                "View Services",
                style: primaryFont.copyWith(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
