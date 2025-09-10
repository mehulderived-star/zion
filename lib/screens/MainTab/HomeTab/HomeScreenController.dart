import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zion_app/modelClass/country_model.dart';
import 'package:zion_app/modelClass/landingModelClass.dart';
import 'package:zion_app/modelClass/ourPartnersModel.dart';
import 'package:zion_app/modelClass/whatMakeUsDifferentModel.dart';
import 'package:zion_app/navigation/routename.dart';
import 'package:zion_app/service/network/apiServices.dart';

import '../../../../../constant/assets.dart';
import '../../../../../constant/const_string.dart';
import '../../../constant/color.dart';
import '../../../constant/font_family.dart';
import '../../../constant/utilities.dart';
import '../../../customWidgets/appTextField.dart';
import '../../../main.dart';
import '../../BaseViewController/baseController.dart';

class HomeScreenControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }
}

class HomeScreenController extends BaseController {
  //*********************************************************************** */
  // Variable Declaration
  //*********************************************************************** */
  TextEditingController fromDestincationController = TextEditingController();
  FocusNode fromDestincationFocus = FocusNode();
  TextEditingController toDestincationController = TextEditingController();
  FocusNode toDestincationFocus = FocusNode();
  TextEditingController weightController = TextEditingController();
  FocusNode weightFocus = FocusNode();
  TextEditingController pickUpZipController = TextEditingController();
  FocusNode pickUpZipFocus = FocusNode();
  TextEditingController deliveryZipController = TextEditingController();
  FocusNode deliveryZipFocus = FocusNode();

  landingModelData? objlandingModelData;

  var countries = <CountryModel>[].obs;
  var differences = <WhatMakeUsDifferentModel>[].obs;
  var ourPartners = <PartnerModel>[].obs;

  final ApiServices apiService = ApiServices();

  //*********************************************************************** */
  // Functions Declaration
  //*********************************************************************** */
  @override
  void onInit() async {
    super.onInit();
    // callForLandingAPICall();
    getCountriesAPICall();
    getWhatMakeUsDifferentAPICall();
    getOurPartnersAPICall();
    update();
  }

  //*********************************************************************** */
  // Field Validation
  //*********************************************************************** */

  Future refineQuotePopup() {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Container(
            height: 54.h,
            decoration: BoxDecoration(
              color: AppColors().white100Color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Container(
                  height: 7.5.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: AppColors().newAppDarkRedColor,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: Text(
                          "REFINE YOUR QUOTE",
                          style: TextStyle(
                            fontFamily: Appfonts.family1Bold,
                            fontSize: 18.sp,
                            color: AppColors().white100Color,
                          ),
                        ),
                      ),
                      // Right-Aligned Close Icon
                      Positioned(
                        right: 1.h,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            AppImages.whiteCrossIcon,
                            height: 5.h,
                            width: 5.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100.w,
                  padding: EdgeInsets.only(right: 2.h, left: 2.h, top: 2.h),
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
                        "Help us improve the accuracy of your quote by giving us a little more information",
                        style: TextStyle(
                          height: 1,
                          fontFamily: Appfonts.family2Regular,
                          fontSize: 17.sp,
                          color: AppColors().newBlackLightColor,
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                      Row(
                        children: [
                          SizedBox(width: 4.w),
                          Text(
                            "Pickup zip code (optional)",
                            style: TextStyle(
                              height: 1,
                              fontFamily: Appfonts.family2Regular,
                              fontSize: 16.sp,
                              color: AppColors().newBlackLightColor,
                            ),
                          ),
                        ],
                      ),
                      CustomTextField(
                        type: '',
                        keyBoardType: TextInputType.text,
                        isEnabled: true,
                        isOptional: false,
                        inValidMsg: "",
                        placeHolderMsg: "".tr,
                        labelMsg: "",
                        emptyFieldMsg: "",
                        controller: pickUpZipController,
                        focus: pickUpZipFocus,
                        isSecure: false,
                        keyboardButtonType: TextInputAction.next,
                        maxLength: 64,
                      ),
                      SizedBox(height: 0.3.h),
                      Row(
                        children: [
                          SizedBox(width: 4.w),
                          Text(
                            "Delivery zip code (optional)",
                            style: TextStyle(
                              height: 1,
                              fontFamily: Appfonts.family2Regular,
                              fontSize: 16.sp,
                              color: AppColors().newBlackLightColor,
                            ),
                          ),
                        ],
                      ),
                      CustomTextField(
                        type: '',
                        keyBoardType: TextInputType.text,
                        isEnabled: true,
                        isOptional: false,
                        inValidMsg: "",
                        placeHolderMsg: "".tr,
                        labelMsg: "",
                        emptyFieldMsg: "",
                        controller: deliveryZipController,
                        focus: deliveryZipFocus,
                        isSecure: false,
                        keyboardButtonType: TextInputAction.done,
                        maxLength: 64,
                      ),
                      SizedBox(height: 2.h),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                            Get.toNamed(RouterName.refineYourQuoteScreen);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 1.5.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors().newAppDarkBlueColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "REQUEST FOR A QUOTE",
                              style: TextStyle(
                                fontFamily: Appfonts.family2Medium,
                                fontSize: 16.sp,
                                color: AppColors().white100Color,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 1.7.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //*********************************************************************** */
  // API CAlls
  //*********************************************************************** */
  // callForLandingAPICall() async {
  //   print("🔄 API call started...");
  //   var response = await service.landingAPICall();
  //   if (response != null) {
  //     update();
  //     print("✅ Got response: ${response.toJson()}");
  //     if (response.error == ApiStatusCode.sucuss) {
  //       objlandingModelData = response.data;
  //       update();
  //     }
  //   } else {
  //     print("❌ Response was null");
  //     showErrorToast(AppString.generalError);
  //     update();
  //   }
  // }

  Future<void> getCountriesAPICall() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await apiService.fetchCountries();
      countries.assignAll(response.data); // set countries list
      update();
      print('Countries List: $countries');
    } catch (e) {
      print(e);
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getWhatMakeUsDifferentAPICall() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await apiService.fetchWhatMakesUsDifferent();
      differences.assignAll(response.data);
      update();
      print('What makes us different: $differences');
    } catch (error) {
      print(error);
      errorMessage.value = error.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getOurPartnersAPICall() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await apiService.fetchOurPartners();
      ourPartners.assignAll(response.data);
      update();
      print('Our Partners: $ourPartners');
    } catch (error) {
      print(error);
      errorMessage.value = error.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
