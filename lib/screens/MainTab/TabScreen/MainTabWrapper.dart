import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant/assets.dart';
import '../../../constant/color.dart';
import '../../../constant/font_family.dart';
import '../../BaseViewController/baseController.dart';
import '../SideMenu/SideMenuController.dart';
import '../SideMenu/SideMenuWrapper.dart';
import 'MainTabController.dart';

class MainTab extends BaseView<MainTabController> {
  const MainTab({Key? key}) : super(key: key);

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: IndexedStack(
        index: controller.selectedIndex,
        children: controller.widgetOptions,
      ),
      drawer: Builder(
        builder: (context) {
          // Bind controller manually before building the view
          if (!Get.isRegistered<SladderScreenController>()) {
            Get.put(SladderScreenController());
          }
          return SladderScreen();
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min, // Ensures it doesn’t take extra space
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 2.h, top: 2.h),
            color: AppColors().newAppLight80Color, // Remove background color
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem("Home", 0, AppImages.tab1),
                _buildNavItem("Where-to-ship", 1, AppImages.tab2),
                _buildNavItem("Shipping", 2, AppImages.tab3),
                _buildNavItem("Profile", 3, AppImages.tab4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, int index, String unselectedImage) {
    bool isSelected = controller.selectedIndex == index;

    return GestureDetector(
      onTap: () => controller.onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(unselectedImage, width: 24, height: 24),
          SizedBox(height: 4),
          Text(
            label.tr,
            style: TextStyle(
              fontSize: isSelected ? 14 : 12,
              fontFamily: Appfonts.family1Bold,
              color: AppColors().newAppDark100Color,
            ),
          ),
          SizedBox(height: 4),

          isSelected
              ? Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors().newAppDark100Color,
                  shape: BoxShape.circle,
                ),
              )
              : SizedBox(height: 6), // Keep spacing consistent
        ],
      ),
    );
  }
}
