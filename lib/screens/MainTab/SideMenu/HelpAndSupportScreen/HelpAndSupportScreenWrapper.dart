import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter_plus/youtube_player_flutter_plus.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zion_app/navigation/routename.dart';
import 'package:zion_app/screens/MainTab/DiscoverTab/DiscoverScreenController.dart';
import 'package:zion_app/screens/MainTab/HomeTab/HomeScreenController.dart';
import 'package:zion_app/screens/MainTab/OrderTab/OrderScreenController.dart';
import '../../../../../customWidgets/CustomAntimatedProgressBar.dart';
import '../../../../constant/assets.dart';
import '../../../../constant/color.dart';
import '../../../../constant/font_family.dart';
import '../../../../customWidgets/appTextField.dart';
import '../../../../customWidgets/newAppTextField.dart';
import '../../../BaseViewController/baseController.dart';
import 'HelpAndSupportScreenController.dart';

class HelpAndSupportScreen extends BaseView<HelpAndSupportScreenController> {
  const HelpAndSupportScreen({super.key});

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
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: 15,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return listView(context, index);
                      },
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Left - Quote Calculator
                        Expanded(
                          child: Container(
                            height: 6.h,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 5.w, right: 0.w),
                            decoration: BoxDecoration(
                              color: AppColors().newAppDarkRedColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              "Quote Calculator",
                              style: TextStyle(
                                fontFamily: Appfonts.family1Bold,
                                fontSize: 16.sp,
                                color: AppColors().white100Color,
                              ),
                            ),
                          ),
                        ),
                        // Right - Full Quote
                        Expanded(
                          child: Container(
                            height: 6.h,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 5.w, left: 0.w),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              "Full Quote",
                              style: TextStyle(
                                fontFamily: Appfonts.family1Bold,
                                fontSize: 16.sp,
                                color: AppColors().newAppDarkRedColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 100.w,
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                        color: AppColors().newAppLight80Color,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 1.h,
                        children: [
                          SizedBox(height: 1.h),
                          Text(
                            "Select Country",
                            style: TextStyle(
                              fontFamily: Appfonts.family2Regular,
                              fontSize: 16.sp,
                              color: AppColors().newAppBlackColor,
                            ),
                          ),
                          newCustomTextField(
                            type: 'From Destination*',
                            keyBoardType: TextInputType.text,
                            isEnabled: true,
                            isOptional: false,
                            inValidMsg: "",
                            placeHolderMsg: "From Destination*".tr,
                            labelMsg: "From Destination*",
                            emptyFieldMsg: "",
                            controller: controller.fromDestincationController,
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
                              color: AppColors().newAppBlackColor,
                            ),
                          ),
                          newCustomTextField(
                            type: 'To Destination*',
                            keyBoardType: TextInputType.text,
                            isEnabled: true,
                            isOptional: false,
                            inValidMsg: "",
                            placeHolderMsg: "To Destination*".tr,
                            labelMsg: "To Destination*",
                            emptyFieldMsg: "",
                            controller: controller.toDestincationController,
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
                              color: AppColors().newAppBlackColor,
                            ),
                          ),
                          newCustomTextField(
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
                            keyboardButtonType: TextInputAction.next,
                            maxLength: 64,
                          ),
                          SizedBox(height: 1.3.h),
                          Text(
                            "NOTE* Enter The Destination country and weight (in LBS) of the Package",
                            style: TextStyle(
                              fontFamily: Appfonts.family2Regular,
                              fontSize: 12.5.sp,
                              color: AppColors().newAppBlackColor,
                            ),
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouterName.addTicketScreen);
                      },
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(1.h),
                          decoration: BoxDecoration(
                            color: AppColors().newAppDarkBlueColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Get A Quote",
                            style: TextStyle(
                              fontFamily: Appfonts.family2Medium,
                              fontSize: 17.sp,
                              color: AppColors().white100Color,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
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

  Widget listView(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(1.h),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1.h),
        child: Column(
          children: [
            if (index == 0)
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors().newAppDarkRedColor,
                ),
                padding: EdgeInsets.all(1.5.h),
                child: Text(
                  "TUTORIALS",
                  style: TextStyle(
                    height: 1,
                    fontFamily: Appfonts.family2SemiBold,
                    fontSize: 18.sp,
                    color: AppColors().white100Color,
                  ),
                ),
              ),
            Container(
              color: AppColors().white100Color,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How to manage my shipments",
                    style: TextStyle(
                      height: 1.2,
                      fontFamily: Appfonts.family2Bold,
                      fontSize: 18.sp,
                      color: AppColors().newAppDarkBlueColor,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  Text(
                    "In this video you will learn how you can manage your shipments created on zionshipping.com",
                    style: TextStyle(
                      height: 1.4,
                      fontFamily: Appfonts.family1Regular,
                      fontSize: 15.sp,
                      color: AppColors().newAppTitleColor,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2.h),
                    child: YoutubePlayerBuilder(
                      player: YoutubePlayer(
                        aspectRatio: 16 / 9,
                        controller: controller.youtubeVideoController,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.redAccent,
                        progressColors: const ProgressBarColors(
                          playedColor: Colors.redAccent,
                          handleColor: Colors.red,
                        ),
                      ),
                      builder: (context, player) {
                        return Container(
                          width: double.infinity,
                          height: 20.h,
                          child: player,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
