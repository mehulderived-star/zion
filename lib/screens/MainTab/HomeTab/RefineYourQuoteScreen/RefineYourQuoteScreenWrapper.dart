import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zion_app/navigation/routename.dart';
import 'package:zion_app/screens/MainTab/DiscoverTab/DiscoverScreenController.dart';
import 'package:zion_app/screens/MainTab/HomeTab/HomeScreenController.dart';
import 'package:zion_app/screens/MainTab/HomeTab/RefineYourQuoteScreen/RefindYourQuoteScreenController.dart';
import 'package:zion_app/screens/MainTab/OrderTab/OrderScreenController.dart';
import '../../../../../customWidgets/CustomAntimatedProgressBar.dart';
import '../../../../constant/assets.dart';
import '../../../../constant/color.dart';
import '../../../../constant/font_family.dart';
import '../../../BaseViewController/baseController.dart';

class RefineYourQuoteScreen extends BaseView<RefineYourQuoteScreenController> {
  const RefineYourQuoteScreen({super.key});

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
        body: Container(
          child: Column(
            children: [
              headerView(context),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 5.w,
                    right: 5.w,
                    top: 5.w,
                    bottom: 7.w,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors().newAppLight80Color,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Quote No. : 00000",
                        style: TextStyle(
                          fontFamily: Appfonts.family2Regular,
                          fontSize: 16.sp,
                          color: AppColors().newBlackLightColor,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 15,
                          itemBuilder: (context, snapshot) {
                            return refineListView();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
                "QUOTATION",
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

  Widget refineListView() {
    return Container(
      margin: EdgeInsets.only(top: 2.w, bottom: 1.w),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors().white100Color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.refine1, height: 4.h, width: 4.h),
          SizedBox(width: 1.5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Arrives on",
                style: TextStyle(
                  height: 1,
                  fontFamily: Appfonts.family1Bold,
                  fontSize: 14.5.sp,
                  color: AppColors().newBlackLight2Color,
                ),
              ),
              SizedBox(height: 0.4.h),
              Text(
                "Mon, Mar 24",
                style: TextStyle(
                  height: 1,
                  fontFamily: Appfonts.family1Regular,
                  fontSize: 13.sp,
                  color: Color(0xff444444),
                ),
              ),
            ],
          ),
          SizedBox(width: 4.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivered by",
                style: TextStyle(
                  height: 1,
                  fontFamily: Appfonts.family1Medium,
                  fontSize: 13.sp,
                  color: AppColors().newBlackLight2Color,
                ),
              ),
              SizedBox(height: 0.4.h),
              Text(
                "11:30 PM",
                style: TextStyle(
                  height: 1,
                  fontFamily: Appfonts.family1Regular,
                  fontSize: 12.sp,
                  color: Color(0xff444444),
                ),
              ),
              SizedBox(height: 0.4.h),
              Text(
                "UPS Worldwide saver",
                style: TextStyle(
                  height: 1,
                  fontFamily: Appfonts.family1Regular,
                  fontSize: 12.sp,
                  color: Color(0xff444444),
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 0.7.h),
            decoration: BoxDecoration(
              color: AppColors().newAppDarkBlueColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "\$ 504.26",
              style: TextStyle(
                fontFamily: Appfonts.family2Medium,
                fontSize: 14.5.sp,
                color: AppColors().white100Color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
