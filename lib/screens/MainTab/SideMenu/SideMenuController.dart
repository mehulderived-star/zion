// ==============================================================
//  Sladder Screen – Drawer (converted to your project structure)
// ==============================================================

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constant/assets.dart';
import '../../../../../constant/color.dart';
import '../../../../../constant/font_family.dart';
import '../../BaseViewController/baseController.dart';

//-------------------------------------
// Binding
//-------------------------------------
class SladderScreenControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SladderScreenController());
  }
}

//-------------------------------------
// Controller
//-------------------------------------
class SladderScreenController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    // Add any future init‑logic here
    update();
  }
}
