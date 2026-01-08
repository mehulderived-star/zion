import 'package:flutter/cupertino.dart';

import 'color.dart';
import 'font_family.dart';

class TextStyles {
  var textFieldText = TextStyle(
      fontSize: 16,
      fontFamily: Appfonts.family2Medium,
      color: AppColors().textColor);

  var textFieldFocusText = TextStyle(
      fontSize: 16,
      fontFamily: Appfonts.family2Medium,
      color: AppColors().textColor);
  var drawerTitleText = TextStyle(
    fontSize: 14,
    color: AppColors().white100Color,
    fontFamily: Appfonts.family2Medium,
  );
  var navTitleText = TextStyle(
    fontSize: 21,
    color: AppColors().textColor,
    fontFamily: Appfonts.family1Bold,
  );
}
