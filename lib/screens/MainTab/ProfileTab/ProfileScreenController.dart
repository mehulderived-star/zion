import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constant/assets.dart';
import '../../../../../constant/const_string.dart';
import '../../BaseViewController/baseController.dart';

class ProfileScreenControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileScreenController());
  }
}

class ProfileScreenController extends BaseController {
  //*********************************************************************** */
  // Variable Declaration
  //*********************************************************************** */
  //
  RxBool isLoadingSignIn = false.obs;
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
}
