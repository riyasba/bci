import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/holiday_package_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/models/holiday_package_models/get_package_details_model.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EnquiryNowWidget extends StatefulWidget {
  String packageId;
  GetPackageDetailsData getPackageDetailsData;
  EnquiryNowWidget(
      {super.key,
      required this.packageId,
      required this.getPackageDetailsData});

  @override
  State<EnquiryNowWidget> createState() => _EnquiryNowWidgetState();
}

class _EnquiryNowWidgetState extends State<EnquiryNowWidget> {
  final holidayPackageController = Get.find<HolidayPackageController>();
  final profileController = Get.find<ProfileController>();

  final packageNameController = TextEditingController();
  final cityOfDepController = TextEditingController();
  final dateOfDepController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holidayPackageController.packageDetails(packageid: widget.packageId);
    
    holidayPackageController.adult(1);
    holidayPackageController.child(0);
    holidayPackageController.infant(0);
      setDefault();
  }

  DateTime date = DateTime.now();

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime.now(),
      locale: const Locale('en', 'IN'),
      lastDate: DateTime.now().add(const Duration(days: 6570)),
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
        dateOfDepController.text = formatDate(date, [dd, "/", mm, "/", yyyy]);
      });
  }

  setDefault() async{
    
    packageNameController.text = widget.getPackageDetailsData.title;
  //  await profileController.getProfile();
  //   print("--------------------->>${profileController.profileData}");
  //   nameController.text = profileController.profileData.first.name;
    // emailController.text = profileController.profileData.first.email;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: kgrey, blurRadius: 2.5)]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: size.width,
                      color: korange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Want to go for a memorable holidays?',
                            style: TextStyle(
                                fontSize: 19.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          ksizedbox10,
                          Text(
                            'Provide your details to know best holidays deals',
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Package Name',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: kblue,
                                fontWeight: FontWeight.w500),
                          ),
                          ksizedbox10,
                          Container(
                            height: 40,
                            width: size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(),
                                color:
                                    const Color.fromARGB(255, 254, 252, 252)),
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: TextField(
                                controller: packageNameController,
                                decoration: const InputDecoration(
                                    isCollapsed: true,
                                    isDense: true,
                                    border: InputBorder.none,
                                    // hintText: "Your Name",
                                    hintStyle: TextStyle(
                                      color: Color(0xff6E6D6E),
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                            ),
                          ),
                          ksizedbox20,
                          Text(
                            'City of Departure',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: kblue,
                                fontWeight: FontWeight.w500),
                          ),
                          ksizedbox10,
                          Container(
                            height: 40,
                            width: size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(),
                                color:
                                    const Color.fromARGB(255, 254, 252, 252)),
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: TextField(
                                controller: cityOfDepController,
                                decoration: const InputDecoration(
                                    isCollapsed: true,
                                    isDense: true,
                                    border: InputBorder.none,
                                    // hintText: "Your Name",
                                    hintStyle: TextStyle(
                                      color: Color(0xff6E6D6E),
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                            ),
                          ),
                          ksizedbox20,
                          Text(
                            'Date of Departure',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: kblue,
                                fontWeight: FontWeight.w500),
                          ),
                          ksizedbox10,
                          Container(
                            height: 40,
                            width: size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(),
                                color:
                                    const Color.fromARGB(255, 254, 252, 252)),
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: TextField(
                                controller: dateOfDepController,
                                readOnly: true,
                                onTap: () {
                                  _selectDate(context);
                                },
                                decoration: const InputDecoration(
                                    isCollapsed: true,
                                    isDense: true,
                                    border: InputBorder.none,
                                    // hintText: "Your Name",
                                    hintStyle: TextStyle(
                                      color: Color(0xff6E6D6E),
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                            ),
                          ),
                          ksizedbox20,
                          Obx(
                            () => Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Adult',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: kblue,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    ksizedbox10,
                                    Container(
                                      height: 25,
                                      width: 75,
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                holidayPackageController
                                                    .adult--;
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                size: 20,
                                              )),
                                          Container(
                                            height: 25,
                                            width: 25,
                                            color: Colors.orange,
                                            child: Center(
                                              child: Text(
                                                holidayPackageController
                                                    .adult.value
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                holidayPackageController
                                                    .adult++;
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                size: 20,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                kwidth10,
                                Column(
                                  children: [
                                    Text(
                                      'Child',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: kblue,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    ksizedbox10,
                                    Container(
                                      height: 25,
                                      width: 75,
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                holidayPackageController
                                                    .child--;
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                size: 20,
                                              )),
                                          Container(
                                            height: 25,
                                            width: 25,
                                            color: Colors.orange,
                                            child: Center(
                                              child: Text(
                                                holidayPackageController
                                                    .child.value
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                holidayPackageController
                                                    .child++;
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                size: 20,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                kwidth10,
                                Column(
                                  children: [
                                    Text(
                                      'Infant',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: kblue,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    ksizedbox10,
                                    Container(
                                      height: 25,
                                      width: 75,
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                holidayPackageController
                                                    .infant--;
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                size: 20,
                                              )),
                                          Container(
                                            height: 25,
                                            width: 25,
                                            color: Colors.orange,
                                            child: Center(
                                              child: Text(
                                                holidayPackageController
                                                    .infant.value
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                holidayPackageController
                                                    .infant++;
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                size: 20,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ksizedbox20,
                          Text(
                            'Contact Details',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: kblue,
                                fontWeight: FontWeight.w500),
                          ),
                          ksizedbox10,
                          Container(
                            height: 40,
                            width: size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(),
                                color:
                                    const Color.fromARGB(255, 254, 252, 252)),
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: TextField(
                                controller: nameController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    isCollapsed: true,
                                    isDense: true,
                                    border: InputBorder.none,
                                    hintText: "Your Name",
                                    hintStyle: TextStyle(
                                      color: Color(0xff6E6D6E),
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                            ),
                          ),
                          ksizedbox20,
                          Container(
                            height: 40,
                            width: size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(),
                                color:
                                    const Color.fromARGB(255, 254, 252, 252)),
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: TextField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    isCollapsed: true,
                                    isDense: true,
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                      color: Color(0xff6E6D6E),
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                            ),
                          ),
                          ksizedbox20,
                          Container(
                            height: 40,
                            width: size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(),
                                color:
                                    const Color.fromARGB(255, 254, 252, 252)),
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: TextField(
                                controller: mobileController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.digitsOnly,
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s')),
                                ],
                                decoration: const InputDecoration(
                                    isCollapsed: true,
                                    isDense: true,
                                    border: InputBorder.none,
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(
                                      color: Color(0xff6E6D6E),
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                            ),
                          ),
                          ksizedbox30,
                          InkWell(
                            onTap: () {
                              print("---------testing enquiry--------------");
                              print(widget.packageId);
                              print(cityOfDepController.text);
                              print(dateOfDepController.text);
                              print(nameController.text);
                              print(emailController.text);
                              print(mobileController.text);
                              if (emailController.text.isEmail) {
                                holidayPackageController.createEnquiry(
                                  packageid: widget.packageId,
                                  cityofdeparture: cityOfDepController.text,
                                  dateofdeparture: dateOfDepController.text,
                                  adultcount: holidayPackageController
                                      .adult.value
                                      .toString(),
                                  childcount: holidayPackageController
                                      .child.value
                                      .toString(),
                                  infantcount: holidayPackageController
                                      .infant.value
                                      .toString(),
                                  name: nameController.text,
                                  email: emailController.text,
                                  mobile: mobileController.text,
                                  status: "pending",
                                );
                              } else {
                                Get.rawSnackbar(
                                    message: "Enter a valid email id",
                                    backgroundColor: Colors.red);
                              }
                            },
                            child: Container(
                              height: 35,
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: kOrange,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Text(
                                  "Send Query",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          ksizedbox20,
                          Row(
                            children: [
                              Icon(
                                Icons.punch_clock_sharp,
                                color: kOrange,
                              ),
                              holidayPackageController
                                      .getPackageDetailsData.isEmpty
                                  ? Text("")
                                  : Text(
                                      holidayPackageController
                                          .getPackageDetailsData.first.duration,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                            ],
                          ),
                          ksizedbox10,
                          // Row(
                          //   children: [
                          //     Icon(
                          //       Icons.location_city,
                          //       color: kOrange,
                          //     ),
                          //     Text(
                          //       'Places to Visit :06N Mauritius',
                          //       style: TextStyle(
                          //           fontSize: 18.sp,
                          //           color: Colors.black,
                          //           fontWeight: FontWeight.w500),
                          //     ),
                          //   ],
                          // ),
                          // ksizedbox30,
                          // Text(
                          //   'Packages Include',
                          //   style: TextStyle(
                          //       fontSize: 20.sp,
                          //       color: kblue,
                          //       fontWeight: FontWeight.w500),
                          // ),
                          // ksizedbox10,
                          // Row(
                          //   children: [
                          //     Column(
                          //       children: [
                          //         Icon(
                          //           Icons.flight_outlined,
                          //           color: kgrey,
                          //         ),
                          //         Text(
                          //           'Flights',
                          //           style: TextStyle(
                          //               fontSize: 10.sp,
                          //               color: kgrey,
                          //               fontWeight: FontWeight.w500),
                          //         ),
                          //       ],
                          //     ),
                          //     kwidth5,
                          //     Column(
                          //       children: [
                          //         Icon(
                          //           Icons.hotel,
                          //           color: kgrey,
                          //         ),
                          //         Text(
                          //           'Hotels',
                          //           style: TextStyle(
                          //               fontSize: 10.sp,
                          //               color: kgrey,
                          //               fontWeight: FontWeight.w500),
                          //         ),
                          //       ],
                          //     ),
                          //     kwidth5,
                          //     Column(
                          //       children: [
                          //         Icon(
                          //           Icons.car_rental,
                          //           color: kgrey,
                          //         ),
                          //         Text(
                          //           'Travel',
                          //           style: TextStyle(
                          //               fontSize: 10.sp,
                          //               color: kgrey,
                          //               fontWeight: FontWeight.w500),
                          //         ),
                          //       ],
                          //     ),
                          //     kwidth5,
                          //     Column(
                          //       children: [
                          //         Icon(
                          //           Icons.food_bank,
                          //           color: kgrey,
                          //         ),
                          //         Text(
                          //           'Meals',
                          //           style: TextStyle(
                          //               fontSize: 10.sp,
                          //               color: kgrey,
                          //               fontWeight: FontWeight.w500),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
