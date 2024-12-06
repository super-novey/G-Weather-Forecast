import 'package:flutter/material.dart';
import 'package:g_weather_forecast/features/weather/controllers/weather_controller.dart';
import 'package:g_weather_forecast/features/weather/views/widgets/left_widget.dart';
import 'package:g_weather_forecast/features/weather/views/widgets/right_widget.dart';
import 'package:g_weather_forecast/utils/constants/colors.dart';
import 'package:g_weather_forecast/utils/constants/image_paths.dart';
import 'package:g_weather_forecast/utils/constants/sizes.dart';
import 'package:g_weather_forecast/utils/devices/devices_utils.dart';
import 'package:get/get.dart';

class WeatherDashboard extends StatelessWidget {
  const WeatherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MyDeviceUtils.isMobileScreen(context);
    final weatherController = Get.put(WeatherController());

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(MySizes.defaultSpace),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MySizes.spaceBtwItems,
              ),
              Center(child: Text("Weather Dashboard")),
            ],
          ),
        ),
        backgroundColor: MyColors.darkPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: isMobile
              ? const Column(
                  children: [
                    LeftWidget(),
                    SizedBox(
                      width: MySizes.spaceBtwSections,
                    ),
                    RightWidget()
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Flexible(child: LeftWidget()),
                    const SizedBox(
                      width: MySizes.spaceBtwSections,
                    ),
                    Expanded(
                        flex: 2,
                        child: Obx(() => weatherController.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : const RightWidget()))
                  ],
                ),
        ),
      ),
    );
  }
}
