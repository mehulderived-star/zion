import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/color.dart';
import '../constant/constantTextStyle.dart';
import '../constant/font_family.dart';

class newCustomTextField extends StatefulWidget {
  const newCustomTextField({
    super.key,
    this.regex,
    required this.type,
    required this.keyBoardType,
    required this.isEnabled,
    required this.isOptional,
    required this.inValidMsg,
    required this.placeHolderMsg,
    required this.labelMsg,
    required this.emptyFieldMsg,
    required this.controller,
    required this.focus,
    required this.isSecure,
    required this.maxLength,
    this.prefixIcon,
    this.sufixIcon,
    this.isMaxlineMore,
    this.minLine,
    this.maxLine,
    this.fillColor,
    this.keyboardButtonType,
    this.onTap,
    this.isReadOnly,
    this.roundCornder,
    this.isNoHorizontalPadding,
    this.borderColor,
    this.onSubmitted,
    this.onChange,
  });
  final String? regex;
  final String type;
  final TextInputType keyBoardType;
  final bool isEnabled;
  final bool isOptional;
  final bool isSecure;
  final String inValidMsg;
  final String placeHolderMsg;
  final String labelMsg;
  final String emptyFieldMsg;
  final int maxLength;
  final TextEditingController controller;
  final FocusNode focus;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final bool? isMaxlineMore;
  final int? maxLine;
  final int? minLine;
  final Color? fillColor;
  final Color? borderColor;
  final TextInputAction? keyboardButtonType;
  final Function? onTap;
  final Function? onSubmitted;
  final Function? onChange;
  final bool? isReadOnly;
  final double? roundCornder;
  final bool? isNoHorizontalPadding;

  @override
  State<newCustomTextField> createState() => _newCustomTextField();
}

class _newCustomTextField extends State<newCustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.roundCornder ?? 12.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 6), // ▼ pushes shadow 6 px downward
            blurRadius: 8, // softness
            spreadRadius: -2, // pulls it in a bit (keeps sides clean)
          ),
        ],
      ),
      child: TextField(
        style:
            widget.focus.hasFocus
                ? TextStyles().textFieldFocusText
                : TextStyles().textFieldText,
        // enabled: widget.isEnabled,
        scrollPadding: EdgeInsets.only(bottom: 20.h),
        autofillHints: getSuggetionType(widget.type),
        maxLength: widget.maxLength,
        keyboardType: widget.keyBoardType,
        cursorColor: Colors.black,
        controller: widget.controller,
        focusNode: widget.focus,
        textCapitalization:
            ((widget.isSecure) ||
                    widget.keyBoardType == TextInputType.url ||
                    widget.keyBoardType == TextInputType.emailAddress)
                ? TextCapitalization.none
                : TextCapitalization.sentences,
        readOnly: widget.isReadOnly ?? false,
        // onTap: () {
        //   // if (widget.onTap != null) {
        //   //   widget.onTap!();
        //   // }
        // },
        inputFormatters:
            widget.regex != null
                ? [FilteringTextInputFormatter.allow(RegExp(widget.regex!))]
                : widget.minLine != null
                ? widget.minLine! > 1
                    ? []
                    : null
                : null,
        obscuringCharacter: "●",
        obscureText: widget.isSecure,
        minLines: widget.isMaxlineMore != null ? widget.minLine ?? 5 : 1,
        maxLines: widget.isMaxlineMore != null ? widget.maxLine ?? 5 : 1,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: widget.keyboardButtonType,
        onChanged: (value) {
          // Ensure "+966" remains as the prefix
          if (widget.type == "phone" && !value.startsWith("+966")) {
            widget.controller.text = "+966";
            widget.controller.selection = TextSelection.fromPosition(
              TextPosition(offset: widget.controller.text.length),
            );
          }

          String input = value.trim();

          if (widget.type == "email") {
            // Allow free text entry for email
            widget.controller.value = TextEditingValue(
              text: value,
              selection: TextSelection.collapsed(offset: value.length),
            );
          }

          // Call the provided onChange callback if any
          if (widget.onChange != null) {
            widget.onChange!(value);
          }
        },
        onSubmitted: (value) {
          if (widget.onSubmitted != null) {
            widget.onSubmitted!();
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            top: 1.65.h,
            bottom: 1.65.h,
            left: widget.prefixIcon != null ? 0 : 6.w,
            right: widget.sufixIcon != null ? 0 : 6.w,
          ),
          counterText: "",
          prefixIcon:
              widget.prefixIcon != null
                  ? Container(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: widget.prefixIcon ?? const SizedBox(),
                  )
                  : null,
          suffixIcon:
              widget.sufixIcon != null
                  ? Container(
                    padding:
                        widget.sufixIcon != null
                            ? const EdgeInsets.only(left: 20, right: 20)
                            : const EdgeInsets.only(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                            ),
                    child: widget.sufixIcon ?? const SizedBox(),
                  )
                  : null,
          fillColor: widget.fillColor ?? AppColors().white100Color,
          filled: true,
          hintStyle: TextStyle(
            fontFamily: Appfonts.family2Regular,
            fontSize: 16.sp,
            color: AppColors().newAppDark60Color,
          ),
          hintText: widget.placeHolderMsg,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.sp),
            borderSide: BorderSide(
              color:
                  widget.borderColor != null
                      ? widget.borderColor!
                      : AppColors().newAppLight100Color,
              width: 5.sp,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.sp),
            borderSide: BorderSide(
              color:
                  widget.borderColor == null
                      ? AppColors().gray80Color
                      : widget.borderColor!,
              width: 1.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.sp),
            borderSide: BorderSide(
              color:
                  widget.borderColor != null
                      ? widget.borderColor!
                      : AppColors().gray80Color,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  getSuggetionType(String type) {
    switch (type) {
      case "Fullname":
        [AutofillHints.name];
      case "Email":
        return [AutofillHints.email];

      case "Address":
        return [
          AutofillHints.fullStreetAddress,
          AutofillHints.addressCity,
          AutofillHints.addressState,
          AutofillHints.streetAddressLine3,
          AutofillHints.streetAddressLine2,
          AutofillHints.streetAddressLine1,
          AutofillHints.streetAddressLevel2,
          AutofillHints.streetAddressLevel3,
          AutofillHints.postalAddress,
          AutofillHints.postalAddressExtended,
        ];

      case "State":
        return [AutofillHints.addressState];

      case "zip":
        return [AutofillHints.postalCode];

      case "phone":
        return [AutofillHints.telephoneNumber];

      case "cost":
        return [AutofillHints.transactionAmount];

      case "password":
        return null;

      default:
        return null;
    }
  }
}
