import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/holiday_package_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:get/get.dart';

class OverviewWidget extends StatefulWidget {
  String packageid;
  OverviewWidget({super.key,required this.packageid});

  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {

  final holidayPackageController = Get.find<HolidayPackageController>();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holidayPackageController.packageDetails(packageid: widget.packageid);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return
      ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ksizedbox20,
              Row(
                children: [
                  Text(
                    'Package Overview',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: kblue,
                        fontWeight: FontWeight.w500),
                  ),
                  kwidth10,
                  Expanded(
                    child: Container(
                      width: size.width,
                      child: const Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              ksizedbox10,
              if(holidayPackageController.getPackageDetailsData.isNotEmpty)
              HtmlContentViewer(
                            htmlContent: holidayPackageController.getPackageDetailsData.first.packageoverview,
                            initialContentHeight:
                                MediaQuery.of(context).size.height,
                            initialContentWidth: MediaQuery.of(context).size.width,
                          ),
              if(holidayPackageController.getPackageDetailsData.isNotEmpty)
              ksizedbox20,
              Row(
                children: [
                  Text(
                    'Flight Detail',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: kblue,
                        fontWeight: FontWeight.w500),
                  ),
                  kwidth10,
                  Expanded(
                    child: Container(
                      width: size.width,
                      child: const Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0, top: 10),
                child: Container(
                  height: 120,
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: size.width,
                        color: Colors.orange,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Sector',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Airline',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Departure Time',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Arrival Time',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'DEL-MRU',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: kblue,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'MK745',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: kblue,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '08:00',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: kblue,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '14:00',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: kblue,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                      Container(
                        height: 30,
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'DEL-MRU',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: kblue,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'MK745',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: kblue,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '08:00',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: kblue,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '14:00',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: kblue,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ksizedbox20,
              Row(
                children: [
                  Text(
                    'Inclusions',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: kblue,
                        fontWeight: FontWeight.w500),
                  ),
                  kwidth10,
                  Expanded(
                    child: Container(
                      width: size.width,
                      child: const Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              ksizedbox10,
               HtmlContentViewer(
                            htmlContent: holidayPackageController.getPackageDetailsData.first.inclusion,
                            initialContentHeight:
                                MediaQuery.of(context).size.height,
                            initialContentWidth: MediaQuery.of(context).size.width,
                          ),
              Row(
                children: [
                  Text(
                    'Exclusions',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: kblue,
                        fontWeight: FontWeight.w500),
                  ),
                  kwidth10,
                  Expanded(
                    child: Container(
                      width: size.width,
                      child: const Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              ksizedbox10,
              HtmlContentViewer(
                            htmlContent: holidayPackageController.getPackageDetailsData.first.exclusion,
                            initialContentHeight:
                                MediaQuery.of(context).size.height,
                            initialContentWidth: MediaQuery.of(context).size.width,
                          ),
              ksizedbox20
            ],
          ),
        ],
      );
  }
}
