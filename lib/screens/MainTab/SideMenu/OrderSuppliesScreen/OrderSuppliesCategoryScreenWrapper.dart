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
import '../../../../customWidgets/newAppTextField.dart';
import '../../../BaseViewController/baseController.dart';
import 'OrderSuppliesCategoryScreenController.dart';

class OrderSuppliesCategoryScreen
    extends BaseView<OrderSuppliesCategoryScreenController> {
  const OrderSuppliesCategoryScreen({super.key});

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
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return listView();
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

  Widget listView() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouterName.orderSuppliesProductScreen);
      },
      child: Container(
        height: 13.h,
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
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
        child: Row(
          children: [
            SizedBox(width: 5.w),
            Text(
              "Tapes",
              style: TextStyle(
                fontFamily: Appfonts.family2Regular,
                fontSize: 16.sp,
                color: Color(0xff798388),
              ),
            ),
            Spacer(),
            Container(
              width: 45.w,
              decoration: BoxDecoration(
                color: Color(0xffAD9E9E),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
