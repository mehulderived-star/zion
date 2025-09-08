import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zion_app/navigation/routename.dart';
import 'package:zion_app/screens/MainTab/DiscoverTab/DiscoverScreenController.dart';
import 'package:zion_app/screens/MainTab/HomeTab/HomeScreenController.dart';
import 'package:zion_app/screens/MainTab/OrderTab/OrderScreenController.dart';
import '../../../../../constant/assets.dart';
import '../../../../../constant/color.dart';
import '../../../../../constant/font_family.dart';
import '../../../../../customWidgets/CustomAntimatedProgressBar.dart';
import '../../../../BaseViewController/baseController.dart';
import 'ShipmentSuccessfullController.dart';

class ShipmentSuccessfullScreen
    extends BaseView<ShipmentSuccessfullScreenController> {
  const ShipmentSuccessfullScreen({super.key});

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
            // Background image at the top
            Spacer(),
            Column(
              children: [
                Center(
                  child: Image.asset(
                    AppImages.successImage,
                    height: 25.h,
                    width: 30.h,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Shipment succesfully created.",
                  style: TextStyle(
                    fontFamily: Appfonts.family2Medium,
                    fontSize: 18.sp,
                    color: AppColors().newAppDarkBlueColor,
                  ),
                ),
                SizedBox(height: 2.h),
                Container(
                  width: 85.w,
                  child: Text(
                    "Now sit back and relax, our team member will pickup your package.\nThank you!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: Appfonts.family2Medium,
                      fontSize: 16.sp,
                      color: AppColors().textLightGrayColor,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
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
                "SHIPPING",
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
}
