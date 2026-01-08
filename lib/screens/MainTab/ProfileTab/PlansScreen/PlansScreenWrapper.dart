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
import '../../../../customWidgets/appButton.dart';
import '../../../../customWidgets/newAppTextField.dart';
import '../../../BaseViewController/baseController.dart';
import 'PlansScreenController.dart';

class PlansScreen extends BaseView<PlansScreenController> {
  const PlansScreen({super.key});

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
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 5.w,
                        right: 5.w,
                        // bottom: 7.w,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 2.w,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors().newAppLight80Color,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(
                              0,
                              6,
                            ), // ▼ pushes shadow 6 px downward
                            blurRadius: 8, // softness
                            spreadRadius:
                                -2, // pulls it in a bit (keeps sides clean)
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Plans",
                              style: TextStyle(
                                fontFamily: Appfonts.family1Bold,
                                fontSize: 18.sp,
                                color: AppColors().newAppDarkBlueColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: 15,
                              itemBuilder: (context, index) {
                                return subscriptionPlan();
                              },
                            ),
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 2.h),
                ],
              ),
            ),
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
                "SETTINGS",
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

  Widget subscriptionPlan() {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      child: Column(
        children: [
          Container(
            width: 75.w,
            decoration: BoxDecoration(
              color: AppColors().newAppDarkRedColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(1.5.h),
                topRight: Radius.circular(1.5.h),
              ),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.all(1.h),
            child: Text(
              "Free",
              style: TextStyle(
                height: 1,
                fontFamily: Appfonts.family2SemiBold,
                fontSize: 18.sp,
                color: AppColors().white100Color,
              ),
            ),
          ),
          Container(
            width: 75.w,
            // padding: EdgeInsets.all(11),
            color: AppColors().white100Color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 1.h),
                Text(
                  "\$00.00",
                  style: TextStyle(
                    height: 1,
                    fontFamily: Appfonts.family2Bold,
                    fontSize: 28.sp,
                    color: AppColors().newAppDarkBlueColor,
                  ),
                ),
                Text(
                  "Per month",
                  style: TextStyle(
                    height: 1,
                    fontFamily: Appfonts.family3SemiBold,
                    fontSize: 17.sp,
                    color: AppColors().newBlackLightColor,
                  ),
                ),
                SizedBox(height: 1.5.h),
                Text(
                  "When you subscribe in the yearly plan\nOr pay \$10 / Month for monthly plan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: Appfonts.family2Medium,
                    fontSize: 13.sp,
                    color: AppColors().newGrey55Color,
                  ),
                ),
                SizedBox(height: 1.h),
                Container(
                  height: 1,
                  color: AppColors().gray40Color,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppImages.greenCheckIcon,
                              height: 2.h,
                              width: 1.5.h,
                            ),
                            Text(
                              " FREE PO Box",
                              style: TextStyle(
                                fontFamily: Appfonts.family2Medium,
                                fontSize: 13.sp,
                                color: AppColors().newBlackLightColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              AppImages.greenCheckIcon,
                              height: 2.h,
                              width: 1.5.h,
                            ),
                            Text(
                              " Specials Alert",
                              style: TextStyle(
                                fontFamily: Appfonts.family2Medium,
                                fontSize: 13.sp,
                                color: AppColors().newBlackLightColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 4.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppImages.greenCheckIcon,
                              height: 2.h,
                              width: 1.5.h,
                            ),
                            Text(
                              " 5% on referral",
                              style: TextStyle(
                                fontFamily: Appfonts.family2Medium,
                                fontSize: 13.sp,
                                color: AppColors().newBlackLightColor,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(width: 10.w),
                        Row(
                          children: [
                            Image.asset(
                              AppImages.greenCheckIcon,
                              height: 2.h,
                              width: 1.5.h,
                            ),
                            Text(
                              "Order Supplies",
                              style: TextStyle(
                                fontFamily: Appfonts.family2Medium,
                                fontSize: 13.sp,
                                color: AppColors().newBlackLightColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h),
          Container(
            width: 75.w,
            color: AppColors().newAppDarkBlueColor,
            alignment: Alignment.center,
            padding: EdgeInsets.all(1.h),
            child: Text(
              "View More",
              style: TextStyle(
                fontFamily: Appfonts.family2Medium,
                fontSize: 15.sp,
                color: AppColors().white100Color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
