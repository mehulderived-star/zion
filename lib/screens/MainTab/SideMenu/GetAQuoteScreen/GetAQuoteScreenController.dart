import 'package:cached_network_image/cached_network_image.dart';
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

class GetAQuoteScreenControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GetAQuoteScreenController());
  }
}

class GetAQuoteScreenController extends BaseController {
  //*********************************************************************** */
  // Variable Declaration
  //*********************************************************************** */
  // TextEditingController countryFromController = TextEditingController();
  // FocusNode countryFromFocus = FocusNode();
  TextEditingController addressFromController = TextEditingController();
  FocusNode addressFromFocus = FocusNode();
  TextEditingController aptFromController = TextEditingController();
  FocusNode aptFromFocus = FocusNode();
  TextEditingController zipCodeFromController = TextEditingController();
  FocusNode zipCodeFromFocus = FocusNode();
  TextEditingController cityFromController = TextEditingController();
  FocusNode cityFromFocus = FocusNode();
  TextEditingController stateFromController = TextEditingController();
  FocusNode stateFromFocus = FocusNode();
  // TextEditingController countryToController = TextEditingController();
  // FocusNode countryToFocus = FocusNode();
  TextEditingController addressToController = TextEditingController();
  FocusNode addressToFocus = FocusNode();
  TextEditingController aptToController = TextEditingController();
  FocusNode aptToFocus = FocusNode();
  TextEditingController zipCodeToController = TextEditingController();
  FocusNode zipCodeToFocus = FocusNode();
  TextEditingController cityToController = TextEditingController();
  FocusNode cityToFocus = FocusNode();
  TextEditingController stateToController = TextEditingController();
  FocusNode stateToFocus = FocusNode();
  TextEditingController weightPController = TextEditingController();
  FocusNode weightPFocus = FocusNode();
  TextEditingController lengthPController = TextEditingController();
  FocusNode lengthPFocus = FocusNode();
  TextEditingController widthPController = TextEditingController();
  FocusNode widthPFocus = FocusNode();
  TextEditingController heightPController = TextEditingController();
  FocusNode heightPFocus = FocusNode();
  TextEditingController totalValuePController = TextEditingController();
  FocusNode totalValuePFocus = FocusNode();
  TextEditingController couponController = TextEditingController();
  FocusNode couponFocus = FocusNode();
  TextEditingController fullNameController = TextEditingController();
  FocusNode fullNameFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  TextEditingController trackingNController = TextEditingController();
  FocusNode trackingNFocus = FocusNode();
  TextEditingController instructionController = TextEditingController();
  FocusNode instructionFocus = FocusNode();
  TextEditingController phoneSController = TextEditingController();
  FocusNode phoneSFocus = FocusNode();

  //
  String? isWhichViewSelected;
  bool isFromViewExpanded = true;
  bool isToViewExpanded = true;
  bool isPackageInfoGetViewExpanded = true;
  bool isPackageInfo2ViewExpanded = true;
  bool isDeliveryOptionViewExpanded = true;
  bool isPickupShipmentViewExpanded = true;
  bool isPaymentOptionViewExpanded = true;
  bool isPickUpAddressViewExpanded = true;

  //
  RxBool isLoadingSignIn = false.obs;

  //
  List<PackageItemModel> packageInfoList = [PackageItemModel()];
  void addPackageItem() {
    packageInfoList.add(PackageItemModel());
    update();
  }

  //
  double lowerValue = 690; // 11:30 AM -> 11*60 + 30 = 690
  double upperValue = 933; // 3:33 PM -> 15*60 + 33 = 933

  String formatTime(double minutes) {
    final hours = minutes ~/ 60;
    final mins = (minutes % 60).toInt();
    final period = hours >= 12 ? 'PM' : 'AM';
    final hr12 =
        hours > 12
            ? hours - 12
            : hours == 0
            ? 12
            : hours;
    return '${hr12.toString().padLeft(2, '0')}:${mins.toString().padLeft(2, '0')} $period';
  }

  var Args = Get.arguments;
  //*********************************************************************** */
  // Functions Declaration
  //*********************************************************************** */
  @override
  void onInit() async {
    super.onInit();
    isWhichViewSelected = "1";
    update();
    if (Args != null) {
      if (Args["isWhichViewSelected"] != null ||
          Args["isWhichViewSelected"] != "") {
        isWhichViewSelected = Args["isWhichViewSelected"];
        update();
      }
    }
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
                controller: phoneSController,
                focusNode: phoneSFocus,
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
}

class PackageItemModel {
  final TextEditingController pkgCountController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController additionalWidthController =
      TextEditingController();

  final FocusNode pkgCountFocus = FocusNode();
  final FocusNode lengthFocus = FocusNode();
  final FocusNode widthFocus = FocusNode();
  final FocusNode heightFocus = FocusNode();
  final FocusNode additionalWidthFocus = FocusNode();
}
