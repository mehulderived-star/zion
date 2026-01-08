import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:country_picker/country_picker.dart';

import '../constant/assets.dart';
import '../constant/color.dart';
import '../constant/font_family.dart';

class PhoneNumberField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Country? initialCountry;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;
  final ValueChanged<Country>? onCountryChanged;
  final String hintText;

  const PhoneNumberField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.initialCountry,
    this.onChanged,
    this.onSubmitted,
    this.onCountryChanged,
    this.hintText = '000 000 0000',
  }) : super(key: key);

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  late Country selectedCountry;

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.initialCountry ?? Country.worldWide;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors().newAppLight80Color,
        borderRadius: BorderRadius.circular(16.sp),
        border: Border.all(color: AppColors().gray80Color, width: 1.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.4.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                countryListTheme: CountryListThemeData(
                  borderRadius: BorderRadius.circular(16),
                  inputDecoration: InputDecoration(
                    hintText: 'Search Country',
                    prefixIcon: Icon(Icons.search),
                  ),
                  bottomSheetHeight: 500,
                ),
                onSelect: (Country country) {
                  setState(() {
                    selectedCountry = country;
                  });
                  if (widget.onCountryChanged != null) {
                    widget.onCountryChanged!(country);
                  }
                },
              );
            },
            child: Row(
              children: [
                Text(
                  '+${selectedCountry.phoneCode}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: Appfonts.family2Regular,
                    color:
                        selectedCountry.phoneCode == '1'
                            ? AppColors().newAppDark60Color
                            : AppColors().newAppDark100Color,
                  ),
                ),
                SizedBox(width: 1.w),
                Image.asset(AppImages.arrowDown, height: 3.h, width: 6.w),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            height: 3.5.h,
            width: 1,
            color: AppColors().newAppLight60Color,
          ),
          Expanded(
            child: TextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9 ]')),
                LengthLimitingTextInputFormatter(15),
              ],
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontFamily: Appfonts.family2Regular,
                  fontSize: 16.sp,
                  color: AppColors().newAppDark60Color,
                ),
                counterText: "",
              ),
              onChanged: widget.onChanged,
              onSubmitted: (_) {
                if (widget.onSubmitted != null) widget.onSubmitted!();
              },
            ),
          ),
        ],
      ),
    );
  }
}
