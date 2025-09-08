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
import '../../../../../constant/utilities.dart';
import '../../../../../customWidgets/CustomAntimatedProgressBar.dart';
import '../../../../../customWidgets/appButton.dart';
import '../../../../../customWidgets/newAppTextField.dart';
import '../../../../BaseViewController/baseController.dart';
import 'ContactUsScreenController.dart';

class ContactUsScreen extends BaseView<ContactUsScreenController> {
  const ContactUsScreen({super.key});

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
                    mainView(),
                    SizedBox(height: 4.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.w),
                      height: 6.h,
                      child: CustomButton(
                        isEnabled: false,
                        title: "Submit".tr,
                        onPress: () {},
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
                "BECOME AN AGENT",
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
            offset: Offset(0, 6), // Push shadow down
            blurRadius: 8, // Soft edge
            spreadRadius: -2, // Prevent side shadow
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
              "CONTACT US",
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
                            text: 'Full Name',
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
                newCustomTextField(
                  type: 'Enter Full Name',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter Full Name".tr,
                  labelMsg: "Enter Full Name",
                  emptyFieldMsg: "",
                  controller: controller.fullNameController,
                  focus: controller.fullNameFocus,
                  isSecure: false,
                  keyboardButtonType: TextInputAction.next,
                  maxLength: 64,
                ),
                SizedBox(height: 1.5.h),
                Row(
                  children: [
                    SizedBox(width: 3.w),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Email',
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
                newCustomTextField(
                  type: 'Enter Your Email',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter Your Email".tr,
                  labelMsg: "Enter Your Email",
                  emptyFieldMsg: "",
                  controller: controller.businessController,
                  focus: controller.businessFocus,
                  isSecure: false,
                  keyboardButtonType: TextInputAction.next,
                  maxLength: 64,
                ),
                SizedBox(height: 1.5.h),
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
                Row(
                  children: [
                    SizedBox(width: 3.w),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Address',
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
                newCustomTextField(
                  type: 'Enter a Location',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter a Location".tr,
                  labelMsg: "Enter a Location",
                  emptyFieldMsg: "",
                  controller: controller.addressController,
                  focus: controller.addressFocus,
                  isSecure: false,
                  keyboardButtonType: TextInputAction.next,
                  maxLength: 64,
                ),
                SizedBox(height: 1.5.h),
                Row(
                  children: [
                    SizedBox(width: 3.w),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Apt/Ste/Unit',
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
                newCustomTextField(
                  type: 'Apt/Ste/Unit*',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Apt/Ste/Unit".tr,
                  labelMsg: "Apt/Ste/Unit",
                  emptyFieldMsg: "",
                  controller: controller.aptController,
                  focus: controller.aptFocus,
                  isSecure: false,
                  keyboardButtonType: TextInputAction.next,
                  maxLength: 64,
                ),
                SizedBox(height: 1.5.h),
                Row(
                  children: [
                    SizedBox(width: 3.w),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Zip Code',
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
                newCustomTextField(
                  type: 'Enter Zip code',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter Zip code".tr,
                  labelMsg: "Enter Zip code",
                  emptyFieldMsg: "",
                  controller: controller.zipController,
                  focus: controller.zipFocus,
                  isSecure: false,
                  keyboardButtonType: TextInputAction.next,
                  maxLength: 64,
                ),
                SizedBox(height: 1.5.h),
                Row(
                  children: [
                    SizedBox(width: 3.w),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'CIty',
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
                newCustomTextField(
                  type: 'Enter City',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter City".tr,
                  labelMsg: "Enter City",
                  emptyFieldMsg: "",
                  controller: controller.cityController,
                  focus: controller.cityFocus,
                  isSecure: false,
                  keyboardButtonType: TextInputAction.next,
                  maxLength: 64,
                ),
                SizedBox(height: 1.5.h),
                Row(
                  children: [
                    SizedBox(width: 3.w),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'State',
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
                newCustomTextField(
                  type: 'Enter State',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter State".tr,
                  labelMsg: "Enter State",
                  emptyFieldMsg: "",
                  controller: controller.stateController,
                  focus: controller.stateFocus,
                  isSecure: false,
                  keyboardButtonType: TextInputAction.next,
                  maxLength: 64,
                ),
                SizedBox(height: 1.5.h),
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
                SizedBox(height: 1.5.h),
                Row(
                  children: [
                    SizedBox(width: 3.w),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Message',
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
                newCustomTextField(
                  type: 'Enter Message',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter Message".tr,
                  labelMsg: "Enter Message",
                  emptyFieldMsg: "",
                  controller: controller.messageController,
                  focus: controller.messageFocus,
                  isSecure: false,
                  keyboardButtonType: TextInputAction.next,
                  maxLength: 64,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
