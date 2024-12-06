import 'package:flutter/material.dart';
import 'package:g_weather_forecast/features/weather/controllers/weather_controller.dart';
import 'package:g_weather_forecast/features/weather/views/widgets/forecasts/forecast_day_tile.dart';
import 'package:g_weather_forecast/utils/constants/sizes.dart';
import 'package:g_weather_forecast/utils/devices/devices_utils.dart'; // Assuming you have this utility
import 'package:get/get.dart';

class Forecast extends StatelessWidget {
  const Forecast({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherController = WeatherController.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "4-Day Forecast",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: MySizes.spaceBtwItems,
        ),
        Obx(
          () => weatherController.currentWeather.value == null
              ? const SizedBox()
              : LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = MyDeviceUtils.isMobileScreen(context);
                    final isTablet = MyDeviceUtils.isTabletScreen(context);
                    final crossAxisCount = isMobile
                        ? 2
                        : isTablet
                            ? 3
                            : 4;
                    final cardWidth = constraints.maxWidth / crossAxisCount;
                    const cardHeight = 275;
                    final childAspectRatio = cardWidth / cardHeight;

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: childAspectRatio,
                      ),
                      itemCount: weatherController
                          .currentWeather.value!.forecasts.length,
                      itemBuilder: (context, index) {
                        final forecastDay = weatherController
                            .currentWeather.value!.forecasts[index];

                        return ForecastDay(forecastDay: forecastDay);
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
