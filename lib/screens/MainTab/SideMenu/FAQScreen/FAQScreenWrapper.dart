import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zion_app/navigation/routename.dart';
import 'package:zion_app/screens/MainTab/DiscoverTab/DiscoverScreenController.dart';
import 'package:zion_app/screens/MainTab/HomeTab/HomeScreenController.dart';
import 'package:zion_app/screens/MainTab/OrderTab/OrderScreenController.dart';
import '../../../../../customWidgets/CustomAntimatedProgressBar.dart';
import '../../../../constant/assets.dart';
import '../../../../constant/color.dart';
import '../../../../constant/font_family.dart';
import '../../../BaseViewController/baseController.dart';
import 'FAQScreenController.dart';

class FAQScreen extends BaseView<FAQScreenController> {
  const FAQScreen({super.key});

  @override
  Widget vBuilder(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors().white100Color,
        body: Column(
          children: [
            headerView(context),
            SizedBox(height: 2.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 100.w,
                      height: 6.h,
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: AppColors().newAppLight80Color,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        boxShadow:
                            controller.isViewExpanded
                                ? [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: Offset(0, 6), // Push shadow down
                                    blurRadius: 8, // Soft edge
                                    spreadRadius: -2, // Prevent side shadow
                                  ),
                                ]
                                : [],
                      ),
                      child: Center(
                        child: Text(
                          "FAQ's",
                          style: TextStyle(
                            fontFamily: Appfonts.family1Bold,
                            color: AppColors().newAppDarkBlueColor,
                            fontSize: 19.sp,
                          ),
                        ),
                      ),
                    ),
                    expandedView(),
                    SizedBox(height: 2.h),
                    expandedView(),
                    SizedBox(height: 2.h),
                    expandedView(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h),
            // Background image at the top
          ],
        ),
      ),
    );
  }

  Widget headerView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      color: AppColors().newAppDarkBlueColor,
      child: Column(
        children: [
          SizedBox(height: 7.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  AppImages.arrowBack,
                  height: 4.h,
                  width: 4.h,
                ),
              ),
              Spacer(),
              Text(
                "SERVICE NAVIGATOR",
                style: TextStyle(
                  fontFamily: Appfonts.family1Bold,
                  fontSize: 18.sp,
                  color: AppColors().white100Color,
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 5),
                height: 3.5.h,
                width: 3.5.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors().gray40Color,
                  borderRadius: BorderRadius.circular(50.h),
                ),
                child: Text(
                  "U",
                  style: TextStyle(
                    fontFamily: Appfonts.family1Bold,
                    fontSize: 19.sp,
                    color: Color(0xff444444),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
        ],
      ),
    );
  }

  Widget expandedView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColors().newAppDarkBlueColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow:
            controller.isViewExpanded
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 6), // Push shadow down
                    blurRadius: 8, // Soft edge
                    spreadRadius: -2, // Prevent side shadow
                  ),
                ]
                : [],
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: EdgeInsets.symmetric(horizontal: 5.w),
        childrenPadding: EdgeInsets.zero,
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        showTrailingIcon: false,
        onExpansionChanged: (value) {
          controller.isViewExpanded = value;
          controller.update();
        },
        title: Row(
          children: [
            Text(
              "How long Zion Shipping been in existence?",
              style: TextStyle(
                fontFamily: Appfonts.family1Bold,
                color: AppColors().white100Color,
                fontSize: 14.sp,
              ),
            ),
            Spacer(),
            Image.asset(
              controller.isViewExpanded
                  ? AppImages.whiteMinus
                  : AppImages.plusIcon,
              height: 3.5.h,
              width: 3.5.h,
            ),
          ],
        ),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: AppColors().newAppLight80Color,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80.w,
                      child: Text(
                        "We have fifteen (15) years of offering shipping services.",
                        style: TextStyle(
                          fontFamily: Appfonts.family2Regular,
                          color: AppColors().newBlackLightColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Center(
                  child: Image.asset(
                    AppImages.yrsImage,
                    height: 20.h,
                    width: 25.h,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
