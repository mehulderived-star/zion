import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../constant/color.dart';
import '../constant/font_family.dart';

// ignore_for_file: must_be_immutable
class CustomButton extends StatefulWidget {
  CustomButton({
    super.key,
    required this.isEnabled,
    this.prefixIcon,
    this.suffixIcon,
    required this.title,
    required this.onPress,
    required this.bgColor,
    this.borderColor,
    required this.isFilled,
    required this.textColor,
    required this.isTextCenter,
    required this.isLoading,
    required this.shimmerColor,
    this.prefixHeight,
    this.prefixWdith,
    this.isGradiantBG,
  });

  bool isEnabled;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String title;
  Function onPress;
  Color bgColor;
  Color? borderColor;
  bool isFilled;
  Color textColor;
  bool isTextCenter;
  bool isLoading;
  Color shimmerColor;
  double? prefixWdith;
  double? prefixHeight;
  bool? isGradiantBG;

  @override
  State<CustomButton> createState() => _CustomButton();
}

class _CustomButton extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPress();
      },
      child: Stack(
        children: [
          Container(
            height: 6.8.h,
            width: 90.w,
            decoration: BoxDecoration(
              gradient:
                  widget.isGradiantBG != null
                      ? const LinearGradient(
                        colors: [
                          Color(0xffFAC869),
                          Color(0xffF48A49),
                          Color(0xffDC5C6D),
                          Color(0xffC52F8F),
                          Color(0xff525ED0),
                        ],
                      )
                      : null,
              borderRadius: BorderRadius.circular(3.w),
              border: Border.all(
                color: widget.borderColor ?? Colors.transparent,
              ),
              color:
                  widget.isGradiantBG != null
                      ? null
                      : widget.isFilled
                      ? widget.bgColor
                      : AppColors().white100Color,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Row(
                mainAxisAlignment:
                    widget.isTextCenter
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                children: [
                  if (widget.prefixIcon != null)
                    SizedBox(
                      width: widget.prefixWdith ?? 3.h,
                      height: widget.prefixHeight ?? 3.h,
                      child: widget.prefixIcon ?? const SizedBox(),
                    ),
                  const SizedBox(width: 0),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Container(
                    // width: widget.title != "" ? 55.w : 0,
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Get.isDarkMode ? Colors.white : widget.textColor,
                        fontFamily: Appfonts.family1Bold,
                      ),
                    ),
                  ),
                  if (widget.suffixIcon != null) const Spacer(),
                  if (widget.suffixIcon != null)
                    SizedBox(
                      width: 4.h,
                      height: 4.h,
                      child: widget.suffixIcon ?? const SizedBox(),
                    ),
                ],
              ),
            ),
          ),
          if (widget.isLoading)
            Shimmer.fromColors(
              baseColor:
                  widget.isFilled ? widget.bgColor : AppColors().white100Color,
              highlightColor: widget.shimmerColor,
              child: Container(
                height: 7.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.w),
                  border: Border.all(
                    color: widget.borderColor ?? Colors.transparent,
                  ),
                  color:
                      widget.isFilled
                          ? widget.bgColor
                          : AppColors().white100Color,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: Row(
                    mainAxisAlignment:
                        widget.isTextCenter
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                    children: [
                      if (widget.prefixIcon != null)
                        SizedBox(
                          width: 3.h,
                          height: 3.h,
                          child: widget.prefixIcon ?? const SizedBox(),
                        ),
                      const SizedBox(width: 10),
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.textColor,
                          fontFamily: Appfonts.family2Medium,
                        ),
                      ),
                      if (widget.suffixIcon != null) const Spacer(),
                      if (widget.suffixIcon != null)
                        SizedBox(
                          width: 4.h,
                          height: 4.h,
                          child: widget.suffixIcon ?? const SizedBox(),
                        ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
