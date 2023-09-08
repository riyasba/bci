import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/screens/members/liquer_screen/wine_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constands/constands.dart';
import '../../bussiness/views/business/notification_screen.dart';

class LiquorScreen extends StatefulWidget {
  const LiquorScreen({super.key});

  @override
  State<LiquorScreen> createState() => _LiquorScreenState();
}

class _LiquorScreenState extends State<LiquorScreen> {

  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    homeController.liquorVendors(categoryid: "6");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFF9F8FD),
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(110),
          child: Column(
            children: [
              ClipPath(
                clipper: SinCosineWaveClipper(),
                child: Container(
                  height: 145.h,
                  color: kblue,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: (){
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.arrow_back_ios,color: kwhite,),
                      )
                                ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Text(
                            'Liquors',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: kwhite),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.to(const NotificationScreen());
                            },
                            icon: Icon(
                              Icons.notifications,
                              color: kwhite,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     height: 44.h,
              //     child: TextFormField(
              //       // controller: _controller,
              //       decoration: InputDecoration(disabledBorder: OutlineInputBorder(),
              //           hintText: 'Search',
              //           fillColor: Colors.grey[200],
              //           focusColor: Colors.grey[200],
              //           isDense: true,
              //           filled: true,
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(23.0),
              //           ),
              //           prefixIcon: Image.asset('assets/images/622669.png'),),
              //           //suffixIcon: Image.asset('assets/images/Icon material-location-on.png')),
              //     ),
              //   ),
              // ),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GetBuilder<HomeController>(
          builder: (_) {
            return homeController.vendorListData.isEmpty ? const  Center(
                child: Text("No data found"),
            ) : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeController.vendorListData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                    child: InkWell(
                      onTap: (){
                        Get.to( LiquorListScreen(vendor: homeController.vendorListData[index].vendorId.toString(),));
                      },
                      child: Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kwhite,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0.5,
                                    color: kgrey
                                  )
                                ]
                              ),
                              
                              child: Row(
                                children: [
                                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(homeController.vendorListData[index].image,fit: BoxFit.cover,width: 100,height: 130,)),
                                  ),kwidth10,
                                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(homeController.vendorListData[index].title),
                          Container(
                            width: 170,
                            child: Text(homeController.vendorListData[index].description,maxLines: 3,overflow: TextOverflow.ellipsis,)),
                          Text(homeController.vendorListData[index].saleAmount),
                        ],
                      ),
                                  )
                                ],
                              ),
                            ),
                    ),
                  );
                });
          }
        ),
      ),
    );
  }
}
