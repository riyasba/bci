import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bci/controllers/auth_controllers.dart';
import 'package:bci/controllers/flights_controller.dart';
import 'package:bci/controllers/profile_controller.dart';
import 'package:bci/controllers/services_controller.dart';
import 'package:bci/controllers/settings_controllers.dart';
import 'package:bci/screens/bussiness/views/business/notification_screen.dart';
import 'package:bci/screens/bussiness/views/generations/waiting_for_approval_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'authentications/splash_screen/Splash_screen.dart';
import 'controllers/notification_controller.dart';
import 'controllers/vendorbanner_controller.dart';
import 'package:download_assets/download_assets.dart';


Future main()async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp();
 
    AwesomeNotifications().initialize(
  // set the icon to null if you want to use the default app icon
  null,
  [
    NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor:const Color(0xFF9D50DD),
        importance:NotificationImportance.High,
        playSound: true,
        ledColor: Colors.white)
  ],
  // Channel groups are only visual and are not required
  channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: 'basic_channel_group',
        channelGroupName: 'Basic group')
  ],
  debug: true
);
 

 @pragma('vm:entry-point')
   Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {

    if(
      receivedAction.actionType == ActionType.SilentAction ||
      receivedAction.actionType == ActionType.SilentBackgroundAction
    ){
      // For background actions, you must hold the execution until the end
      print('Message sent via notification input: "${receivedAction.buttonKeyInput}"');
      
    }
    else {
      Get.offAll(NotificationScreen());
      // MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
      //     '/notification-page',
      //         (route) =>
      //     (route.settings.name != '/notification-page') || route.isFirst,
      //     arguments: receivedAction);
    }
  }

 Future<void> startListeningNotificationEvents() async {
    AwesomeNotifications()
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
  }
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
                  id: 10,
                  channelKey: 'basic_channel',
                  title: message.notification!.title,
                  body: message.notification!.body,
                  actionType: ActionType.Default
               ),
              );
  }
});

  Get.put(FlightsController());
  Get.put(SettingsController());
  Get.put(AuthController());
  Get.put(ProfileController());
  Get.put(ServicesController());
  Get.put(VendorBannerController());
  Get.put(NotificationController());
   checkForUpdate();
  runApp( MyApp());
}


//


firebaseNotification()async{
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
print(settings);
}

Future<void> checkForUpdate() async {
  print(
      "******-__-***-__-***-__-***_-***-_****************---On update---*******************************************");
  InAppUpdate.checkForUpdate().then((info) {
    print(
        "%%%%%%%%%%%%%%% ------- ${info.availableVersionCode} -------- %%%%%%%%%%%%%%%");
    print(
        "%%%%%%%%%%%%%%% ------- ${info.updateAvailability} -------- %%%%%%%%%%%%%%%");
    print(
        "%%%%%%%%%%%%%%% ------- ${info.packageName} -------- %%%%%%%%%%%%%%%");

    if (info.updateAvailability == UpdateAvailability.updateAvailable) {
      InAppUpdate.performImmediateUpdate().catchError((e) {
        // showSnack(e.toString());
        return AppUpdateResult.inAppUpdateFailed;
      });
    }
  }).catchError((e) {
    // showSnack(e.toString());
  });
}

class MyApp extends StatefulWidget {
static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 850),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      // splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          // navigatorKey: MyApp.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home:  const WaitingForApprovalScreen(),
          home:const splash(),
        );
      },
    );
  }
}
