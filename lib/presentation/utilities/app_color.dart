import 'package:flutter/material.dart';

class AppColor {
  static final Map<int, Color> color = {
    50: primarySwatchColor,
    100: primarySwatchColor,
    200: primarySwatchColor,
    300: primarySwatchColor,
    400: primarySwatchColor,
    500: primarySwatchColor,
    600: primarySwatchColor,
    700: primarySwatchColor,
    800: primarySwatchColor,
    900: primarySwatchColor,
  };

  static final Map<int, Color> darkColor = {
    50: primarySwatchColorDark,
    100: primarySwatchColorDark,
    200: primarySwatchColorDark,
    300: primarySwatchColorDark,
    400: primarySwatchColorDark,
    500: primarySwatchColorDark,
    600: primarySwatchColorDark,
    700: primarySwatchColorDark,
    800: primarySwatchColorDark,
    900: primarySwatchColorDark,
  };

  static final primarySwatchColor = Color.fromRGBO(90, 176, 162, 1);
  static final primarySwatchColorDark = Color.fromRGBO(71, 172, 150, 1);
  static final appGreyColor = Color.fromRGBO(140, 140, 140, 1);
  static final materialPrimarySwatchColor = MaterialColor(0xFF5AB0A2, color);
  static final backgroundColorLight = Colors.white;
  static final backgroundColorDark = Color.fromRGBO(51, 51, 51, 1);
  static final headerBackgroundColor = Color.fromRGBO(245, 245, 245, 1);
  static final lightMainTextColor = Color.fromRGBO(86, 86, 86, 1);
}
