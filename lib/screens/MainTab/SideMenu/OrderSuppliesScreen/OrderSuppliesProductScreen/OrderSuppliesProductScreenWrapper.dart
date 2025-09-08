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
import '../../../../../customWidgets/CustomAntimatedProgressBar.dart';
import '../../../../../customWidgets/newAppTextField.dart';
import '../../../../BaseViewController/baseController.dart';
import 'OrderSuppliesProductScreenController.dart';

class OrderSuppliesProductScreen
    extends BaseView<OrderSuppliesProductScreenController> {
  const OrderSuppliesProductScreen({super.key});

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
            SizedBox(height: 3.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Text(
                    "Search result for “Tape”",
                    style: TextStyle(
                      fontFamily: Appfonts.family2Regular,
                      fontSize: 14.sp,
                      color: Color(0xff393F42),
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    AppImages.filterIcon1,
                    height: 3.5.h,
                    width: 20.w,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                  physics: BouncingScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2.h,
                    crossAxisSpacing: 2.w,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return productList();
                  },
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

  Widget productList() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouterName.orderSuppliesProductDetailScreen);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
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
        padding: EdgeInsets.all(2.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.tapeImage, height: 10.h, fit: BoxFit.contain),
            SizedBox(height: 1.h),
            Text(
              "3 Inches tape",
              style: TextStyle(
                fontFamily: Appfonts.family1Regular,
                fontSize: 15.sp,
                color: Color(0xff393F42),
              ),
            ),
            SizedBox(height: 0.5.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Row(
                children: [
                  Text(
                    "\$3.00",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
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
            ),
            SizedBox(height: 1.h),

            SizedBox(height: 1.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Text(
                "Add to Cart",
                style: TextStyle(
                  fontFamily: Appfonts.family2Regular,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
