import 'package:flutter/material.dart';
import 'package:g_weather_forecast/utils/constants/colors.dart';
import 'package:g_weather_forecast/utils/themes/custom_themes/app_bar_theme.dart';
import 'package:g_weather_forecast/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:g_weather_forecast/utils/themes/custom_themes/outline_button_theme.dart';
import 'package:g_weather_forecast/utils/themes/custom_themes/text_button_theme.dart';
import 'package:g_weather_forecast/utils/themes/custom_themes/text_field_theme.dart';
import 'package:g_weather_forecast/utils/themes/custom_themes/text_theme.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      fontFamily: "Rubik",
      colorScheme: const ColorScheme.light(
          primary: MyColors.primaryColor,
          onPrimary: Colors.white,
          surface: Colors.white,
          onSurface: MyColors.primaryTextColor,
          secondary: MyColors.lightPrimaryColor),
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      appBarTheme: MyAppBarTheme.lightAppBarTheme,
      textTheme: MyTextTheme.lightTextTheme,
      elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
      textButtonTheme: MyTextButtonTheme.lightTextButton,
      inputDecorationTheme: MyTextFieldTheme.lightInputDecorationTheme,
      textSelectionTheme: MyTextFieldTheme.lightTextSelectionTheme,
      outlinedButtonTheme: MyOutlineButtonTheme.lightOutlineButtonTheme);
}
