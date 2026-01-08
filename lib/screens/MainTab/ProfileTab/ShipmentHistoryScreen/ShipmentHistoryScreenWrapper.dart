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
import 'ShipmentHistoryScreenController.dart';

class ShipmentHistoryScreen extends BaseView<ShipmentHistoryScreenController> {
  const ShipmentHistoryScreen({super.key});

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
                              "Shipment History",
                              style: TextStyle(
                                fontFamily: Appfonts.family1Bold,
                                fontSize: 18.sp,
                                color: AppColors().newAppDarkBlueColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.filterIcon,
                                height: 5.h,
                                width: 7.w,
                              ),
                              Spacer(),
                              Image.asset(
                                AppImages.searchIcon,
                                height: 5.h,
                                width: 7.w,
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return listView();
                              },
                            ),
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: 2.h),
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: 25.w),
                  //   height: 6.h,
                  //   child: CustomButton(
                  //     isEnabled: false,
                  //     title: "Update".tr,
                  //     onPress: () {},
                  //     bgColor: AppColors().newAppDarkBlueColor,
                  //     isFilled: true,
                  //     textColor: AppColors().white100Color,
                  //     isTextCenter: true,
                  //     isLoading: controller.isLoadingSignIn.value,
                  //     shimmerColor: Colors.transparent,
                  //   ),
                  // ),
                  SizedBox(height: 3.5.h),
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

  Widget listView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      margin: EdgeInsets.only(bottom: 2.h),
      decoration: BoxDecoration(
        color: AppColors().white100Color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 6), // ▼ pushes shadow 6 px downward
            blurRadius: 8, // softness
            spreadRadius: -2, // pulls it in a bit (keeps sides clean)
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 1.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ready to Ship",
                    style: TextStyle(
                      fontFamily: Appfonts.family1Regular,
                      fontSize: 13.sp,
                      color: AppColors().newApp77Color,
                    ),
                  ),
                  Text(
                    "HTB408105",
                    style: TextStyle(
                      fontFamily: Appfonts.family1SemiBold,
                      fontSize: 14.sp,
                      color: AppColors().newAppDarkBlueColor,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 1.5.w),
              Container(
                height: 50,
                color: AppColors().newAppGreyBorderColor,
                width: 1,
              ),
              SizedBox(width: 1.5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shipment Date",
                    style: TextStyle(
                      fontFamily: Appfonts.family1Regular,
                      fontSize: 13.sp,
                      color: AppColors().newApp77Color,
                    ),
                  ),
                  Text(
                    "Mar 13, 2025",
                    style: TextStyle(
                      fontFamily: Appfonts.family1SemiBold,
                      fontSize: 12.5.sp,
                      color: AppColors().appNewBlack44,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: AppColors().white100Color,
                  borderRadius: BorderRadius.circular(6.w),
                  border: Border.all(color: AppColors().newAppGreenColor),
                ),
                // padding: EdgeInsets.symmetric(horizontal: 4.7.w, vertical: 2.w),
                height: 3.5.h,
                width: 17.w,
                child: Center(
                  child: Text(
                    "Quick View",
                    style: TextStyle(
                      fontFamily: Appfonts.family1Medium,
                      fontSize: 13.sp,
                      color: AppColors().newAppGreenColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1.w),
              Container(
                decoration: BoxDecoration(
                  color: AppColors().white100Color,
                  borderRadius: BorderRadius.circular(6.w),
                  border: Border.all(color: AppColors().newAppOrangeColor),
                ),
                // padding: EdgeInsets.symmetric(horizontal: 4.7.w, vertical: 2.w),
                height: 3.5.h,
                width: 14.w,
                child: Center(
                  child: Text(
                    "More",
                    style: TextStyle(
                      fontFamily: Appfonts.family1Medium,
                      fontSize: 13.sp,
                      color: AppColors().newAppOrangeColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1.w),
            ],
          ),
          // SizedBox(height: 1.h),
          Container(
            height: 1,
            color: AppColors().newAppGreyBorderColor,
            width: 100.w,
          ),
          SizedBox(height: 0.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 2.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Delivery Option",
                    style: TextStyle(
                      fontFamily: Appfonts.family1Regular,
                      fontSize: 13.sp,
                      color: AppColors().newApp77Color,
                    ),
                  ),
                  Text(
                    "Zion - Regular",
                    style: TextStyle(
                      fontFamily: Appfonts.family1SemiBold,
                      fontSize: 13.sp,
                      color: AppColors().appNewBlack44,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 3.w),
              Container(
                height: 9.h,
                color: AppColors().newAppGreyBorderColor,
                width: 1,
              ),
              SizedBox(width: 2.5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Created by",
                    style: TextStyle(
                      fontFamily: Appfonts.family1Regular,
                      fontSize: 13.sp,
                      color: AppColors().newApp77Color,
                    ),
                  ),
                  Text(
                    "Therlande Louis Jean",
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: Appfonts.family1SemiBold,
                      fontSize: 13.sp,
                      color: AppColors().appNewBlack44,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 3.w),
              Container(
                height: 9.h,
                color: AppColors().newAppGreyBorderColor,
                width: 1,
              ),
              SizedBox(width: 2.5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(
                      fontFamily: Appfonts.family1Regular,
                      fontSize: 13.sp,
                      color: AppColors().newApp77Color,
                    ),
                  ),
                  Container(
                    width: 18.5.w,
                    child: Text(
                      "Boat HUB20 14x14x14 HUB20 14x14x14",
                      style: TextStyle(
                        fontFamily: Appfonts.family1SemiBold,
                        fontSize: 13.sp,
                        color: AppColors().appNewBlack44,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 0.5.h),
          Container(
            height: 1,
            color: AppColors().newAppGreyBorderColor,
            width: 100.w,
          ),
          SizedBox(height: 0.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 2.w),
              Container(
                width: 30.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Ship From",
                      style: TextStyle(
                        fontFamily: Appfonts.family1Regular,
                        fontSize: 13.5.sp,
                        color: AppColors().newApp77Color,
                      ),
                    ),
                    Text(
                      "ALAIN LOUISSAIN",
                      style: TextStyle(
                        fontFamily: Appfonts.family1SemiBold,
                        fontSize: 14.sp,
                        color: AppColors().appNewBlack44,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      "1117 NE 163rd St., North Miami Beach, FL 33162",
                      style: TextStyle(
                        fontFamily: Appfonts.family1SemiBold,
                        fontSize: 14.sp,
                        color: AppColors().appNewBlack44,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 3.w),
              Container(
                height: 11.h,
                color: AppColors().newAppGreyBorderColor,
                width: 1,
              ),
              SizedBox(width: 2.5.w),
              Container(
                width: 35.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Ship to",
                      style: TextStyle(
                        fontFamily: Appfonts.family1Regular,
                        fontSize: 13.5.sp,
                        color: AppColors().newApp77Color,
                      ),
                    ),
                    Text(
                      "Anne Marie Anto",
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: Appfonts.family1SemiBold,
                        fontSize: 14.sp,
                        color: AppColors().appNewBlack44,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      "Delmas 47 # 4, Port au prince, Quest 33162",
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: Appfonts.family1SemiBold,
                        fontSize: 14.sp,
                        color: AppColors().appNewBlack44,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
