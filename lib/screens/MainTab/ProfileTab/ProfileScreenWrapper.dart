import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zion_app/navigation/routename.dart';
import 'package:zion_app/screens/MainTab/DiscoverTab/DiscoverScreenController.dart';
import 'package:zion_app/screens/MainTab/HomeTab/HomeScreenController.dart';
import 'package:zion_app/screens/MainTab/OrderTab/OrderScreenController.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/ProfileScreenController.dart';
import '../../../../../customWidgets/CustomAntimatedProgressBar.dart';
import '../../../constant/assets.dart';
import '../../../constant/color.dart';
import '../../../constant/font_family.dart';
import '../../../customWidgets/appButton.dart';
import '../../../customWidgets/appNavigationBar.dart';
import '../../../customWidgets/appTextField.dart';
import '../../BaseViewController/baseController.dart';

class ProfileScreen extends BaseView<ProfileScreenController> {
  const ProfileScreen({super.key});

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
                    SizedBox(height: 1.h),
                    Container(
                      // height: 73.h,
                      margin: EdgeInsets.only(
                        left: 5.w,
                        right: 5.w,

                        // bottom: 7.w,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 5.w,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors().newAppLight80Color,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              AppImages.userImage,
                              height: 10.h,
                              width: 10.h,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Center(
                            child: Text(
                              "Emmanuel Oyiboke",
                              style: TextStyle(
                                fontFamily: Appfonts.family2Bold,
                                fontSize: 16.sp,
                                color: AppColors().gray100Color,
                              ),
                            ),
                          ),
                          SizedBox(height: 0.5.h),
                          Center(
                            child: Text(
                              "Account No. : 27215",
                              style: TextStyle(
                                fontFamily: Appfonts.family2Regular,
                                fontSize: 15.sp,
                                color: AppColors().gray100Color,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "Settings",
                            style: TextStyle(
                              fontFamily: Appfonts.family2Regular,
                              fontSize: 16.sp,
                              color: AppColors().newGreayColor,
                            ),
                          ),
                          SizedBox(height: 0.5.h),
                          commonView(
                            AppImages.profileIcon,
                            "Profile",
                            onTap: () {
                              Get.toNamed(RouterName.editProfileScreen);
                            },
                          ),
                          SizedBox(height: 2.h),
                          commonView(
                            AppImages.securityIcon,
                            "Security",
                            onTap: () {
                              Get.toNamed(RouterName.securityScreen);
                            },
                          ),
                          SizedBox(height: 2.h),
                          commonView(
                            AppImages.languageIcon,
                            "Language",
                            onTap: () {
                              Get.toNamed(RouterName.languageScreen);
                            },
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Data",
                            style: TextStyle(
                              fontFamily: Appfonts.family2Regular,
                              fontSize: 16.sp,
                              color: AppColors().newGreayColor,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          commonView(
                            AppImages.consigneesIcon,
                            "My Consignees",
                            onTap: () {
                              Get.toNamed(RouterName.myConsigneesScreen);
                            },
                          ),
                          SizedBox(height: 2.h),
                          commonView(AppImages.orderIcon, "Order History"),
                          SizedBox(height: 2.h),
                          commonView(
                            AppImages.shipmentIcon,
                            "Pre Shipments",
                            onTap: () {
                              Get.toNamed(RouterName.shipmentHistory);
                            },
                          ),
                          SizedBox(height: 2.h),
                          commonView(
                            AppImages.consolidationIcon,
                            "Consolidations",
                            onTap: () {
                              Get.toNamed(RouterName.consolidation);
                            },
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Billing",
                            style: TextStyle(
                              fontFamily: Appfonts.family2Regular,
                              fontSize: 16.sp,
                              color: AppColors().newGreayColor,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          commonView(
                            AppImages.plansIcon,
                            "Plans",
                            onTap: () {
                              Get.toNamed(RouterName.plansScreen);
                            },
                          ),
                          SizedBox(height: 2.h),
                          commonView(
                            AppImages.subscriptionIcon,
                            "Subscription",
                            onTap: () {
                              Get.toNamed(RouterName.subscriptionScreen);
                            },
                          ),
                          SizedBox(height: 2.h),
                          commonView(
                            AppImages.cardsIcon,
                            "Cards",
                            onTap: () {
                              Get.toNamed(RouterName.cardsScreen);
                            },
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Support",
                            style: TextStyle(
                              fontFamily: Appfonts.family2Regular,
                              fontSize: 16.sp,
                              color: AppColors().newGreayColor,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          commonView(AppImages.claimIcon, "My Claims"),
                          SizedBox(height: 2.h),
                          commonView(AppImages.ticketIcon, "My Ticket"),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.w),
                      height: 6.h,
                      child: CustomButton(
                        isEnabled: false,
                        title: "Sign Out".tr,
                        onPress: () {},
                        bgColor: AppColors().newAppDarkBlueColor,
                        isFilled: true,
                        textColor: AppColors().white100Color,
                        isTextCenter: true,
                        isLoading: controller.isLoadingSignIn.value,
                        shimmerColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ),
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
              // GestureDetector(
              //   onTap: () {
              //     Get.back();
              //   },
              //   child: Image.asset(
              //     AppImages.arrowBack,
              //     height: 4.h,
              //     width: 4.h,
              //   ),
              // ),
              SizedBox(width: 4.h),
              Spacer(),
              Text(
                "PROFILE",
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

  Widget commonView(String iconName, String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: 6.h,
        decoration: BoxDecoration(
          color: AppColors().white100Color,
          borderRadius: BorderRadius.circular(12.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 6), // ▼ pushes shadow 6 px downward
              blurRadius: 8, // softness
              spreadRadius: -2, // pulls it in a bit (keeps sides clean)
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 3.w),
            Image.asset(iconName, height: 3.h, width: 3.h),
            SizedBox(width: 5.w),
            Text(
              title,
              style: TextStyle(
                fontFamily: Appfonts.family2Regular,
                fontSize: 15.5.sp,
                color: AppColors().gray100Color,
              ),
            ),
            Spacer(),
            Image.asset(AppImages.arrowRight, height: 2.h, width: 2.h),
            SizedBox(width: 1.w),
          ],
        ),
      ),
    );
  }
}
