import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../customWidgets/CustomAntimatedProgressBar.dart';
import '../../../constant/assets.dart';
import '../../../constant/color.dart';
import '../../../constant/font_family.dart';
import '../../../customWidgets/appButton.dart';
import '../../../customWidgets/appNavigationBar.dart';
import '../../../customWidgets/appTextField.dart';
import '../../BaseViewController/baseController.dart';
import 'verificationScreenController.dart';

class VerificationScreen extends BaseView<VerificationScreenController> {
  const VerificationScreen({super.key});

  @override
  Widget vBuilder(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors().white100Color,
        body: Stack(
          children: [
            Image.asset(
              AppImages.signInBack,
              height: 100.h,
              width: 100.w,
              fit: BoxFit.cover,
            ),
            Container(
              height: 85.h,
              padding: EdgeInsets.only(top: 14.h),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        AppImages.appIcon,
                        height: 10.h,
                        width: 30.w,
                      ),
                    ),
                    Text(
                      "Verify Phone Number".tr,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontFamily: Appfonts.family2Medium,
                        color: AppColors().newAppDark100Color,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "We have sent you a 6 digit code. Please enter here to Verify your Number."
                          .tr,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: Appfonts.family2Regular,
                        color: AppColors().newAppDark80Color,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors().newAppLight80Color,
                            borderRadius: BorderRadius.circular(
                              4.h,
                            ), // Adjust radius as needed
                          ),
                          height: 4.5.h,
                          width: 40.w,
                          child: Center(
                            child: Text(
                              "+1 169 916 9564".tr,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: Appfonts.family2Regular,
                                color: AppColors().newAppDark90Color,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Image.asset(
                          AppImages.editIcon,
                          height: 5.h,
                          width: 10.w,
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Pinput(
                      length: 6,
                      defaultPinTheme: controller.defaultPinTheme,
                      focusedPinTheme: controller.focusedPinTheme,
                      obscureText: false,
                      submittedPinTheme: controller.submittedPinTheme,
                      pinputAutovalidateMode: PinputAutovalidateMode.disabled,
                      showCursor: true,
                      onCompleted: (value) {},
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn’t Receive Code? ".tr,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: Appfonts.family2Regular,
                            color: AppColors().newAppDark80Color,
                          ),
                        ),
                        Text(
                          "Get a New one".tr,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: Appfonts.family2Regular,
                            color: AppColors().newAppPinkColor,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors().newAppPinkColor,
                            decorationThickness:
                                1.5, // Optional: makes the underline slightly thicker
                            height:
                                2, // 👈 Adds vertical space between text and underline
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Center(
                      child: Container(
                        width: 55.w,
                        height: 6.h,
                        child: CustomButton(
                          isEnabled: false,
                          title: "Verify & Continue".tr,
                          onPress: () {},
                          bgColor: AppColors().newAppDarkBlueColor,
                          isFilled: true,
                          textColor: AppColors().white100Color,
                          isTextCenter: true,
                          isLoading: controller.isLoadingSignIn.value,
                          shimmerColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
