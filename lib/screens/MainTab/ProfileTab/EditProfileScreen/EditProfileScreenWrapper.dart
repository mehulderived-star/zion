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
import '../../../../constant/utilities.dart';
import '../../../../customWidgets/appButton.dart';
import '../../../../customWidgets/newAppTextField.dart';
import '../../../BaseViewController/baseController.dart';
import 'EditProfileScreenController.dart';

class EditProfileScreen extends BaseView<EditProfileScreenController> {
  const EditProfileScreen({super.key});

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
                    Center(
                      child: Image.asset(
                        AppImages.userImage,
                        height: 10.h,
                        width: 10.h,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Container(
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
                              "Profile",
                              style: TextStyle(
                                fontFamily: Appfonts.family1Bold,
                                fontSize: 18.sp,
                                color: AppColors().newAppDarkBlueColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          commonView(
                            "Full Name",
                            "Enter Full Name",
                            controller.fullNameController,
                            controller.fullNameFocus,
                          ),
                          commonView(
                            "Email Address",
                            "Enter Email",
                            controller.emailController,
                            controller.emailFocus,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 3.w),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Country',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: Appfonts.family2Regular,
                                        color:
                                            Colors
                                                .black, // or AppColors().newAppDark100Color
                                      ),
                                    ),
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: Appfonts.family2Regular,
                                        color:
                                            Colors
                                                .red, // or AppColors().newAppDarkRedColor
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 0.4.h),
                          countryListDropDown(),
                          SizedBox(height: 1.5.h),
                          commonView(
                            "Address",
                            "Enter a Location",
                            controller.addressController,
                            controller.addressFocus,
                          ),
                          commonView(
                            "Zip Code",
                            "Enter Zip code",
                            controller.zipController,
                            controller.zipFocus,
                          ),
                          commonView(
                            "City",
                            "Enter City",
                            controller.cityController,
                            controller.cityFocus,
                          ),
                          commonView(
                            "State",
                            "Enter State",
                            controller.stateController,
                            controller.stateFocus,
                          ),
                          commonView(
                            "Apt/Ste/Unit",
                            "Apt/Ste/Unit",
                            controller.aptController,
                            controller.aptFocus,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 3.w),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Phone',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: Appfonts.family2Regular,
                                        color:
                                            Colors
                                                .black, // or AppColors().newAppDark100Color
                                      ),
                                    ),
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: Appfonts.family2Regular,
                                        color:
                                            Colors
                                                .red, // or AppColors().newAppDarkRedColor
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 0.4.h),
                          controller.buildPhoneNumberField(),
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
                        title: "Save".tr,
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

  Widget commonView(
    String title,
    String placeHolderText,
    TextEditingController textController,
    FocusNode textFocus,
  ) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 3.w),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: Appfonts.family2Regular,
                      color: Colors.black, // or AppColors().newAppDark100Color
                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: Appfonts.family2Regular,
                      color: Colors.red, // or AppColors().newAppDarkRedColor
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 0.4.h),
        newCustomTextField(
          type: placeHolderText,
          keyBoardType: TextInputType.text,
          isEnabled: true,
          isOptional: false,
          inValidMsg: "",
          placeHolderMsg: placeHolderText.tr,
          labelMsg: placeHolderText,
          emptyFieldMsg: "",
          controller: textController,
          focus: textFocus,
          isSecure: false,
          keyboardButtonType: TextInputAction.next,
          maxLength: 64,
        ),
        SizedBox(height: 1.5.h),
      ],
    );
  }
}
