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

class CardsScreenControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CardsScreenController());
  }
}

class CardsScreenController extends BaseController {
  //*********************************************************************** */
  // Variable Declaration
  //*********************************************************************** */
  RxList<String> cardList = <String>[].obs;
  TextEditingController cardNumberController = TextEditingController();
  FocusNode cardNumberFocus = FocusNode();
  TextEditingController monthController = TextEditingController();
  FocusNode monthFocus = FocusNode();

  //
  RxBool isLoadingSignIn = false.obs;
  //*********************************************************************** */
  // Functions Declaration
  //*********************************************************************** */
  @override
  void onInit() async {
    super.onInit();
    cardList.addAll(["0000", "1111"]);
    update();
  }

  //*********************************************************************** */
  // Field Validation
  //*********************************************************************** */
  void addCard() {
    final randomDigits = (1000 + cardList.length).toString();
    cardList.add(randomDigits);
  }
}
