import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/controllers/bus_controllers.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/controllers/holiday_package_controller.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/plans_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:bci/screens/members/bus/bus_contact_details.dart';
import 'package:bci/screens/members/holiday/controllers/holidaycontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'authentications/splash_screen/Splash_screen.dart';
import 'screens/members/bus/boarding_screen_view.dart';
import 'screens/members/flight_booking_screens/flight_booking_success_page.dart';
import 'screens/members/flight_booking_screens/flight_loading_page.dart';
import 'screens/members/flight_booking_screens/flight_ticket_screen.dart';

void main() {
  Get.put(FlightsController());
  Get.put(SettingsController());
  Get.put(AuthController());
  Get.put(ProfileController());
  Get.put(PlanController());
  Get.put(HomeController());
  Get.put(HolidayController());
  Get.put(HolidayPackageController());
  Get.put(BusController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 850),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: BusBoardingDetailsScreen(),
          home: const splash(),
        );
      },
    );
  }
}
