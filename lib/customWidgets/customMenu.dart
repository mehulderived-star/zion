import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/assets.dart';
import '../constant/color.dart';
import '../constant/font_family.dart';

Widget menuItemDropdown(
  Function onTodayPress,
  Function onThisWeekPress,
  Function onThisMonthPress,
  Function onThisYearPress,
  Function onCustomPress,
  Rx<MenuItem> selectedMenu,
) {
  return Obx(() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Image.asset(AppImages.arrowBack, height: 28, width: 28),
        items: [
          ...MenuItems.allItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item, item == selectedMenu.value),
            ),
          ),
        ],
        onChanged: (value) {
          if (value is MenuItem) {
            selectedMenu.value = value;
            // Fixed comparison - use case-insensitive comparison
            switch (value.text.toLowerCase()) {
              case 'today':
                onTodayPress();
                break;
              case 'this week':
                onThisWeekPress();
                break;
              case 'this month':
                onThisMonthPress();
                break;
              case 'this year':
                onThisYearPress();
                break;
              case 'custom range':
                onCustomPress();
                break;
            }
          }
        },
        dropdownStyleData: DropdownStyleData(
          width: 57.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors().white100Color,
          ),
          offset: Offset(-50.w, -0.5.h),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: List<double>.filled(MenuItems.allItems.length, 48),
          padding: const EdgeInsets.only(left: 0, right: 0),
        ),
      ),
    );
  });
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
    required this.isBlock,
  });

  final String text;
  final String icon;
  final String isBlock;
}

abstract class MenuItems {
  static MenuItem today = MenuItem(
    text: 'Today'.tr,
    icon: AppImages.arrowBack,
    isBlock: "1",
  );
  static MenuItem thisWeek = MenuItem(
    text: 'This Week'.tr,
    icon: AppImages.arrowBack,
    isBlock: "2",
  );
  static MenuItem thisMonth = MenuItem(
    text: 'This Month'.tr,
    icon: AppImages.arrowBack,
    isBlock: "3",
  );
  static MenuItem thisYear = MenuItem(
    text: 'This Year'.tr,
    icon: AppImages.arrowBack,
    isBlock: "4",
  );
  static MenuItem custom = MenuItem(
    text: 'Custom Range'.tr,
    icon: AppImages.arrowBack,
    isBlock: "5",
  );

  static final List<MenuItem> allItems = [
    today,
    thisWeek,
    thisMonth,
    thisYear,
    custom,
  ];

  static Widget buildItem(MenuItem item, bool isSelected) {
    return SizedBox(
      height: 8.h,
      child: Row(
        children: [
          const SizedBox(width: 16),
          Image.asset(
            isSelected ? AppImages.arrowBack : AppImages.arrowBack,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 10),
          Text(
            item.text,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: Appfonts.family3Regular,
              color: AppColors().textColor,
            ),
          ),
        ],
      ),
    );
  }
}
