import 'package:flutter/material.dart';
import 'package:g_weather_forecast/common/widgets/custom_scroll_bar.dart';
import 'package:g_weather_forecast/data/weather/weather_repository.dart';
import 'package:g_weather_forecast/features/weather/controllers/weather_controller.dart';
import 'package:g_weather_forecast/features/weather/models/weather_model.dart';
import 'package:g_weather_forecast/features/weather/views/widgets/adding_city.dart';
import 'package:g_weather_forecast/utils/constants/colors.dart';
import 'package:g_weather_forecast/utils/constants/sizes.dart';
import 'package:get/get.dart';

class Current extends StatelessWidget {
  const Current({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final weatherController = WeatherController.instance;
    return Obx(
      () => weatherController.currentWeather.value == null
          ? const SizedBox()
          : CustomScrollbarWithSingleChildScrollView(
              controller: ScrollController(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Weather by city name or current weather
                  WeatherCard(
                      isCurrent: true,
                      weatherModel: weatherController.currentWeather.value!),

                  // List view displays favorite cities
                  Obx(
                    () => SizedBox(
                      height: 150,
                      child: ListView.builder(
                          shrinkWrap: true,
                          reverse: false,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: weatherController.favoriteCities.length,
                          itemBuilder: (context, index) {
                            final weather =
                                weatherController.favoriteCities[index];
                            return WeatherCard(
                              weatherModel: weather,
                              showDelete: true,
                              onDelete: () {
                                weatherController.hanleRemoveCity(weather);
                              },
                            );
                          }),
                    ),
                  ),

                  GestureDetector(
                    onTap: () async {
                      // final test = await WeatherRepository.instance
                      //     .getForecast("Ha Noi");
                      // weatherController.handleAddNewCity(test.data!);

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            title: const Text('Add city'),
                            content: AddingCity(),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  weatherController.handleAddNewCity();
                                  weatherController.newCityController.clear();
                                },
                                child: const Text('Add'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Card(
                      color: Colors.grey[300],
                      elevation: 4,
                      child: const SizedBox(
                        height: 140,
                        width: 140,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: MyColors.primaryTextColor,
                              ),
                              Text("Add city"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  const WeatherCard(
      {super.key,
      required this.weatherModel,
      this.isCurrent = false,
      this.showDelete = false,
      this.onDelete});

  final bool isCurrent;
  final WeatherModel weatherModel;
  final VoidCallback? onDelete;
  final bool showDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          Card(
            color: isCurrent ? MyColors.primaryColor : Colors.blueGrey,
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(MySizes.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${weatherModel.city} (${weatherModel.current.getDate})",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: Colors.white),
                      ),
                      const SizedBox(
                        height: MySizes.sm,
                      ),
                      Text(
                        "Temperature: ${weatherModel.current.formattedTemC}",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: Colors.white),
                      ),
                      const SizedBox(
                        height: MySizes.sm,
                      ),
                      Text(
                        "Wind: ${weatherModel.current.formattedWindSpeed}",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: Colors.white),
                      ),
                      const SizedBox(
                        height: MySizes.sm,
                      ),
                      Text(
                        "Humidity: ${weatherModel.current.formatterHumidity}",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: Colors.white),
                      ),
                    ],
                  ),
                  // Condition
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image
                      Image.network(
                          width: 64,
                          height: 64,
                          fit: BoxFit.cover,
                          weatherModel.current.condition.imageUrl),
                      // Name
                      Text(
                        weatherModel.current.condition.text,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: Colors.white, fontWeightDelta: 2),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          if (showDelete)
            Positioned(
              top: MySizes.md,
              right: MySizes.md,
              child: GestureDetector(
                onTap: onDelete,
                child: const Icon(
                  Icons.close,
                  color: MyColors.primaryTextColor,
                  size: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
