import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:g_weather_forecast/data/location/location_repository.dart';
import 'package:g_weather_forecast/data/response/status.dart';
import 'package:g_weather_forecast/data/weather/weather_repository.dart';
import 'package:g_weather_forecast/features/weather/models/weather_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherController extends GetxController {
  static WeatherController get instance => Get.find();
  final WeatherRepository _weatherRepository = Get.put(WeatherRepository());
  final TextEditingController cityController = TextEditingController();
  final TextEditingController newCityController = TextEditingController();
  final LocationRepository _locationRepository = Get.put(LocationRepository());
  GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
  var currentWeather = Rxn<WeatherModel>();
  var favoriteCities = <WeatherModel>[].obs;
  var isLoading = false.obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void dispose() {
    cityController.dispose();
    newCityController.dispose();
    super.dispose();
  }

  @override
  void onInit() async {
    super.onInit();
    await loadCachedWeather();
    favoriteCities.assignAll(await getFavoriteCity());
    if (currentWeather.value == null) {
      getCurrentWeatherByCurrentPosition();
    }
  }

  /// Fetch weather based on city name
  Future getCurrentWeather() async {
    try {
      if (!searchFormKey.currentState!.validate()) return;

      isLoading.value = true;

      final res = await _weatherRepository.getForecast(cityController.text);
      if (res.status == Status.ERROR) return;

      currentWeather.value = res.data!;
      await saveWeatherToCache(currentWeather.value!);
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch weather based on current position
  Future getCurrentWeatherByCurrentPosition() async {
    try {
      isLoading.value = true;
      await _locationRepository.getCurrentPosition();

      final res = await _weatherRepository
          .getForecast(_locationRepository.formattedPosition);
      if (res.status == Status.ERROR) return;

      currentWeather.value = res.data!;
      await saveWeatherToCache(currentWeather.value!); // Save to cache
    } finally {
      isLoading.value = false;
    }
  }

  /// Save weather data to cache
  Future<void> saveWeatherToCache(WeatherModel weather) async {
    final SharedPreferences prefs = await _prefs;

    final weatherJson = jsonEncode(weather.toJson());
    final currentDate = DateTime.now().toIso8601String();

    await prefs.setString('weather_data', weatherJson);
    await prefs.setString('last_cached_date', currentDate);
  }

  /// Load cached weather data if it is still valid
  Future<void> loadCachedWeather() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final cachedWeather = prefs.getString('weather_data');
      final cachedDate = prefs.getString('last_cached_date');

      if (cachedWeather != null && cachedDate != null) {
        final lastCachedDate = DateTime.parse(cachedDate);
        final now = DateTime.now();

        if (lastCachedDate.year == now.year &&
            lastCachedDate.month == now.month &&
            lastCachedDate.day == now.day) {
          currentWeather.value =
              WeatherModel.fromJson(jsonDecode(cachedWeather));
        }
      }
    } catch (e, stackTrace) {
      print("Stack trace: $stackTrace");
    }
  }

  Future<void> saveWeatherCity(WeatherModel weather) async {
    final SharedPreferences prefs = await _prefs;

    final weatherJson = jsonEncode(weather.toJson());

    List<String> history = prefs.getStringList('weather_history') ?? [];

    history.add(weatherJson);
    await prefs.setStringList('weather_history', history);
  }

  Future<void> removeWeatherCity(WeatherModel weather) async {
    final SharedPreferences prefs = await _prefs;
    List<String> history = prefs.getStringList('weather_history') ?? [];

    final weatherJson = jsonEncode(weather.toJson());

    history.removeWhere((city) => city == weatherJson);

    await prefs.setStringList('weather_history', history);
  }

  Future<List<WeatherModel>> getFavoriteCity() async {
    final SharedPreferences prefs = await _prefs;

    List<String>? history = prefs.getStringList('weather_history');

    return history?.map((e) => WeatherModel.fromJson(jsonDecode(e))).toList() ??
        [];
  }

  void handleAddNewCity() async {
    final res = await _weatherRepository.getForecast(newCityController.text);
    if (res.status == Status.ERROR) return;
    if (res.data == null) return;
    bool cityExists = favoriteCities.any((city) => city.city == res.data!.city);

    if (cityExists) {
      return;
    }
    favoriteCities.add(res.data!);
    await saveWeatherCity(res.data!);
  }

  void hanleRemoveCity(WeatherModel currentWeather) async {
    favoriteCities.remove(currentWeather);

    await removeWeatherCity(currentWeather);
  }
}
