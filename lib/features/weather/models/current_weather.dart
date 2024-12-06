import 'package:g_weather_forecast/features/weather/models/condition.dart';
import 'package:g_weather_forecast/utils/formatter/formatter.dart';

class CurrentWeather {
  final double tempC;
  final Condition condition;
  final double windKph;
  final double maxWindKph;
  final int humidity;
  final String time;
  final double avgtempC;
  final int avgHumidity;

  CurrentWeather(
      {required this.tempC,
      required this.condition,
      required this.windKph,
      required this.humidity,
      required this.time,
      required this.avgtempC,
      required this.avgHumidity,
      required this.maxWindKph});

  String get formattedTemC => Formatter.formatTempC(tempC);
  String get formattedAvgTempC => Formatter.formatTempC(avgtempC);
  String get formattedAvgHumidity => "$avgHumidity %";
  String get formattedWindSpeed => Formatter.formatWindSpeed(windKph);
  String get formattedMaxWindSpeed => Formatter.formatWindSpeed(maxWindKph);
  String get formatterHumidity => "$humidity %";
  String get getDate => time.substring(0, 10);

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
        tempC:
            json['temp_c'] != null ? (json['temp_c'] as num).toDouble() : 0.0,
        condition: Condition.fromJson(json['condition']),
        windKph: json['wind_kph'] != null
            ? (json['wind_kph'] as num).toDouble()
            : 0.0,
        humidity: json['humidity'] ?? 0,
        time: json["last_updated"] ?? "",
        avgtempC: json["avgtemp_c"] ?? 0.0,
        avgHumidity: json["avghumidity"] ?? 0,
        maxWindKph: json["maxwind_kph"] ?? 0.0);
  }

  Map<String, dynamic> toJson() {
    return {
      'temp_c': tempC,
      'condition': condition.toJson(),
      'wind_kph': windKph,
      'humidity': humidity,
      'last_updated': time,
      'avgtemp_c': avgtempC,
      'avghumidity': avgHumidity,
      'maxwind_kph': maxWindKph,
    };
  }

  @override
  String toString() {
    return 'CurrentWeather(tempC: $tempC°C, condition: $condition, '
        'windKph: $windKph kph, humidity: $humidity%)';
  }
}
