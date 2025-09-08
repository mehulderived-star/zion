import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constant/assets.dart';
import '../../../../../constant/const_string.dart';
import '../../../../BaseViewController/baseController.dart';

class OrderSuppliesProductControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OrderSuppliesProductScreenController());
  }
}

class OrderSuppliesProductScreenController extends BaseController {
  //*********************************************************************** */
  // Variable Declaration
  //*********************************************************************** */
  TextEditingController fullNameController = TextEditingController();
  FocusNode fullNameFocus = FocusNode();
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
