import 'dart:io';

import 'package:bci/constands/app_fonts.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/controllers/services_controller.dart';
import 'package:bci/models/category_model.dart';
import 'package:bci/screens/bussiness/views/home_screen/offers/last_offers.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constands/constands.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {

  final authController = Get.find<AuthController>();
  final servicesController = Get.find<ServicesController>();

  var merchantCategory;
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var bsValueController = TextEditingController();
  var claimUserController = TextEditingController();
  var discountValueController = TextEditingController();
  final startatController = TextEditingController();
  final endatController = TextEditingController();

  File? image;

  DateTime date1 = DateTime.now();
  DateTime date = DateTime.now();

  String selectdt =
      formatDate(DateTime.now(), [
    yyyy,
    "-",
    mm,
    "-",
    dd,
  ]);

  String selectdt1 = formatDate(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      [yyyy, "-", mm, "-", dd]);

  _showDatePicker(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        builder: ((context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: kblue,
                onPrimary: Colors.white,
                onSurface: Colors.blue,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary:const Color.fromARGB(255, 42, 59, 158),
                ),
              ),
            ),
            child: child!,
          );
        }));

    if (picked != null) {
      setState(() {
        date1 = picked;
        selectdt = formatDate(date1, [
          yyyy,
          "-",
          mm,
          "-",
          dd,
        ]);
      });
      // serviceController.dateFilterBooking(
      //     fromdate: selectdt,
      //     todate: selectdt1);
    }
  }

  _showDatePicker1(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        builder: ((context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: kblue,
                onPrimary: Colors.white,
                onSurface: Colors.blue,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary:const Color.fromARGB(255, 42, 59, 158),
                ),
              ),
            ),
            child: child!,
          );
        }));

    if (picked != null) {
      setState(() {
        date = picked;
        selectdt1 = formatDate(date, [
          yyyy,
          "-",
          mm,
          "-",
          dd,
        ]);
      });
      // serviceController.dateFilterBooking(
      //     fromdate: selectdt,
      //     todate: selectdt1);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(250),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 158,
              color: kblue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: kwhite,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      'Offers',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset('assets/images/helps.png'),
                  )
                ],
              ),
            ),
          )),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text(
                'Offer Title',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: kblue),
              ),
            ),
            Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: TextFormField(
              controller: titleController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return "Title Can't be Empty";
              //   }
              //   return null;
              // },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  isCollapsed: false,
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  hintText: "Your Offer Title",
                  hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          ksizedbox10,
          GetBuilder<AuthController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: Container(
                height: 44,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                        color: const Color.fromARGB(255, 5, 5, 5)
                            .withOpacity(0.8))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: DropdownButton<CategoryList>(
                    value: merchantCategory,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    elevation: 0,
                    itemHeight: 55,
                    isDense: true,
                    dropdownColor: Colors.grey[250],
                    style: const TextStyle(color: Colors.black54),
                    hint: Text(
                      "Product Category Name",
                      style: TextStyle(fontSize: 16, color: kblue),
                    ),
                    onChanged: (CategoryList? value) {
                      setState(() {
                        merchantCategory = value!;
                      });
                    },
                    items: authController.categoryList
                        .map<DropdownMenuItem<CategoryList>>(
                            (CategoryList value) {
                      return DropdownMenuItem<CategoryList>(
                        value: value,
                        child: Text(value.title),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: TextFormField(
              controller: discountValueController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return "Title Can't be Empty";
              //   }
              //   return null;
              // },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  isCollapsed: false,
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  hintText: "Discount Value",
                  hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: TextFormField(
              controller: claimUserController,
               autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return "Title Can't be Empty";
              //   }
              //   return null;
              // },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  isCollapsed: false,
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  hintText: "Claim User",
                  hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: TextFormField(
              controller: bsValueController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return "Title Can't be Empty";
              //   }
              //   return null;
              // },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  isCollapsed: false,
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  hintText: "Bs Value",
                  hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Starts At",
                         style: TextStyle(
                      color: kblue,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),),
                       const SizedBox(height: 5,),
                        InkWell(
                          onTap: (){
                           _showDatePicker(context);
                          },
                          child: Container(
            height: 35,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color:const Color(0xff707070)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(selectdt,style: TextStyle(color: kblue),),
                Icon(Icons.edit_calendar,color: kgrey,)
              ],
            ),
                          ),
                        ),
                   ],
                 ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                           Text("Ends At",
                         style: TextStyle(
                      color: kblue,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),),
                      const SizedBox(height: 5,),
                      InkWell(
                          onTap: (){
                            _showDatePicker1(context);
                          },
                           child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: const Color(0xff707070)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(selectdt1,style: TextStyle(color: kblue),),
                                Icon(Icons.edit_calendar,color: kgrey,)
                              ],
                            ),
                                               ),
                         ),
                  ],
                 ),
                  
              ],
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,top: 15),
              child: InkWell(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                          // Pick an image
                          final XFile? tempimage = await picker.pickImage(
                              source: ImageSource.gallery);

                          setState(() {
                            image = File(tempimage!.path);
                          });
                },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.4,
                  width: MediaQuery.of(context).size.width,
                  decoration:const BoxDecoration(color: Color.fromARGB(255, 232, 232, 232)),
                  child:image != null
                              ? Image.file(image!)
                              :  Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Image.asset('assets/images/avaiimageupload.png',color: kgrey,),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Offer Banner',
                              style: TextStyle(fontSize: 18, color: kblue),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: TextFormField(
              controller: descriptionController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLines: 5,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  isCollapsed: false,
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  hintText: "Description",
                  hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kblue,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 50)),
                  onPressed: () {
                    if(titleController.text.isNotEmpty &&
                       merchantCategory != null &&
                       bsValueController.text.isNotEmpty &&
                       claimUserController.text.isNotEmpty &&
                       discountValueController.text.isNotEmpty &&
                       image != null
                    ){
                      servicesController.addTodayOffers(
                          image: image!.path, 
                          title: titleController.text, 
                          category: merchantCategory.id.toString(), 
                          startsat: selectdt, 
                          endsat: selectdt1, 
                          discountValue: discountValueController.text, 
                          claimUser: claimUserController.text, 
                          bsValue: bsValueController.text
                          );
                    } else {
                       Get.rawSnackbar(
                                  backgroundColor: Colors.red,
                                  messageText: Text(
                                    "Fill All the Fields",
                                    style: primaryFont.copyWith(
                                        color: Colors.white),
                                  ));
                    } 
                         
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 21, color: kwhite),
                  )),
            ),
            ksizedbox20,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kyellow,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.8, 50)),
                  onPressed: () {
                    Get.to(const LastOffers());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Last Offers',
                        style: TextStyle(fontSize: 21, color: kwhite),
                      ),
                     const Icon(Icons.arrow_forward)
                    ],
                  )),
            ),
            ksizedbox20
          ],
        ),
      ]),
    );
  }

  Widget descriptiontextFiled(String hinttext, dynamic controller) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 12),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[
              BoxShadow(offset: Offset(0.0, 0.75), blurRadius: 5, color: kgrey)
            ],
            color: kwhite,
            border: Border.all(color: kgrey)),
        child: TextField(
          maxLines: 7,
          controller: controller,
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              hintText: hinttext,
              hintStyle: TextStyle(fontSize: 16, color: kblue),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: kgrey))),
        ),
      ),
    );
  }
}
