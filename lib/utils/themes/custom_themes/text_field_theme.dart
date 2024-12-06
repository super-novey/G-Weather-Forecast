import 'package:flutter/material.dart';
import 'package:g_weather_forecast/utils/constants/colors.dart';
import 'package:g_weather_forecast/utils/constants/sizes.dart';

class MyTextFieldTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    prefixIconColor: MyColors.primaryTextColor.withOpacity(0.8),
    suffixIconColor: MyColors.primaryTextColor.withOpacity(0.8),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: const TextStyle().copyWith(
        fontSize: MySizes.fontSizeSm, color: MyColors.primaryTextColor),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(MySizes.borderRadiusLg),
        borderSide: const BorderSide(width: 1, color: Colors.grey)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(MySizes.borderRadiusLg),
        borderSide: const BorderSide(width: 1, color: Colors.grey)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(MySizes.borderRadiusLg),
        borderSide:
            const BorderSide(width: 1, color: MyColors.darkPrimaryColor)),
    disabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(MySizes.borderRadiusLg),
        borderSide: const BorderSide(width: 1, color: Colors.grey)),
  );

  static TextSelectionThemeData lightTextSelectionTheme =
      const TextSelectionThemeData(
          cursorColor: MyColors.darkPrimaryColor,
          selectionColor: MyColors.lightPrimaryColor,
          selectionHandleColor: MyColors.accentColor);
}
