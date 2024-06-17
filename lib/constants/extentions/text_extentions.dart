import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';

class TextStyles {
  TextStyles(this.context);
  BuildContext? context;
  static TextStyle defaultStyle = TextStyle(
    fontSize: 18.sp,
    color: ThemeColor.textBlack,
    fontWeight: FontWeight.w400,
    fontFamily: 'Myfont',
  );
}

extension ExtendedTextStyle on TextStyle {
  TextStyle get light {
    return copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle get regular {
    return copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get medium {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.w700);
  }

  TextStyle get italic {
    return copyWith(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
    );
  }



  TextStyle get textBoldColor {
    return copyWith(color: ThemeColor.textBoldColor);
  }

  TextStyle get greyTextColor {
    return copyWith(color: ThemeColor.grey);
  }

  TextStyle get whiteTextColor {
    return copyWith(color: Colors.white);
  }
  TextStyle get defaultTextColor {
    return copyWith(color: Colors.black);
  }

  TextStyle setColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle setTextSize(double size) {
    return copyWith(fontSize: size);
  }

  TextStyle setFont(String font) {
    return copyWith(fontFamily: font);
  }

}