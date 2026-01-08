import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constant/assets.dart';
import '../../../../../constant/const_string.dart';
import '../../../BaseViewController/baseController.dart';

class FAQScreenControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FAQScreenController());
  }
}

class FAQScreenController extends BaseController {
  //*********************************************************************** */
  // Variable Declaration
  //*********************************************************************** */
  bool isViewExpanded = true;
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
