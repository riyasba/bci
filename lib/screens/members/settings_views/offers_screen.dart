import 'package:bci/constands/constands.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controllers.dart';
import '../../../controllers/settings_controllers.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {

var selectItem = '';  
  @override
  void initState() {
    super.initState();
    settingcontroller.offersList();
    authcontroller.getCategoryList();
   
  }
    final _popupMenu = GlobalKey<PopupMenuButtonState>(); 
  final settingcontroller = Get.find<SettingsController>();
  final authcontroller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:const Color(0xffF9F8FD),
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(150),
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              height: 150,
              color: kblue,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child:const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Offers',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffF9F8FD)),
                      ),
                    ),
                    Image.asset('assets/images/helps.png')
                  ],
                ),
              ),
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             Padding(
              padding:const EdgeInsets.only(top: 20,left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Member Offer",
                  style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff003366)),),

                  IconButton(onPressed: (){
                  showModalBottomSheet(

                    shape:const RoundedRectangleBorder(
                     borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(15),
                      topStart: Radius.circular(15)
                     )
                    ),
                    context: context,
                    builder: (context){
                      return GetBuilder<AuthController>(
                        builder: (_) {
                          return Container(
                            height: 250,
                            child: ListView.builder(
                            itemCount:authcontroller.categoryList.length,
                              itemBuilder: (context,index){
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30,left: 0,right: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              authcontroller.filterindex(index);
                                              authcontroller.getoffersfilterCategory(categoryid: authcontroller.categoryList[index].id.toString());
                                              authcontroller.update();
                                              Get.back();
                                            },
                                            child: Container(
                                            width: 200,
                                              child: Text(authcontroller.categoryList[index].title,
                                              style:const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500
                                              ),)),
                                          ),
                                          Container(
                                            width: 100,
                                            child:authcontroller.filterindex.value==index?
                                            Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: kOrange
                                              ),
                                              child: Center(
                                                child: Container(
                                                  height: 15,
                                                  width: 15,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kwhite
                                                  ),
                                                ),
                                              ),
                                            ):
                                            Container(
                                              color: kwhite,
                                            )
                                             
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              }),
                          );
                        }
                      );
                    });

                  }, 
                 
                  icon:const Icon(Icons.filter_alt))
                //     GetBuilder<AuthController>(
                //       builder: (_) {
                //         return PopupMenuButton(
                //           key: _popupMenu,
                // itemBuilder: (context) => [
                //           PopupMenuItem(
                //               child: Container(
                //                 height: 150,
                //                 child: Column(
                //                     children: const [
                //                       Text('item1'), 
                //                     Text('item2'),
                //                     ]),
                //               ))
                //         ],
                // child: IconButton(
                //   onPressed: () {
                //         _popupMenu.currentState?.showButtonMenu();
                //   },
                //   icon: Icon(Icons.filter_alt),
                // ));
                //       }
                //     )
                ],
              ),
            ),
           GetBuilder<SettingsController>(
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 500,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:settingcontroller.offerslistdata.length ,
                      itemBuilder: (context, index) {
                        return settingcontroller.offerslistdata.isNotEmpty?  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 140,
                            width: size.width,
                            decoration: BoxDecoration(
                              color:const Color(0xff594A99),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(settingcontroller.offerslistdata[index].title,
                                         style:const TextStyle(fontSize: 20,
                                         fontWeight: FontWeight.w500,
                                         height: 1.4,
                                         color: Color(0xffFAE7E3)),),
                                         Padding(
                                           padding: const EdgeInsets.only(top: 10,right: 10,bottom: 10),
                                           child: Container(
                                            height: 150,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image(
                                                image: NetworkImage(settingcontroller.offerslistdata[index].image),fit: BoxFit.fill))),
                                         )
                                       ],
                                    ),
                            ),
                          ),
                        ) : const Text('No data');
                      },
                    ),
                  ),
                );
              }
            ),
        ],
      ),
    );
  }
  
}
