import 'package:g_weather_forecast/data/response/api_response.dart';
import 'package:g_weather_forecast/features/weather/models/weather_model.dart';
import 'package:g_weather_forecast/utils/http/http_client.dart';
import 'package:get/get.dart';

class WeatherRepository extends GetxController {
  static WeatherRepository get instance => Get.find();

  Future<ApiResponse<WeatherModel>> getForecast(String city) async {
    try {
      final res = await HttpHelper.get("forecast.json?q=$city&days=4");
      final result = WeatherModel.fromJson(res);
      return ApiResponse.completed(result, "Successful");
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
