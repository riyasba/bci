import 'package:bci/constands/app_fonts.dart';
import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/search_service_list_model.dart';
import 'package:bci/models/vendor_list_model.dart';
import 'package:bci/screens/members/offer%20screen/view_vendors_offers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class VendorDetailScreen extends StatefulWidget {
  VendorListModelData vendorListModelData;
  VendorDetailScreen({super.key, required this.vendorListModelData});

  @override
  State<VendorDetailScreen> createState() => _VendorDetailScreenState();
}

class _VendorDetailScreenState extends State<VendorDetailScreen> {
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
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: kblue,
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
                ? Image.network(
                    widget.vendorListModelData.profilePicture!,
                    height: 350,
                    width: size.width,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/icons/no-photo.png",
                    height: 350,
                    width: size.width,
                    fit: BoxFit.cover,
                  ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.vendorListModelData.name,
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Details',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                  ksizedbox10,
                  if (widget.vendorListModelData.address != null)
                    Text(
                      "${widget.vendorListModelData.address ?? ""}",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black87),
                    ),
                  if (widget.vendorListModelData.address != null)
                    Text(
                      "${widget.vendorListModelData.city}",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black87),
                    ),
                  if (widget.vendorListModelData.address != null)
                    Text(
                      "${widget.vendorListModelData.state}",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black87),
                    ),
                  Text(
                    "Mobile: ${widget.vendorListModelData.mobile}",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                        height: 1.5,
                        color: Colors.black87),
                  ),
                  Text(
                    "Email: ${widget.vendorListModelData.email}",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                        height: 1.5,
                        color: Colors.black87),
                  ),
                  ksizedbox10,
                 if(widget.vendorListModelData.locationAddress != null) Row(
                    children: [
                      InkWell(
                        onTap: (){
                          launchUrl(Uri.parse(widget.vendorListModelData.locationAddress));
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    color: Colors.grey.withOpacity(0.5))
                              ],
                              borderRadius: BorderRadius.circular(40)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Location",
                                  style: primaryFont.copyWith(
                                    fontWeight: FontWeight.w500,
                                      color: Colors.black, fontSize: 12),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.blue,
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
              Get.to(() => VendorViewOffers(
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
