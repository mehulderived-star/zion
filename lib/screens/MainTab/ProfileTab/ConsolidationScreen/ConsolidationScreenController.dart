import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constant/assets.dart';
import '../../../../../constant/const_string.dart';
import '../../../../constant/color.dart';
import '../../../../constant/font_family.dart';
import '../../../BaseViewController/baseController.dart';

class ConsolidationScreenControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ConsolidationScreenController());
  }
}

class ConsolidationScreenController extends BaseController {
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
