import 'package:flutter/material.dart';
import 'package:g_weather_forecast/features/weather/models/forecast_model.dart';
import 'package:g_weather_forecast/utils/constants/sizes.dart';

class ForecastDay extends StatelessWidget {
  final ForecastModel forecastDay;

  const ForecastDay({
    super.key,
    required this.forecastDay,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(MySizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("(${forecastDay.date})",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: Colors.white)),
            Image.network(
                width: 64,
                height: 64,
                fit: BoxFit.cover,
                forecastDay.current.condition.imageUrl),
            Text("Temperature: ${forecastDay.current.formattedAvgTempC}",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: Colors.white)),
            Text("Wind: ${forecastDay.current.formattedMaxWindSpeed}",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: Colors.white)),
            Text("Humidity: ${forecastDay.current.formattedAvgHumidity}",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}