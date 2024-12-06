import 'package:g_weather_forecast/features/weather/models/current_weather.dart';
import 'package:g_weather_forecast/features/weather/models/forecast_model.dart';

class WeatherModel {
  final String city;
  final CurrentWeather current;
  final List<ForecastModel> forecasts;

  WeatherModel(
      {required this.city, required this.current, required this.forecasts});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['location']['name'],
      current: CurrentWeather.fromJson(json['current']),
      forecasts: (json['forecast']['forecastday'] as List)
          .map((data) => ForecastModel.fromJson(data))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': {'name': city},
      'current': current.toJson(),
      'forecast': {
        'forecastday': forecasts.map((forecast) => forecast.toJson()).toList(),
      },
    };
  }
}
