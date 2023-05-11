import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

 import 'authentications/splash_screen/Splash_screen.dart';
import 'screens/members/flight_booking_screens/flight_booking_landing_screen.dart';

void main() {
  Get.put(FlightsController());
  Get.put(SettingsController()); 
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {     
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(     designSize: Size(392, 850),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {  
     return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home:  splash(),
        home: splash(),
      );
    },  );
  }
}
 