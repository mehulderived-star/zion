import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/assets.dart';
import '../constant/color.dart';
import '../constant/constantTextStyle.dart';
import '../constant/utilities.dart';

// ignore_for_file: must_be_immutable
class appNavigationBar extends AppBar {
  appNavigationBar({
    super.key,
    this.scaffoldKey,
    this.headerTitle,
    this.backTitle,
    this.isBackDisplay,
    this.isTrailingDisplay,
    this.isForEdit,
    this.isForShare,
    this.onDrawerButtonPress,
    this.onTrailingButtonPress,
    this.onBackButtonPress,
    this.centerIcon,
    this.backGroundColor,
    this.trailingIcon,
  });
  GlobalKey<ScaffoldState>? scaffoldKey;
  String? headerTitle;
  String? backTitle;
  bool? isBackDisplay;
  bool? isTrailingDisplay;
  bool? isForEdit;
  bool? isForShare;
  Widget? centerIcon;
  Function? onDrawerButtonPress;
  Function? onBackButtonPress;
  Function? onTrailingButtonPress;
  Color? backGroundColor;
  Widget? trailingIcon;
  @override
  State<appNavigationBar> createState() => _appNavigationBar();
}

class _appNavigationBar extends State<appNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        systemOverlayStyle: getSystemUiOverlayStyle(),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: widget.backGroundColor ?? AppColors().white100Color,
        foregroundColor: widget.backGroundColor ?? AppColors().white100Color,
        flexibleSpace: Container(
            color: widget.backGroundColor ?? AppColors().white100Color),
        leading: SizedBox(
            height: 24.sp,
            width: 24.sp,
            child: widget.isBackDisplay != null
                ? IconButton(
                    onPressed: () {
                      if (widget.isBackDisplay == false) {
                        widget.onBackButtonPress!();
                      } else if (widget.isBackDisplay != null) {
                        Get.back();
                      } else {
                        widget.onDrawerButtonPress!();
                      }
                    },
                    icon: widget.isBackDisplay != null
                        ? Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Image.asset(
                              AppImages.arrowBack,
                              width: 24,
                              color: widget.backGroundColor ==
                                      AppColors().gray100Color
                                  ? AppColors().white100Color
                                  : null,
                            ),
                          )
                        : const SizedBox(),
                  )
                : null),
        title: widget.centerIcon != null
            ? Center(
                child: widget.centerIcon,
              )
            : Center(
                child: Text(
                widget.headerTitle ?? "",
                style: TextStyles().navTitleText,
              )),
        actions: [
          widget.isTrailingDisplay != null
              ? widget.trailingIcon != null
                  ? Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: () async {
                          widget.onTrailingButtonPress!();
                        },
                        icon: widget.trailingIcon!,
                      ),
                    )
                  : SizedBox(
                      width: 15.w,
                    )
              : SizedBox(
                  width: 15.w,
                ),
        ]);
  }
}
