import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zion_app/customWidgets/customDropdown.dart';
import 'package:zion_app/modelClass/country_model.dart';
import 'package:zion_app/navigation/routename.dart';
import 'package:zion_app/screens/MainTab/HomeTab/HomeScreenController.dart';
import '../../../../../customWidgets/CustomAntimatedProgressBar.dart';
import '../../../constant/assets.dart';
import '../../../constant/color.dart';
import '../../../constant/font_family.dart';
import '../../../customWidgets/appButton.dart';
import '../../../customWidgets/appNavigationBar.dart';
import '../../../customWidgets/appTextField.dart';
import '../../BaseViewController/baseController.dart';

class HomeScreen extends BaseView<HomeScreenController> {
  const HomeScreen({super.key});

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
                          height: 62.h,
                          width: 100.w,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2.h),
                              Text(
                                "Welcome, Louis",
                                style: TextStyle(
                                  fontFamily: Appfonts.family2Medium,
                                  fontSize: 17.sp,
                                  color: AppColors().white100Color,
                                ),
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
                                    // CustomTextField(
                                    //   type: 'From Destination*',
                                    //   keyBoardType: TextInputType.text,
                                    //   isEnabled: true,
                                    //   isOptional: false,
                                    //   inValidMsg: "",
                                    //   placeHolderMsg: "From Destination*".tr,
                                    //   labelMsg: "From Destination*",
                                    //   emptyFieldMsg: "",
                                    //   controller:
                                    //       controller.fromDestincationController,
                                    //   focus: controller.fromDestincationFocus,
                                    //   isSecure: false,
                                    //   keyboardButtonType: TextInputAction.next,
                                    //   maxLength: 64,
                                    // ),
                                    Obx(() {
                                      if (controller.isLoading.value) {
                                        return const CircularProgressIndicator();
                                      }

                                      return CustomDropdown<CountryModel>(
                                        hintText: "From Destination*",
                                        items: controller.countries,
                                        selectedValue: null,
                                        getLabel:
                                            (country) => country.countryName,
                                        onChanged: (value) {
                                          controller
                                              .fromDestincationController
                                              .text = value?.countryName ?? "";
                                        },
                                      );
                                    }),

                                    Text(
                                      "Select Country",
                                      style: TextStyle(
                                        fontFamily: Appfonts.family2Regular,
                                        fontSize: 16.sp,
                                        color: AppColors().white100Color,
                                      ),
                                    ),

                                    // CustomTextField(
                                    //   type: 'To Destination*',
                                    //   keyBoardType: TextInputType.text,
                                    //   isEnabled: true,
                                    //   isOptional: false,
                                    //   inValidMsg: "",
                                    //   placeHolderMsg: "To Destination*".tr,
                                    //   labelMsg: "To Destination*",
                                    //   emptyFieldMsg: "",
                                    //   controller:
                                    //       controller.toDestincationController,
                                    //   focus: controller.toDestincationFocus,
                                    //   isSecure: false,
                                    //   keyboardButtonType: TextInputAction.next,
                                    //   maxLength: 64,
                                    // ),
                                    Obx(() {
                                      if (controller.isLoading.value) {
                                        return const CircularProgressIndicator();
                                      }

                                      return CustomDropdown<CountryModel>(
                                        hintText: "To Destination*",
                                        items: controller.countries,
                                        selectedValue: null,
                                        getLabel:
                                            (country) => country.countryName,
                                        onChanged: (value) {
                                          controller
                                              .fromDestincationController
                                              .text = value?.countryName ?? "";
                                        },
                                      );
                                    }),
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
                                      onTap: () {
                                        controller.refineQuotePopup();
                                      },
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
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (controller.errorMessage.isNotEmpty) {
                        return Text("Error: ${controller.errorMessage.value}");
                      }

                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.w),
                        height: 16.h, // little bigger for circle + text
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children:
                                controller.differences.map((item) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2.w,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 8.h,
                                          width: 8.h,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors
                                                    .grey
                                                    .shade200, // grey background
                                            border: Border.all(
                                              color:
                                                  AppColors()
                                                      .newAppDarkBlueColor, // blue border
                                              width: 1,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              1.2.h,
                                            ), // padding so image doesn’t touch border
                                            child: Image.network(
                                              item.image,
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => const Icon(
                                                    Icons.error,
                                                    color: Colors.red,
                                                  ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: 1.h),
                                        SizedBox(
                                          width: 20.w,
                                          child: Text(
                                            item.title,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontFamily:
                                                  Appfonts.family2Medium,
                                              fontSize: 13.sp,
                                              color:
                                                  AppColors()
                                                      .newBlackLightColor,

                                              // backgroundColor: Colors.amber,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                          ),
                        ),
                      );
                    }),

                    SizedBox(height: 3.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      width: 100.w,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors().newAppDarkBlueColor,
                          ),
                        ),
                      ),
                      child: Text(
                        "RECENT BLOG ENTRIES.",
                        style: TextStyle(
                          fontFamily: Appfonts.family2Bold,
                          fontSize: 19.sp,
                          color: AppColors().newAppDarkBlueColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      height: 24.h,
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            controller
                                .objlandingModelData
                                ?.announcements
                                .length,
                        itemBuilder: (context, index) {
                          return recentBlogsView(context, index);
                        },
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      width: 100.w,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors().newAppDarkBlueColor,
                          ),
                        ),
                      ),
                      child: Text(
                        "SUBSCRIPTION PLANS",
                        style: TextStyle(
                          fontFamily: Appfonts.family2Bold,
                          fontSize: 20.sp,
                          color: AppColors().newAppDarkBlueColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    // TOP-LEVEL LIST VIEW
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            controller.objlandingModelData?.plans.length ?? 4,
                            (index) => subscriptionPlan(context, index),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      width: 100.w,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors().newAppDarkBlueColor,
                          ),
                        ),
                      ),
                      child: Text(
                        "Our Partners",
                        style: TextStyle(
                          fontFamily: Appfonts.family2Bold,
                          fontSize: 20.sp,
                          color: AppColors().newAppDarkBlueColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.5.h),

                    SizedBox(
                      height: 75,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        itemCount: controller.ourPartners.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final partner = controller.ourPartners[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: Image.network(
                              partner.image,
                              height: 75,
                              // width: 75,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  AppImages.placeholder,
                                  height: 75,
                                  // width: 75,
                                  fit: BoxFit.contain,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 4.h),
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
                  Scaffold.of(context).openDrawer();
                },
                child: Image.asset(AppImages.menuIcon, height: 4.h, width: 4.h),
              ),
              Spacer(),
              Text(
                "HOME",
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

  Widget recentBlogsView(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(right: 5.w),
      child: Column(
        children: [
          Container(
            width: 75.w,
            height: 19.5.h,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3.5.h),
                topRight: Radius.circular(3.5.h),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                  AppColors().newAppDarkBlueColor,
                  AppColors().newAppMagentaColor,
                  AppColors().newAppDarkRedColor,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h),
                Text(
                  "${index + 1}",
                  style: TextStyle(
                    height: 1,
                    fontFamily: Appfonts.family2Bold,
                    fontSize: 24.sp,
                    color: AppColors().white100Color,
                  ),
                ),
                Text(
                  controller.objlandingModelData?.announcements[index].title ??
                      "",
                  style: TextStyle(
                    height: 1.2,
                    fontFamily: Appfonts.family3SemiBold,
                    fontSize: 18.sp,
                    color: AppColors().white100Color,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  controller
                          .objlandingModelData
                          ?.announcements[index]
                          .description ??
                      "",
                  style: TextStyle(
                    fontFamily: Appfonts.family2Bold,
                    fontSize: 13.sp,
                    color: AppColors().white100Color,
                  ),
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
          Container(
            width: 75.w,
            color: AppColors().newAppDarkBlueColor,
            alignment: Alignment.center,
            padding: EdgeInsets.all(1.h),
            child: Text(
              "Learn More",
              style: TextStyle(
                fontFamily: Appfonts.family2Medium,
                fontSize: 15.sp,
                color: AppColors().white100Color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget subscriptionPlan(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(right: 5.w),
      width: 75.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Title
          Container(
            decoration: BoxDecoration(
              color: AppColors().newAppDarkRedColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3.5.h),
                topRight: Radius.circular(3.5.h),
              ),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.all(1.h),
            child: Text(
              controller.objlandingModelData?.plans[index].name ?? "",
              style: TextStyle(
                height: 1,
                fontFamily: Appfonts.family2SemiBold,
                fontSize: 18.sp,
                color: AppColors().white100Color,
              ),
            ),
          ),

          // Middle content
          Container(
            color: AppColors().newAppLight80Color,
            padding: EdgeInsets.symmetric(vertical: 1.5.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "\$${controller.objlandingModelData?.plans[index].price ?? ""}",
                  style: TextStyle(
                    height: 1,
                    fontFamily: Appfonts.family2Bold,
                    fontSize: 28.sp,
                    color: AppColors().newAppDarkBlueColor,
                  ),
                ),
                Text(
                  "Per month",
                  style: TextStyle(
                    height: 1,
                    fontFamily: Appfonts.family3SemiBold,
                    fontSize: 17.sp,
                    color: AppColors().newBlackLightColor,
                  ),
                ),
                SizedBox(height: 1.5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    controller.objlandingModelData?.plans[index].description ??
                        "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: Appfonts.family2Medium,
                      fontSize: 13.sp,
                      color: AppColors().newGrey55Color,
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                Divider(
                  color: AppColors().gray40Color,
                  thickness: 1,
                  indent: 2.w,
                  endIndent: 2.w,
                ),
                SizedBox(height: 1.h),
                SizedBox(
                  height: 10.h, // You can adjust this height as needed
                  child: SingleChildScrollView(
                    child: dynamicFeaturesList(
                      controller.objlandingModelData?.plans[index].features ??
                          "",
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Button
          Container(
            color: AppColors().newAppDarkBlueColor,
            alignment: Alignment.center,
            padding: EdgeInsets.all(1.h),
            child: Text(
              "View More",
              style: TextStyle(
                fontFamily: Appfonts.family2Medium,
                fontSize: 15.sp,
                color: AppColors().white100Color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dynamicFeaturesList(String features) {
    List<String> featureList = features.split(',');
    List<List<String>> featureChunks = [];

    for (int i = 0; i < featureList.length; i += 2) {
      featureChunks.add(
        featureList.sublist(
          i,
          (i + 2 > featureList.length) ? featureList.length : i + 2,
        ),
      );
    }

    return Column(
      children:
          featureChunks.map((pair) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Padding(
                padding: EdgeInsets.only(bottom: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      pair.map((feature) {
                        return Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppImages.greenCheckIcon,
                                height: 2.h,
                                width: 1.5.h,
                              ),
                              SizedBox(width: 1.w),
                              Expanded(
                                child: Text(
                                  feature.trim(),
                                  style: TextStyle(
                                    fontFamily: Appfonts.family2Medium,
                                    fontSize: 13.sp,
                                    color: AppColors().newBlackLightColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                ),
              ),
            );
          }).toList(),
    );
  }
}
