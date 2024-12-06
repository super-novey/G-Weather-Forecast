import 'package:flutter/material.dart';
import 'package:g_weather_forecast/utils/constants/colors.dart';
import 'package:g_weather_forecast/utils/constants/sizes.dart';



class MyAppBarTheme {
  static const lightAppBarTheme = AppBarTheme(
      centerTitle: false,
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white, size: MySizes.iconLg),
      actionsIconTheme:
          IconThemeData(color: Colors.white, size: MySizes.iconLg),
      titleTextStyle: TextStyle(
          fontSize: MySizes.fontSizeLg,
          fontWeight: FontWeight.w600,
          color: MyColors.iconColor));
}
