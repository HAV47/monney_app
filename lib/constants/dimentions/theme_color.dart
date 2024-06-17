import 'dart:ui';
import 'package:flutter/cupertino.dart';

class ThemeColor {
  static const Color blueDark = Color(0xff3751FB);
  static const Color textBoldColor = Color(0xff2743FD);
  static const Color white = Color(0xffFFFFFF);
  static const Color textBlue = Color(0xff7C2AFF);
  static const Color grey = Color(0xffB9B9B9);
  static const Color textBlack = Color(0xff3A3A3A);
  static const Color topLinear = Color(0xff4960F9);
  static const Color botLinear = Color(0xff1433FF);
  static const Color secondsLinear = Color(0xff1937FE);
  static const Color iconColor = Color(0xff2B47FC);
  static const Color backgroundColor = Color(0xffF6F8FE);
  static const Color subtitleColor = Color(0xff80E0FF);

}
class Gradients {
  static const Gradient buttonLinear = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        ThemeColor.topLinear,
        ThemeColor.botLinear,
      ]);
  static const Gradient scaffoldLinear = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        ThemeColor.topLinear,
        ThemeColor.secondsLinear,
      ]);
  static const Gradient cardLinear = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        ThemeColor.topLinear,
        ThemeColor.secondsLinear,
      ]);
}
