import 'package:flutter/material.dart';
import 'package:g_weather_forecast/features/weather/controllers/weather_controller.dart';
import 'package:g_weather_forecast/utils/constants/sizes.dart';
import 'package:g_weather_forecast/utils/validations/validators.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    super.key,
  });

  final weatherController = WeatherController.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: weatherController.searchFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter a City Name",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: MySizes.spaceBtwInputFields),
            TextFormField(
              validator: (value) =>
                  Validators.validateEmptyText("City name", value),
              controller: weatherController.cityController,
              decoration: const InputDecoration(
                  hintText: "E.g., New York, London, Tokyo"),
            ),
            const SizedBox(
              height: MySizes.defaultSpace,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    await weatherController.getCurrentWeather();
                  },
                  child: const Text("Search")),
            ),
          ],
        ));
  }
}
