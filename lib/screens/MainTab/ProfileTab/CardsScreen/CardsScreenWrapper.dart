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
import '../../../../customWidgets/appButton.dart';
import '../../../../customWidgets/newAppTextField.dart';
import '../../../BaseViewController/baseController.dart';
import 'CardsScreenController.dart';

class CardsScreen extends BaseView<CardsScreenController> {
  const CardsScreen({super.key});

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
                              "Cards",
                              style: TextStyle(
                                fontFamily: Appfonts.family1Bold,
                                fontSize: 18.sp,
                                color: AppColors().newAppDarkBlueColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 1.h),
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
                          Obx(() {
                            return SizedBox(
                              height:
                                  30.h +
                                  (controller.cardList.length - 1) *
                                      3.5.h, // Dynamic height based on number of cards
                              child: Stack(
                                children: List.generate(
                                  controller.cardList.length,
                                  (index) {
                                    return Positioned(
                                      top: index * 8.h,
                                      left: 0,
                                      right: 0,
                                      child: cardView(
                                        controller.cardList[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    addCardView(),
                    SizedBox(height: 2.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.w),
                      height: 6.h,
                      child: CustomButton(
                        isEnabled: false,
                        title: "Add Card".tr,
                        onPress: () {
                          controller.addCard();
                          controller.update();
                        },
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

  Widget cardView(String last4Digits) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.5.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Image.asset(AppImages.cardImage, height: 20.h, width: 74.w),
          ),
          Row(
            children: [
              SizedBox(width: 5.w, height: 8.h),
              Text(
                "**** **** **** $last4Digits",
                style: TextStyle(
                  fontFamily: Appfonts.family2Medium,
                  fontSize: 17.sp,
                  color: AppColors().white100Color,
                ),
              ),
              Spacer(),
              Text(
                "VISA",
                style: TextStyle(
                  fontFamily: Appfonts.family2Medium,
                  fontSize: 20.sp,
                  color: AppColors().white100Color,
                ),
              ),
              SizedBox(width: 7.w),
            ],
          ),
        ],
      ),
    );
  }

  Widget addCardView() {
    return Container(
      margin: EdgeInsets.only(
        left: 5.w,
        right: 5.w,
        // bottom: 7.w,
      ),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors().newAppLight80Color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 6), // ▼ pushes shadow 6 px downward
            blurRadius: 8, // softness
            spreadRadius: -2, // pulls it in a bit (keeps sides clean)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Add a Card",
              style: TextStyle(
                fontFamily: Appfonts.family1Bold,
                fontSize: 18.sp,
                color: AppColors().newAppDarkBlueColor,
              ),
            ),
          ),
          SizedBox(height: 1.h),
          commonView(
            "Enter Card Details",
            "Card number",
            "MM/YY",
            controller.cardNumberController,
            controller.cardNumberFocus,
            controller.monthController,
            controller.monthFocus,
          ),
        ],
      ),
    );
  }

  Widget commonView(
    String title,
    String placeHolderText,
    String placeHolderText2,
    TextEditingController textController,
    FocusNode textFocus,
    TextEditingController textController2,
    FocusNode textFocus2,
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
        SizedBox(height: 0.4.h),
        Row(
          children: [
            Expanded(
              child: newCustomTextField(
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
            ),
            SizedBox(width: 4.w),
            Container(
              width: 28.w,
              child: newCustomTextField(
                type: placeHolderText2,
                keyBoardType: TextInputType.text,
                isEnabled: true,
                isOptional: false,
                inValidMsg: "",
                placeHolderMsg: placeHolderText2.tr,
                labelMsg: placeHolderText2,
                emptyFieldMsg: "",
                controller: textController2,
                focus: textFocus2,
                isSecure: false,
                keyboardButtonType: TextInputAction.next,
                maxLength: 64,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.5.h),
      ],
    );
  }
}
