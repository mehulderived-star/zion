// import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constant/assets.dart';
import '../../../../../constant/const_string.dart';
import '../../../constant/color.dart';
import '../../../constant/font_family.dart';
import '../../../constant/utilities.dart';
import '../../../main.dart';
import '../../../navigation/routename.dart';
import '../../BaseViewController/baseController.dart';

class SignInScreenControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignInScreenController());
  }
}

class SignInScreenController extends BaseController {
  //*********************************************************************** */
  // Variable Declaration
  //*********************************************************************** */

  TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocus = FocusNode();
  TextEditingController nameSController = TextEditingController();
  FocusNode nameSFocus = FocusNode();
  TextEditingController emailSController = TextEditingController();
  FocusNode emailSFocus = FocusNode();
  TextEditingController phoneSController = TextEditingController();
  FocusNode phoneSFocus = FocusNode();
  TextEditingController passwordSController = TextEditingController();
  FocusNode passwordSFocus = FocusNode();
  String categoryType = "login";
  RxBool isLoadingSignIn = false.obs;
  RxBool isKeyBoardVisible = false.obs;

  Country selectedCountry = Country(
    phoneCode: '1',
    countryCode: 'US',
    e164Sc: 1,
    geographic: true,
    level: 1,
    name: 'United States',
    example: '2015550123',
    displayName: 'United States',
    displayNameNoCountryCode: '2015550123',
    e164Key: '1-US',
  );

  //*********************************************************************** */
  // Functions Declaration
  //*********************************************************************** */

  @override
  void onInit() async {
    super.onInit();

    emailFocus.addListener(() {
      update();
    });
    passwordFocus.addListener(() {
      update();
    });
    update();
  }

  //*********************************************************************** */
  // Field Validation
  //*********************************************************************** */

  String validateField() {
    var msg = "";
    if (emailController.text.trim().isEmpty) {
      msg = AppString.emptyEmail;
    } else if (!emailController.text.trim().isEmail) {
      msg = AppString.invalidEmail;
    } else if (passwordController.text.trim().isEmpty) {
      msg = AppString.emptyPassword;
    } else if (passwordController.text.length <= 7) {
      msg = AppString.invalidPassword;
    }
    return msg;
  }

  //*********************************************************************** */
  // API CAlls
  //*********************************************************************** */
  callForSignIn() async {
    var msg = validateField();
    if (msg.isEmpty) {
      emailFocus.unfocus();
      passwordFocus.unfocus();
      isLoadingSignIn.value = true;
      update();
      var response = await service.loginAPICall(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      isLoadingSignIn.value = false;
      if (response != null) {
        update();
        if (response.error == ApiStatusCode.sucuss) {
          await localStorage.write(
            LocalStorageKeys.accessToken,
            response.accessToken,
          );
          showSuccessToast(response.message ?? "");
          Get.toNamed(RouterName.mainTab);
          isLoadingSignIn.value = false;
        } else {
          isLoadingSignIn.value = false;
          update();
          showErrorToast(response.message ?? "");
        }
      } else {
        showErrorToast(AppString.generalError);
        isLoadingSignIn.value = false;
        update();
      }
    } else {
      showWarningToast(msg);
    }
  }
}
