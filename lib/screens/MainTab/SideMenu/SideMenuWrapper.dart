//-------------------------------------
// View
//-------------------------------------
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zion_app/constant/assets.dart';
import 'package:zion_app/navigation/routename.dart';
import 'package:zion_app/screens/MainTab/SideMenu/SideMenuController.dart';

import '../../../constant/color.dart';
import '../../../constant/font_family.dart';
import '../../BaseViewController/baseController.dart';

class SladderScreen extends BaseView<SladderScreenController> {
  const SladderScreen({super.key});

  @override
  Widget vBuilder(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: AppColors().newAppDarkBlueColor,
      width: 77.w,
      child: Column(
        // padding: EdgeInsets.zero,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 1.h, top: 7.h),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(AppImages.cross, height: 5.h, width: 5.h),
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _drawerItem(
                  "GET A QUOTE",
                  onTap: () {
                    Get.back();
                    Get.toNamed(
                      RouterName.getAQuoteScreen,
                      arguments: {"isWhichViewSelected": "1"},
                    );
                  },
                ),
                _drawerItem(
                  "CREATE A SHIPMENT",
                  onTap: () {
                    Get.back();
                    Get.toNamed(
                      RouterName.getAQuoteScreen,
                      arguments: {"isWhichViewSelected": "2"},
                    );
                  },
                ),
                _drawerItem(
                  "TRACK A PACKAGE",
                  onTap: () {
                    Get.back();
                    Get.toNamed(RouterName.trackPackageScreen);
                  },
                ),
                _drawerItem(
                  "SCHEDULE A PICKUP",
                  onTap: () {
                    Get.back();
                    Get.toNamed(
                      RouterName.getAQuoteScreen,
                      arguments: {"isWhichViewSelected": "3"},
                    );
                  },
                ),
                _drawerItem(
                  "ORDER SUPPLIES",
                  onTap: () {
                    Get.back();
                    Get.toNamed(RouterName.orderSuppliesCategoryScreen);
                  },
                ),
                _drawerItem(
                  "WHERE WE SHIP",
                  onTap: () {
                    Get.back();
                    Get.toNamed(RouterName.whereWeShipScreen);
                  },
                ),
                _drawerItem(
                  "OUR LOCATION",
                  onTap: () {
                    Get.back();
                    Get.toNamed(RouterName.ourLocationScreen);
                  },
                ),
                _drawerItem(
                  "BECOME AN AGENT",
                  onTap: () {
                    Get.back();
                    Get.toNamed(RouterName.becomeAnAgentScreen);
                  },
                ),
                _drawerItem(
                  "HELP & SUPPORT",
                  onTap: () {
                    Get.back();
                    Get.toNamed(RouterName.helpAndSupportScreen);
                  },
                ),
                _drawerItem(
                  "FAQ’S",
                  onTap: () {
                    Get.back();
                    Get.toNamed(RouterName.faqScreen);
                  },
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_drawerItem("MY ACCOUNT"), _drawerItem("SETTINGS")],
            ),
          ),
          SizedBox(height: 5.h),
        ],
      ),
    );
  }

  // ------------------------------------------------------------------
  // Shared text‑style builder so you only update typography in one spot
  // ------------------------------------------------------------------
  Widget _drawerItem(String title, {VoidCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h),
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Text(
          title,
          style: TextStyle(
            fontFamily: Appfonts.family1SemiBold,
            fontSize: 18.sp,
            color: AppColors().white100Color,
          ),
        ),
      ),
    );
  }
}
