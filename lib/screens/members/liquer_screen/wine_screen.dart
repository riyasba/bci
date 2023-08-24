import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/screens/members/liquer_screen/add_cart_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constands/constands.dart';
import '../../bussiness/views/business/notification_screen.dart';

class LiquorListScreen extends StatefulWidget {
    String vendor;
    LiquorListScreen({super.key,required this.vendor});

  @override
  State<LiquorListScreen> createState() => _LiquorListScreenState();
}

class _LiquorListScreenState extends State<LiquorListScreen> {

  final homeController = Get.find<HomeController>();

  final searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.liquorService(vendor: widget.vendor, categoryid: "6");
    searchController.addListener(searchUsers);
  }

   searchUsers() {
    if (searchController.text.trim().isNotEmpty) {
      homeController.searchServiceList(searchKey: searchController.text,categoryid: "6");
    } else {
      homeController.liquorService(vendor: widget.vendor, categoryid: "6");
      homeController.searchServiceListData.clear();
      homeController.update();
    }
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
              height: 150,
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
                    const Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Text(
                        'Wine',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
          )),
      body: ListView(
        children: [
           Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 44,
                  child: TextFormField(
                     controller: searchController,
                    decoration: InputDecoration(disabledBorder: OutlineInputBorder(),
                        hintText: 'Search',
                        fillColor: Colors.grey[200],
                        focusColor: Colors.grey[200],
                        isDense: true,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        prefixIcon: Image.asset('assets/images/622669.png'),
                        suffixIcon: searchController.text.length > 1 ? InkWell(
                        onTap: (){
                          searchController.clear();
                        },
                        child: const Icon(CupertinoIcons.clear,color: Colors.grey,),
                        ) : Icon(CupertinoIcons.clear,color: Colors.grey[200],),
                        ),
                       // suffixIcon: Image.asset('assets/images/Icon material-location-on.png')
                       // ),
                  ),
                ),
              ),
         const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Popular Wine',
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          
          GetBuilder<HomeController>(
            builder: (_) {
              return Container(
                height: size.height * 0.66,
                child:homeController.searchServiceListData.isEmpty &&
                searchController.text.isNotEmpty
               ? Center(
                child: Column(
                  children: [
                    const Image(image: AssetImage("assets/icons/search.png")),
                    Text(
                      'No result found',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: kblue),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '''we can't find any item matching\nyour search''',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, height: 1.5, color: kblue),
                    ),
                  ],
                ),
              )
            : GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: homeController.searchServiceListData.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(LiquorDetailScreen(searchServicelist: 
                              homeController.searchServiceListData[index],));
                            },
                            child: Container(
                              height: 130,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(color: kgrey, blurRadius: 0.5),
                                  ],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        homeController
                                            .searchServiceListData[index].image,
                                        height: 100,
                                        width:150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      homeController
                                          .searchServiceListData[index].title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: kblue),
                                    ),
                                    Text(homeController.searchServiceListData[index].actualAmount,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
              );
            }
          ),
              ]
              )
              );

          // InkWell(onTap: (){
          //   Get.to(LiquorDetailScreen());},
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Wine_widget(
          //         wineimg: 'assets/images/Layer 3442.png',
          //       ),
          //       Wine_widget(
          //         wineimg:
          //             'assets/images/59_Barefoot-Cellars-California-Chardonnay-750ml.png',
          //       )
          //     ],
          //   ),
          // ),
    
  }
}
