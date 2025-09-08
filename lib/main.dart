import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:zion_app/service/network/apiService.dart';
import 'constant/color.dart';
import 'constant/const_string.dart';
import 'constant/font_family.dart';
import 'constant/languages.dart';
import 'constant/utilities.dart';
import 'navigation/navigation.dart';
import 'navigation/routename.dart';
import 'service/network/allApiCallService.dart';

//*********************************************************************** */
// Variable Declaration
//*********************************************************************** */
bool isProduction = false;
bool isSmallAndroidDevice = false;
String? userId;
String? userToken;
String? refreshToken;
String? isRemember;
String? verificationID;
AndroidDeviceInfo? androidInfo;
IosDeviceInfo? isoInfo;
String? fcmToken;
bool isAccessTokenExpired = false;
Locale? initialLocale;
AllApiCallService service = AllApiCallService();
bool isFlutterLocalNotificationsInitialized = false;
late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//*********************************************************************** */
// Life Cycle Method
//*********************************************************************** */

class AppLifecycleObserver with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      print("App is in Foreground");
    } else if (state == AppLifecycleState.paused) {
      print("App is in Background");
    } else if (state == AppLifecycleState.inactive) {
      print("App is in Inactive State");
    } else if (state == AppLifecycleState.detached) {
      print("App is Terminated");
    }
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  final localStorage = GetStorage();
  userToken = localStorage.read(LocalStorageKeys.userToken);
  userId = localStorage.read(LocalStorageKeys.userId);
  refreshToken = localStorage.read(LocalStorageKeys.refreshToken);
  verificationID = localStorage.read(LocalStorageKeys.verificationID);
  // await Firebase.initializeApp();
  // handelFcm();
  updateSystemOverlay();
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.addObserver(AppLifecycleObserver());

  initializeDateFormatting();

  Timer.periodic(const Duration(seconds: 2), (timer) {
    internetConnectivity();
  });

  print(localStorage.read(LocalStorageKeys.LanguageID));
  print("Language");
  // Check if the language has already been selected manually
  String? storedLanguage = localStorage.read(LocalStorageKeys.LanguageID);

  // Set initial locale

  if (storedLanguage == null) {
    // Use device locale if nothing is stored
    final deviceLocale = Get.deviceLocale ?? const Locale('en', 'US');
    initialLocale =
        ['en', 'ar'].contains(deviceLocale.languageCode)
            ? Locale(
              deviceLocale.languageCode,
              deviceLocale.countryCode ?? 'US',
            )
            : const Locale('en', 'US');

    // Save the detected language
    localStorage.write(
      LocalStorageKeys.LanguageID,
      '${initialLocale!.languageCode}_${initialLocale!.countryCode}',
    );
  } else {
    // Use stored language
    List<String> parts = storedLanguage.split('_');
    initialLocale = Locale(parts[0], parts.length > 1 ? parts[1] : 'US');
  }

  runApp(const MyApp());
}

//*********************************************************************** */
// Functions
//*********************************************************************** */
showAlert(String message) {
  showDialog(
    context: Get.context!,
    builder:
        (builder) => Material(
          color: Colors.transparent,
          child: AlertDialog(content: Text(message, maxLines: 3)),
        ),
  );
}

bool isValidPhoneNumber(String phone) {
  // Remove +966 or any non-numeric characters
  final sanitizedPhone = phone.replaceAll(RegExp(r'[^0-9]'), '');
  final phoneRegex = RegExp(r'^\d{10,15}$');
  return phoneRegex.hasMatch(sanitizedPhone);
}

internetConnectivity() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      if (Get.isDialogOpen!) {
        Get.back();
      }
    }
  } on SocketException catch (_) {
    print("There is no internet");
    if (Get.isDialogOpen == false) {
      Get.dialog(
        Material(
          color: Colors.transparent,
          child: WillPopScope(
            onWillPop: () {
              SystemChannels.textInput.invokeMethod('TextInput.hide');
              FocusScope.of(Get.context!).unfocus();
              return Future.value(false);
            },
            child: AlertDialog(
              contentPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              content: SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    "There is no internet connection".tr,
                    maxLines: 3,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}

//*********************************************************************** */
//Main Class
//*********************************************************************** */
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors().white100Color,
            ),
            fontFamily: Appfonts.family1Regular,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(brightness: Brightness.dark),
          locale: initialLocale,
          translations: Languages(),
          fallbackLocale: const Locale('en', 'US'),
          initialRoute: RouterName.signInScreen,
          debugShowCheckedModeBanner: false,
          getPages: Pages.pages(),
        );
      },
    );
  }
}

class CustomImageCache extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() {
    ImageCache imageCache = super.createImageCache();
    // Set your image cache size
    imageCache.maximumSizeBytes = 1024 * 1024 * 100; // 100 MB
    return imageCache;
  }
}

//*********************************************************************** */
// Push Notification
//*********************************************************************** */
// handelFcm() async {
//   var status = await Permission.notification.request();
//   print(status.isGranted);
//   await FirebaseMessaging.instance.requestPermission(
//     alert: false,
//     announcement: false,
//     badge: false,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: false,
//   );

//   String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//   print("APNS Token: $apnsToken");

//   if (apnsToken == null) {
//     print("APNs token is null. Ensure the app is properly set up for APNs.");
//     // return;
//   }

//   FirebaseMessaging.instance.getToken().then((value) async {
//     fcmToken = value;

//     print("firebase Token : $fcmToken");

//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     await setupFlutterNotifications();
//   });
//   FirebaseMessaging.instance.getInitialMessage().then((event) async {
//     print("firebase getInitialMessage : $event");
//     if (event != null) {
//       Future.delayed(Duration(milliseconds: 2000), () {
//         handelAndroidNotification("", iOSData: event.data);
//       });
//     }
//   });
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: false,
//     badge: false,
//     sound: false,
//   );
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     log('Got a message whilst in the foreground!');
//     log('Message data: ${message.data}');
//     log('Got a message whilst in the foreground!');
//     log('Message Progress: ${message.data["data"]}');
//     var data = jsonDecode(message.data["data"]);
//     // Extract progress data
//     final connectCustomerFromJson = connectCustomerData.fromJson(data);
//     print("CustomerData : ${connectCustomerFromJson.message}");
//     if (connectCustomerFromJson == null) {
//       log("No progress data found in notification");
//       return;
//     }

//     // Determine the target screen route
//     const targetRoute = RouterName.loaderScreen;

//     // Check if the current screen matches the target screen
//     if (Get.currentRoute != targetRoute) {
//       // Navigate to the target screen and pass the data
//       Get.toNamed(
//         targetRoute,
//         arguments: {"customerData": connectCustomerFromJson},
//       );
//     } else {
//       // Update the existing screen with new data
//       if (Get.isRegistered<LoaderScreenController>()) {
//         LoaderScreenController controller = Get.find<LoaderScreenController>();
//         controller.objCustomerData = connectCustomerFromJson;
//         print(
//           "All Stages Completed ${controller.objCustomerData?.allStagesCompleted}",
//         );
//         if (controller.objCustomerData?.allStagesCompleted ?? false == true) {
//           Get.find<HomeScreenController>().getBankList();
//           Get.find<HomeScreenController>().getCashFlowAPICall();
//           Get.back();
//         }
//         controller.update();
//       }
//     }
//     log('Message also contained a notification: ${message.notification}');
//     if (connectCustomerFromJson.contentavailable == "1") {
//       processSilentNotification(message.data);
//     } else {
//       showFlutterNotification(message);
//     }
//     // showFlutterNotification(message);
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((event) {
//     handelAndroidNotification("", iOSData: event.data);
//   });
// }

// void processSilentNotification(Map<String, dynamic> data) {
//   log('Processing silent notification data: $data');
//   if (data.containsKey("someKey")) {
//     // Example: Update some data in your app
//   }
// }

showAlerts(String message) {
  showDialog(
    context: Get.context!,
    builder:
        (builder) => Material(
          color: Colors.transparent,
          child: AlertDialog(content: Text(message, maxLines: 3)),
        ),
  );
}

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   await setupFlutterNotifications();
//   showFlutterNotification(message);
//   print('Handling a background message ${jsonEncode(message.data)}');
// }

// Future<void> setupFlutterNotifications() async {
//   if (isFlutterLocalNotificationsInitialized) {
//     return;
//   }
//   try {
//     channel = const AndroidNotificationChannel(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       description:
//           'This channel is used for important notifications.', // description
//       importance: Importance.high,
//     );

//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin
//         >()
//         ?.createNotificationChannel(channel);
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('mipmap/ic_launcher');
//     final DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings();
//     final LinuxInitializationSettings initializationSettingsLinux =
//         LinuxInitializationSettings(defaultActionName: 'Open notification');
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//           android: initializationSettingsAndroid,
//           iOS: initializationSettingsDarwin,
//           linux: initializationSettingsLinux,
//         );
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse? payload) async {
//         Future.delayed(Duration(seconds: 2), () {
//           handelAndroidNotification(payload!.payload!);
//         });
//       },
//     );

//     flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails().then((
//       value,
//     ) {
//       if (value!.didNotificationLaunchApp) {
//         if (value.notificationResponse != null) {
//           Future.delayed(Duration(seconds: 2), () {
//             handelAndroidNotification(value.notificationResponse!.payload!);
//           });
//         }
//       }
//     });

//     isFlutterLocalNotificationsInitialized = true;
//   } catch (e) {
//     print(e);
//   }
// }

// handelAndroidNotification(String payload, {Map<String, dynamic>? iOSData}) {
//   log("-------------------------------------");
//   print(payload);
//   log("-------------------------------------");
//   var paylodJson;
//   if (iOSData != null) {
//     paylodJson = iOSData;
//   } else {
//     paylodJson = jsonDecode(payload);
//   }
//   var data = jsonDecode(paylodJson);
//   // Extract progress data
//   final connectCustomerFromJson = connectCustomerData.fromJson(data);
//   print("CustomerData : ${connectCustomerFromJson.message}");
//   if (connectCustomerFromJson == null) {
//     log("No progress data found in notification");
//     return;
//   }

//   // Determine the target screen route
//   const targetRoute = RouterName.loaderScreen;

//   // Check if the current screen matches the target screen
//   if (Get.currentRoute != targetRoute) {
//     // Navigate to the target screen and pass the data
//     Get.toNamed(
//       targetRoute,
//       arguments: {"customerData": connectCustomerFromJson},
//     );
//   } else {
//     // Update the existing screen with new data
//     if (Get.isRegistered<LoaderScreenController>()) {
//       LoaderScreenController controller = Get.find<LoaderScreenController>();
//       controller.objCustomerData = connectCustomerFromJson;
//       print(
//         "All Stages Completed ${controller.objCustomerData?.allStagesCompleted}",
//       );
//       if (controller.objCustomerData?.allStagesCompleted ?? false == true) {
//         Get.find<HomeScreenController>().getBankList();
//         Get.find<HomeScreenController>().getCashFlowAPICall();
//         Get.back();
//       }
//       controller.update();
//     }
//   }

//   flutterLocalNotificationsPlugin.cancelAll();
// }

// void onNotificationTap(event) {}

// void showFlutterNotification(RemoteMessage message) {
//   if (Platform.isAndroid) {
//     var data = message.data;
//     if (message.data["message"] != null) {
//       data = jsonDecode(message.data["message"]);
//     }

//     RemoteNotification? notification = RemoteNotification(
//       title: data["title"],
//       body: data["body"],
//     );

//     flutterLocalNotificationsPlugin.show(
//       notification.hashCode,
//       notification.title,
//       notification.body,
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           channel.id,
//           channel.name,
//           channelDescription: channel.description,
//         ),
//       ),
//       payload: jsonEncode(data),
//     );

//     log('Handling a background message ${jsonEncode(data)}');
//   }
// }
