import 'package:flutter/material.dart';
import 'package:g_weather_forecast/features/weather/controllers/weather_controller.dart';

class UseCurrentLocationWidget extends StatelessWidget {
  const UseCurrentLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed:
            WeatherController.instance.getCurrentWeatherByCurrentPosition,
        child: const Text("Use current location"),
      ),
    );
  }
}
