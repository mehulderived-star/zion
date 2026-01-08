import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zion_app/navigation/routename.dart';
import '../../../../../customWidgets/CustomAntimatedProgressBar.dart';
import '../../../constant/assets.dart';
import '../../../constant/color.dart';
import '../../../constant/font_family.dart';
import '../../../customWidgets/appButton.dart';
import '../../../customWidgets/appNavigationBar.dart';
import '../../../customWidgets/appTextField.dart';
import '../../../customWidgets/customPhoneNumberTextfield.dart';
import '../../BaseViewController/baseController.dart';
import 'signInScreenController.dart';

class SignInScreen extends BaseView<SignInScreenController> {
  const SignInScreen({super.key});

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
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                AppImages.signInBack,
                height: 100.h,
                width: 100.w,
                fit: BoxFit.fill,
              ),
            ),
            Obx(() {
              return Positioned(
                top: 14.h,
                left: 0,
                right: 0,
                bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? 0 : 15.h,
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            AppImages.appIcon,
                            height: 10.h,
                            width: 30.w,
                          ),
                        ),
                        Text(
                          "Welcome!".tr,
                          style: TextStyle(
                            fontSize: 23.sp,
                            fontFamily: Appfonts.family2Medium,
                            color: AppColors().newAppDark100Color,
                          ),
                        ),

                        Text(
                          "Sign up or Login to your Account".tr,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: Appfonts.family2Regular,
                            color: AppColors().newAppDark80Color,
                          ),
                        ),

                        SizedBox(height: 2.h),

                        Container(
                          decoration: BoxDecoration(
                            color: AppColors().newAppDarkBlueColor.withOpacity(
                              0.2,
                            ),
                            borderRadius: BorderRadius.circular(4.h),
                          ),
                          height: 7.h,
                          width: 100.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  controller.categoryType = "login";
                                  controller.update();
                                },
                                child: Container(
                                  width: 40.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                    color:
                                        controller.categoryType == "login"
                                            ? AppColors().newAppDarkRedColor
                                            : Colors.transparent,
                                    borderRadius: BorderRadius.circular(2.5.h),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Login".tr,
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontFamily: Appfonts.family2Regular,
                                        color:
                                            controller.categoryType == "signup"
                                                ? AppColors().newAppDarkRedColor
                                                : AppColors().white100Color,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 2.w),

                              GestureDetector(
                                onTap: () async {
                                  controller.categoryType = "signup";
                                  controller.update();
                                },
                                child: Container(
                                  width: 40.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                    color:
                                        controller.categoryType == "signup"
                                            ? AppColors().newAppDarkRedColor
                                            : Colors.transparent,
                                    borderRadius: BorderRadius.circular(3.h),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Sign Up".tr,
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      fontFamily: Appfonts.family2Regular,
                                      color:
                                          controller.categoryType == "login"
                                              ? AppColors().newAppDarkRedColor
                                              : AppColors().white100Color,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        // This will take the remaining space and push everything up when keyboard appears
                        controller.categoryType == "login"
                            ? loginView()
                            : signUpView(),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget loginView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 3.w),
            Text(
              "Email Address".tr,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: Appfonts.family2Regular,
                color: AppColors().newAppDark100Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        CustomTextField(
          type: 'Enter your Email',
          keyBoardType: TextInputType.emailAddress,
          isEnabled: true,
          isOptional: false,
          inValidMsg: "",
          placeHolderMsg: "Enter your Email".tr,
          labelMsg: "Enter your Email",
          emptyFieldMsg: "",
          controller: controller.emailController,
          focus: controller.emailFocus,
          isSecure: false,
          keyboardButtonType: TextInputAction.next,
          maxLength: 64,
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            SizedBox(width: 3.w),
            Text(
              "Password".tr,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: Appfonts.family2Regular,
                color: AppColors().newAppDark100Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        CustomTextField(
          type: 'Enter your Password',
          keyBoardType: TextInputType.text,
          isEnabled: true,
          isOptional: false,
          inValidMsg: "",
          placeHolderMsg: "Enter your Password".tr,
          labelMsg: "Enter your Password",
          emptyFieldMsg: "",
          controller: controller.passwordController,
          focus: controller.passwordFocus,
          isSecure: false,
          keyboardButtonType: TextInputAction.done,
          maxLength: 64,
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            Spacer(),
            Text(
              "Forgot Password?".tr,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: Appfonts.family2Regular,
                color: AppColors().newAppDark80Color,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Center(
          child: Container(
            width: 40.w,
            height: 6.h,
            child: CustomButton(
              isEnabled: false,
              title: "Sign In".tr,
              onPress: () {
                // Get.toNamed(RouterName.mainTab);
                controller.callForSignIn();
              },
              bgColor: AppColors().newAppDarkBlueColor,
              isFilled: true,
              textColor: AppColors().white100Color,
              isTextCenter: true,
              isLoading: controller.isLoadingSignIn.value,
              shimmerColor: Colors.transparent,
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Center(
          child: GestureDetector(
            onTap: (){
              Get.toNamed(RouterName.mainTab);
            },
            child: Text(
              "Skip".tr,
              style: TextStyle(
                fontSize: 17.sp,
                fontFamily: Appfonts.family1SemiBold,
                color: AppColors().newAppDarkBlueColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget signUpView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 3.w),
            Text(
              "Full Name".tr,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: Appfonts.family2Regular,
                color: AppColors().newAppDark100Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        CustomTextField(
          type: 'Enter your Name',
          keyBoardType: TextInputType.text,
          isEnabled: true,
          isOptional: false,
          inValidMsg: "",
          placeHolderMsg: "Enter your Name".tr,
          labelMsg: "Enter your Name",
          emptyFieldMsg: "",
          controller: controller.nameSController,
          focus: controller.nameSFocus,
          isSecure: false,
          keyboardButtonType: TextInputAction.next,
          maxLength: 64,
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            SizedBox(width: 3.w),
            Text(
              "Phone Number".tr,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: Appfonts.family2Regular,
                color: AppColors().newAppDark100Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        PhoneNumberField(
          controller: controller.phoneSController,
          focusNode: controller.phoneSFocus,
          initialCountry: Country.parse('IN'), // Optional
          onChanged: (value) {
            print("Phone number changed: $value");
          },
          onCountryChanged: (country) {
            print("Selected country: ${country.name}");
          },
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            SizedBox(width: 3.w),
            Text(
              "Email Address".tr,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: Appfonts.family2Regular,
                color: AppColors().newAppDark100Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        CustomTextField(
          type: 'Enter your Email',
          keyBoardType: TextInputType.emailAddress,
          isEnabled: true,
          isOptional: false,
          inValidMsg: "",
          placeHolderMsg: "Enter your Email".tr,
          labelMsg: "Enter your Email",
          emptyFieldMsg: "",
          controller: controller.emailSController,
          focus: controller.emailSFocus,
          isSecure: false,
          keyboardButtonType: TextInputAction.next,
          maxLength: 64,
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            SizedBox(width: 3.w),
            Text(
              "Create Password".tr,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: Appfonts.family2Regular,
                color: AppColors().newAppDark100Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        CustomTextField(
          type: 'Enter your Password',
          keyBoardType: TextInputType.text,
          isEnabled: true,
          isOptional: false,
          inValidMsg: "",
          placeHolderMsg: "Enter your Password".tr,
          labelMsg: "Enter your Password",
          emptyFieldMsg: "",
          controller: controller.passwordSController,
          focus: controller.passwordSFocus,
          isSecure: false,
          keyboardButtonType: TextInputAction.done,
          maxLength: 64,
        ),
        SizedBox(height: 4.h),
        Center(
          child: SizedBox(
            width: 40.w,
            height: 6.h,
            child: CustomButton(
              isEnabled: false,
              title: "Register".tr,
              onPress: () {
                Get.toNamed(RouterName.verificationScreen);
              },
              bgColor: AppColors().newAppDarkBlueColor,
              isFilled: true,
              textColor: AppColors().white100Color,
              isTextCenter: true,
              isLoading: controller.isLoadingSignIn.value,
              shimmerColor: Colors.transparent,
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Center(
          child: Text(
            "Skip".tr,
            style: TextStyle(
              fontSize: 17.sp,
              fontFamily: Appfonts.family1SemiBold,
              color: AppColors().newAppDarkBlueColor,
            ),
          ),
        ),
      ],
    );
  }
}
