import 'package:flutter/material.dart';
import 'package:g_weather_forecast/features/weather/views/widgets/current_widget.dart';
import 'package:g_weather_forecast/features/weather/views/widgets/forecasts/forecast_list.dart';
import 'package:g_weather_forecast/utils/constants/sizes.dart';

class RightWidget extends StatelessWidget {
  const RightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Current(),
        SizedBox(
          height: MySizes.spaceBtwItems,
        ),
        Forecast()
      ],
    );
  }
}
