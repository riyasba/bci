import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/controllers/bus_controllers.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/controllers/holiday_package_controller.dart';
import 'package:bci/controllers/home_page_controller.dart';
import 'package:bci/controllers/hotel_booking_controller.dart';
import 'package:bci/controllers/plans_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:bci/screens/members/holiday/controllers/holidaycontroller.dart';
import 'package:bci/screens/members/members%20widgets/member_bottumbavigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'authentications/splash_screen/Splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.instance.requestPermission();


  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_noti_channel_group',
            channelKey: 'basic_noti_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            importance: NotificationImportance.High,
            playSound: true,
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupName: 'Basic group', channelGroupkey: '')
      ],
      debug: true);

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // This is just a basic example. For real apps, you must show some
      // friendly dialog box before call the request method.
      // This is very important to not harm the user experience
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  firebaseNotification();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');

      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 15,
          channelKey: 'basic_noti_channel',
          title: message.notification!.title,
          body: message.notification!.body,
        ),
      );
    }
  });

  AwesomeNotifications()
      .actionStream
      .listen((ReceivedNotification receivedNotification) {
    print(
        ":::--------:::::::notification datas:>>>>>>>>>>>>>>>:::-------------------::::::");
    Get.offAll(() => MemberBottomNavBar(
          index: 3,
        ));
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print(message.data);
    print(message.notification);
    if (message.data.isNotEmpty) {
      Map<String, String>? data = Map.from(message.data);

      Get.offAll(() => MemberBottomNavBar(
            index: 3,
          ));
    }
  });

  Get.put(FlightsController());
  Get.put(SettingsController());
  Get.put(AuthController());
  Get.put(ProfileController());
  Get.put(PlanController());
  Get.put(HomeController());
  Get.put(HolidayController());
  Get.put(HolidayPackageController());
  Get.put(BusController());
  Get.put(HotelBookingController());
  runApp(const MyApp());
}

firebaseNotification() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 850),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const splash(),
        );
      },
    );
  }
}
