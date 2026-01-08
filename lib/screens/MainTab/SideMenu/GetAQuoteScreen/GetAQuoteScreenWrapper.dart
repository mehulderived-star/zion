import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zion_app/customWidgets/newAppTextField.dart';
import 'package:zion_app/navigation/routename.dart';
import 'package:zion_app/screens/MainTab/DiscoverTab/DiscoverScreenController.dart';
import 'package:zion_app/screens/MainTab/HomeTab/HomeScreenController.dart';
import 'package:zion_app/screens/MainTab/OrderTab/OrderScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/GetAQuoteScreen/GetAQuoteScreenController.dart';
import '../../../../../customWidgets/CustomAntimatedProgressBar.dart';
import '../../../../constant/assets.dart';
import '../../../../constant/color.dart';
import '../../../../constant/font_family.dart';
import '../../../../constant/utilities.dart';
import '../../../../customWidgets/appButton.dart';
import '../../../../customWidgets/appTextField.dart';
import '../../../BaseViewController/baseController.dart';

class GetAQuoteScreen extends BaseView<GetAQuoteScreenController> {
  const GetAQuoteScreen({super.key});

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
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                headerView(context),
                SizedBox(height: 2.h),
                pageView(),
                SizedBox(height: 2.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (controller.isWhichViewSelected == "3")
                          pickUpAddressView(),
                        if (controller.isWhichViewSelected == "3")
                          SizedBox(height: 2.h),
                        if (controller.isWhichViewSelected == "1" ||
                            controller.isWhichViewSelected == "2")
                          fromView(),
                        if (controller.isWhichViewSelected == "1" ||
                            controller.isWhichViewSelected == "2")
                          SizedBox(height: 2.h),
                        if (controller.isWhichViewSelected == "1" ||
                            controller.isWhichViewSelected == "2")
                          toView(),
                        if (controller.isWhichViewSelected == "1" ||
                            controller.isWhichViewSelected == "2")
                          SizedBox(height: 2.h),
                        if (controller.isWhichViewSelected == "1" ||
                            controller.isWhichViewSelected == "3")
                          packageInformationView(),
                        if (controller.isWhichViewSelected == "1" ||
                            controller.isWhichViewSelected == "3")
                          SizedBox(height: 2.h),
                        if (controller.isWhichViewSelected == "2")
                          packageInformationView2(),
                        if (controller.isWhichViewSelected == "2")
                          SizedBox(height: 2.h),
                        if (controller.isWhichViewSelected == "1" ||
                            controller.isWhichViewSelected == "2")
                          devliveryOptionView(),
                        if (controller.isWhichViewSelected == "1" ||
                            controller.isWhichViewSelected == "2")
                          SizedBox(height: 2.h),
                        if (controller.isWhichViewSelected == "3")
                          pickupShipmentView(constraints),
                        SizedBox(height: 2.h),
                        if (controller.isWhichViewSelected == "3")
                          paymentOptionView(),
                        SizedBox(height: 4.h),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25.w),
                          height: 6.h,
                          child: CustomButton(
                            isEnabled: false,
                            title:
                                controller.isWhichViewSelected == "3"
                                    ? "Schedule Pickup"
                                    : "Get A Quote".tr,
                            onPress: () {
                              Get.toNamed(RouterName.shipmentSuccessfullScreen);
                            },
                            bgColor: AppColors().newAppDarkBlueColor,
                            isFilled: true,
                            textColor: AppColors().white100Color,
                            isTextCenter: true,
                            isLoading: controller.isLoadingSignIn.value,
                            shimmerColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
              ],
            );
          },
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

  Widget pageView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              controller.isWhichViewSelected = "1";
              controller.update();
            },
            child: Column(
              children: [
                Image.asset(
                  controller.isWhichViewSelected == "1"
                      ? AppImages.getQuoteSelectedIcon
                      : AppImages.getQuoteIcon,
                  height: 11.h,
                  width: 11.h,
                ),
                Text(
                  "GET \nA QUOTE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.1,
                    fontFamily:
                        controller.isWhichViewSelected == "1"
                            ? Appfonts.family2SemiBold
                            : Appfonts.family2Medium,
                    fontSize: 16.sp,
                    color:
                        controller.isWhichViewSelected == "1"
                            ? AppColors().newAppDarkBlueColor
                            : AppColors().newBlackLightColor,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              controller.isWhichViewSelected = "2";
              controller.update();
            },
            child: Column(
              children: [
                Image.asset(
                  controller.isWhichViewSelected == "2"
                      ? AppImages.createShipmentSelectedIcon
                      : AppImages.createShipmentIcon,
                  height: 11.h,
                  width: 11.h,
                ),
                Text(
                  "CREATE \nA SHIPMENT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.1,
                    fontFamily:
                        controller.isWhichViewSelected == "2"
                            ? Appfonts.family2SemiBold
                            : Appfonts.family2Medium,
                    fontSize: 16.sp,
                    color:
                        controller.isWhichViewSelected == "2"
                            ? AppColors().newAppDarkBlueColor
                            : AppColors().newBlackLightColor,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              controller.isWhichViewSelected = "3";
              controller.update();
            },
            child: Column(
              children: [
                Image.asset(
                  controller.isWhichViewSelected == "3"
                      ? AppImages.schedulePickupSelectedIcon
                      : AppImages.schedulePickupIcon,
                  height: 11.h,
                  width: 11.h,
                ),
                Text(
                  "SCHEDULE \nA PICKUP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.1,
                    fontFamily:
                        controller.isWhichViewSelected == "3"
                            ? Appfonts.family2SemiBold
                            : Appfonts.family2Medium,
                    fontSize: 16.sp,
                    color:
                        controller.isWhichViewSelected == "3"
                            ? AppColors().newAppDarkBlueColor
                            : AppColors().newBlackLightColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget fromView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColors().newAppDarkRedColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow:
            controller.isFromViewExpanded
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 6), // Push shadow down
                    blurRadius: 8, // Soft edge
                    spreadRadius: -2, // Prevent side shadow
                  ),
                ]
                : [],
      ),

      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: EdgeInsets.symmetric(horizontal: 5.w),
        childrenPadding: EdgeInsets.zero,
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        showTrailingIcon: false,
        onExpansionChanged: (value) {
          controller.isFromViewExpanded = value;
          controller.update();
        },
        title: Row(
          children: [
            Text(
              "FROM",
              style: TextStyle(
                fontFamily: Appfonts.family1Bold,
                color: AppColors().white100Color,
                fontSize: 19.sp,
              ),
            ),
            Spacer(),
            Image.asset(
              controller.isFromViewExpanded
                  ? AppImages.whiteMinus
                  : AppImages.plusIcon,
              height: 3.5.h,
              width: 3.5.h,
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
                  type: 'Enter your Location',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter your Location".tr,
                  labelMsg: "Enter your Location",
                  emptyFieldMsg: "",
                  controller: controller.addressFromController,
                  focus: controller.addressFromFocus,
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
                  placeHolderMsg: "Apt/Ste/Unit*".tr,
                  labelMsg: "Apt/Ste/Unit*",
                  emptyFieldMsg: "",
                  controller: controller.aptFromController,
                  focus: controller.aptFromFocus,
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
                  controller: controller.zipCodeFromController,
                  focus: controller.zipCodeFromFocus,
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
                  controller: controller.cityFromController,
                  focus: controller.cityFromFocus,
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
                  controller: controller.stateFromController,
                  focus: controller.stateFromFocus,
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

  Widget toView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColors().newAppDarkRedColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow:
            controller.isToViewExpanded
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 6), // Push shadow down
                    blurRadius: 8, // Soft edge
                    spreadRadius: -2, // Prevent side shadow
                  ),
                ]
                : [],
      ),

      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: EdgeInsets.symmetric(horizontal: 5.w),
        childrenPadding: EdgeInsets.zero,
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        showTrailingIcon: false,
        onExpansionChanged: (value) {
          controller.isToViewExpanded = value;
          controller.update();
        },
        title: Row(
          children: [
            Text(
              "TO",
              style: TextStyle(
                fontFamily: Appfonts.family1Bold,
                color: AppColors().white100Color,
                fontSize: 19.sp,
              ),
            ),
            Spacer(),
            Image.asset(
              controller.isToViewExpanded
                  ? AppImages.whiteMinus
                  : AppImages.plusIcon,
              height: 3.5.h,
              width: 3.5.h,
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
                  type: 'Enter your Location',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter your Location".tr,
                  labelMsg: "Enter your Location",
                  emptyFieldMsg: "",
                  controller: controller.addressToController,
                  focus: controller.addressToFocus,
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
                  placeHolderMsg: "Apt/Ste/Unit*".tr,
                  labelMsg: "Apt/Ste/Unit*",
                  emptyFieldMsg: "",
                  controller: controller.aptToController,
                  focus: controller.aptToFocus,
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
                  controller: controller.zipCodeToController,
                  focus: controller.zipCodeToFocus,
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
                  controller: controller.cityToController,
                  focus: controller.cityToFocus,
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
                  controller: controller.stateToController,
                  focus: controller.stateToFocus,
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

  Widget packageInformationView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColors().newAppDarkRedColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow:
            controller.isPackageInfoGetViewExpanded
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 6), // Push shadow down
                    blurRadius: 8, // Soft edge
                    spreadRadius: -2, // Prevent side shadow
                  ),
                ]
                : [],
      ),

      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: EdgeInsets.symmetric(horizontal: 5.w),
        childrenPadding: EdgeInsets.zero,
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        showTrailingIcon: false,
        onExpansionChanged: (value) {
          controller.isPackageInfoGetViewExpanded = value;
          controller.update();
        },
        title: Row(
          children: [
            Text(
              "PACKAGE INFORMATION",
              style: TextStyle(
                fontFamily: Appfonts.family1Bold,
                color: AppColors().white100Color,
                fontSize: 19.sp,
              ),
            ),
            Spacer(),
            Image.asset(
              controller.isPackageInfoGetViewExpanded
                  ? AppImages.whiteMinus
                  : AppImages.plusIcon,
              height: 3.5.h,
              width: 3.5.h,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Flat rate items?",
                      style: TextStyle(
                        fontFamily: Appfonts.family2Medium,
                        color: AppColors().newBlackLightColor,
                        fontSize: 16.sp,
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      AppImages.checkbox,
                      height: 3.5.h,
                      width: 3.5.h,
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    SizedBox(width: 3.w),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'No. of Packages',
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
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Expanded(
                      child: newCustomTextField(
                        type: 'Weight in lbs',
                        keyBoardType: TextInputType.text,
                        isEnabled: true,
                        isOptional: false,
                        inValidMsg: "",
                        placeHolderMsg: "Weight in lbs".tr,
                        labelMsg: "Weight in lbs",
                        emptyFieldMsg: "",
                        controller: controller.weightPController,
                        focus: controller.weightPFocus,
                        isSecure: false,
                        keyboardButtonType: TextInputAction.next,
                        maxLength: 64,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: newCustomTextField(
                        type: 'Length in inches',
                        keyBoardType: TextInputType.text,
                        isEnabled: true,
                        isOptional: false,
                        inValidMsg: "",
                        placeHolderMsg: "Length in inches".tr,
                        labelMsg: "Length in inches",
                        emptyFieldMsg: "",
                        controller: controller.lengthPController,
                        focus: controller.lengthPFocus,
                        isSecure: false,
                        keyboardButtonType: TextInputAction.next,
                        maxLength: 64,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Expanded(
                      child: newCustomTextField(
                        type: 'Width in inches',
                        keyBoardType: TextInputType.text,
                        isEnabled: true,
                        isOptional: false,
                        inValidMsg: "",
                        placeHolderMsg: "Width in inches".tr,
                        labelMsg: "Width in inches",
                        emptyFieldMsg: "",
                        controller: controller.widthPController,
                        focus: controller.widthPFocus,
                        isSecure: false,
                        keyboardButtonType: TextInputAction.next,
                        maxLength: 64,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: newCustomTextField(
                        type: 'Height in inches',
                        keyBoardType: TextInputType.text,
                        isEnabled: true,
                        isOptional: false,
                        inValidMsg: "",
                        placeHolderMsg: "Height in inches".tr,
                        labelMsg: "Height in inches",
                        emptyFieldMsg: "",
                        controller: controller.heightPController,
                        focus: controller.heightPFocus,
                        isSecure: false,
                        keyboardButtonType: TextInputAction.next,
                        maxLength: 64,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    SizedBox(width: 3.w),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                controller.isWhichViewSelected == "3"
                                    ? 'Total Value'
                                    : "Total Value (Optional)",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: Appfonts.family2Regular,
                              color:
                                  Colors
                                      .black, // or AppColors().newAppDark100Color
                            ),
                          ),
                          TextSpan(
                            text:
                                controller.isWhichViewSelected == "3"
                                    ? '*'
                                    : "",
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
                  type: 'Enter a Total Shipment value',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter a Total Shipment value".tr,
                  labelMsg: "Enter a Total Shipment value",
                  emptyFieldMsg: "",
                  controller: controller.totalValuePController,
                  focus: controller.totalValuePFocus,
                  isSecure: false,
                  keyboardButtonType: TextInputAction.next,
                  maxLength: 64,
                ),
                if (controller.isWhichViewSelected != "3")
                  SizedBox(height: 2.h),
                if (controller.isWhichViewSelected != "3")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(AppImages.checkbox, height: 3.h, width: 3.h),
                      Spacer(),
                      Text(
                        "Fragile Shipment (Note: It will not be applicable on 0 \nvalue shipments.)",
                        style: TextStyle(
                          fontFamily: Appfonts.family2Regular,
                          color: AppColors().newBlackLightColor,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget devliveryOptionView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColors().newAppDarkRedColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow:
            controller.isDeliveryOptionViewExpanded
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 6), // Push shadow down
                    blurRadius: 8, // Soft edge
                    spreadRadius: -2, // Prevent side shadow
                  ),
                ]
                : [],
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: EdgeInsets.symmetric(horizontal: 5.w),
        childrenPadding: EdgeInsets.zero,
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        showTrailingIcon: false,
        onExpansionChanged: (value) {
          controller.isDeliveryOptionViewExpanded = value;
          controller.update();
        },
        title: Row(
          children: [
            Text(
              "DELIVERY OPTIONS & COUPON",
              style: TextStyle(
                fontFamily: Appfonts.family1Bold,
                color: AppColors().white100Color,
                fontSize: 17.sp,
              ),
            ),
            Spacer(),
            Image.asset(
              controller.isDeliveryOptionViewExpanded
                  ? AppImages.whiteMinus
                  : AppImages.plusIcon,
              height: 3.5.h,
              width: 3.5.h,
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
                            text: 'Delivery Location',
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
                            text: 'Coupon/Promo Code',
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
                  type: 'Enter a Total Shipment value',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter a Total Shipment value".tr,
                  labelMsg: "Enter a Total Shipment value",
                  emptyFieldMsg: "",
                  controller: controller.couponController,
                  focus: controller.couponFocus,
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

  Widget packageInformationView2() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColors().newAppDarkRedColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow:
            controller.isPackageInfo2ViewExpanded
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 6), // Push shadow down
                    blurRadius: 8, // Soft edge
                    spreadRadius: -2, // Prevent side shadow
                  ),
                ]
                : [],
      ),

      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: EdgeInsets.symmetric(horizontal: 5.w),
        childrenPadding: EdgeInsets.zero,
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        showTrailingIcon: false,
        onExpansionChanged: (value) {
          controller.isPackageInfo2ViewExpanded = value;
          controller.update();
        },
        title: Row(
          children: [
            Text(
              "PACKAGE INFORMATION",
              style: TextStyle(
                fontFamily: Appfonts.family1Bold,
                color: AppColors().white100Color,
                fontSize: 19.sp,
              ),
            ),
            Spacer(),
            Image.asset(
              controller.isPackageInfo2ViewExpanded
                  ? AppImages.whiteMinus
                  : AppImages.plusIcon,
              height: 3.5.h,
              width: 3.5.h,
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
              children:
                  controller.packageInfoList
                      .asMap()
                      .entries
                      .map(
                        (e) => Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: packageInfoItem(e.key),
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget packageInfoItem(int index) {
    final item = controller.packageInfoList[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Flat rate items?",
              style: TextStyle(
                fontFamily: Appfonts.family2Medium,
                color: AppColors().newBlackLightColor,
                fontSize: 16.sp,
              ),
            ),
            Spacer(),
            Image.asset(AppImages.checkbox, height: 3.5.h, width: 3.5.h),
          ],
        ),
        SizedBox(height: 2.h),
        if (index == 0)
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Flat rate type',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: Appfonts.family2Regular,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        if (index == 0) SizedBox(height: 0.4.h),
        if (index == 0) countryListDropDown(),
        if (index == 0) SizedBox(height: 2.h),

        /// Row 1
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pkg Count",
                    style: TextStyle(
                      fontFamily: Appfonts.family2Regular,
                      color: AppColors().newBlackLightColor,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 0.4.h),
                  newCustomTextField(
                    type: 'Weight in lbs',
                    keyBoardType: TextInputType.text,
                    isEnabled: true,
                    isOptional: false,
                    inValidMsg: "",
                    placeHolderMsg: "Weight in lbs".tr,
                    labelMsg: "Weight in lbs",
                    emptyFieldMsg: "",
                    controller: item.pkgCountController,
                    focus: item.pkgCountFocus,
                    isSecure: false,
                    keyboardButtonType: TextInputAction.next,
                    maxLength: 64,
                  ),
                ],
              ),
            ),
            SizedBox(width: 5.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(""),
                  SizedBox(height: 0.4.h),
                  newCustomTextField(
                    type: 'Length in inches',
                    keyBoardType: TextInputType.text,
                    isEnabled: true,
                    isOptional: false,
                    inValidMsg: "",
                    placeHolderMsg: "Length in inches".tr,
                    labelMsg: "Length in inches",
                    emptyFieldMsg: "",
                    controller: item.lengthController,
                    focus: item.lengthFocus,
                    isSecure: false,
                    keyboardButtonType: TextInputAction.next,
                    maxLength: 64,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),

        /// Row 2
        Row(
          children: [
            Expanded(
              child: newCustomTextField(
                type: 'Width in inches',
                keyBoardType: TextInputType.text,
                isEnabled: true,
                isOptional: false,
                inValidMsg: "",
                placeHolderMsg: "Width in inches".tr,
                labelMsg: "Width in inches",
                emptyFieldMsg: "",
                controller: item.widthController,
                focus: item.widthFocus,
                isSecure: false,
                keyboardButtonType: TextInputAction.next,
                maxLength: 64,
              ),
            ),
            SizedBox(width: 5.w),
            Expanded(
              child: newCustomTextField(
                type: 'Height in inches',
                keyBoardType: TextInputType.text,
                isEnabled: true,
                isOptional: false,
                inValidMsg: "",
                placeHolderMsg: "Height in inches".tr,
                labelMsg: "Height in inches",
                emptyFieldMsg: "",
                controller: item.heightController,
                focus: item.heightFocus,
                isSecure: false,
                keyboardButtonType: TextInputAction.next,
                maxLength: 64,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),

        /// Row 3
        Row(
          children: [
            Expanded(
              child: newCustomTextField(
                type: 'Width in inches',
                keyBoardType: TextInputType.text,
                isEnabled: true,
                isOptional: false,
                inValidMsg: "",
                placeHolderMsg: "Width in inches".tr,
                labelMsg: "Width in inches",
                emptyFieldMsg: "",
                controller: item.additionalWidthController,
                focus: item.additionalWidthFocus,
                isSecure: false,
                keyboardButtonType: TextInputAction.next,
                maxLength: 64,
              ),
            ),
            SizedBox(width: 5.w),

            /// Conditional Button
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (index == 0) {
                    controller.addPackageItem();
                  } else {
                    controller.packageInfoList.removeAt(index);
                  }
                  controller.update();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 1.35.h,
                  ),
                  decoration: BoxDecoration(
                    color:
                        index == 0
                            ? AppColors().newAppDarkBlueColor
                            : AppColors().newAppDarkRedColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        index == 0 ? "Add More" : "Delete",
                        style: TextStyle(
                          fontFamily: Appfonts.family2Medium,
                          fontSize: 16.sp,
                          color: AppColors().white100Color,
                        ),
                      ),
                      Spacer(),
                      Image.asset(
                        index == 0 ? AppImages.plusIcon : AppImages.whiteMinus,
                        height: 3.h,
                        width: 3.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        /// Divider Line
        if (index != controller.packageInfoList.length - 1)
          SizedBox(height: 4.h),
        if (index != controller.packageInfoList.length - 1)
          Container(
            height: 1,
            color: AppColors().gray40Color,
            width: double.infinity,
          ),
        if (index == controller.packageInfoList.length - 1)
          SizedBox(height: 2.h),
        if (index == controller.packageInfoList.length - 1)
          Row(
            children: [
              SizedBox(width: 3.w),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Total Value (Optional)',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: Appfonts.family2Regular,
                        color:
                            Colors.black, // or AppColors().newAppDark100Color
                      ),
                    ),
                    TextSpan(
                      text: '',
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
        if (index == controller.packageInfoList.length - 1)
          SizedBox(height: 0.4.h),
        if (index == controller.packageInfoList.length - 1)
          newCustomTextField(
            type: 'Enter a Total Shipment value',
            keyBoardType: TextInputType.text,
            isEnabled: true,
            isOptional: false,
            inValidMsg: "",
            placeHolderMsg: "Enter a Total Shipment value".tr,
            labelMsg: "Enter a Total Shipment value",
            emptyFieldMsg: "",
            controller: controller.stateToController,
            focus: controller.stateToFocus,
            isSecure: false,
            keyboardButtonType: TextInputAction.next,
            maxLength: 64,
          ),
        if (index == controller.packageInfoList.length - 1)
          SizedBox(height: 2.h),
        if (index == controller.packageInfoList.length - 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.checkbox, height: 3.h, width: 3.h),
              Spacer(),
              Text(
                "Fragile Shipment (Note: It will not be applicable on 0 \nvalue shipments.)",
                style: TextStyle(
                  fontFamily: Appfonts.family2Regular,
                  color: AppColors().newBlackLightColor,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget paymentOptionView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColors().newAppDarkRedColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow:
            controller.isPaymentOptionViewExpanded
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 6), // Push shadow down
                    blurRadius: 8, // Soft edge
                    spreadRadius: -2, // Prevent side shadow
                  ),
                ]
                : [],
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: EdgeInsets.symmetric(horizontal: 5.w),
        childrenPadding: EdgeInsets.zero,
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        showTrailingIcon: false,
        onExpansionChanged: (value) {
          controller.isPaymentOptionViewExpanded = value;
          controller.update();
        },
        title: Row(
          children: [
            Text(
              "PAYMENT OPTION",
              style: TextStyle(
                fontFamily: Appfonts.family1Bold,
                color: AppColors().white100Color,
                fontSize: 19.sp,
              ),
            ),
            Spacer(),
            Image.asset(
              controller.isPaymentOptionViewExpanded
                  ? AppImages.whiteMinus
                  : AppImages.plusIcon,
              height: 3.5.h,
              width: 3.5.h,
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
                            text: 'Payment Option',
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget pickupShipmentView(BoxConstraints constraints) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColors().newAppDarkRedColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow:
            controller.isPickupShipmentViewExpanded
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 6),
                    blurRadius: 8,
                    spreadRadius: -2,
                  ),
                ]
                : [],
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: EdgeInsets.symmetric(horizontal: 5.w),
        childrenPadding: EdgeInsets.zero,
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        showTrailingIcon: false,
        onExpansionChanged: (value) {
          controller.isPickupShipmentViewExpanded = value;
          controller.update();
        },
        title: Row(
          children: [
            Text(
              "WHEN SHOULD WE PICKUP YOUR SHIPMENT?",
              style: TextStyle(
                fontFamily: Appfonts.family1Bold,
                color: AppColors().white100Color,
                fontSize: 13.8.sp,
              ),
            ),
            Spacer(),
            Image.asset(
              controller.isPickupShipmentViewExpanded
                  ? AppImages.whiteMinus
                  : AppImages.plusIcon,
              height: 3.5.h,
              width: 3.5.h,
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
                // Payment Date Display
                Row(
                  children: [
                    SizedBox(width: 3.w),
                    Text(
                      'Payment Date',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: Appfonts.family2Regular,
                        color: AppColors().newBlackLightColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.4.h),
                Container(
                  width: 100.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: AppColors().white100Color,
                    borderRadius: BorderRadius.circular(12.sp),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(0, 6),
                        blurRadius: 8,
                        spreadRadius: -2,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 5.w),
                      Text(
                        "Jan 09,2024",
                        style: TextStyle(
                          fontFamily: Appfonts.family2Medium,
                          color: AppColors().newBlackLightColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      Spacer(),
                      Image.asset(
                        AppImages.calenderIcon,
                        height: 3.h,
                        width: 3.h,
                      ),
                      SizedBox(width: 5.w),
                    ],
                  ),
                ),

                SizedBox(height: 2.h),
                Text(
                  "Pickup Window – When courier may arrive \nand shipment is ready",
                  style: TextStyle(
                    color: AppColors().newBlackLightColor,
                    fontSize: 15.sp,
                    fontFamily: Appfonts.family2Regular,
                  ),
                ),

                SizedBox(height: 2.h),

                LayoutBuilder(
                  builder: (context, constraints) {
                    final sliderWidth = constraints.maxWidth;
                    final percentLower = controller.lowerValue / 1440;
                    final percentUpper = controller.upperValue / 1440;

                    // Top of your build method inside LayoutBuilder
                    final handlerDiameter = 20.0; // Must match handler size
                    final sliderWidths =
                        constraints.maxWidth -
                        handlerDiameter; // Prevent overflow
                    final leftOffset =
                        sliderWidths * (controller.lowerValue / 1440);
                    final rightOffset =
                        sliderWidths * (controller.upperValue / 1440);

                    return SizedBox(
                      height: 10.h,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Slider
                          Positioned(
                            top: 3.h,
                            left: 0,
                            right: 0,
                            child: FlutterSlider(
                              values: [
                                controller.lowerValue,
                                controller.upperValue,
                              ],
                              rangeSlider: true,
                              max: 1440,
                              min: 0,
                              tooltip: FlutterSliderTooltip(disabled: true),
                              trackBar: FlutterSliderTrackBar(
                                inactiveTrackBar: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    width: 0.8,
                                    color: Colors.grey.shade300,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 2,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                activeTrackBar: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors().newAppDarkBlueColor,
                                      AppColors().newAppMagentaColor,
                                      AppColors().newAppDarkRedColor,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                activeTrackBarHeight: 10,
                                inactiveTrackBarHeight: 10,
                              ),
                              handler: FlutterSliderHandler(
                                decoration:
                                    BoxDecoration(), // No outer decoration
                                child: Container(
                                  width: 20, // increase as needed
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        AppColors()
                                            .white100Color, // Make sure this matches your background
                                    border: Border.all(
                                      color:
                                          AppColors()
                                              .newAppDarkBlueColor, // Left handler color
                                      width: 3,
                                    ),
                                  ),
                                ),
                              ),

                              rightHandler: FlutterSliderHandler(
                                decoration:
                                    BoxDecoration(), // No outer decoration
                                child: Container(
                                  width: 20, // increase as needed
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        AppColors()
                                            .white100Color, // Make sure this matches your background
                                    border: Border.all(
                                      color:
                                          AppColors()
                                              .newAppDarkBlueColor, // Left handler color
                                      width: 3,
                                    ),
                                  ),
                                ),
                              ),

                              onDragging: (
                                handlerIndex,
                                lowerValue,
                                upperValue,
                              ) {
                                controller.lowerValue = lowerValue;
                                controller.upperValue = upperValue;
                                controller.update();
                              },
                            ),
                          ),

                          // Earliest Label
                          /// EARLIEST LABEL (above left thumb)
                          /// EARLIEST LABEL
                          Positioned(
                            top: 0,
                            left:
                                (sliderWidth - 60) *
                                (controller.lowerValue / 1440),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Earliest",
                                  style: TextStyle(
                                    fontFamily: Appfonts.family2Regular,
                                    color: AppColors().newBlackLightColor,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  controller.formatTime(controller.lowerValue),
                                  style: TextStyle(
                                    fontFamily: Appfonts.family2Regular,
                                    color: AppColors().newAppDark80Color,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// LATEST LABEL
                          Positioned(
                            top: 0,
                            left:
                                (sliderWidth - 60) *
                                (controller.upperValue / 1440),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Latest",
                                  style: TextStyle(
                                    fontFamily: Appfonts.family2Regular,
                                    color: AppColors().newBlackLightColor,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  controller.formatTime(controller.upperValue),
                                  style: TextStyle(
                                    fontFamily: Appfonts.family2Regular,
                                    color: AppColors().newAppDark80Color,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                SizedBox(height: 2.h),
                Text(
                  "Please allow at least 60 minutes for your Pickup Window \nThe latest time a request can be made for pickup today is \n6:30 pm",
                  style: TextStyle(
                    color: AppColors().newBlackLightColor,
                    fontSize: 12.75.sp,
                    fontFamily: Appfonts.family2Regular,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget pickUpAddressView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColors().newAppDarkRedColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow:
            controller.isPickUpAddressViewExpanded
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 6), // Push shadow down
                    blurRadius: 8, // Soft edge
                    spreadRadius: -2, // Prevent side shadow
                  ),
                ]
                : [],
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: EdgeInsets.symmetric(horizontal: 5.w),
        childrenPadding: EdgeInsets.zero,
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        showTrailingIcon: false,
        onExpansionChanged: (value) {
          controller.isPickUpAddressViewExpanded = value;
          controller.update();
        },
        title: Row(
          children: [
            Text(
              "PICKUP ADDRESS",
              style: TextStyle(
                fontFamily: Appfonts.family1Bold,
                color: AppColors().white100Color,
                fontSize: 19.sp,
              ),
            ),
            Spacer(),
            Image.asset(
              controller.isPickUpAddressViewExpanded
                  ? AppImages.whiteMinus
                  : AppImages.plusIcon,
              height: 3.5.h,
              width: 3.5.h,
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
                  type: 'Enter your Location',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter your Location".tr,
                  labelMsg: "Enter your Location",
                  emptyFieldMsg: "",
                  controller: controller.addressFromController,
                  focus: controller.addressFromFocus,
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
                  placeHolderMsg: "Apt/Ste/Unit*".tr,
                  labelMsg: "Apt/Ste/Unit*",
                  emptyFieldMsg: "",
                  controller: controller.aptFromController,
                  focus: controller.aptFromFocus,
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
                  controller: controller.zipCodeFromController,
                  focus: controller.zipCodeFromFocus,
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
                  controller: controller.cityFromController,
                  focus: controller.cityFromFocus,
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
                  controller: controller.stateFromController,
                  focus: controller.stateFromFocus,
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
                  type: 'Enter Email ID',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter Email ID".tr,
                  labelMsg: "Enter Email ID",
                  emptyFieldMsg: "",
                  controller: controller.emailController,
                  focus: controller.emailFocus,
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
                            text: 'Pickup From',
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
                            text: 'Tracking Number',
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
                  type: 'Enter Tracking Number',
                  keyBoardType: TextInputType.text,
                  isEnabled: true,
                  isOptional: false,
                  inValidMsg: "",
                  placeHolderMsg: "Enter Tracking Number".tr,
                  labelMsg: "Enter Tracking Number",
                  emptyFieldMsg: "",
                  controller: controller.trackingNController,
                  focus: controller.trackingNFocus,
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
                            text:
                                'Where should the courier pick up the\nshipment?',
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
                            text: 'Instructions for the courier',
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
                Container(
                  height: 11.h,
                  child: newCustomTextField(
                    type:
                        'Provide other instructions you\'d like the courier to receive.',
                    keyBoardType: TextInputType.text,
                    isEnabled: true,
                    isOptional: false,
                    // maxLine: 5,
                    isMaxlineMore: true,
                    inValidMsg: "",
                    placeHolderMsg:
                        'Provide other instructions you\'d like the courier to receive.'
                            .tr,
                    labelMsg:
                        'Provide other instructions you\'d like the courier to receive.',
                    emptyFieldMsg: "",
                    controller: controller.instructionController,
                    focus: controller.instructionFocus,
                    isSecure: false,
                    keyboardButtonType: TextInputAction.next,
                    maxLength: 64,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
