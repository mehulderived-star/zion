import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constant/assets.dart';
import '../../../../../constant/const_string.dart';
import '../../../BaseViewController/baseController.dart';

class WhereWeShipScreenControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WhereWeShipScreenController());
  }
}

class WhereWeShipScreenController extends BaseController {
  //*********************************************************************** */
  // Variable Declaration
  //*********************************************************************** */
  TextEditingController fromDestincationController = TextEditingController();
  FocusNode fromDestincationFocus = FocusNode();
  TextEditingController toDestincationController = TextEditingController();
  FocusNode toDestincationFocus = FocusNode();
  TextEditingController weightController = TextEditingController();
  FocusNode weightFocus = FocusNode();
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
