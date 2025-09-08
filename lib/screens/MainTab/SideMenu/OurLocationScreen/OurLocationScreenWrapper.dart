import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
import 'OurLocationScreenController.dart';

class OurLocationScreen extends BaseView<OurLocationScreenController> {
  const OurLocationScreen({super.key});

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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: CustomButton(
                        isEnabled: true,
                        title: "Sign Out".tr,
                        onPress: () {},
                        bgColor: AppColors().newAppDarkBlueColor,
                        isFilled: true,
                        textColor: AppColors().white100Color,
                        isTextCenter: true,
                        isLoading: false,
                        shimmerColor: AppColors().white100Color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h),
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
                "OUR LOCATIONS",
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
            Row(
              children: [
                SizedBox(width: 3.w),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Address / Zip Code',
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
              type: 'Enter Location / Zip Code',
              keyBoardType: TextInputType.text,
              isEnabled: true,
              isOptional: false,
              inValidMsg: "",
              placeHolderMsg: "Enter Location / Zip Code".tr,
              labelMsg: "Enter Location / Zip Code",
              emptyFieldMsg: "",
              controller: controller.addressController,
              focus: controller.addressFocus,
              isSecure: false,
              keyboardButtonType: TextInputAction.next,
              maxLength: 64,
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: CustomButton(
                isEnabled: true,
                title: "Search".tr,
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
            Row(
              children: [
                SizedBox(width: 3.w),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sort by Service',
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
            SizedBox(height: 2.h),
            Row(
              children: [
                SizedBox(width: 3.w),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sort by Distance',
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
            SizedBox(height: 2.h),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouterName.mapScreen);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                      width: double.infinity,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: controller.gmapkGooglePlex,
                        onMapCreated: (GoogleMapController mapController) {
                          // controller.complete(mapController);
                        },

                        zoomControlsEnabled: false,
                        myLocationButtonEnabled: false,
                        liteModeEnabled:
                            true, // Optional: speeds up map in cards
                      ),
                    ),

                    // Blur + Text + Icon
                    Container(
                      height: 20.h,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.black.withOpacity(0.3),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "View Map",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontFamily: Appfonts.family1Bold,
                              ),
                            ),

                            Image.asset(
                              AppImages.markerIcon,
                              height: 10.h,
                              width: 20.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return listView();
              },
            ),
            // listView(),
            // listView(),
          ],
        ),
      ),
    );
  }

  Widget listView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      margin: EdgeInsets.only(bottom: 2.h),
      decoration: BoxDecoration(
        color: AppColors().white100Color,
        borderRadius: BorderRadius.circular(10),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 0.w, height: 1.h),
          Text(
            "1. ZION SHIPPING NMB",
            style: TextStyle(
              fontFamily: Appfonts.family1SemiBold,
              fontSize: 15.sp,
              color: AppColors().gray100Color,
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            children: [
              SizedBox(width: 2.w),
              Container(
                width: 70.w,
                child: Text(
                  "1117 NE 163rd St, Suite F, North Miami Beach,\nFL 33162 \n(305) 515-2616",
                  style: TextStyle(
                    fontFamily: Appfonts.family1Regular,
                    fontSize: 14.sp,
                    color: AppColors().gray100Color,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.5.h),
          Row(
            children: [
              SizedBox(width: 2.w),
              Text(
                "Total shipment:",
                style: TextStyle(
                  fontFamily: Appfonts.family1SemiBold,
                  fontSize: 14.sp,
                  color: AppColors().gray100Color,
                ),
              ),
              Text(
                " 1",
                style: TextStyle(
                  fontFamily: Appfonts.family1Regular,
                  fontSize: 14.sp,
                  color: AppColors().gray100Color,
                ),
              ),
            ],
          ),
          SizedBox(height: 0.5.h),
          Row(
            children: [
              SizedBox(width: 2.w),
              Text(
                "Last date:",
                style: TextStyle(
                  fontFamily: Appfonts.family1SemiBold,
                  fontSize: 14.sp,
                  color: AppColors().gray100Color,
                ),
              ),
              Text(
                " August 29, 2022",
                style: TextStyle(
                  fontFamily: Appfonts.family1Regular,
                  fontSize: 14.sp,
                  color: AppColors().gray100Color,
                ),
              ),
            ],
          ),
          SizedBox(height: 0.5.h),
          Row(
            children: [
              SizedBox(width: 2.w),
              Text(
                "www.zionshipping.com",
                style: TextStyle(
                  fontFamily: Appfonts.family1SemiBold,
                  fontSize: 14.sp,
                  color: AppColors().newAppBlueColor,
                ),
              ),
              Spacer(),
              Text(
                "0.3 mile",
                style: TextStyle(
                  fontFamily: Appfonts.family1SemiBold,
                  fontSize: 15.5.sp,
                  color: AppColors().gray60Color,
                ),
              ),
              SizedBox(width: 2.w),
            ],
          ),
          SizedBox(height: 0.5.h),
          Container(
            height: 1,
            color: AppColors().newAppGreyBorderColor,
            width: 100.w,
          ),
          SizedBox(height: 0.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 2.w),
              Text(
                "Directions",
                style: TextStyle(
                  fontFamily: Appfonts.family1SemiBold,
                  fontSize: 14.sp,
                  color: AppColors().gray100Color,
                ),
              ),
              Spacer(),
              Container(
                height: 30,
                color: AppColors().newAppGreyBorderColor,
                width: 1,
              ),
              Spacer(),
              Text(
                "Whatsapp Me",
                style: TextStyle(
                  fontFamily: Appfonts.family1SemiBold,
                  fontSize: 14.sp,
                  color: AppColors().gray100Color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
