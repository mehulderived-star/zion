import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constant/color.dart';
import '../../constant/font_family.dart';
import '../../modelClass/country_model.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String hintText;
  final List<T> items;
  final T? selectedValue;
  final void Function(T?) onChanged;
  final String Function(T) getLabel;

  const CustomDropdown({
    Key? key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    required this.getLabel,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.sp),
        border: Border.all(
          color: AppColors().newAppLight100Color,
          width: 1,
        ),
      ),
      child: DropdownButtonFormField<T>(
        value: selectedValue,
        isExpanded: true,
        dropdownColor: Colors.white,
        decoration: const InputDecoration(
          border: InputBorder.none, // removes underline
        ),
        hint: Text(
          hintText,
          style: TextStyle(
            fontFamily: Appfonts.family2Regular,
            fontSize: 16.sp,
            color: AppColors().newAppDark60Color,
          ),
        ),
        items: items.map((item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(
              getLabel(item),
              style: TextStyle(
                color: AppColors().textColor,
                fontFamily: Appfonts.family2Regular,
                fontSize: 16.sp,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
