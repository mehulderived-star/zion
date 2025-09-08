import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zion_app/screens/MainTab/DiscoverTab/DiscoverScreenController.dart';
import 'package:zion_app/screens/MainTab/HomeTab/HomeScreenController.dart';
import 'package:zion_app/screens/MainTab/OrderTab/OrderScreenController.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/ProfileScreenController.dart';
import '../../../constant/utilities.dart';
import '../../../main.dart';
import '../../BaseViewController/baseController.dart';
import '../DiscoverTab/DiscoverScreenWrapper.dart';
import '../HomeTab/HomeScreenWrapper.dart';
import '../OrderTab/OrderScreenWrapper.dart';
import '../ProfileTab/ProfileScreenWrapper.dart';

class MainTabBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainTabController());
  }
}

class MainTabController extends BaseController {
  final List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const DiscoverScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];
  int selectedIndex = 0;
  String unVerifiedHelpCount = "0";

  DateTime timeBackPressed = DateTime.now();

  @override
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextStyle optionStyle = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  late Widget currentScreen;
  @override
  void onInit() {
    PaintingBinding.instance.imageCache.maximumSizeBytes = 300000000000;
    Get.put(HomeScreenController());
    Get.put(DiscoverScreenController());
    Get.put(OrderScreenController());
    // Get.put(NotificationScreenController());
    Get.put(ProfileScreenController());

    super.onInit();
    isSmallAndroidDevice = 100.w <= 450;
  }

  refreshView() {
    update();
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
