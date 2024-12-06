import 'package:flutter/material.dart';
import 'package:g_weather_forecast/utils/themes/theme.dart';
import 'package:g_weather_forecast/features/weather/views/weather_dashboard.dart';
import 'package:get/route_manager.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const WeatherDashboard(),
    );
  }
}
