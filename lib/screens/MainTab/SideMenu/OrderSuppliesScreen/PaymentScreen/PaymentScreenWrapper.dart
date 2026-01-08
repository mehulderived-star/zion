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
import 'PaymentScreenController.dart';

class PaymentScreen extends BaseView<PaymentScreenController> {
  const PaymentScreen({super.key});

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
                    billingDetailView(),
                    SizedBox(height: 2.h),
                    payWithCardView(),
                    SizedBox(height: 2.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: CustomButton(
                        isEnabled: true,
                        title: "Pay".tr,
                        onPress: () {
                          Get.toNamed(RouterName.paymentSuccessfullScreen);
                        },
                        bgColor: AppColors().newAppDarkBlueColor,
                        isFilled: true,
                        textColor: AppColors().white100Color,
                        isTextCenter: true,
                        isLoading: false,
                        shimmerColor: AppColors().white100Color,
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
                "PAYMENTS",
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

  Widget billingDetailView() {
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
            Center(
              child: Text(
                "BILLING DETAILS",
                style: TextStyle(
                  fontFamily: Appfonts.family1Bold,
                  fontSize: 18.sp,
                  color: AppColors().newAppDarkBlueColor,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Text(
                  "Pay Zion Shipping",
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
            Text(
              "\$12.00",
              style: TextStyle(
                fontFamily: Appfonts.family2Bold,
                fontSize: 18.sp,
                color: AppColors().newAppDarkBlueColor,
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                SizedBox(width: 2.w),
                Text(
                  "32039695",
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
            SizedBox(height: 1.h),
            Divider(height: 1, color: Color(0xff707B81)),
            SizedBox(height: 2.h),
            Row(
              children: [
                SizedBox(width: 2.w),
                Text(
                  "Subtotal",
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

            Row(
              children: [
                SizedBox(width: 2.w),
                Text(
                  "Add promotion code",
                  style: TextStyle(
                    fontFamily: Appfonts.family2Medium,
                    fontSize: 15.sp,
                    color: Color(0xff3177FF),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Divider(height: 1, color: Color(0xff707B81)),
            SizedBox(height: 2.h),
            Row(
              children: [
                Text(
                  "Total due:",
                  style: TextStyle(
                    fontFamily: Appfonts.family2Medium,
                    fontSize: 15.sp,
                    color: AppColors().newAppDarkBlueColor,
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
          ],
        ),
      ),
    );
  }

  Widget payWithCardView() {
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
            Center(
              child: Text(
                "PAY WITH CARD",
                style: TextStyle(
                  fontFamily: Appfonts.family1Bold,
                  fontSize: 18.sp,
                  color: AppColors().newAppDarkBlueColor,
                ),
              ),
            ),
            SizedBox(height: 2.h),
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
                              Colors.black, // or AppColors().newAppDark100Color
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: Appfonts.family2Regular,
                          color:
                              Colors.red, // or AppColors().newAppDarkRedColor
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
            SizedBox(height: 2.h),
            Row(
              children: [
                SizedBox(width: 3.w),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Card Information',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: Appfonts.family2Regular,
                          color:
                              Colors.black, // or AppColors().newAppDark100Color
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: Appfonts.family2Regular,
                          color:
                              Colors.red, // or AppColors().newAppDarkRedColor
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.4.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors().white100Color,
                  boxShadow: [
                    //BoxShadow
                    BoxShadow(
                      color: AppColors().newGrey66Color,
                      offset: const Offset(0.0, 2),
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: "1234 1234 1234 1234",
                        hintStyle: TextStyle(
                          fontFamily: Appfonts.family2Regular,
                          color: AppColors().newGrey66Color,
                          fontSize: 16.sp,
                        ),
                        suffixIcon: Image.asset(
                          AppImages.cardsImage,
                          // height: 15.h,
                          width: 30.w,
                        ),
                        contentPadding: EdgeInsets.all(1.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors().white100Color,
                      ),
                    ),
                    Divider(color: Color(0xffC4CFD6)),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "MM/YY",
                              hintStyle: TextStyle(
                                fontFamily: Appfonts.family2Regular,
                                color: AppColors().newGrey66Color,
                                fontSize: 16.sp,
                              ),
                              contentPadding: EdgeInsets.all(1.h),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: AppColors().white100Color,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 1.h, right: 1.h),
                          height: 6.h,
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(color: Color(0xffC4CFD6)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "CVC",
                              hintStyle: TextStyle(
                                fontFamily: Appfonts.family2Regular,
                                color: AppColors().newGrey66Color,
                                fontSize: 16.sp,
                              ),
                              suffixIcon: Image.asset(
                                AppImages.cvImage,
                                // height: 10.h,
                                width: 5.w,
                              ),
                              contentPadding: EdgeInsets.all(1.h),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: AppColors().white100Color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                SizedBox(width: 3.w),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Cardholder name',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: Appfonts.family2Regular,
                          color:
                              Colors.black, // or AppColors().newAppDark100Color
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: Appfonts.family2Regular,
                          color:
                              Colors.red, // or AppColors().newAppDarkRedColor
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.4.h),
            newCustomTextField(
              type: 'Enter Cardholder name',
              keyBoardType: TextInputType.text,
              isEnabled: true,
              isOptional: false,
              inValidMsg: "",
              placeHolderMsg: "Enter Cardholder name".tr,
              labelMsg: "Enter Cardholder name",
              emptyFieldMsg: "",
              controller: controller.emailController,
              focus: controller.emailFocus,
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
                        text: 'Country',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: Appfonts.family2Regular,
                          color:
                              Colors.black, // or AppColors().newAppDark100Color
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: Appfonts.family2Regular,
                          color:
                              Colors.red, // or AppColors().newAppDarkRedColor
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.4.h),
            countryListDropDown(),
            Divider(height: 1, color: Color(0xff707B81)),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.checkbox, height: 3.h, width: 3.h),
                SizedBox(width: 2.w),
                Text(
                  "Save my payment information for future purchases",
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
    );
  }
}
