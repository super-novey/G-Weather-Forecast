import 'package:flutter/material.dart';
import 'package:g_weather_forecast/features/weather/views/widgets/form_divider.dart';
import 'package:g_weather_forecast/features/weather/views/widgets/search_widget.dart';
import 'package:g_weather_forecast/features/weather/views/widgets/user_current_location.dart';
import 'package:g_weather_forecast/utils/constants/sizes.dart';

class LeftWidget extends StatelessWidget {
  const LeftWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchWidget(),
        const SizedBox(
          height: MySizes.spaceBtwItems,
        ),
        // Divider
        const FormDivider(),
        const SizedBox(
          height: MySizes.spaceBtwItems,
        ),
        const UseCurrentLocationWidget(),
        const SizedBox(
          height: MySizes.spaceBtwSections,
        ),
        // RegisterWidget(),
      ],
    );
  }
}
