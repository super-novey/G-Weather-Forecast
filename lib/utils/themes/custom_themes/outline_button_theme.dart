import 'package:flutter/material.dart';
import 'package:g_weather_forecast/utils/constants/colors.dart';
import 'package:g_weather_forecast/utils/constants/sizes.dart';


class MyOutlineButtonTheme {
  MyOutlineButtonTheme._();

  static final OutlinedButtonThemeData lightOutlineButtonTheme =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              elevation: 0,
              foregroundColor: MyColors.darkPrimaryColor,
              side:
                  const BorderSide(color: MyColors.darkPrimaryColor, width: 2),
              textStyle: const TextStyle(
                  fontSize: 16,
                  color: MyColors.darkPrimaryColor,
                  fontWeight: FontWeight.w600),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(MySizes.borderRadiusLg))));
}
