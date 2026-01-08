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
import '../../../../customWidgets/appTextField.dart';
import '../../../BaseViewController/baseController.dart';
import 'WhereWeShipScreenController.dart';

class WhereWeShipScreen extends BaseView<WhereWeShipScreenController> {
  const WhereWeShipScreen({super.key});

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
            // Background image at the top
            Expanded(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          AppImages.homeBack,
                          height: 73.h,
                          width: 100.w,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppImages.whereweshipImage,
                                    height: 15.h,
                                    width: 30.w,
                                  ),
                                  SizedBox(width: 5.w),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 50.w,
                                        child: Text(
                                          "Shipping from the US to AFGHANISTAN Cheapest & Fastest",
                                          style: TextStyle(
                                            fontFamily: Appfonts.family1Bold,
                                            fontSize: 16.sp,
                                            color: AppColors().white100Color,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Center(
                                          child: Container(
                                            padding: EdgeInsets.all(1.h),
                                            decoration: BoxDecoration(
                                              color:
                                                  AppColors()
                                                      .newAppDarkRedColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              "From \$68.13",
                                              style: TextStyle(
                                                fontFamily:
                                                    Appfonts.family2Medium,
                                                fontSize: 17.sp,
                                                color:
                                                    AppColors().white100Color,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 3.h),
                              Container(
                                height: 6.h,
                                width: 100.w,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(1.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(18),
                                    topRight: Radius.circular(18),
                                  ),
                                  color: AppColors().newAppDarkRedColor,
                                ),
                                child: Text(
                                  "Quote Calculator",
                                  style: TextStyle(
                                    fontFamily: Appfonts.family1Bold,
                                    fontSize: 18.sp,
                                    color: AppColors().white100Color,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100.w,
                                padding: EdgeInsets.only(
                                  right: 2.h,
                                  left: 2.h,
                                  top: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(18),
                                    bottomRight: Radius.circular(18),
                                  ),
                                  color: Color.fromARGB(28, 255, 255, 255),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 1.h,
                                  children: [
                                    Text(
                                      "Select Country",
                                      style: TextStyle(
                                        fontFamily: Appfonts.family2Regular,
                                        fontSize: 16.sp,
                                        color: AppColors().white100Color,
                                      ),
                                    ),
                                    CustomTextField(
                                      type: 'From Destination*',
                                      keyBoardType: TextInputType.text,
                                      isEnabled: true,
                                      isOptional: false,
                                      inValidMsg: "",
                                      placeHolderMsg: "From Destination*".tr,
                                      labelMsg: "From Destination*",
                                      emptyFieldMsg: "",
                                      controller:
                                          controller.fromDestincationController,
                                      focus: controller.fromDestincationFocus,
                                      isSecure: false,
                                      keyboardButtonType: TextInputAction.next,
                                      maxLength: 64,
                                    ),
                                    Text(
                                      "Select Country",
                                      style: TextStyle(
                                        fontFamily: Appfonts.family2Regular,
                                        fontSize: 16.sp,
                                        color: AppColors().white100Color,
                                      ),
                                    ),
                                    CustomTextField(
                                      type: 'To Destination*',
                                      keyBoardType: TextInputType.text,
                                      isEnabled: true,
                                      isOptional: false,
                                      inValidMsg: "",
                                      placeHolderMsg: "To Destination*".tr,
                                      labelMsg: "To Destination*",
                                      emptyFieldMsg: "",
                                      controller:
                                          controller.toDestincationController,
                                      focus: controller.toDestincationFocus,
                                      isSecure: false,
                                      keyboardButtonType: TextInputAction.next,
                                      maxLength: 64,
                                    ),
                                    Text(
                                      "Weight",
                                      style: TextStyle(
                                        fontFamily: Appfonts.family2Regular,
                                        fontSize: 16.sp,
                                        color: AppColors().white100Color,
                                      ),
                                    ),
                                    CustomTextField(
                                      type: 'Weight in lbs',
                                      keyBoardType: TextInputType.text,
                                      isEnabled: true,
                                      isOptional: false,
                                      inValidMsg: "",
                                      placeHolderMsg: "Weight in lbs".tr,
                                      labelMsg: "Weight in lbs",
                                      emptyFieldMsg: "",
                                      controller: controller.weightController,
                                      focus: controller.weightFocus,
                                      isSecure: false,
                                      keyboardButtonType: TextInputAction.done,
                                      maxLength: 64,
                                    ),
                                    SizedBox(height: 1.h),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Center(
                                        child: Container(
                                          padding: EdgeInsets.all(1.h),
                                          decoration: BoxDecoration(
                                            color:
                                                AppColors().newAppDarkRedColor,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Text(
                                            "Get A Quote",
                                            style: TextStyle(
                                              fontFamily:
                                                  Appfonts.family2Medium,
                                              fontSize: 17.sp,
                                              color: AppColors().white100Color,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 1.3.h),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      "Discounts of ZION Services",
                      style: TextStyle(
                        fontFamily: Appfonts.family2Bold,
                        fontSize: 18.sp,
                        color: AppColors().newAppDarkBlueColor,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Image.asset(
                      AppImages.whereweshipImage1,
                      height: 20.h,
                      width: 100.w,
                    ),
                    SizedBox(height: 3.h),
                    offerView(
                      indexNumber: "1",
                      title: "Save",
                      subTitle: "Time and Money on Shipping Packages",
                    ),
                    SizedBox(height: 1.h),
                    offerView(
                      indexNumber: "2",
                      title: "Instant",
                      subTitle: "Shipping quotes. No registration needed",
                    ),
                    SizedBox(height: 1.h),
                    offerView(
                      indexNumber: "3",
                      title: "Discounted",
                      subTitle: "Rates with premium couriers",
                    ),
                    SizedBox(height: 1.h),
                    offerView(
                      indexNumber: "4",
                      title: "Compare",
                      subTitle: "Prices and services from multiple couriers",
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      height: 6.h,
                      width: 60.w,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(1.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors().newAppDarkRedColor,
                      ),
                      child: Text(
                        "Try our qoute Calculator for other countries",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: Appfonts.family1Bold,
                          fontSize: 15.sp,
                          color: AppColors().white100Color,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      width: 70.w,
                      child: Text(
                        "HOW MUCH DOES IT COST TO SHIP A PARCEL FROM THE UNITED STATES TO AFGHANISTAN?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: Appfonts.family2Bold,
                          fontSize: 16.sp,
                          color: AppColors().newAppDarkBlueColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        "Zion Shipping offers competitive rates for shipping from the U.S. to Afghanistan. Their Estimated Shipping Costs Chart compares rates from top carriers like DHL, UPS, USPS, and FedEx by weight. For accurate pricing, use their online quote calculator or contact customer support. Visit their website for the latest details on affordable, high-quality shipping.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: Appfonts.family2Medium,
                          fontSize: 13.5.sp,
                          color: AppColors().gray100Color,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          border: Border.all(
                            width: 0.79,
                            color: Color(0xff828282),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.maxFinite,
                              padding: EdgeInsets.all(8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors().newAppDarkBlueColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                              child: Text(
                                "ESTIMATED SHIPPING PRICES TABLE",
                                style: TextStyle(
                                  fontFamily: Appfonts.family2Medium,
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 0.79,
                                    color: Color(0xff828282),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            width: 0.79,
                                            color: Color(0xff828282),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "Weight",
                                        style: TextStyle(
                                          fontFamily: Appfonts.family2Medium,
                                          fontSize: 14.sp,
                                          color:
                                              AppColors().newAppDarkBlueColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "USPS\n5-10 days",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: Appfonts.family2Medium,
                                          fontSize: 14.sp,
                                          color:
                                              AppColors().newAppDarkBlueColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                              itemCount: 10,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 0.79,
                                        color: Color(0xff828282),
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                width: 0.79,
                                                color: Color(0xff828282),
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            "1 lbs",
                                            style: TextStyle(
                                              // fontFamily: ,
                                              fontSize: 12,
                                              color: Color(0xff333333),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "68.13 USD",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              // fontFamily: ,
                                              fontSize: 12,
                                              color: Color(0xff333333),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
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
                "AFGHANISTAN",
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

  Widget offerView({
    String indexNumber = "1",
    String title = "",
    String subTitle = "",
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        children: [
          // Purple Box with "Save"
          Container(
            height: 5.h,
            width: 45.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFF4B2E83), // Purple color
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 5.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                    color: Colors.red[700],
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    indexNumber,
                    style: TextStyle(
                      fontFamily: Appfonts.family2Medium,
                      fontSize: 18.sp,
                      color: AppColors().white100Color,
                    ),
                  ),
                ),
                SizedBox(width: 7.w),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: Appfonts.family2Medium,
                    fontSize: 16.sp,
                    color: AppColors().white100Color,
                  ),
                ),
              ],
            ),
          ),
          // Grey box with text
          Expanded(
            child: Container(
              height: 5.h,
              decoration: BoxDecoration(
                color: Color(0xFFE0E0E0), // Light grey
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(width: 5.w),
                  Container(
                    width: 40.w,
                    child: Text(
                      subTitle,
                      style: TextStyle(
                        fontFamily: Appfonts.family2Medium,
                        fontSize: 14.sp,
                        color: AppColors().newBlackLightColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
