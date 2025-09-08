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
import '../../../../../customWidgets/newAppTextField.dart';
import '../../../../BaseViewController/baseController.dart';
import 'OrderSuppliesProductDetailScreenController.dart';

class OrderSuppliesProductDetailScreen
    extends BaseView<OrderSuppliesProductDetailScreenController> {
  const OrderSuppliesProductDetailScreen({super.key});

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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 75.w,
                    child: newCustomTextField(
                      type: 'Search by product name',
                      keyBoardType: TextInputType.text,
                      isEnabled: true,
                      isOptional: false,
                      inValidMsg: "",
                      placeHolderMsg: "Search by product name".tr,
                      labelMsg: "Search by product name",
                      emptyFieldMsg: "",
                      controller: controller.fullNameController,
                      focus: controller.fullNameFocus,
                      isSecure: false,
                      keyboardButtonType: TextInputAction.next,
                      maxLength: 64,
                      prefixIcon: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          AppImages.searchIcon1,
                          height: 2.h,
                          width: 2.h,
                        ),
                      ),
                      sufixIcon: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          AppImages.micIcon,
                          height: 2.h,
                          width: 2.h,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          AppImages.cartImage,
                          height: 6.h,
                          width: 6.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(height: 5.h),
                          Text(
                            "3 Inches tape",
                            style: TextStyle(
                              fontFamily: Appfonts.family2Medium,
                              fontSize: 19.sp,
                              color: AppColors().newBlackLight2Color,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        AppImages.tapeImage,
                        height: 30.h,
                        width: 100.w,
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Text(
                            "\$3.00",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.sp,
                            ),
                          ),
                          Spacer(),
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
                              border: Border.all(color: Colors.grey.shade200),
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
                      GestureDetector(
                        onTap: () {
                          controller.showBottomsheetCartDialog(
                            "3 Inches tape".tr,
                            "Are you sure you want to logout ?".tr,
                            onYesTap: () {
                              Get.back();
                            },
                            onNoTap: () {
                              Get.back();
                              Get.toNamed(RouterName.checkOutScreen);
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 1.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                              fontFamily: Appfonts.family2Regular,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Text(
                            "Description of product",
                            style: TextStyle(
                              fontFamily: Appfonts.family2Medium,
                              fontSize: 17.sp,
                              color: Color(0xff202020),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.5.h),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquet arcu id tincidunt tellus arcu rhoncus, turpis nisl sed. Neque viverra ipsum orci, morbi semper. Nulla bibendum purus tempor semper purus. Ut curabitur platea sed blandit. Amet non at proin justo nulla et. A, blandit morbi suspendisse vel malesuada purus massa mi. Faucibus neque a mi hendrerit.",
                        style: TextStyle(
                          fontFamily: Appfonts.family1Regular,
                          fontSize: 14.sp,
                          color: Color(0xff393F42),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Text(
                            "Reviews",
                            style: TextStyle(
                              fontFamily: Appfonts.family2Medium,
                              fontSize: 17.sp,
                              color: Color(0xff202020),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 7.h,
                            width: 7.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    0.1,
                                  ), // soft shadow
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppImages.userImage,
                              height: 6.h,
                              width: 6.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Veronika",
                                style: TextStyle(
                                  fontFamily: Appfonts.family2Medium,
                                  fontSize: 17.sp,
                                  color: Color(0xff000000),
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Row(
                                children: [
                                  Image.asset(
                                    AppImages.starFilled,
                                    height: 1.5.h,
                                    width: 1.5.h,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 1.w),
                                  Image.asset(
                                    AppImages.starFilled,
                                    height: 1.5.h,
                                    width: 1.5.h,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 1.w),
                                  Image.asset(
                                    AppImages.starFilled,
                                    height: 1.5.h,
                                    width: 1.5.h,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 1.w),
                                  Image.asset(
                                    AppImages.starFilled,
                                    height: 1.5.h,
                                    width: 1.5.h,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 1.w),
                                  Image.asset(
                                    AppImages.star,
                                    height: 1.5.h,
                                    width: 1.5.h,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),
                              Container(
                                width: 70.w,
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum",
                                  style: TextStyle(
                                    fontFamily: Appfonts.family1Regular,
                                    fontSize: 13.sp,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
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
                "ORDER SUPPLIES",
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
}
