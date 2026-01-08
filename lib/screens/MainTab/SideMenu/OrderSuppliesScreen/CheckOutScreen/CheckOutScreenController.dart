import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zion_app/navigation/routename.dart';

import '../../../../../constant/assets.dart';
import '../../../../../constant/color.dart';
import '../../../../../constant/const_string.dart';
import '../../../../../constant/font_family.dart';
import '../../../../../customWidgets/appButton.dart';
import '../../../../BaseViewController/baseController.dart';

class CheckOutScreenControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CheckOutScreenController());
  }
}

class CheckOutScreenController extends BaseController {
  //*********************************************************************** */
  // Variable Declaration
  //*********************************************************************** */
  TextEditingController fullNameController = TextEditingController();
  FocusNode fullNameFocus = FocusNode();
  TextEditingController lastNameController = TextEditingController();
  FocusNode lastNameFocus = FocusNode();
  TextEditingController businessController = TextEditingController();
  FocusNode businessFocus = FocusNode();
  TextEditingController addressController = TextEditingController();
  FocusNode addressFocus = FocusNode();
  TextEditingController aptController = TextEditingController();
  FocusNode aptFocus = FocusNode();
  TextEditingController zipController = TextEditingController();
  FocusNode zipFocus = FocusNode();
  TextEditingController cityController = TextEditingController();
  FocusNode cityFocus = FocusNode();
  TextEditingController stateController = TextEditingController();
  FocusNode stateFocus = FocusNode();
  TextEditingController phoneNumberController = TextEditingController();
  FocusNode phoneNumberFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();

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

  Widget buildPhoneNumberField() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors().white100Color,
        borderRadius: BorderRadius.circular(12.sp),
        border: Border.all(color: AppColors().gray80Color, width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 6), // ▼ pushes shadow 6 px downward
            blurRadius: 8, // softness
            spreadRadius: -2, // pulls it in a bit (keeps sides clean)
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.0.h),
      child: Row(
        children: [
          /// Country Code Box with Blue Background
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
            decoration: BoxDecoration(
              color: AppColors().newAppDarkBlueColor, // your custom blue
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.sp),
                bottomLeft: Radius.circular(12.sp),
              ),
            ),
            child: GestureDetector(
              onTap: () async {},
              child: Row(
                children: [
                  Text(
                    '+1',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: Appfonts.family2Regular,
                      color: AppColors().white100Color,
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Image.asset(
                    AppImages.arrowDown,
                    height: 2.5.h,
                    width: 2.5.h,
                    color: AppColors().white100Color,
                  ),
                ],
              ),
            ),
          ),

          /// Divider
          Container(
            height: 3.5.h,
            width: 1,
            color: AppColors().newAppLight60Color,
          ),

          /// Phone Input
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: TextField(
                controller: phoneNumberController,
                focusNode: phoneNumberFocus,
                keyboardType: TextInputType.phone,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Phone Number',
                  hintStyle: TextStyle(
                    fontFamily: Appfonts.family2Regular,
                    fontSize: 16.sp,
                    color: AppColors().newAppDark60Color,
                  ),
                  counterText: "",
                ),
                onChanged: (value) {},
                onSubmitted: (_) {},
              ),
            ),
          ),
        ],
      ),
    );
  }

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
            height: 30.h,
            decoration: BoxDecoration(
              color: AppColors().white100Color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
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
                      SizedBox(height: 3.h),
                      CustomButton(
                        isEnabled: true,
                        title: "PAY WITH CARD".tr,
                        onPress: () {
                          Get.toNamed(RouterName.paymentScreen);
                        },
                        bgColor: AppColors().newAppDarkBlueColor,
                        isFilled: true,
                        textColor: AppColors().white100Color,
                        isTextCenter: true,
                        isLoading: false,
                        shimmerColor: AppColors().white100Color,
                      ),
                      SizedBox(height: 3.h),
                      CustomButton(
                        isEnabled: true,
                        title: "PAY WITH PAYPAL".tr,
                        onPress: () {
                          Get.toNamed(RouterName.paymentScreen);
                        },
                        bgColor: AppColors().newAppDarkBlueColor,
                        isFilled: true,
                        textColor: AppColors().white100Color,
                        isTextCenter: true,
                        isLoading: false,
                        shimmerColor: AppColors().white100Color,
                      ),
                      SizedBox(height: 3.h),
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
}
