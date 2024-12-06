import 'package:g_weather_forecast/features/weather/models/current_weather.dart';

class ForecastModel {
  final String date;
  final CurrentWeather current;

  ForecastModel({
    required this.date,
    required this.current,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      date: json['date'],
      current: CurrentWeather.fromJson(json['day']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'day': current.toJson(),
    };
  }
}
