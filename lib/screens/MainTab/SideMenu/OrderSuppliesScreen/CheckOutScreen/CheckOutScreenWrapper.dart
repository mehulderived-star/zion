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
import 'CheckOutScreenController.dart';

class CheckOutScreen extends BaseView<CheckOutScreenController> {
  const CheckOutScreen({super.key});

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
                    shippingDetailView(),
                    SizedBox(height: 2.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.checkbox,
                            height: 3.h,
                            width: 3.h,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            "Same as shipping address.",
                            style: TextStyle(
                              fontFamily: Appfonts.family2Regular,
                              color: AppColors().newBlackLightColor,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    billingDetailView(),
                    SizedBox(height: 2.h),
                    billingDetail2View(),
                    SizedBox(height: 4.h),
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
                "CHECKOUT",
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

  Widget shippingDetailView() {
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
              "SHIPPING DETAILS",
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
                            text: 'Last Name',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: Appfonts.family2Regular,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '*',
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
                  type: 'Enter Last Name',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter Last Name".tr,
                  labelMsg: "Enter Last Name",
                  emptyFieldMsg: "",
                  controller: controller.lastNameController,
                  focus: controller.lastNameFocus,
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
                            text: 'Company Name (Optional)',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: Appfonts.family2Regular,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '*',
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
                  type: 'Enter Company Name',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter Company Name".tr,
                  labelMsg: "Enter Company Name",
                  emptyFieldMsg: "",
                  controller: controller.lastNameController,
                  focus: controller.lastNameFocus,
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
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '*',
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
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '*',
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
                  type: 'Enter your Email',
                  keyBoardType: TextInputType.text,
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget billingDetailView() {
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
              "BILLING DETAILS",
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
                            text: 'Last Name',
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
                  type: 'Enter Last Name',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter Last Name".tr,
                  labelMsg: "Enter Last Name",
                  emptyFieldMsg: "",
                  controller: controller.lastNameController,
                  focus: controller.lastNameFocus,
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
                            text: 'Company Name (Optional)',
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
                  type: 'Enter Company Name',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter Company Name".tr,
                  labelMsg: "Enter Company Name",
                  emptyFieldMsg: "",
                  controller: controller.lastNameController,
                  focus: controller.lastNameFocus,
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
                  type: 'Enter your Email',
                  keyBoardType: TextInputType.text,
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget billingDetail2View() {
    return Container(
      width: 100.w,
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

      child: Container(
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
            Text(
              "BILLING DETAILS",
              style: TextStyle(
                fontFamily: Appfonts.family1Bold,
                fontSize: 18.sp,
                color: AppColors().newAppDarkBlueColor,
              ),
            ),
            SizedBox(height: 2.h),
            Divider(height: 1, color: Color(0xff707B81)),
            SizedBox(height: 2.h),
            Row(
              children: [
                Text(
                  "Product",
                  style: TextStyle(
                    fontFamily: Appfonts.family2Bold,
                    fontSize: 16.sp,
                    color: AppColors().gray100Color,
                  ),
                ),
                Spacer(),
                Text(
                  "Total",
                  style: TextStyle(
                    fontFamily: Appfonts.family2Bold,
                    fontSize: 16.sp,
                    color: AppColors().gray100Color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Text(
                  "3 Inches tape x 4",
                  style: TextStyle(
                    fontFamily: Appfonts.family2Medium,
                    fontSize: 15.sp,
                    color: AppColors().gray100Color,
                  ),
                ),
                Spacer(),
                Text(
                  "\$12.00",
                  style: TextStyle(
                    fontFamily: Appfonts.family2Medium,
                    fontSize: 15.sp,
                    color: AppColors().gray100Color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Divider(height: 1, color: Color(0xff707B81)),
            SizedBox(height: 2.h),
            Row(
              children: [
                Text(
                  "Subtotal :",
                  style: TextStyle(
                    fontFamily: Appfonts.family2Medium,
                    fontSize: 15.sp,
                    color: AppColors().gray100Color,
                  ),
                ),
                Spacer(),
                Text(
                  "\$12.00",
                  style: TextStyle(
                    fontFamily: Appfonts.family2Medium,
                    fontSize: 15.sp,
                    color: AppColors().gray100Color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Divider(height: 1, color: Color(0xff707B81)),
            SizedBox(height: 2.h),
            Row(
              children: [
                Text(
                  "Shipping :",
                  style: TextStyle(
                    fontFamily: Appfonts.family2Medium,
                    fontSize: 15.sp,
                    color: AppColors().gray100Color,
                  ),
                ),
                Spacer(),
                Text(
                  "0",
                  style: TextStyle(
                    fontFamily: Appfonts.family2Medium,
                    fontSize: 15.sp,
                    color: AppColors().gray100Color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Divider(height: 1, color: Color(0xff707B81)),
            SizedBox(height: 2.h),
            Row(
              children: [
                Text(
                  "Total :",
                  style: TextStyle(
                    fontFamily: Appfonts.family2Medium,
                    fontSize: 15.sp,
                    color: AppColors().gray100Color,
                  ),
                ),
                Spacer(),
                Text(
                  "\$12.00",
                  style: TextStyle(
                    fontFamily: Appfonts.family2Medium,
                    fontSize: 15.sp,
                    color: AppColors().newAppDarkBlueColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: CustomButton(
                isEnabled: true,
                title: "CALCULATE SHIPPING".tr,
                onPress: () {},
                bgColor: AppColors().newAppDarkBlueColor,
                isFilled: true,
                textColor: AppColors().white100Color,
                isTextCenter: true,
                isLoading: false,
                shimmerColor: AppColors().white100Color,
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: CustomButton(
                isEnabled: true,
                title: "PLACE ORDER".tr,
                onPress: () {
                  controller.refineQuotePopup();
                },
                bgColor: AppColors().white100Color,
                borderColor: AppColors().newAppDarkBlueColor,
                isFilled: true,
                textColor: AppColors().newAppDarkBlueColor,
                isTextCenter: true,
                isLoading: false,
                shimmerColor: AppColors().newAppLight60Color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
