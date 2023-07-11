import 'package:bci/constands/constands.dart';
import 'package:bci/controllers/holiday_package_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EnquiryNowWidget extends StatefulWidget {
  String packageId;
  EnquiryNowWidget({super.key,required this.packageId});

  @override
  State<EnquiryNowWidget> createState() => _EnquiryNowWidgetState();
}

class _EnquiryNowWidgetState extends State<EnquiryNowWidget> {

  final holidayPackageController = Get.find<HolidayPackageController>();
  final profileController = Get.find<ProfileController>();

  final cityOfDepController = TextEditingController();
  final dateOfDepController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.getProfile();
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
                  boxShadow: [
                    BoxShadow(
                      color: kgrey,
                      blurRadius: 2.5
                    )
                  ]
                ),
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
                          Text('Want to go for a memorable holidays?',
                              style: TextStyle(
                                fontSize: 19.sp, 
                                color: Colors.white,
                              fontWeight: FontWeight.w500),
                            ),ksizedbox10,
                            Text('Provide your details to know best holidays deals',
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
                          Text('Package Name',
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
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child:const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      //controller: usernamecontroller,
                      decoration: InputDecoration(
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
                Text('City of Departure',
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
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding:const EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      controller: cityOfDepController,
                      decoration:const InputDecoration(
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
                Text('Date of Departure',
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
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding:const EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      controller: dateOfDepController,
                      decoration:const InputDecoration(
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
                Obx( () =>
                   Row(
                    children: [
                      Column(
                        children: [
                          Text('Adult',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              holidayPackageController.adult--;
                            },
                            child: const Icon(Icons.remove,size: 20,)),
                          Container(
                            height: 25,
                            width: 25,
                            color: Colors.orange,
                            child: Center(
                                child: Text(holidayPackageController.adult.value.toString(),style: const TextStyle(color: Colors.white),),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              holidayPackageController.adult++;
                            },
                            child: const Icon(Icons.add,size: 20,)),
                        ],
                      ),
                    ),
                        ],
                      ),
                      kwidth10,
                      Column(
                        children: [
                          Text('Child',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         InkWell(
                            onTap: (){
                              holidayPackageController.child--;
                            },
                            child: const Icon(Icons.remove,size: 20,)),
                          Container(
                            height: 25,
                            width: 25,
                            color: Colors.orange,
                            child: Center(
                                child: Text(holidayPackageController.child.value.toString(),style: const TextStyle(color: Colors.white),),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              holidayPackageController.child++;
                            },
                            child: const Icon(Icons.add,size: 20,)),
                        ],
                      ),
                    ),
                        ],
                      ),
                      kwidth10,
                      Column(
                        children: [
                          Text('Infant',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              holidayPackageController.infant--;
                            },
                            child: const Icon(Icons.remove,size: 20,)),
                          Container(
                            height: 25,
                            width: 25,
                            color: Colors.orange,
                            child: Center(
                                child: Text(holidayPackageController.infant.value.toString(),style: const TextStyle(color: Colors.white),),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              holidayPackageController.infant++;
                            },
                            child: const Icon(Icons.add,size: 20,)),
                        ],
                      ),
                    ),
                        ],
                      ),
                    ],
                  ),
                ),
                ksizedbox20,
                Text('Contact Details',
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
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding:const EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      controller: nameController,
                      decoration:const InputDecoration(
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
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding:const EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      controller: emailController,
                      decoration:const InputDecoration(
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
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding:const EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      controller: mobileController,
                      decoration:const InputDecoration(
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
                  onTap: (){
                    print("---------testing enquiry--------------");
                    print(widget.packageId);
                    print(profileController.profileData);
                    print(cityOfDepController.text);
                    print(dateOfDepController.text);
                    print(nameController.text);
                    print(emailController.text);
                    print(mobileController.text);
                         holidayPackageController.createEnquiry(
                          packageid: widget.packageId, 
                          vendorid:"107", //profileController.profileData.first.id.toString(),
                          cityofdeparture: cityOfDepController.text, 
                          dateofdeparture: dateOfDepController.text, 
                          adultcount: holidayPackageController.adult.value.toString(), 
                          childcount: holidayPackageController.child.value.toString(), 
                          infantcount:  holidayPackageController.infant.value.toString(), 
                          name: nameController.text, 
                          email: emailController.text, 
                          mobile: mobileController.text, 
                          status: "pending",
                          );
                  },
                  child: Container(
                            height: 35,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: kOrange,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child:const Center(
                                child: Text("Send Query",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                ),
                        ksizedbox20,
                        Row(
                          children: [
                            Icon(Icons.punch_clock_sharp,color: kOrange,),
                            Text('Duration :6 Nights & 7 Days',
                          style: TextStyle(
                          fontSize: 18.sp, 
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                  ),
                          ],
                        ),
                        ksizedbox10,
                         Row(
                          children: [
                            Icon(Icons.location_city,color: kOrange,),
                            Text('Places to Visit :06N Mauritius',
                          style: TextStyle(
                          fontSize: 18.sp, 
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                  ),
                          ],
                        ),
                        ksizedbox30,
                        Text('Packages Include',
                          style: TextStyle(
                          fontSize: 20.sp, 
                          color: kblue,
                          fontWeight: FontWeight.w500),
                         ),
                         ksizedbox10,
                         Row(
                          children: [
                            Column(
                              children: [
                                Icon(Icons.flight_outlined,color: kgrey,),
                                Text('Flights',
                          style: TextStyle(
                          fontSize: 10.sp, 
                          color: kgrey,
                          fontWeight: FontWeight.w500),
                         ),
                              ],
                            ),
                            kwidth5,
                            Column(
                              children: [
                                Icon(Icons.hotel,color: kgrey,),
                                Text('Hotels',
                          style: TextStyle(
                          fontSize: 10.sp, 
                          color: kgrey,
                          fontWeight: FontWeight.w500),
                         ),
                              ],
                            ),
                            kwidth5,
                            Column(
                              children: [
                                Icon(Icons.car_rental,color: kgrey,),
                                Text('Travel',
                          style: TextStyle(
                          fontSize: 10.sp, 
                          color: kgrey,
                          fontWeight: FontWeight.w500),
                         ),
                              ],
                            ),
                            kwidth5,
                            Column(
                              children: [
                                Icon(Icons.food_bank,color: kgrey,),
                                Text('Meals',
                          style: TextStyle(
                          fontSize: 10.sp, 
                          color: kgrey,
                          fontWeight: FontWeight.w500),
                         ),
                              ],
                            ),
                          ],
                         ),
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