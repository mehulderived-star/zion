import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pinput/pinput.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constant/assets.dart';
import '../../../../../constant/const_string.dart';
import '../../../constant/color.dart';
import '../../../constant/font_family.dart';
import '../../BaseViewController/baseController.dart';

class VerificationScreenControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(VerificationScreenController());
  }
}

class VerificationScreenController extends BaseController {
  //*********************************************************************** */
  // Variable Declaration
  //*********************************************************************** */

  TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  RxBool isLoadingSignIn = false.obs;
  final defaultPinTheme = PinTheme(
    width: 13.w,
    height: 6.5.h,
    textStyle: TextStyle(
      fontSize: 18,
      color: AppColors().gray100Color,
      fontFamily: Appfonts.family2Medium,
    ),
    decoration: BoxDecoration(
      // border: Border.all(color: AppColors().gray40Color),
      borderRadius: BorderRadius.circular(10),
      color: AppColors().newAppLight80Color,
    ),
  );

  var focusedPinTheme;
  var submittedPinTheme;

  //*********************************************************************** */
  // Functions Declaration
  //*********************************************************************** */
  @override
  void onInit() async {
    super.onInit();

    emailFocus.addListener(() {
      update();
    });

    update();
  }

  //*********************************************************************** */
  // Field Validation
  //*********************************************************************** */
}
