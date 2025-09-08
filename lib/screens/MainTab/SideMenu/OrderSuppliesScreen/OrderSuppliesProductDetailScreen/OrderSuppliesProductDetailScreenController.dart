import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constant/assets.dart';
import '../../../../../constant/color.dart';
import '../../../../../constant/const_string.dart';
import '../../../../../constant/font_family.dart';
import '../../../../../customWidgets/appButton.dart';
import '../../../../BaseViewController/baseController.dart';

class OrderSuppliesProductDetailControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OrderSuppliesProductDetailScreenController());
  }
}

class OrderSuppliesProductDetailScreenController extends BaseController {
  //*********************************************************************** */
  // Variable Declaration
  //*********************************************************************** */
  TextEditingController fullNameController = TextEditingController();
  FocusNode fullNameFocus = FocusNode();
  //*********************************************************************** */
  // Functions Declaration
  //*********************************************************************** */
  @override
  void onInit() async {
    super.onInit();

    update();
  }

  //*********************************************************************** */
  // Field Validation
  //*********************************************************************** */

  showBottomsheetCartDialog(
    String title,
    String message, {
    String? yesTxt,
    String? noTxt,
    Function? onYesTap,
    Function? onNoTap,
    RxBool? isLodading,
  }) {
    Get.bottomSheet(
      SizedBox(
        height: 50.h,
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(color: Colors.transparent),
              ),
            ),
            Container(
              height: 50.h,
              width: 100.w,
              // padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                color: AppColors().white100Color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.w),
                  topRight: Radius.circular(5.w),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 1.h),
                  Center(
                    child: Container(
                      width: 10.w,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors().switchOffColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 17.sp,
                            fontFamily: Appfonts.family2Medium,
                            color: AppColors().gray100Color,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            AppImages.cross,
                            height: 3.h,
                            width: 3.h,
                            fit: BoxFit.cover,
                            color: AppColors().gray100Color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    padding: EdgeInsets.only(left: 2.w, right: 5.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "1.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 17.sp,
                            fontFamily: Appfonts.family2Medium,
                            color: AppColors().gray100Color,
                          ),
                        ),
                        Image.asset(
                          AppImages.tapeImage,
                          height: 12.h,
                          width: 25.w,
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "\$3.00",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 2.w,
                                    vertical: 1.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors().newAppGreyBorderColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        spreadRadius: 1,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Qty",
                                        style: TextStyle(
                                          fontFamily: Appfonts.family2Regular,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      SizedBox(width: 1.w),
                                      Text(
                                        "4",
                                        style: TextStyle(
                                          fontFamily: Appfonts.family2Regular,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      SizedBox(width: 1.w),
                                      Image.asset(
                                        AppImages.arrowDown,
                                        height: 2.h,
                                        color: AppColors().newAppBlackColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 2.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors().gray40Color,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                "\$ 12.00",
                                style: TextStyle(
                                  fontFamily: Appfonts.family2Medium,
                                  color: AppColors().newAppDarkBlueColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Divider(color: AppColors().gray100Color),
                  ),
                  // SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      children: [
                        Text(
                          "Cart Total :",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 18.sp,
                            fontFamily: Appfonts.family2Medium,
                            color: AppColors().textColor,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "\$ 12.00",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 18.sp,
                            fontFamily: Appfonts.family2Medium,
                            color: AppColors().newAppDarkBlueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        CustomButton(
                          isEnabled: true,
                          title: noTxt ?? "PROCEED TO CHECKOUT".tr,
                          onPress: () {
                            if (onNoTap != null) {
                              onNoTap();
                            } else {
                              Get.back();
                            }
                          },
                          bgColor: AppColors().newAppDarkBlueColor,
                          isFilled: true,
                          textColor: AppColors().white100Color,
                          isTextCenter: true,
                          isLoading: false,
                          shimmerColor: AppColors().white100Color,
                        ),
                        SizedBox(height: 2.h),

                        isLodading != null
                            ? Obx(
                              () => CustomButton(
                                isEnabled: true,
                                title: "${yesTxt ?? title}".tr,
                                onPress: () {
                                  if (onYesTap != null) {
                                    onYesTap();
                                  } else {
                                    Get.back();
                                  }
                                },
                                bgColor: AppColors().white100Color,
                                borderColor: AppColors().newAppDarkBlueColor,
                                isFilled: true,
                                textColor: AppColors().newAppDarkBlueColor,
                                isTextCenter: true,
                                isLoading: isLodading.value,
                                shimmerColor: AppColors().newAppLight60Color,
                              ),
                            )
                            : CustomButton(
                              isEnabled: true,
                              title: "CONTINUE SHOPPING".tr,
                              onPress: () {
                                if (onYesTap != null) {
                                  onYesTap();
                                } else {
                                  Get.back();
                                }
                              },
                              bgColor: AppColors().white100Color,
                              borderColor: AppColors().newAppDarkBlueColor,
                              isFilled: true,
                              textColor: AppColors().newAppDarkBlueColor,
                              isTextCenter: true,
                              isLoading: false,
                              shimmerColor: AppColors().newAppLight60Color,
                            ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
