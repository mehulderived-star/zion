import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zion_app/navigation/routename.dart';
import 'package:zion_app/screens/MainTab/DiscoverTab/DiscoverScreenController.dart';
import 'package:zion_app/screens/MainTab/HomeTab/HomeScreenController.dart';
import 'package:zion_app/screens/MainTab/OrderTab/OrderScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/HelpAndSupportScreen/AddTicketScreen/AddTicketScreenController.dart';
import '../../../../../constant/assets.dart';
import '../../../../../constant/color.dart';
import '../../../../../constant/font_family.dart';
import '../../../../../customWidgets/CustomAntimatedProgressBar.dart';
import '../../../../../customWidgets/appButton.dart';
import '../../../../../customWidgets/newAppTextField.dart';
import '../../../../BaseViewController/baseController.dart';
import 'FileAClaimScreenController.dart';

class FileAClaimScreen extends BaseView<FileAClaimScreenController> {
  const FileAClaimScreen({super.key});

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
                physics: ClampingScrollPhysics(),
                child: Column(
                  children: [
                    mainView(),
                    SizedBox(height: 4.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.w),
                      height: 6.h,
                      child: CustomButton(
                        isEnabled: false,
                        title: "Submit".tr,
                        onPress: () {
                          Get.toNamed(RouterName.contactUsScreen);
                        },
                        bgColor: AppColors().newAppDarkBlueColor,
                        isFilled: true,
                        textColor: AppColors().white100Color,
                        isTextCenter: true,
                        isLoading: controller.isLoadingSignIn.value,
                        shimmerColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(height: 4.h),
                  ],
                ),
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
                "HELP & SUPPORT",
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

  Widget mainView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColors().newAppDarkRedColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(0, 6),
            blurRadius: 8,
            spreadRadius: -2,
          ),
        ],
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: EdgeInsets.symmetric(horizontal: 5.w),
        childrenPadding: EdgeInsets.zero,
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        showTrailingIcon: false,
        title: Row(
          children: [
            Text(
              "FILE CLAIM",
              style: TextStyle(
                fontFamily: Appfonts.family1Bold,
                color: AppColors().white100Color,
                fontSize: 19.sp,
              ),
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
                  children: [
                    SizedBox(width: 3.w),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Authorization Code',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: Appfonts.family2Regular,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: Appfonts.family2Regular,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.4.h),
                newCustomTextField(
                  type: 'Enter Code',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter Code".tr,
                  labelMsg: "Enter Code",
                  emptyFieldMsg: "",
                  controller: controller.codeController,
                  focus: controller.codeFocus,
                  isSecure: false,
                  keyboardButtonType: TextInputAction.next,
                  maxLength: 64,
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    SizedBox(width: 3.w),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Note:',
                            style: TextStyle(
                              fontSize: 12.5.sp,
                              fontFamily: Appfonts.family2Bold,
                              color: AppColors().newBlackLightColor,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' You need to contact the claim department at \nclaims@zionshipping.com to provide you your \nauthorization code.',
                            style: TextStyle(
                              fontSize: 12.5.sp,
                              fontFamily: Appfonts.family2Regular,
                              color: AppColors().newBlackLightColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
